##############################################################################
##                                                                          ##
## TCL NAME : COVID TCL                                                     ##
## VERSION  : 1.2-dev                                                       ##
## RELEASE  : 15 SEPT 2021                                                  ##
## AUTHOR   : IJOO A.K.A VICTOR                                             ##
##                                                                          ##
## SIMPLE TCL JUST FOR BASIC TCL, AND NO PS TOTCHAN, DLL                    ##
## BORING WITH ALOT OF TCL LIKE NET* BUS* ALLO* PET*                        ##
## WITH ALOT FEATURE BUT USELESS (I JUST NEED PARKING JOIN PART BOT)        ##
##                                                                          ##
## RUN YOUR EGGDROP                                                         ##
## /MSG BOT HELLO             identify yourself to bot                      ##
## /MSG BOT pass <password>   create password to bot                        ##
## /MSG BOT auth <password>   auth yoursef to bot                           ##
## /MSG BOT out               logout from bot                               ##
##                                                                          ##
## CMD AVAILABLE:                                                           ##
## `join    `part    `chanset                                               ##
##                                                                          ##
##                                               CREATED WITH WFH SITUATION ##
##############################################################################

bind msg n auth msg_auth
bind msg n out msg_deauth
bind msg n sz msg_sz
bind msg n join msg_join
bind pub n `join pub_join
bind msg n part msg_part
bind pub n `part pub_part
bind pub n `auth pub_auth
bind pub n `chanset pub_chanset
bind pub n `ver pub_info
bind msg n identify msg_identify

bind notc - "*This nickname is registered and protected.*" autoident
bind notc - "*Password accepted - you are now recognized.*" compautoident
bind notc - "*This nick is owned by someone else.*" autoident2
bind notc - "*Password accepted for*" compautoident2

set partm {
"bAlIk Base!" "WroNG ChaNneL!" "Bad UsER!" "BaCk To BaSe" "Be Right Back!" "No one Join Forever!" "Damn! Wrong Channel!" "Access Denied!" "Return To Base!"
"Access Rejected!" "Going Back!" "Ilegal Channel!" "Going Home!" "Good Bye!" "Sayonara!" "Ups! Wrong Room :P" "Got To Go!" "Goodbye! Ugly :P" "Go To Hell!"
}

set awaym {
"aWaY FrOM KeyBoaRd" "SlEppiNG oN Net" "WaCthiNG Tube6.nET" "Got tO gO!" "No oNE CarE!" "CoVID tcl bY iJoo" "EgGDrop noT diES" "i ThiNk aBouT yOu" "reMeMbeRiNg You"
"Play mOBiLE lEGenD" "CoRoNaViRus iS DeADly" "NoT ReaDY F0r QueRY" "Bad Boy nOT AlLoWed" "CrOSsinG tHE StrEet"
}

################################################################

if {[info exists basechan]} {
	if {![validchan $basechan]} {
		channel add $basechan
	}
}

proc autoident {nick uhost hand text dest} {
	global nickpass
	putserv "PRIVMSG NickServ :identify $nickpass"
}
proc compautoident {nick uhost hand text dest} {
	global owner
	putserv "PRIVMSG $owner :$notim \002Identification\002 has been successful.."
}

proc autoident2 {nick uhost hand text dest} {
	global nickpass
	putserv "PRIVMSG NickServ@services.dal.net :identify $nickpass"
}
proc compautoident2 {nick uhost hand text dest} {
	global owner
	putserv "PRIVMSG $owner :$notim \002Identification\002 has been successful.."
}

##### PROC MSG
proc msg_sz {nick uhost hand rest} {
	global botnick notim tolak
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notim [katakata "akses"] $tolak"
		return 0
	}

	set rest [lindex $rest 0]
	if {$rest == ""} {
		putquick "PRIVMSG $nick :$notim Command: /msg $botnick sz <text>"
		return 0
	}
	putquick "PRIVMSG $nick :$notim zip: [enzip "$rest"]"
	putquick "PRIVMSG $nick :$notim dezip: [dezip "$rest"]"
	putquick "PRIVMSG $nick :$notim dcp: [dcp "$rest"]"
	putquick "PRIVMSG $nick :$notim dezip+dcp: [dezip [dcp "$rest"]]"
	putquick "PRIVMSG $nick :$notim decrypt: [decrypt 64 "$rest"]"
	putquick "PRIVMSG $nick :$notim encrypt: [encrypt 64 "$rest"]"
	putquick "PRIVMSG $nick :$notim unsix: [unsix "$rest"]"
	return 0
}

proc msg_auth {nick uhost hand rest} {
	global botnick notic tolak tuan
	if {![matchattr $hand n]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	if {[matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "sudah auth dengan akses"] $tuan"
		return 0
	}
	set inputpw [lindex $rest 0]
	if {$inputpw == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick auth <password>"
		return 0
	}
	set checkpw [passwdok $nick $inputpw]
	if {$checkpw == 1} {
		set hostmask "${nick}!*@*"
		setuser $nick HOSTS $hostmask
		setuser $nick XTRA COVID $inputpw
		chattr $nick +fZHQ
		putquick "NOTICE $nick :$notic [katakata "akses"] $tuan"
		save
	} else {
		putquick "NOTICE $nick :$notic [katakata "password salah"]!"
	}
}

proc msg_deauth {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand n]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "belum melakukan auth ke bot"]!"
		return 0
	}
	chattr $nick -Z
	save
	putquick "NOTICE $nick :$notic [katakata "sukses deauth"]!"
}

proc msg_join {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick join <#chan>"
	} else {
		channel add $namachan
		putquick "NOTICE $nick :$notic [katakata "joining"] $namachan"
	}
}

proc msg_part {nick uhost hand rest} {
	global botnick notic tolak partm partmsg
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick part <#chan>"
	} else {
		set partmsg [lindex $partm [rand [llength $partm]]]
		putserv "PART $namachan $partmsg"
		putquick "NOTICE $nick :$notic [katakata "parting"] $namachan"
		channel remove $namachan
	}
}

proc msg_identify {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set passwo [lindex $rest 0]
	if { $passwo == ""} {
		putquick "NOTICE $nick :$notic Command: /msg $botnick <password>"
	} else {
		putserv "PRIVMSG NickServ :identify $passwo"
	}
}

############## PROC PUB
proc pub_auth {nick uhost hand chan rest} {
	global botnick notic tolak tuan
	if {![matchattr $hand Z]} {
		putquick "PRIVMSG $chan :$nick, $tolak"
	} else {
		putquick "PRIVMSG $chan :$nick, $tuan"
	}
}

proc pub_join {nick uhost hand chan rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: `join <#chan>"
	} else {
		channel add $namachan
		putquick "NOTICE $nick :$notic [katakata "joining"] $namachan"
	}
}

proc pub_part {nick uhost hand chan rest} {
	global botnick notic tolak partm partmsg
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set namachan [lindex $rest 0]
	if { $namachan == ""} {
		putquick "NOTICE $nick :$notic Command: `part <#chan>"
	} else {
		set partmsg [lindex $partm [rand [llength $partm]]]
		putserv "PART $namachan $partmsg"
		putquick "NOTICE $nick :$notic [katakata "parting"] $namachan"
		channel remove $namachan
	}
}

proc pub_chanset {nick uhost hand chan rest} {
	global botnick notic tolak
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set opsitext [string tolower [lindex $rest 0]]
	foreach i [channel info $chan] {
		if {([string match "$opsitext" $i])} {
			putquick "NOTICE $nick :$notic [katakata "sudah ada opsi"] $opsitext !"
			return 0
		}
	}	
	channel set $chan ${opsitext}
	putquick "NOTICE $nick :$notic [katakata "channel sudah diset"]: $opsitext"

}

proc pub_info {nick uhost hand chan rest} {
	global botnick notic tolak version tcl_version
	if {![matchattr $hand Z]} {
		putquick "NOTICE $nick :$notic [katakata "akses"] $tolak"
		return 0
	}
	set getos "grep PRETTY /etc/os-release"
	catch { eval exec $getos } outputx
	set myos [string map {"PRETTY_NAME=" ""} $outputx]
	puthelp "PRIVMSG $chan :[lgrnd] [katakata "running with eggdrop"] v[lindex $version 0] [katakata "with tcl"] $tcl_version on $myos"
}

###### PROC FUNCTION
proc unsix {txt} {
	set retval $txt
	regsub ~ $retval "" retval
	return $retval
}
proc dezip {txt} {
	return [decrypt 64 [unsix $txt]]
}
proc dcp {txt} {
	return [decrypt 64 $txt]
}
proc enzip {txt} {
	return [encrypt 64 [unsix $txt]]
}

set hitamputih { "0" "1" }
set berwarna { "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" }

proc lgrnd {} {
	global hitamputih berwarna show_logo
	set bg1 [lindex $hitamputih [rand [llength $hitamputih]]]
	set bg2 [lindex $berwarna [rand [llength $berwarna]]]
	set show_logo "\003$bg1,$bg2"
	append show_logo "C"
	append show_logo "\003$bg2,$bg1"
	append show_logo "o"
	append show_logo "\003$bg1,$bg2"
	append show_logo "V"
	append show_logo "\003$bg2,$bg1"
	append show_logo "I"
	append show_logo "\003$bg1,$bg2"
	append show_logo "D"
	append show_logo "\003"
	set lgrnd $show_logo
}

timer 2 setaway
proc setaway {} {
	global awaym loopaway
	set awaymsg [lindex $awaym [rand [llength $awaym]]]
	set waktu [duration [expr [clock seconds] - $::uptime]]
	set fixaway "[lgrnd] \[\037Uptime:\037 $waktu\] [dezip "EL0P10zaHDp/"] $awaymsg [dezip "ivRvn.ZAO1G/"]"
	putserv "AWAY $fixaway"
	timer 30 setaway
}

proc katakata {kata} {
	set kata1 [split $kata ""]
	set kata2 ""
	foreach kata3 $kata1 {
		if {[string trim $kata3] != " "} {
			append kata2 [atasbawah $kata3] ""
		}
	}
	return [string trim $kata2]
}

proc atasbawah {abjad} {
	set acakx {"tolower" "toupper"}
	set acaky [lindex $acakx [rand [llength $acakx]]]
	set ab [string $acaky $abjad]
	return $ab
}

set notic [dezip "UdE3x0oEa700JjCIJ1lMldw1"]
set notim [dezip "UdE3x0oEa700JjCIJ1lMldw1"]
set tolak [dezip "mUO3m.vyfg3/Zn68503MNTM/yvbjS1qs/10."]
set tuan [dezip "7JqUq0UjBv00VHBqv.8tyPs1k/tfS0jmlaL."]


