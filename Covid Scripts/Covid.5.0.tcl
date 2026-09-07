##############################################################################
##                                                                          ##
## TCL NAME     : COVID TCL                                                 ##
## VERSION      : 5.0                                                       ##
## AUTHOR       : IJOO A.K.A VICTOR                                         ##
##                                                                          ##
## This is bot Control with Protection Scripts                              ##
## Just basic control to your eggdrop..                                     ##
## Working and Tested on irc.dal.net & irc.evochat.id                       ##
##                                                                          ##
## RUN YOUR EGGDROP                                                         ##
## /MSG BOT HELLO             identify yourself to bot                      ##
## /MSG BOT pass <password>   create password to bot                        ##
## /MSG BOT auth <password>   auth yoursef to bot                           ##
## /MSG BOT deauth            logout from bot                               ##
## /MSG BOT help              See Help CMD                                  ##
##                                                                          ##
##                                               CREATED WITH WFH SITUATION ##
##############################################################################

######################################### You Can Edit Here ##################
set verc "5.0"
set notic "!\002c\037V\037d\002!"
set notim "!\002c\037V\037d\002!"
set tolak "\002\0034deNieD!\003\002"
set tuan "\002\00312oWNeR!\003\002"
set aktif "\002ACTIVATED\002"
set deaktif "\002DEACTIVATED\002"
set enable "\002ENABLE\002"
set disable "\002DISABLE\002"
##############################################################################

set partm {
	"bAlIk Base!" "WroNG ChaNneL!" "Bad UsER!" "BaCk To BaSe" "Be Right Back!" "No one Join Forever!" "Damn! Wrong Channel!" "Access Denied!" "Return To Base!"
	"Access Rejected!" "Going Back!" "Ilegal Channel!" "Going Home!" "Good Bye!" "Sayonara!" "Ups! Wrong Room :P" "Got To Go!" "Goodbye! Ugly :P" "Go To Hell!"
}

set awaym {
	"aWaY FrOM KeyBoaRd" "SlEppiNG oN Net" "WaCthiNG Tube6.nET" "Got tO gO!" "No oNE CarE!" "CoVID tcl bY iJoo" "EgGDrop noT diES" "i ThiNk aBouT yOu" "reMeMbeRiNg You"
	"Play mOBiLE lEGenD" "CoRoNaViRus iS DeADly" "NoT ReaDY F0r QueRY" "Bad Boy nOT AlLoWed" "CrOSsinG tHE StrEet"
}

set versim {
	"eGgdRoP v1.5.6+ctcpfix (c) 1996" "xchat 2.8.8 Ubuntu" "rZNC Version 1.0 [02/01/11] - Built from ZNC." "psyBNC-2.3.1-7"
	"PIRCH98:WIN 95/98/WIN NT:1.0 (build 1.0.1.1190)" "Snak for Macintosh 4.13 English" "mIRC 3.75 via ZNC 1.8.2deb10+2"
}

set sambutm {
	"seLaMat DatAng Ya.." "EnJoy YoUr Stay.." "GrEat to See YOu.." "WelComE bACk yOo.."
	"Glad wIth YoU Here.." "StAy anD HaPpy ChAt.." "NeEd Help? Msg The @p.."
}

set ctcp-mode "1"
set global-flood-chan 10:60
set global-flood-deop 3:10
set global-flood-kick 3:10
set global-flood-join 5:60
set global-flood-ctcp 3:60
set global-flood-nick 5:60
set global-aop-delay 5:30
set global-idle-kick 0
set global-chanmode "nt"
set global-stopnethack-mode 0
set global-revenge-mode 0
set global-ban-time 120
set global-exempt-time 60
set global-invite-time 60
set global-chanset {
        -autoop         +autovoice
        -bitch          +cycle
        +dontkickops    +dynamicbans
        +dynamicexempts +dynamicinvites
        -enforcebans    -greet
        -inactive       +nodesynch
        -protectfriends +protectops
        -revenge        -revengebot
        -secret         -seen
        +shared         +statuslog
        +userbans       +userexempts
        +userinvites    +protecthalfops
        -autohalfop
}

if {![info exists greet-burst-max]} {set greet-burst-max 3}
if {![info exists greet-burst-window]} {set greet-burst-window 10}
if {![info exists greet-burst-cooldown]} {set greet-burst-cooldown 30}
if {![info exists cvd-rejoin-delay]} {set cvd-rejoin-delay 10}
if {![info exists cvd-rejoin-max]} {set cvd-rejoin-max 3}
if {![info exists cvd-rejoin-window]} {set cvd-rejoin-window 60}
if {![info exists cvd-rejoin-cooldown]} {set cvd-rejoin-cooldown 300}
if {![info exists cvd-automod-max]} {set cvd-automod-max 10}
if {![info exists cvd-automod-window]} {set cvd-automod-window 8}
if {![info exists cvd-automod-duration]} {set cvd-automod-duration 60}
if {![info exists cvd-guard-op-grace]} {set cvd-guard-op-grace 30}

array set cvd_netprofile {
	dal.net {svc "NickServ@services.dal.net" ignsvc "*!*@dal.net"}
}

proc cvd_netget {network key default} {
	global cvd_netprofile
	if {[info exists cvd_netprofile($network)]} {
		array set prof $cvd_netprofile($network)
		if {[info exists prof($key)]} {return $prof($key)}
	}
	return $default
}

proc cvd_apply_defaults {chan} {
	global global-chanmode global-flood-chan global-flood-deop global-flood-kick
	global global-flood-join global-flood-ctcp global-flood-nick global-aop-delay
	global global-idle-kick global-stopnethack-mode global-revenge-mode
	global global-ban-time global-exempt-time global-invite-time global-chanset

	catch {channel set $chan chanmode ${global-chanmode}}
	catch {channel set $chan flood-chan ${global-flood-chan}}
	catch {channel set $chan flood-deop ${global-flood-deop}}
	catch {channel set $chan flood-kick ${global-flood-kick}}
	catch {channel set $chan flood-join ${global-flood-join}}
	catch {channel set $chan flood-ctcp ${global-flood-ctcp}}
	catch {channel set $chan flood-nick ${global-flood-nick}}
	catch {channel set $chan aop-delay ${global-aop-delay}}
	catch {channel set $chan idle-kick ${global-idle-kick}}
	catch {channel set $chan stopnethack-mode ${global-stopnethack-mode}}
	catch {channel set $chan revenge-mode ${global-revenge-mode}}
	catch {channel set $chan ban-time ${global-ban-time}}
	catch {channel set $chan exempt-time ${global-exempt-time}}
	catch {channel set $chan invite-time ${global-invite-time}}
	foreach flag ${global-chanset} {
		catch {channel set $chan $flag}
	}
	putlog "!cVd! Default settings applied to $chan"
}

bind msg n auth msg_auth
bind msg Z deauth msg_deauth
bind msg Z nick msg_nick
bind msg Z realname msg_realname
bind msg Z identify msg_identify
bind msg Z cv msg_cv
bind msg Z join msg_join
bind msg Z part msg_part
bind msg Z chanset msg_chanset
bind msg Z rehash msg_rehash
bind msg Z restart msg_restart
bind msg Z die msg_shutdown
bind msg Z ignore msg_cuek
bind msg Z autogreet msg_greetonoff
bind msg Z cvdset msg_cvdset
bind msg Z help kirimhelp
bind pub Z `deauth pub_deauth
bind pub Z `logo pub_logo
bind pub Z `k pub_kick
bind pub Z `kb pub_kban
bind pub Z `b pub_ban
bind pub Z `ub pub_unban
bind pub Z `mub pub_munban
bind pub Z `join pub_join
bind pub Z `part pub_part
bind pub n `auth pub_auth
bind pub Z `ver pub_info
bind pub Z `mode pub_mode
bind pub Z `cycle pub_cycle
bind pub Z `ping pub_ping
bind pub Z `topic pub_topic
bind pub Z `+f pub_plusteman
bind pub Z `-f pub_minteman
bind pub Z `+av pub_pluspois
bind pub Z `-av pub_minpois
bind pub Z `+greet pub_plusgreet
bind pub Z `-greet pub_mingreet
bind pub Z `+guard pub_plusguard
bind pub Z `-guard pub_minguard
bind pub Z `status pub_status
bind pub Z `+v pub_pois
bind pub Z `mv pub_mpois
bind pub Z `-v pub_depois
bind pub Z `mdv pub_mdepois
bind pub Z `+o pub_opers
bind pub Z `-o pub_dopers
bind pub Z `deluser pub_deluser
bind pub Z `userlist pub_userlist
bind pubm Z * pub_botcmd
bind notc - "*Password accepted*" autoident2
bind notc - "*This nickname is registered and protected*" autoident
bind notc - "*This nick is owned by someone else*" autoident
bind ctcp - "VERSION" autoversion
bind ctcr - PING pingreply
bind evnt - init-server evnt:init_server
bind time -|- {00 * * * *} setaway
bind raw - 432 raw_release
bind splt - * cvd_splt
bind rejn - * cvd_rejn
bind join - * cvd_autofriend
bind join - * cvd_joinburst
bind kick - * cvd_kick
bind flud - * cvd_flood
bind mode - * cvd_modeprotect
setudef flag sambut
setudef flag guard

if {![info exist realname]} {set realname $notim}
if {![info exist greetmode]} {set greetmode "0"}
if {![info exist ircv3caps]} {set ircv3caps ""}
if {![info exists cvd_splitnicks]} {array set cvd_splitnicks {}}
if {![info exists cvd_greettimes]} {array set cvd_greettimes {}}
if {![info exists cvd_greetsuppress]} {array set cvd_greetsuppress {}}
if {![info exists cvd_cmdtimes]} {array set cvd_cmdtimes {}}
if {![info exists cvd_rejointimes]} {array set cvd_rejointimes {}}
if {![info exists cvd_rejoinsuppress]} {array set cvd_rejoinsuppress {}}
if {![info exists cvd_bursttimes]} {array set cvd_bursttimes {}}
if {![info exists cvd_automod]} {array set cvd_automod {}}
if {![info exists cvd_guard_pending]} {array set cvd_guard_pending {}}
if {[info exists basechan]} {if {![validchan $basechan]} {channel add $basechan; cvd_apply_defaults $basechan}}

proc autoident {nick uhost hand text dest} {
	global nickpass network
	set target [cvd_netget $network svc "NickServ"]
	putlog "!cVd! $network Identify"
	putserv "PRIVMSG $target :identify $nickpass"
}

proc autoident2 {nick uhost hand text dest} {
	putlog "!cVd! Identification has been successful.."
}

proc raw_release {args} {
	global network botnick nickpass
	set target [cvd_netget $network svc "NickServ"]
	putserv "PRIVMSG $target :release $botnick $nickpass"
	putlog "!cVd! Release $network"
}


##### PROC MSG
proc msg_cv {nick uhost hand rest} {
	global botnick notim tolak
	set rest [lindex $rest 0]
	if {$rest == ""} {putquick "PRIVMSG $nick :$notim Command: /msg $botnick cv <text>";return 0}
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
	if {![matchattr $hand n]} {putquick "NOTICE $nick :$notic $tolak";return 0}
	if {[matchattr $hand Z]} {putquick "NOTICE $nick :$notic [katakata "already auth with access"]: $tuan";return 0}
	set inputpw [lindex $rest 0]
	if {$inputpw == ""} {putquick "NOTICE $nick :$notic Command: /msg $botnick auth <password>";return 0}
	set checkpw [passwdok $nick $inputpw]
	if {$checkpw == 1} {
		set hostmask "${nick}!*@*"
		setuser $nick HOSTS $hostmask
		setuser $nick XTRA COVID $inputpw
		chattr $nick +fZHQ
		putquick "PRIVMSG $nick :$notic [katakata "access"] $tuan"
		save
	} else {
		putquick "PRIVMSG $nick :$notic [katakata "wrong password"]!"
	}
}

proc msg_deauth {nick uhost hand rest} {
	global botnick notic tolak
	if {![matchattr $hand n]} {return 0}
	if {![matchattr $hand Z]} {putquick "NOTICE $nick :$notic [katakata "please auth 1st"]!";return 0}
	chattr $nick -Z;save
	putquick "PRIVMSG $nick :$notic [katakata "successfully deauth"]!"
}

proc msg_join {nick uhost hand rest} {
	global botnick notic tolak
	set namachan [lindex $rest 0]
	if { $namachan == ""} {putquick "PRIVMSG $nick :$notic Command: /msg $botnick join <#chan>"; return 0}
	if {[string first # $namachan] != 0} {set namachan "#$namachan"}
	set isnew [expr {![validchan $namachan]}]
	channel add $namachan
	if {$isnew} {cvd_apply_defaults $namachan}
	putquick "PRIVMSG $nick :$notic [katakata "im joining"] $namachan"
}

proc msg_part {nick uhost hand rest} {
	global botnick notic tolak partm partmsg
	set namachan [lindex $rest 0]
	if { $namachan == ""} {putquick "PRIVMSG $nick :$notic Command: /msg $botnick part <#chan>"; return 0}
	if {[string first # $namachan] != 0} {set namachan "#$namachan"}	
	set partmsg [lindex $partm [rand [llength $partm]]]
	putserv "PART $namachan [lgrnd] $partmsg"
	putquick "PRIVMSG $nick :$notic [katakata "im parting"] $namachan"
	channel remove $namachan
}

proc msg_nick {nick uhost hand rest} {
	global botnick notic tolak notim
	set nik [lindex $rest 0]
	set pas [lindex $rest 1]
	if {$nik == "" || $pas == ""} {putquick "PRIVMSG $nick :$notic Command: \002nick\002 <nick> <pass>";return 0}
	set bnick $nik ; set bpass $pas
	putserv "NICK $nik $pas"
	putquick "PRIVMSG $nick :$notic [katakata "botnick change to"] $nik"
}

proc msg_realname {nick uhost hand rest} {
	global botnick realname notic notim
	if {$rest == ""} {putquick "PRIVMSG $nick :$notic Command: \002realname\002 <realname>";return 0}
	set realname $rest ; save
	putserv "QUIT :$notic [katakata "rEALNaME CHaNGED By"] \[ $nick \]"
}

proc msg_identify {nick uhost hand rest} {
	global botnick notic tolak
	set passwo [lindex $rest 0]
	if { $passwo == ""} {
		putquick "PRIVMSG $nick :$notic Command: /msg $botnick <password>"
	} else {
		putserv "PRIVMSG NickServ :identify $passwo"
	}
}

proc msg_rehash {nick uhost hand rest} {
	global botnick notim notic tolak
	utimer 1 rehash
	putquick "PRIVMSG $nick :$notim [katakata "rehasing done"]!"
}

proc msg_restart {nick uhost hand rest} {
	global botnick notim notic tolak
	set alasan "[katakata "[lrange $rest 0 end]"]"
	if {$alasan == ""} {set alasan "[katakata "restart request by"] \0030,4 $nick \003"}
	putquick "PRIVMSG $nick :$notim [katakata "restart now"]!"
	putserv "QUIT :[lgrnd] $alasan"
}

proc msg_shutdown {nick uhost hand rest} {
	global botnick notim tolak notic
	set alasan "[katakata "[lrange $rest 0 end]"]"
	if {$alasan == ""} {set alasan "[katakata "shutdown request by"] \0030,4 $nick \003"}
	putquick "PRIVMSG $nick :$notim [katakata "shutdown now"]!"
	putserv "QUIT :[lgrnd] $alasan"
	utimer 2 die
}

proc msg_greetonoff {nick host hand rest} {
	global botnick notim greetmode enable disable
	set opsi [lindex [split $rest] 0]
	if {$opsi == ""} {puthelp "PRIVMSG $nick :$notim Usage: autogreet <on/off>"; return 0}
	if {$opsi == "on"} {
		if {$greetmode == "1"} {puthelp "PRIVMSG $nick :$notim auToGrEet is AlReady \[$enable\]"; return 0}
		catch { bind join - * kirim_sambutan}
		set greetmode "1"
		puthelp "PRIVMSG $nick :$notim auToGrEet is \[$enable\]"
	}
	if {$opsi == "off"} {
		if {$greetmode == "0"} {puthelp "PRIVMSG $nick :$notim auToGrEet is AlReady \[$disable\]"; return 0}
		catch { unbind join - * kirim_sambutan}
		set greetmode "0"
		puthelp "PRIVMSG $nick :$notim auToGrEet is \[$disable\]"
	}
}

proc msg_cvdset {nick host hand rest} {
	global notic

	array set cvd_cfgmap {
		greet,max        greet-burst-max
		greet,window     greet-burst-window
		greet,cooldown   greet-burst-cooldown
		rejoin,delay     cvd-rejoin-delay
		rejoin,max       cvd-rejoin-max
		rejoin,window    cvd-rejoin-window
		rejoin,cooldown  cvd-rejoin-cooldown
		automod,max      cvd-automod-max
		automod,window   cvd-automod-window
		automod,duration cvd-automod-duration
		guard,grace      cvd-guard-op-grace
	}

	set cat [lindex $rest 0]
	set opt [lindex $rest 1]
	set val [lindex $rest 2]

	if {$cat == ""} {
		puthelp "PRIVMSG $nick :$notic Usage: cvdset <category> <option> <value>"
		puthelp "PRIVMSG $nick :$notic Categories: greet <max/window/cooldown>, rejoin <delay/max/window/cooldown>, automod <max/window/duration>, guard <grace>"
		return 0
	}

	if {$opt == ""} {
		set found 0
		foreach key [lsort [array names cvd_cfgmap "$cat,*"]] {
			set found 1
			set optname [lindex [split $key ,] 1]
			set varname $cvd_cfgmap($key)
			global $varname
			puthelp "PRIVMSG $nick :$notic $cat $optname = [set $varname]"
		}
		if {!$found} {puthelp "PRIVMSG $nick :$notic [katakata "unknown category"]: $cat"}
		return 0
	}

	set mapkey "$cat,$opt"
	if {![info exists cvd_cfgmap($mapkey)]} {
		puthelp "PRIVMSG $nick :$notic [katakata "unknown category/option"]: $cat $opt"
		return 0
	}
	set varname $cvd_cfgmap($mapkey)
	global $varname

	if {$val == ""} {
		puthelp "PRIVMSG $nick :$notic $cat $opt = [set $varname]"
		return 0
	}

	if {![string is integer -strict $val] || $val < 0} {
		puthelp "PRIVMSG $nick :$notic [katakata "value must be a non-negative integer"]"
		return 0
	}

	set $varname $val
	puthelp "PRIVMSG $nick :$notic $cat $opt [katakata "set to"] $val"
}

proc msg_chanset {nick host hand rest} {
	global notic tolak notim
	set chan [lindex [split $rest] 0]
	set flag [lindex [split $rest] 1]
	set str [join [lrange [split $rest] 1 end]]
	if {[matchattr $hand Z $chan]} {
		if {![validchan $chan]} {
			puthelp "PRIVMSG $nick :$notim [katakata "im not on that channel"]!"
			return
		}
		set value ""
		set error 0
		if {($flag == "") || ($chan == "")} {
			puthelp "PRIVMSG $nick :$notim \002chanset\002 <#chan> <+/-value>"
			return
		}
		if {[regexp {^[+-]} $flag]} {
			set rem_flag [string map {"+" "" "-" ""} $flag]
			set error [catch {channel get $chan $rem_flag} value]
		}
		if {$error == "1"} {
			puthelp "PRIVMSG $nick :$notim [katakata "check your option again"]!"
			return
		}
		if {[regexp {^[+]} $flag]} {
			if {$value == "1"} {
				puthelp "PRIVMSG $nick :$notim mOde \[\002$flag\002\] [katakata "already set for"] $chan"
			} else {
				channel set $chan $flag
				puthelp "PRIVMSG $nick :$notim set $chan to \[\002$flag\002\]"
			}
		} elseif {[regexp {^[-]} $flag]} {
			if {$value == "0"} {
				puthelp "PRIVMSG $nick :$notim MoDe \[\002$flag\002\] [katakata "already set for"] $chan."
			} else {
				channel set $chan $flag
				puthelp "PRIVMSG $nick :$notim set $chan to \[\002$flag\002\]"
			}
		} else {
			set error [catch {channel get $chan $flag} value]
			set rem_value [string map {" " ":"} $value]
			if {$error == "1"} {
				puthelp "PRIVMSG $nick :$notim [katakata "Invalid channel setting"]."
				return
			}
			if {$str == ""} {
				puthelp "PRIVMSG $nick :$notim \002chanset\002 <#chan> <+/-value>"
				return
			}
			if {[string equal -nocase $rem_value $str]} {
				puthelp "PRIVMSG $nick :$notim mOde \[\002$flag\002\] [katakata "already set"] \002$str\002 di $chan."
				return
			}
		channel set $chan $flag $str
		puthelp "PRIVMSG $nick :Set \[\002$flag\002\] to \002$str\002 on $chan"
		}
	} else {
		putquick "PRIVMSG $nick :$notic $tolak"
	}
}

proc msg_cuek {nick uhost hand rest} {
	global botnick notim tolak notic
	if {[lindex [split $rest] 0] == ""} {putquick "PRIVMSG $nick :\037ERROR\037: Usage add / del / list"; return 0}
	if {[lindex [split $rest] 0] == "add"} {
			set addmask [lindex [split $rest] 1]
			if {[isignore $addmask]} {putquick "PRIVMSG $nick :\037ERROR\037: This is already a Valid Ignore."; return 0}
			set duration [lindex [split $rest] 2]
	if {![info exist duration]} { set duration "0" }
			set reason "iGnored By Covid TcL"
			newignore $addmask $hand "$reason" $duration
			putquick "PRIVMSG $nick :\002New Ignore\002: $addmask - \002Duration\002: $duration minutes - \002Reason\002: $reason"
			return 0
	}
	if {[lindex [split $rest] 0] == "del"} {
	set delmask [lindex [split $rest] 1]
	if {![isignore $delmask]} {putquick "PRIVMSG $chan :\037ERROR\037: This is NOT a Valid Ignore."; return 0}
	killignore $delmask
	putquick "PRIVMSG $nick :\002Removed Ignore\002: $delmask"
	return 0
	}
	if {[lindex [split $rest] 0] == "list"} {
		if {[ignorelist] == ""} {
			putquick "PRIVMSG $nick :\002There are Currently no Ignores\002"
		} else {
			putquick "PRIVMSG $nick :\002Current Ignore List\002"
			foreach ignore [ignorelist] {
				set ignoremask [lindex $ignore 0]
				set ignorecomment [lindex $ignore 1]
				set ignoreexpire [lindex $ignore 2]
				set ignoreadded [lindex $ignore 3]
				set ignorecreator [lindex $ignore 4]
				set ignoreexpire_ctime [ctime $ignoreexpire]
				set ignoreadded_ctime [ctime $ignoreadded]
				if {$ignoreexpire == 0} {
				set ignoreexpire_ctime "Permanent!"
				}
			putserv "PRIVMSG $nick :\002Mask\002: $ignoremask - \002Set by\002: $ignorecreator - \002Created On\002: $ignoreadded_ctime - \002Expired On\002: $ignoreexpire_ctime "
			}
		}
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

proc pub_deauth {nick uhost hand chan rest} {
	global botnick notic tolak tuan
	if {[matchattr $hand Z]} {
		chattr $nick -Z;save
		putquick "NOTICE $nick :$notic [katakata "successfully deauth"]!"
	}
}

proc pub_plusteman {nick uhost hand chan rest} {
	global botnick notic tolak
	if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `+f <nick>";return 0}
	if {[lindex $rest 0] == $botnick} {
		set target [lindex $rest 1]
	} else {
		set target [lindex $rest 0]
	}
	if {[matchattr $rest f]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "already on friend list"]";return 0}
	set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp";chattr $rest "f"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037added\037 to friend list"]!"
}

proc pub_minteman {nick uhost hand chan rest} {
	global botnick notic tolak
	if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `-f <nick>";return 0}
	if {![matchattr $rest f]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "not in friend list"]";return 0}
	chattr $rest "-f"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037delete\037 from friend list"]!"
}

proc pub_pluspois {nick uhost hand chan rest} {
	global botnick notic tolak owner
	if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `+av <nick>";return 0}
	if {[matchattr $rest v]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "already on autovoice list"]";return 0}
	set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" ; chattr $rest "v"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037added\037 to autovoice list"]!"
}

proc pub_minpois {nick uhost hand chan rest} {
	global botnick notic tolak
	if {$rest == ""} {putquick "NOTICE $nick :$notic Command: `-av <nick>";return 0}
	if {![matchattr $rest v]} {putquick "NOTICE $nick :$notic \002$rest\002 [katakata "not in autovoice list"]";return 0}
	chattr $rest "-v"; save
	puthelp "NOTICE $nick :$notic \002$rest\002 [katakata "is successfully \037delete\037 from autovoice list"]!"
}

proc pub_join {nick uhost hand chan rest} {
	global botnick notic tolak
	set namachan [lindex $rest 0]
	if { $namachan == ""} {putquick "NOTICE $nick :$notic Command: `join <#chan>"; return 0}
	if {[string first # $namachan] != 0} {set namachan "#$namachan"}
	set isnew [expr {![validchan $namachan]}]
	channel add $namachan
	if {$isnew} {cvd_apply_defaults $namachan}
	putquick "NOTICE $nick :$notic [katakata "im joining"] $namachan"
}

proc pub_deluser {nick uhost hand chan rest} {
	global botnick notic tolak owner
	set targetx [lindex $rest 0]
	set okdel "0"
	if {$targetx == $owner} {putquick "NOTICE $nick :$notic [katakata "cannot delete own owner"]!";	return 0}
	foreach user [userlist] {
		if { $user == $targetx } {set okdel "1"}
	}
	if {$okdel == "1"} {
		deluser $targetx ; save
		putquick "NOTICE $nick :$notic $targetx [katakata "is successfully \037delete\037 from database list"]!"
	} else {
		putquick "NOTICE $nick :$notic $targetx [katakata "is not available database list"]!"
	}
}

proc pub_part {nick uhost hand chan rest} {
	global botnick notic tolak partm partmsg
	set namachan [lindex $rest 0]
	if {$namachan == ""} {putquick "NOTICE $nick :$notic Command: `part <#chan>"; return 0}
	if {[string first # $namachan] != 0} {set namachan "#$namachan"}
	set partmsg [lindex $partm [rand [llength $partm]]]
	putserv "PART $namachan [lgrnd] $partmsg"
	putquick "NOTICE $nick :$notic [katakata "im parting"] $namachan"
	channel remove $namachan
}

proc pub_info {nick uhost hand chan rest} {
	global botnick notim tolak version tcl_version pidfile verc ircv3caps
	set getos "grep PRETTY /etc/os-release"
	catch { eval exec $getos } outputx
	set myos [string map {"PRETTY_NAME=" ""} $outputx]
	set backid [open $pidfile r]
	gets $backid pidnya
	set getcpu "ps axu | grep $pidnya | head -1"
	catch { eval exec $getcpu } outcpu
	set cpux [lindex $outcpu 2]
	set memx [lindex $outcpu 3]
	puthelp "PRIVMSG $chan :$notim [katakata "powered By"] [lgrnd] $verc [katakata "with eggdrop"] v[lindex $version 0]"
	puthelp "PRIVMSG $chan :$notim [katakata "Running On"]\002 $myos \002[katakata "with tcl version"] \002$tcl_version \002"
	puthelp "PRIVMSG $chan :$notim [katakata "Procces Number"]:\002 $pidnya \002[katakata "Memory Usage"]:\002 $memx \002 [katakata "CPu Usage"]:\002 $cpux \002"
	set capsview $ircv3caps
	if {$capsview == ""} {set capsview "none/legacy server"}
	puthelp "PRIVMSG $chan :$notim IRCv3:\002 $capsview \002"
}

proc pub_cycle {nick uhost hand chan rest} {
	global botnick notic tolak partm cyclem
	set cyclem [lindex $partm [rand [llength $partm]]]
	putserv "PART $chan :[lgrnd] $cyclem"
	putserv "JOIN $chan"
}

proc pub_logo {nick uhost hand chan rest} {putquick "PRIVMSG $chan :[lgrnd]"}

proc pub_userlist {nick uhost hand chan rest} {
	global botnick notic tolak
	set kirimuser "[katakata "userlist"]: "
	foreach user [userlist] {
		set flagx [chattr $user]
		if {($user != "") && ($flagx != "")} {
			append kirimuser "\0034,1 $user\0030,1 ($flagx) \003 "
		}
	}
	putquick "NOTICE $nick :$notic $kirimuser"
}

proc pub_kick {nick uhost hand chan rest} {
	global botnick owner notic notim khitung global-flood-kick
	if {$rest == ""} {puthelp "NOTICE $nick :$notic Usage: `k <nick> <reason>";return 0}
	set handle [lindex $rest 0]
	set reason [lrange $rest 1 end]
	if {![isop $botnick $chan]} {puthelp "NOTICE $nick :$notic [katakata "im not operator"]";return 0}
	if {$handle == $botnick} {puthelp "NOTICE $nick :$notic [katakata "cannot kick myself"]";return 0}
	if {[matchattr $handle Z]} {puthelp "NOTICE $nick :$notic [katakata "cannot kick my owner"]";return 0}
	if {[matchattr $handle f]} {puthelp "NOTICE $nick :$notic [katakata "cannot kick my friend"]";return 0}
	lassign [split ${global-flood-kick} :] cdmax cdwin
	if {![cvd_cmd_allowed $hand k $cdmax $cdwin]} {puthelp "NOTICE $nick :$notic [katakata "too many kick command, please wait"] ${cdwin}s";return 0}
	if {$reason == ""} {set reason "![katakata "sorry, owner kick request"]!"}
	putserv "KICK $chan $handle :[lgrnd] $reason -\037#\002[khitung]\002\037-"
}

proc pub_kban {nick uhost hand chan rest} {
	global botnick notic global-flood-kick
	if {$rest == ""} {puthelp "NOTICE $nick :$notic Usage: `kb <nick> <reason>";return 0}
	set handle [lindex $rest 0]
	set reason [lrange $rest 1 end]
	if {![isop $botnick $chan]} {puthelp "NOTICE $nick :$notic [katakata "im not operator"]";return 0}
	if {[isop $handle $chan]} {puthelp "NOTICE $nick :$notic [katakata "cannot kickban other operator"]";return 0}
	if {[matchattr $handle Z]} {puthelp "NOTICE $nick :$notic [katakata "cannot kickban my owner"]";return 0}
	if {[matchattr $handle f]} {puthelp "NOTICE $nick :$notic [katakata "cannot kickban my friend"]";return 0}
	lassign [split ${global-flood-kick} :] cdmax cdwin
	if {![cvd_cmd_allowed $hand kb $cdmax $cdwin]} {puthelp "NOTICE $nick :$notic [katakata "too many kickban command, please wait"] ${cdwin}s";return 0}
	if {$reason == ""} {set reason "![katakata "sorry, owner kickban request"]!"}
	set chan [string tolower $chan]
	set bnick "*!*@[lindex [split [getchanhost $handle $chan] @] 1]"
	putserv "KICK $chan $handle :[lgrnd] $reason -\037#\002[khitung]\002\037-"
	pushmode $chan +b $bnick
}

proc pub_ban {nick uhost hand chan rest} {
	global botnick notic global-flood-kick
	if {$rest == ""} {puthelp "NOTICE $nick :$notic Usage: `b <nick>";return 0}
	set handle [lindex $rest 0]
	if {![isop $botnick $chan]} {puthelp "NOTICE $nick :$notic [katakata "im not operator"]";return 0}
	if {[isop $handle $chan]} {puthelp "NOTICE $nick :$notic [katakata "cannot banned other operator"]";return 0}
	if {[matchattr $handle Z]} {puthelp "NOTICE $nick :$notic [katakata "cannot banned my owner"]";return 0}
	if {[matchattr $handle f]} {puthelp "NOTICE $nick :$notic [katakata "cannot banned my friend"]";return 0}
	lassign [split ${global-flood-kick} :] cdmax cdwin
	if {![cvd_cmd_allowed $hand b $cdmax $cdwin]} {puthelp "NOTICE $nick :$notic [katakata "too many ban command, please wait"] ${cdwin}s";return 0}
	set chan [string tolower $chan]
	set bnick "*!*@[lindex [split [getchanhost $handle $chan] @] 1]"
	pushmode $chan +b $bnick
}

proc pub_unban {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest == ""} {putquick "NOTICE $nick :$notic Usage: `unban <nick/hostmask> <#channel>";	return 0}
	if {[lindex $rest 1] != ""} {set chan [lindex $rest 1]}
	if {[string first # $chan] != 0} {set chan "#$chan"}
	set handle [lindex $rest 0]
	append userhost $handle "!*" [getchanhost $handle $chan]
	set hostmask [maskhost $userhost]
	if {![onchan $handle $chan]} {set hostmask [lindex $rest 0]}
	putserv "MODE $chan -b $hostmask"
	puthelp "NOTICE $nick :$notic UnBaN [unsix $hostmask] ON $chan"
}

proc pub_munban {nick uhost hand chan rest} {
	global botnick notic global-flood-kick
	if {$rest != ""} {
		set chan [lindex $rest 0]
		if {[string first # $chan] != 0} {
			set chan "#$chan"
		}
	}
	if {![validchan $chan] || ![isop $botnick $chan]} { return 0 }
	lassign [split ${global-flood-kick} :] cdmax cdwin
	if {![cvd_cmd_allowed $hand mub $cdmax $cdwin]} {puthelp "NOTICE $nick :$notic [katakata "too many munban command, please wait"] ${cdwin}s";return 0}
	set bans ""
	set i 0
	foreach x [chanbans $chan] {
		if {$i < 5} {
			append bans " [lindex $x 0]"
			set i [incr i]
		}
		if {$i == 5} {
			putserv "MODE $chan -bbbbb $bans"
			set bans ""
			append bans " [lindex $x 0]"
			set i 0
		}
	}
	putserv "MODE $chan -bbbbb $bans"
	if {![onchan $nick $chan]} { 
		putquick "NOTICE $nick :$notic MuNBaNS \[$chan\]"
	}
	return 0
}

proc pub_pois {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest == "" && [isvoice $nick $chan]} {
		putquick "NOTICE $nick :$notic [katakata "You're already Voiced, Usage"]: `v <nick>"
		return 0
	}
	if {$rest != ""} {
		putserv "MODE $chan +vvvvvv $rest"
	} else { 
		putserv "MODE $chan +v $nick"
	}
	return 0
}

proc pub_mpois {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest != ""} {
		set chan [lindex $rest 0]
		if {[string first # $chan]!=0} { 
			set chan "#$chan"
		}
	}
	set nicks ""
	set i 0
	set members [chanlist $chan]
	foreach x $members {
		if {(![isop $x $chan]) && (![isvoice $x $chan]) && (![matchattr $x O])} {
			if {$i == 6} {
				voiceq $chan $nicks
				set nicks ""
				append nicks " $x"
				set i 1
			} else {
				append nicks " $x"
				incr i
			}
		}
	}
	voiceq $chan $nicks
}

proc pub_depois {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest == "" && ![isvoice $nick $chan]} {
		putquick "NOTICE $nick :$notic Usage: `dv <nick>"
		return 0
	}
	if {$rest != ""} {
	putserv "MODE $chan -vvvvvv $rest"
	} else { 
	putserv "MODE $chan -v $nick" 
	}
	return 0
}

proc pub_mdepois {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest != ""} {
		set chan [lindex $rest 0]
		if {[string first # $chan]!=0} { 
			set chan "#$chan"
		}
	}
	set nicks ""
	set i 0
	set members [chanlist $chan]
	foreach x $members {
		if {[isvoice $x $chan]} {
			if {$i == 6} {
				putserv "MODE $chan -vvvvvv $nicks"
				set nicks ""
				append nicks " $x"
				set i 1
			} else {
				append nicks " $x"
				incr i
			}
		}
	}
	putserv "MODE $chan -vvvvvv $nicks"
}

proc pub_opers {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest == "" && [isop $nick $chan]} {
		putquick "NOTICE $nick :$notic [katakata "You're already Oped, Usage"]: `o <nick>"
		return 0
	}
	if {$rest != ""} { 
		putserv "MODE $chan +oooooo $rest"
	} else { 
		putserv "MODE $chan +o $nick"
	}
	return 0
}

proc pub_dopers {nick uhost hand chan rest} {
	global botnick notic
	if {![isop $botnick $chan]} { return 0 }
	if {$rest == "" && ![isop $nick $chan]} {
		putquick "NOTICE $nick :$notic Usage: `do <nick>"
		return 0
	}
	set mreq [katakata "request.by.owner"]
	if {$rest != ""} {
		if {![string match "*k*" [getchanmode $chan]]} {
			putserv "MODE $chan -kooooo $mreq $rest"
		} else {
			putserv "MODE $chan -ooooo $rest"
		}
	} else {
		if {![string match "*k*" [getchanmode $chan]]} {
		putserv "MODE $chan -ko $mreq $nick" 
		} else {
		putserv "MODE $chan -o $nick" 
		}
	}
	return 0
}

proc pub_mode {nick uhost hand chan rest} {
	global notic botnick
	if {![isop $botnick $chan]} { putquick "NOTICE $nick :$notic [katakata "sorry, im not operator"]";return 0 }
	if {![matchattr $nick Z]} { putquick "NOTICE $nick :$notic $tolak" ; return 0 }
	if {$rest == ""} { puthelp "NOTICE $nick :$notic Usage: `mode +/- ntspnmcilk" ; return 0 }
	putserv "MODE $chan $rest"
}

proc pub_topic {nick uhost hand chan rest} {
	global notic botnick
	if {![isop $botnick $chan]} { putquick "NOTICE $nick :$notic [katakata "sorry, im not operator"]";return 0 }
	if {![matchattr $hand Z]} { putquick "NOTICE $nick :$notic $tolak" ; return 0 }
	if {$rest == ""} { puthelp "NOTICE $nick :$notic Usage: `topic Welcome to $chan" ; return 0 }
	putserv "TOPIC $chan :$rest"
}

proc pub_plusgreet {nick uhost hand chan rest} {
	global botnick notic greetmode aktif disable
	if {$greetmode == "1"} {
		foreach i [channel info $chan] {
			if {[string match "+sambut" $i]} {putquick "NOTICE $nick :$notic AuToGreET is  AlReady \[$aktif\]"; return 0}
		}
		channel set $chan +sambut ; save
		putquick "NOTICE $nick :$notic AuToGreET\002 $chan \002iS \[$aktif\] "
	} else {
		puthelp "NOTICE $nick :$notic AuToGreET Mode is \[$disable\] - To ActiVAted /msg $botnick autogreet on"
	}
}

proc pub_mingreet {nick uhost hand chan rest} {
	global botnick notic greetmode deaktif disable
	if {$greetmode == "1"} {
		foreach i [channel info $chan] {
			if {[string match "-sambut" $i]} {putquick "NOTICE $nick :$notic AuToGreET is AlReady \[$deaktif\]"; return 0}
		}
		channel set $chan -sambut ; save
		putquick "NOTICE $nick :$notic AuToGreET\002 $chan \002iS \[$deaktif\] "
	} else {
		puthelp "NOTICE $nick :$notic AuToGreET Mode is \[$disable\] - To ActiVAted \037/msg $botnick autogreet on\037"
	}
}

proc pub_plusguard {nick uhost hand chan rest} {
	global notic aktif
	global global-flood-chan global-flood-join global-flood-ctcp
	global global-flood-kick global-flood-deop global-flood-nick
	foreach i [channel info $chan] {
		if {[string match "+guard" $i]} {putquick "NOTICE $nick :$notic PrOTeksI ChanNel is AlReady \[$aktif\]"; return 0}
	}
	channel set $chan +guard ; save
	catch {channel set $chan flood-chan ${global-flood-chan}}
	catch {channel set $chan flood-join ${global-flood-join}}
	catch {channel set $chan flood-ctcp ${global-flood-ctcp}}
	catch {channel set $chan flood-kick ${global-flood-kick}}
	catch {channel set $chan flood-deop ${global-flood-deop}}
	catch {channel set $chan flood-nick ${global-flood-nick}}
	putquick "NOTICE $nick :$notic PrOTeksI ChanNel\002 $chan \002iS \[$aktif\] "
	cvd_guard_ensure_op $chan
}

proc pub_minguard {nick uhost hand chan rest} {
	global notic deaktif
	foreach i [channel info $chan] {
		if {[string match "-guard" $i]} {putquick "NOTICE $nick :$notic PrOTeksI ChanNel is AlReady \[$deaktif\]"; return 0}
	}
	channel set $chan -guard ; save
	catch {channel set $chan flood-chan 0:0}
	catch {channel set $chan flood-join 0:0}
	catch {channel set $chan flood-ctcp 0:0}
	catch {channel set $chan flood-kick 0:0}
	catch {channel set $chan flood-deop 0:0}
	catch {channel set $chan flood-nick 0:0}
	putquick "NOTICE $nick :$notic PrOTeksI ChanNel\002 $chan \002iS \[$deaktif\] "
}

proc cvd_guard_on {chan} {
	if {$chan == "" || [string index $chan 0] != "#"} {return 1}
	foreach i [channel info $chan] {
		if {[string match "+guard" $i]} {return 1}
	}
	return 0
}

proc cvd_notify_owner {msg} {
	set sent 0
	foreach c [channels] {
		foreach u [chanlist $c] {
			if {[matchattr $u Z]} {
				catch {putserv "NOTICE $u :$msg"}
				set sent 1
			}
		}
	}
	if {!$sent} {
		putlog "!cVd! (owner tidak terlihat online di channel manapun) $msg"
	}
}

proc cvd_guard_ensure_op {chan} {
	global botnick cvd_guard_pending

	if {![cvd_guard_on $chan]} {return 0}
	if {[isop $botnick $chan]} {return 0}
	if {[info exists cvd_guard_pending($chan)]} {return 0}

	set cvd_guard_pending($chan) 1
	putlog "!cVd! +guard aktif di $chan tapi saya belum op - mencoba dapatkan op"
	catch {putserv "PRIVMSG ChanServ :op $chan $botnick"}
	global cvd-guard-op-grace
	utimer ${cvd-guard-op-grace} [list cvd_guard_opcheck $chan]
	return 0
}

proc cvd_guard_opcheck {chan} {
	global botnick notic cvd_guard_pending cvd-guard-op-grace

	catch {unset cvd_guard_pending($chan)}
	if {![cvd_guard_on $chan]} {return 0}
	if {[isop $botnick $chan]} {
		putlog "!cVd! Op berhasil didapat di $chan, +guard tetap aktif"
		return 0
	}

	channel set $chan -guard ; save
	putlog "!cVd! Gagal dapatkan op di $chan setelah ${cvd-guard-op-grace}s - +guard otomatis dimatikan"
	cvd_notify_owner "$notic [katakata "guard auto-disabled on"] $chan - [katakata "im not operator there, protection would be useless"]"
	return 0
}

proc pub_status {nick uhost hand chan rest} {
	global notim aktif deaktif
	global cvd-automod-max cvd-automod-window cvd-automod-duration cvd_automod

	if {![cvd_guard_on $chan]} {
		puthelp "PRIVMSG $chan :$notim [katakata "channel protection is currently"] \[$deaktif\] - \037`+guard\037 [katakata "to activate"]"
		puthelp "PRIVMSG $chan :$notim [katakata "note: -guard also zeroes out eggdrop's own baseline flood counters"] - [katakata "nothing is protecting this channel right now"]"
		return 0
	}

	set parts {}
	lappend parts "\[F\][katakata "loOd-ProTecT"]"
	lappend parts "\[D\][katakata "e@p-ReVenge"]"
	lappend parts "\[K\][katakata "icK-ReVenge"]"
	lappend parts "\[J\][katakata "oiN-BursT"] ${cvd-automod-max}:${cvd-automod-window}/${cvd-automod-duration}s"
	if {[info exists cvd_automod($chan)]} {
		lappend parts "\[!\][katakata "MODeRATeD NOW"]"
	}
	puthelp "PRIVMSG $chan :$notim [katakata "channel protection for"] $chan \[$aktif\]: [join $parts { }]"

	set fj "?" ; set fc "?" ; set fk "?" ; set fd "?"
	catch {set fj [channel get $chan flood-join]}
	catch {set fc [channel get $chan flood-ctcp]}
	catch {set fk [channel get $chan flood-kick]}
	catch {set fd [channel get $chan flood-deop]}
	puthelp "PRIVMSG $chan :$notim [katakata "Guard flood on"] $chan: $fj [katakata "join"], $fc [katakata "ctcp"], $fk [katakata "kick"], $fd [katakata "deop"]"
}

proc cvd_autofriend {nick uhost hand chan} {
	global botnick
	if {$hand == ""} {return 0}
	if {![isop $botnick $chan]} {return 0}
	if {[isvoice $nick $chan] || [isop $nick $chan]} {return 0}
	# Deliberately NOT filtered against netsplit rejoins (unlike greet) -
	# a returning nick loses its channel modes on a genuine split, so it
	# needs to be re-voiced just like a fresh join would.
	if {[matchattr $hand v $chan]} {
		putserv "MODE $chan +v $nick"
	}
}

proc cvd_cmd_allowed {hand cmdname max window} {
	global cvd_cmdtimes
	set key "$hand,$cmdname"
	set now [clock seconds]
	if {![info exists cvd_cmdtimes($key)]} {set cvd_cmdtimes($key) {}}
	set fresh {}
	foreach t $cvd_cmdtimes($key) {
		if {$now - $t < $window} {lappend fresh $t}
	}
	if {[llength $fresh] >= $max} {
		set cvd_cmdtimes($key) $fresh
		return 0
	}
	lappend fresh $now
	set cvd_cmdtimes($key) $fresh
	return 1
}

proc cvd_splt {nick uhost hand chan} {
	global cvd_splitnicks
	set cvd_splitnicks($chan,[string tolower $nick]) 1
}

proc cvd_rejn {nick uhost hand chan} {
	global cvd_splitnicks
	catch {unset cvd_splitnicks($chan,[string tolower $nick])}
}

proc cvd_kick {nick uhost hand chan target reason} {
	global botnick cvd_rejointimes cvd_rejoinsuppress
	global cvd-rejoin-delay cvd-rejoin-max cvd-rejoin-window cvd-rejoin-cooldown

	if {[string tolower $target] != [string tolower $botnick]} {
		if {[cvd_guard_on $chan] && ![string match "*Serv*" $nick] && $nick != $target
			&& ![matchattr $hand Z] && ![matchattr $hand f]
			&& ([matchattr $target Z] || [matchattr $target f])} {
			if {[isop $botnick $chan]} {
				putlog "!cVd! $nick kicked protected user $target from $chan without authorization - kicking back"
				catch {putserv "KICK $chan $nick :[lgrnd] [katakata "unauthorized kick detected"]"}
			} else {
				putlog "!cVd! $nick kicked protected user $target from $chan, but im not op - cannot retaliate"
			}
		}
		return 0
	}

	if {[matchattr $hand Z]} {
		putlog "!cVd! Kicked from $chan by owner $nick, not auto-rejoining"
		return 0
	}

	set now [clock seconds]
	if {[info exists cvd_rejoinsuppress($chan)] && $now < $cvd_rejoinsuppress($chan)} {
		putlog "!cVd! Kicked from $chan again by $nick, rejoin still on cooldown"
		return 0
	}
	if {![info exists cvd_rejointimes($chan)]} {set cvd_rejointimes($chan) {}}
	lappend cvd_rejointimes($chan) $now
	set fresh {}
	foreach t $cvd_rejointimes($chan) {
		if {$now - $t <= ${cvd-rejoin-window}} {lappend fresh $t}
	}
	set cvd_rejointimes($chan) $fresh
	if {[llength $fresh] > ${cvd-rejoin-max}} {
		set cvd_rejoinsuppress($chan) [expr {$now + ${cvd-rejoin-cooldown}}]
		putlog "!cVd! Kicked from $chan too many times ($nick), giving up rejoin for ${cvd-rejoin-cooldown}s"
		return 0
	}

	putlog "!cVd! Kicked from $chan by $nick ($reason), rejoining in ${cvd-rejoin-delay}s"
	utimer ${cvd-rejoin-delay} [list putserv "JOIN $chan"]
}

proc cvd_flood {nick uhost hand type chan} {
	if {![cvd_guard_on $chan]} {return 0}
	if {[matchattr $hand Z] || [matchattr $hand f]} {
		putlog "!cVd! Flood ($type) dari $nick diabaikan - dia owner/friend"
		return 1
	}
	putlog "!cVd! Flood terdeteksi: type=$type nick=$nick host=$uhost chan=$chan - dibiarkan dihukum eggdrop"
	return 0
}

proc cvd_modeprotect {nick uhost hand chan mchange target} {
	global botnick

	if {$mchange != "-o"} {return 0}
	if {![cvd_guard_on $chan]} {return 0}
	if {$nick == "" || [string match "*Serv*" $nick]} {return 0}
	if {$nick == $target} {return 0}
	if {[matchattr $hand Z] || [matchattr $hand f]} {return 0}

	if {$target == $botnick} {
		putlog "!cVd! $nick de-opped me on $chan without authorization"
		cvd_guard_ensure_op $chan
		return 0
	}

	if {![matchattr $target Z] && ![matchattr $target f]} {return 0}

	putlog "!cVd! $nick de-opped protected user $target on $chan without authorization - retaliating"
	if {[isop $botnick $chan]} {
		catch {putserv "KICK $chan $nick :[lgrnd] [katakata "unauthorized deop detected"]"}
		catch {pushmode $chan +o $target}
	} else {
		putlog "!cVd! im not op on $chan - cannot retaliate or re-op $target"
	}
	return 0
}

proc cvd_joinburst {nick uhost hand chan} {
	global botnick cvd_bursttimes cvd_automod
	global cvd-automod-max cvd-automod-window cvd-automod-duration

	if {$nick == $botnick} {
		# We just joined (or rejoined) this channel - if it already has
		# +guard on from a previous session/rehash, make sure we actually
		# get op, or the protection is pointless.
		cvd_guard_ensure_op $chan
		return 0
	}
	if {![cvd_guard_on $chan]} {return 0}
	if {![isop $botnick $chan]} {return 0}
	if {[info exists cvd_automod($chan)]} {return 0}

	set now [clock seconds]
	if {![info exists cvd_bursttimes($chan)]} {set cvd_bursttimes($chan) {}}
	lappend cvd_bursttimes($chan) $now
	set fresh {}
	foreach t $cvd_bursttimes($chan) {
		if {$now - $t <= ${cvd-automod-window}} {lappend fresh $t}
	}
	set cvd_bursttimes($chan) $fresh

	if {[llength $fresh] <= ${cvd-automod-max}} {return 0}
	if {[string match "*m*" [getchanmode $chan]]} {return 0}

	set cvd_automod($chan) 1
	catch {putserv "MODE $chan +m"}
	putlog "!cVd! Join burst on $chan ([llength $fresh] joins in ${cvd-automod-window}s), channel moderated for ${cvd-automod-duration}s"
	utimer ${cvd-automod-duration} [list cvd_unmoderate $chan]
	return 0
}

proc cvd_unmoderate {chan} {
	global botnick cvd_automod
	catch {unset cvd_automod($chan)}
	if {![isop $botnick $chan]} {return 0}
	if {![string match "*m*" [getchanmode $chan]]} {return 0}
	catch {putserv "MODE $chan -m"}
	putlog "!cVd! Auto-moderate lifted on $chan"
}

proc kirim_sambutan {nick uhost hand chan} {
	global botnick sambutm cvd_splitnicks cvd_greettimes cvd_greetsuppress
	global greet-burst-max greet-burst-window greet-burst-cooldown
	set splitkey "$chan,[string tolower $nick]"
	if {[info exists cvd_splitnicks($splitkey)]} {
		unset cvd_splitnicks($splitkey)
		return 0
	}

	set now [clock seconds]
	if {[info exists cvd_greetsuppress($chan)] && $now < $cvd_greetsuppress($chan)} {
		return 0
	}
	if {![info exists cvd_greettimes($chan)]} {set cvd_greettimes($chan) {}}
	lappend cvd_greettimes($chan) $now
	set fresh {}
	foreach t $cvd_greettimes($chan) {
		if {$now - $t <= ${greet-burst-window}} {lappend fresh $t}
	}
	set cvd_greettimes($chan) $fresh
	if {[llength $fresh] > ${greet-burst-max}} {
		set cvd_greetsuppress($chan) [expr {$now + ${greet-burst-cooldown}}]
		putlog "!cVd! Join flood on $chan, autogreet paused for ${greet-burst-cooldown}s"
		return 0
	}

	foreach i [channel info $chan] {
		if {[string match "+sambut" $i]} {
			set sambutmsg [lindex $sambutm [rand [llength $sambutm]]]
			# getaccount only returns a real account name on networks with
			# IRCv3 account-tracking (extended-join + account-notify + WHOX).
			# On networks without it, it returns "" and we just skip this part.
			set acct ""
			catch {set acct [getaccount $nick $chan]}
			if {$acct != "" && $acct != "*"} {
				putserv "PRIVMSG $chan :Hai \0030,1 $nick \003 (account: $acct), $sambutmsg"
			} else {
				putserv "PRIVMSG $chan :Hai \0030,1 $nick \003, $sambutmsg"
			}
		}
	}
}

proc pub_botcmd {nick uhost hand chan rest} {
	global notic botnick
	set nickbot [lindex $rest 0]
	if {$nickbot == $botnick} {
		set botproc [lindex $rest 1]
		set botcmd [lindex $rest 2 end]
		switch $botproc {
			auth { pub_auth $nick $uhost $hand $chan "" }
			deauth { pub_deauth $nick $uhost $hand $chan "" }
			cycle  { pub_cycle $nick $uhost $hand $chan "" }
			ver  { pub_info $nick $uhost $hand $chan "" }
			+v { pub_pois $nick $uhost $hand $chan $botcmd }
			dv { pub_depois $nick $uhost $hand $chan $botcmd }
			+o { pub_opers $nick $uhost $hand $chan $botcmd }
			do { pub_dopers $nick $uhost $hand $chan $botcmd }
			+greet { pub_plusgreet $nick $uhost $hand $chan "" }
			-greet { pub_mingreet $nick $uhost $hand $chan "" }
			default { puthelp "NOTICE $nick :This \002`$botcmd\002 CaNNot UsiNg BotName" }
		}
	}
}

proc pub_ping {nick host hand chan rest} {
	global notic botnick
	set tping "$rest"
	if {($rest == "") || ($rest == "me")} { set tping "$nick" }
	putquick "PRIVMSG $tping :\001PING [clock clicks -milliseconds]\001"
}

proc pingreply {nick host hand dest key arg} {
	global pingmethod server notic
	set pingnum [lindex $arg 0]
	set pingserver [lindex [split $server :] 0]
	if {![regexp -- {[^0-9]} $pingnum]} {
		set balas "[expr [expr [clock clicks -milliseconds] - $pingnum] / 1000.000]"
		putquick "NOTICE $nick :$notic [katakata "ping reply from"] $pingserver: $balas dETiK"
		return 0
	}
}

proc evnt:init_server {type} {
	global botnick network ircv3caps
	putquick "MODE $botnick +xiB-ws"
	set ignsvc [cvd_netget $network ignsvc ""]
	if {$ignsvc != "" && [isignore $ignsvc]} {
		killignore $ignsvc
		putlog "!cVd! Remove $network Ignored List"
	}
	# IRCv3: ask the server what capabilities got negotiated on this
	# connect. This is safe on networks with no IRCv3 support at all -
	# 'cap' is only unavailable if the 'server' module isn't loaded, and
	# 'cap enabled' just returns an empty list when nothing was negotiated.
	set ircv3caps ""
	if {![catch {cap enabled} caps]} {
		set ircv3caps $caps
	}
	if {$ircv3caps != ""} {
		putlog "!cVd! IRCv3 caps negotiated: $ircv3caps"
	} else {
		putlog "!cVd! No IRCv3 caps negotiated (legacy server or none requested)"
	}
}

proc cvd_hascap {name} {
	global ircv3caps
	return [expr {[lsearch -exact $ircv3caps $name] >= 0}]
}

bind account - * cvd_account
proc cvd_account {nick user hand chan account} {
	if {$account == "*"} {
		putlog "!cVd! $nick logged out of services on $chan"
	} else {
		putlog "!cVd! $nick logged into services as $account on $chan"
	}
}


proc voiceprc {chan nick} {
	global botnick
	if {[isop $botnick $chan] && ![isvoice $nick $chan] && ![isop $nick $chan]} { 
		putserv "MODE $chan +vvvvvv $nick"
	}
}
proc voiceq {chan nick} {utimer [expr 5 + [rand 15]] [list voiceprc $chan $nick]}
proc unsix {txt} {set retval $txt;regsub ~ $retval "" retval;return $retval}
proc dezip {txt} {return [decrypt 64 [unsix $txt]]}
proc dcp {txt} {return [decrypt 64 $txt]}
proc enzip {txt} {return [encrypt 64 [unsix $txt]]}

set hitamputih { "0" "1" }
set berwarna { "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" }

proc lgrnd {} {
	global hitamputih berwarna show_logo
	set bg1 [lindex $hitamputih [rand [llength $hitamputih]]]
	set bg2 [lindex $berwarna [rand [llength $berwarna]]]
	set show_logo "\003$bg1,$bg2";append show_logo "C";append show_logo "\003$bg2,$bg1";append show_logo "o"
	append show_logo "\003$bg1,$bg2";append show_logo "V";append show_logo "\003$bg2,$bg1";append show_logo "I"
	append show_logo "\003$bg1,$bg2";append show_logo "D";append show_logo "\003"
	set lgrnd $show_logo
}

proc khitung {} {
	set kickdb "scripts/covidk.db"
	if {![file exists $kickdb]} {
		set db1 [open $kickdb w]
		puts $db1 "0"
		close $db1
 	}
	set db1 [open $kickdb r]
	gets $db1 dbk;close $db1
	set db2 [expr $dbk + 1]
	set db1 [open $kickdb w]
	puts $db1 "$db2"
	close $db1
	return $db2
}

timer 2 setaway
proc setaway {args} {
	global awaym
	set awaymsg [lindex $awaym [rand [llength $awaym]]]
	set waktu [duration [expr [clock seconds] - $::uptime]]
	set arrowR [dezip "EL0P10zaHDp/"]
	set arrowL [dezip "ivRvn.ZAO1G/"]
	set awayTime "\[\002Uptime:\002 $waktu\]"
	set awayFix "[lgrnd] $awayTime $arrowR $awaymsg $arrowL"
	putserv "AWAY :$awayFix "
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

proc autoversion {nick uhost hand dest key arg} {
	global versim
	set versiku [lindex $versim [rand [llength $versim]]]
	putserv "NOTICE $nick :\001VERSION $versiku\001"
}

proc kirimhelp {nick uhost hand rest} {
	global notim tolak version notic verc
    if {![matchattr $hand Z]} {putlog "!cVd! $nick Try to Command help";return 0}
	puthelp "PRIVMSG $nick :\037\002     [katakata "bot command list via private"]\002                                \037"
	puthelp "PRIVMSG $nick :\002auth\002 <password>							- [katakata "login owner access"]"
	puthelp "PRIVMSG $nick :\002deauth\002							- [katakata "logout from your bot"]"
	puthelp "PRIVMSG $nick :\002join\002 <#chan>							- [katakata "ask bot to join channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002part\002 <#chan>							- [katakata "ask bot to part channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002nick\002 <nick> <password>							- [katakata "ask bot to change botnick"]"
	puthelp "PRIVMSG $nick :\002identify\002 <password>							- [katakata "ask bot to identify botnick"]"
	puthelp "PRIVMSG $nick :\002chanset\002 <#chan> <+/-flag>							- [katakata "ask bot to setting flag on channel"]"
	puthelp "PRIVMSG $nick :\002ignore\002 <add/del/list> <*!*@*>							- [katakata "ask bot to ignore host user"]"
	puthelp "PRIVMSG $nick :\002autogreet\002 <on/off>							- [katakata "ask bot to activated greet system"]"
	puthelp "PRIVMSG $nick :\002cvdset\002 <category> <option> <value>							- [katakata "tune protection thresholds live"]"
	puthelp "PRIVMSG $nick :\002rehash\002							- [katakata "ask bot to rehashing"]"
	puthelp "PRIVMSG $nick :\002restart\002							- [katakata "ask bot to restart "]"
	puthelp "PRIVMSG $nick :\002die\002							- [katakata "ask bot to shutdown "]"
	puthelp "PRIVMSG $nick :\002 \002"
	puthelp "PRIVMSG $nick :\002\037     [katakata "bot command list via public"]\002                                \037"
	puthelp "PRIVMSG $nick :\002`auth\002							- [katakata "see your status"]"
	puthelp "PRIVMSG $nick :\002`deauth\002							- [katakata "logout from your bot"]"
	puthelp "PRIVMSG $nick :\002`ver\002							- [katakata "display bot information"]"
	puthelp "PRIVMSG $nick :\002`join\002 <#chan>							- [katakata "ask join to channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002`part\002 <#chan>							- [katakata "ask bot to part channel <#chan>"]"
	puthelp "PRIVMSG $nick :\002`k\002 <nick>							- [katakata "ask bot to kick nick from channel"]"
	puthelp "PRIVMSG $nick :\002`kb\002 <nick>							- [katakata "ask bot to kickban nick from channel"]"
	puthelp "PRIVMSG $nick :\002`ub\002 <nick>							- [katakata "ask bot to unban nick"]"
	puthelp "PRIVMSG $nick :\002`mub\002 <nick>							- [katakata "ask bot to mass unban"]"
	puthelp "PRIVMSG $nick :\002`+v\002 <nick>							- [katakata "ask bot to voice nick"]"
	puthelp "PRIVMSG $nick :\002`mv\002 <nick>							- [katakata "ask bot to mass voice nick"]"
	puthelp "PRIVMSG $nick :\002`-v\002 <nick>							- [katakata "ask bot to devoice nick"]"
	puthelp "PRIVMSG $nick :\002`dmv\002 <nick>							- [katakata "ask bot to mass devoice nick"]"
	puthelp "PRIVMSG $nick :\002`+o\002 <nick>							- [katakata "ask bot to @op nick"]"
	puthelp "PRIVMSG $nick :\002`-o\002 <nick>							- [katakata "ask bot to de@op nick"]"
	puthelp "PRIVMSG $nick :\002`+greet\002							- [katakata "ask bot to start greeting user join"]"
	puthelp "PRIVMSG $nick :\002`-greet\002							- [katakata "ask bot to stop greeting user join"]"
	puthelp "PRIVMSG $nick :\002`+guard\002							- [katakata "activate channel protection engine"]"
	puthelp "PRIVMSG $nick :\002`-guard\002							- [katakata "deactivate channel protection engine"]"
	puthelp "PRIVMSG $nick :\002`status\002							- [katakata "show active channel protection status"]"
	puthelp "PRIVMSG $nick :\002`cycle\002							- [katakata "ask bot to cycle from channel"]"
	puthelp "PRIVMSG $nick :\002`logo\002							- [katakata "ask bot to send logo"]"
	puthelp "PRIVMSG $nick :\037                                                                    \037"
	puthelp "PRIVMSG $nick :[katakata "This bot running with eggdrop"] v[lindex $version 0]" 
	puthelp "PRIVMSG $nick :[katakata "powered by with"] [lgrnd] $verc"
}

putlog "#######################################"
putlog "##       Covid.5.0.Tcl is Loaded!!   ##"
putlog "#######################################"
