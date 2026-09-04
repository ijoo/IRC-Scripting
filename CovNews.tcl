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

set ijoo(maxberita) 2
set ijoo(detiklogo) [dezip "IjDB3/ygPBT1Oi1Sn.0uHg21mmO1i.aMC8F/ceCBi/sMIbx/OgAQ0/IEE29.PzSIW0c035C/"]
set ijoo(liputanlogo) [dezip "27z7Z08Qwc91Y7Ewe0I2wZN.G8xEo1XAZbu13Kvlf/sYUoM1rk4ar.9eNZm0"]
set ijoo(cnnlogo) [dezip "NtUTS0plS0q0eLm/I1bEgxa0VKfY3.HQa56.5P2Th/mnzoW0StamL1OsZy3/"]
set ijoo(republikalogo) [dezip "G243f1GO9cN/9AqFU/SDZTK/wacVV0T6k4M/oIdAm1y0eL9/ceS9A/KMbrX1CZXy91NXYmQ0"]

bind time -|- {00 * * * *} get_rdm
bind time -|- {30 * * * *} get_rdm

setudef flag berita

########## PACKAGE
package require http
package require tdom
package require tls
::tls::init -ssl2 false -ssl3 false -tls1 true
::http::register https 443 [list ::tls::socket -autoservername true -require true -cadir /etc/ssl/certs]
::http::config -useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0"

set a_berita {
        "Diambil dari"
        "Dimuat di"
        "Info Tebaru dari"
        "Info Terkini di"
        "Kabar dari"
}


proc get_rdm {args} {
        set news_src {"go_detik" "go_cnn" "go_liputan" "go_republika"}
        set news_on [lindex $news_src [rand [llength $news_src]]]
        $news_on
}

proc go_detik {args} {
        global notic
        set channels_string [channels]
        set cleaned_string [regsub -all {[{}]} $channels_string ""]
        set channel_list [split $cleaned_string " "]
        foreach c $channel_list {
                if {![channel get $c berita]} { 
                        putlog "$notic $c is Not Berita Channel"
                } else {
                        putlog "$notic $c is Berita Channel -> Send News!"
                        set detik_kat { "health" "news" "inet" "finance" "hot" "sport" "travel" "food" "wolipop" }
                        set kat [lindex $detik_kat [rand [llength $detik_kat]]]
                        putlog "$notic Get News Detik from $kat !"
                        get_detik $kat $c
                }
        }
}

proc go_liputan {args} {
        global notic
        set channels_string [channels]
        set cleaned_string [regsub -all {[{}]} $channels_string ""]
        set channel_list [split $cleaned_string " "]
        foreach c $channel_list {
                if {![channel get $c berita]} { 
                        putlog "$notic $c is Not Berita Channel"
                } else {
                        putlog "$notic $c is Berita Channel -> Send News!"
                        set liputan_kat { "bisnis" "news" "tv" "showbiz" "tekno" "hot" "cek-fakta" "crypto" "saham" "otomotif"}
                        set kat [lindex $liputan_kat [rand [llength $liputan_kat]]]
                        putlog "$notic Get News Liputan6 from $kat !"
                        get_liputan $kat $c
                }
        }
}

proc go_cnn {args} {
        global notic
        set channels_string [channels]
        set cleaned_string [regsub -all {[{}]} $channels_string ""]
        set channel_list [split $cleaned_string " "]
        foreach c $channel_list {
                if {![channel get $c berita]} { 
                        putlog "$notic $c is Not Berita Channel"
                } else {
                        putlog "$notic $c is Berita Channel -> Send News!"
                        set cnn_kat { "ekonomi" "teknologi" "hiburan" "otomotif" "gaya-hidup" "internasional"}
                        set kat [lindex $cnn_kat [rand [llength $cnn_kat]]]
                        putlog "$notic Get News CNNIndonesia from $kat !"
                        get_cnn $kat $c
                }
        }
}

proc go_republika {args} {
        global notic
        set channels_string [channels]
        set cleaned_string [regsub -all {[{}]} $channels_string ""]
        set channel_list [split $cleaned_string " "]
        foreach c $channel_list {
                if {![channel get $c berita]} { 
                        putlog "$notic $c is Not Berita Channel"
                } else {
                        putlog "$notic $c is Berita Channel -> Send News!"
                        set repb_kat { "news" "finansial" "tekno" "otomotif" "bisnis" "sport"}
                        set kat [lindex $repb_kat [rand [llength $repb_kat]]]
                        putlog "$notic Get News REPUBLIKA from $kat !"
                        get_republika $kat $c
                }
        }
}

proc get_detik {cat chn} {
        global ijoo a_berita
        set mx 0
        set urlnews "https://$cat.detik.com/rss"
        set rssData [get_news $urlnews]
        set doc [dom parse $rssData]
        set root [$doc documentElement]
        set items [$root selectNodes //item]
        foreach node $items {
                if { $mx == $ijoo(maxberita) } { break }
                set mx [expr {$mx + 1}]
                set judul [[[$node selectNodes title] firstChild] nodeValue]
                set linkberita [[[$node selectNodes link] firstChild] nodeValue]
                set b_berita [lindex $a_berita [rand [llength $a_berita]]]
                if { $mx > 1 } {
                        putquick "PRIVMSG $chn :$ijoo(detiklogo) \003Artikel berikutnya [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                } else {
                        putquick "PRIVMSG $chn :$ijoo(detiklogo) \003[salam], $b_berita \0038,12 [string toupper $cat] \003 [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                }
        }
}

proc get_liputan {cat chn} {
        global ijoo a_berita
        set mx 0
        set urlnews "https://feed.liputan6.com/rss/$cat"
        set rssData [get_news $urlnews]
        set doc [dom parse $rssData]
        set root [$doc documentElement]
        set items [$root selectNodes //item]
        foreach node $items {
                if { $mx == $ijoo(maxberita) } { break }
                set mx [expr {$mx + 1}]
                set judul [[[$node selectNodes title] firstChild] nodeValue]
                set linkberita [[[$node selectNodes link] firstChild] nodeValue]
                set b_berita [lindex $a_berita [rand [llength $a_berita]]]
                if { $mx > 1 } {
                        putquick "PRIVMSG $chn :$ijoo(liputanlogo) \003Artikel berikutnya [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                } else {
                        putquick "PRIVMSG $chn :$ijoo(liputanlogo) \003[salam], $b_berita \0030,4 [string toupper $cat] \003 [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                }
        }
}

proc get_cnn {cat chn} {
        global ijoo a_berita
        set mx 0
        set urlnews "https://www.cnnindonesia.com/$cat/rss"
        set rssData [get_news $urlnews]
        set doc [dom parse $rssData]
        set root [$doc documentElement]
        set items [$root selectNodes //item]
        foreach node $items {
                if { $mx == $ijoo(maxberita) } { break }
                set mx [expr {$mx + 1}]
                set judul [[[$node selectNodes title] firstChild] nodeValue]
                set linkberita [[[$node selectNodes link] firstChild] nodeValue]
                set b_berita [lindex $a_berita [rand [llength $a_berita]]]
                if { $mx > 1 } {
                        putquick "PRIVMSG $chn :$ijoo(cnnlogo) \003Artikel berikutnya [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                } else {
                        putquick "PRIVMSG $chn :$ijoo(cnnlogo) \003[salam], $b_berita \0034,1 [string toupper $cat] \003 [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                }
        }
}

proc get_republika {cat chn} {
        global ijoo a_berita
        set mx 0
        set urlnews "https://www.republika.co.id/rss/$cat"
        set rssData [get_news $urlnews]
        set doc [dom parse $rssData]
        set root [$doc documentElement]
        set items [$root selectNodes //item]
        foreach node $items {
                if { $mx == $ijoo(maxberita) } { break }
                set mx [expr {$mx + 1}]
                set judul [[[$node selectNodes title] firstChild] nodeValue]
                set linkberita [[[$node selectNodes link] firstChild] nodeValue]
                set b_berita [lindex $a_berita [rand [llength $a_berita]]]
                if { $mx > 1 } {
                        putquick "PRIVMSG $chn :$ijoo(republikalogo) \003Artikel berikutnya [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                } else {
                        putquick "PRIVMSG $chn :$ijoo(republikalogo) \003[salam], $b_berita \0030,1 [string toupper $cat] \003 [dezip ivRvn.ZAO1G/] \00312$judul\003 [dezip ivRvn.ZAO1G/] Selengkapnya di \037[tinyurl $linkberita]\037"
                }
        }
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

proc get_news {target} {
    set token [::http::geturl $target]
    set body [::http::data $token]
    ::http::cleanup $token
    return $body
}

putlog "#######################################"
putlog "##         CovNews is Loaded!!       ##"
putlog "#######################################"
