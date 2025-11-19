##################################################################################
## Check IP v3 From Proxycheck.io                                               ##
## Simple CovidIP TCL By iJoo                                                   ##
##                                                                v1 02/10/2021 ##
##                                                                v3 18/11/2025 ##
##################################################################################

package require http
package require json
package require tls
http::register https 443 [list ::tls::socket -autoservername true -require true -cadir /etc/ssl/certs]

bind pub - !ip ijoo_ganteng

setudef flag pc

proc ijoo_ganteng {nick uhost hand chan rest} {
        if {![channel get $chan pc]} { return 0 }
        set chkip [lindex $rest 0]
        set theURL "https://proxycheck.io/v3/$chkip"
        set token [::http::geturl $theURL]
        set jostr [::http::data $token]
        set jodat [::json::json2dict $jostr]
        set status [dict get $jodat status]
        if { [string match "ok" $status] } {
                foreach key [dict keys $jodat] {
                        if {[dict exists $jodat $key network]} {
                                set ipKey $key
                                break
                        }
                }
                set ijoo_asn [dict get $jodat $ipKey network asn]
                set ijoo_range [dict get $jodat $ipKey network range]
                set ijoo_host [dict get $jodat $ipKey network hostname]
                set ijoo_prov [dict get $jodat $ipKey network provider]
                set ijoo_cont [dict get $jodat $ipKey location continent_name]
                set ijoo_cont2 [dict get $jodat $ipKey location continent_code]
                set ijoo_regi [dict get $jodat $ipKey location region_name]
                set ijoo_regc [dict get $jodat $ipKey location region_code]
                set ijoo_city [dict get $jodat $ipKey location city_name]
                set ijoo_postal [dict get $jodat $ipKey location postal_code]
                set ijoo_timez [dict get $jodat $ipKey location timezone]
                set ijoo_curn [dict get $jodat $ipKey location currency name]
                set ijoo_curc [dict get $jodat $ipKey location currency code]
                set ijoo_curs [dict get $jodat $ipKey location currency symbol]
                set ijoo_proxy [dict get $jodat $ipKey detections proxy]
                set ijoo_vpn [dict get $jodat $ipKey detections vpn]
                set ijoo_comp [dict get $jodat $ipKey detections compromised]
                set ijoo_scr [dict get $jodat $ipKey detections scraper]
                set ijoo_tor [dict get $jodat $ipKey detections tor]
                set ijoo_hosts [dict get $jodat $ipKey detections hosting]
                set ijoo_anno [dict get $jodat $ipKey detections anonymous]
                set ijoo_risk [dict get $jodat $ipKey detections risk]

                putquick "PRIVMSG $chan :Range \00304\002»\002\003 $ijoo_range"
                if { $ijoo_host  == "null" } {
                        putquick "PRIVMSG $chan :Hostname \00304\002»\002\003 Tidak ada"
                } else {
                        putquick "PRIVMSG $chan :Hostname \00304\002»\002\003 $ijoo_host"
                }
                putquick "PRIVMSG $chan :Location \00304\002»\002\003 $ijoo_city, $ijoo_regi ($ijoo_regc), $ijoo_cont ($ijoo_cont2)"
                putquick "PRIVMSG $chan :Timezone \00304\002»\002\003 $ijoo_timez"
                putquick "PRIVMSG $chan :ASN \00304\002»\002\003 $ijoo_asn $ijoo_prov"
                putquick "PRIVMSG $chan :proxy: $ijoo_proxy \00304\002|\002\003 vpn: $ijoo_vpn \00304\002|\002\003 compromised: $ijoo_comp \00304\002|\002\003 scraper: $ijoo_scr \00304\002|\002\003 tor: $ijoo_tor \00304\002|\002\003 hosting: $ijoo_hosts \00304\002|\002\003 anonymous: $ijoo_anno \00304\002|\002\003 risk: $ijoo_risk"
        } else {
                putquick "PRIVMSG $chan :Masukan IP yang benar!"
        }
}


putlog "CovidIP.v3 is Loaded.."
