#######################################
##     CovNews - Berita Detik tCL    ##
##                                   ##
##   Created By ijoo / evochat.id    ##
##   (recommended using Covid.tcl)   ##
##################### v.3 8/11/2023 ###

########## OPTION - CHANGE IT
# newschan - masukan nama channel menampilkan berita
# maxberita - berapa banyak berita dalam satu kategori [ min 1, max disarankan 4 ]
##########

set ijoo(newschan) "#metro"
set ijoo(maxberita) 2
set ijoo(newslogo) [dezip "tw9TS1XklaY.fKP711agSxk//WzEX/WpdGs1zpX6//wAcV60"]

bind time -|- {45 * * * *} go_berita

########## PACKAGE
package require http
package require tdom
package require tls
::tls::init -ssl2 false -ssl3 false -tls1 true
::http::register https 443 ::tls::socket
::http::config -useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0"

set a_berita {
        "Diambil dari"
        "Dimuat di"
        "Info Tebaru dari"
        "Info Terkini di"
        "Kabar dari"
}

proc go_berita {args} {
        set detik_kat { "health" "news" "inet" "finance" "hot" "sport" "travel" "food" "wolipop" }
        set kat [lindex $detik_kat [rand [llength $detik_kat]]]
        putlog "############# Get Detik-$kat !"
        get_berita $kat
}

proc get_berita {cat} {
        global ijoo a_berita
        set mx 0
        set kat $cat
        set urlnews https://$kat.detik.com/rss
        set srcout [http::data [http::geturl $urlnews]]
        set dom [dom parse $srcout]
        set root [$dom documentElement]
        foreach node [$root selectNodes "/rss/channel/item"] {
                if { $mx == $ijoo(maxberita) } { break }
                set mx [expr {$mx + 1}]
                set judul [[lindex [$node selectNodes title] 0] text]
                set linkberita [[lindex [$node selectNodes guid] 0] text]
                set b_berita [lindex $a_berita [rand [llength $a_berita]]]
                if { $mx > 1 } {
                        putquick "PRIVMSG $ijoo(newschan) :$ijoo(newslogo) \003Artikel berikutnya [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                } else {
                        putquick "PRIVMSG $ijoo(newschan) :$ijoo(newslogo) \003[salam], $b_berita \0038,12 [string toupper $kat] \003 [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                }
        }
        putlog "############# CleanUP News!!"
        ::http::cleanup $srcout
}

proc tinyurl {url} {
        if {[string length $url] <= 26} { return $url; }
        set tinyurl "http://tinyurl.com/api-create.php";
        set query [::http::formatQuery "url" $url];
        set token [::http::geturl "$tinyurl?$query" -timeout 5000];
        set url [::http::data $token];
        ::http::cleanup $token;
        return $url;
}

proc salam {} {
        set systemTime [clock seconds]
        set waktu [clock format $systemTime -format %H]
        if { $waktu >= 01 && $waktu <= 10 } {
                set slm "Selamat Pagi"
        } elseif { $waktu >= 11 && $waktu <= 14 } {
                set slm "Selamat Siang"
        } elseif { $waktu >= 15 && $waktu <= 18 } {
                set slm "Selamat Sore"
        } else {
                set slm "Selamat Malam"
        }
        return $slm
}

if {[catch {source scripts/Covid.tcl} err]} {
        putlog "############# WARN: Cannot load Covid.tcl"
        putlog "############# Download https://github.com/ijoo/covid"
}

putlog "#######################################"
putlog "##         CovNews is Loaded!!       ##"
putlog "#######################################"
