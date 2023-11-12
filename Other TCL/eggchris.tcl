##################################################
# Eggchris.tcl                                   # 
# Author : Chrisna                               #
# Email  : chrisna@Fbi-online.org                # 
##################################################
# Petunjuk Pemakaian :                           # 
# Public Command (channel) gunakan "`"           # 
# Command Msg Bot , ketikkan "help" (owner only) # 
##################################################

# Variabel yang bisa di ubah :
set CC "`"
set timezone "PST"
set nopart ""
set topicnick 0
set greetflag G
set min 5
set pubcommands 1
set mastercommands 1
set ownercommands 1
set moredcc 1
set combot 1
set funny_stuff 1
set rrated_funny_stuff 1
set path "[pwd]/"

######################################################################

############################################################
############# DON'T CHANGE BELOW THIS LINE!!!! #############
############################################################

if {$numversion < 1030700} {
  putlog "*** Can't load Eggchris -- At least Eggdrop v1.3.7 required"
  return 0
}

set thepath $path
set newpath $path
set greetfile "${nick}.greet"
set emailfile "${nick}.email"
set urlfile "${nick}.url"
if {[string index $thepath [expr [string length $thepath]-1]] != "/"} {set greetpath "$thepath/$greetfile"} else {set greetpath "$thepath$greetfile"}
if {[string index $thepath [expr [string length $thepath]-1]] != "/"} {set emailpath "$thepath/$emailfile"} else {set emailpath "$thepath$emailfile"}
if {[string index $thepath [expr [string length $thepath]-1]] != "/"} {set urlpath "$thepath/$urlfile"} else {set urlpath "$thepath$urlfile"}

foreach x [timers] {
  if {[lindex $x 1] == "Eggchris_autosave"} {
    killtimer [lindex $x 2]
  }
}

#foreach u [utimers] {
#  if {[lindex $u 1] == "Eggchris_check"} {
#    killutimer [lindex $u 2]
#  }
#}

bind join G|G * join_greet
bind dcc p|p flhelp dcc_flhelp
bind dcc p|p FLHelp dcc_flhelp
bind pub p|p ${CC}flhelp pub_flhelp
bind pub p|p ${CC}FLHelp pub_flhelp
bind pub p|p ${CC}about pub_about
bind dcc p|p about dcc_about
bind pub p|p ${CC}version pub_version
bind dcc p|p version dcc_version
bind msg p|p auth msg_auth
bind msg p|p deauth msg_deauth
bind sign p|p * sign_deauth
bind part p|p * part_deauth

proc botname {} {global botname;return $botname}

if {$pubcommands==1} {
bind pub p|p ${CC}echo pub_echo
bind pub p|p ${CC}seen pub_seen
bind pub p|p ${CC}who pub_who
bind pub p|p ${CC}whois pub_whois
bind pub p|p ${CC}wi pub_whois
bind pub p|p ${CC}whom pub_whom
bind pub o|o ${CC}match pub_match
bind pub p|p ${CC}bots pub_bots
bind pub p|p ${CC}bottree pub_bottree
bind pub p|p ${CC}notes pub_notes
bind pub o ${CC}+ban pub_+ban
bind pub o ${CC}kb pub_kb
bind pub o ${CC}kickban pub_kb
bind pub o ${CC}-ban pub_-ban
bind pub o ${CC}bans pub_bans
bind pub o ${CC}resetbans pub_resetbans
bind pub o|o ${CC}op pub_op
bind pub o|o ${CC}deop pub_deop
bind pub o|o ${CC}topic pub_topic
bind pub o|o ${CC}act pub_act
bind pub o|o ${CC}say pub_say
bind pub o|o ${CC}msg pub_msg
bind pub o|o ${CC}motd pub_motd
bind pub o|o ${CC}addlog pub_addlog
bind pub o|o ${CC}invite pub_invite
bind pub o|o ${CC}nick pub_nick
bind pub o|o ${CC}away pub_away
bind pub o|o ${CC}back pub_back
bind pub p|p ${CC}note pub_note
bind pub x|x ${CC}files pub_files
bind pub p|p ${CC}newpass pub_newpass
bind pub o|o ${CC}console pub_console
bind pub p|p ${CC}quit pub_quit
bind pub o|o ${CC}servers pub_servers
bind pub p|p ${CC}info pub_info
bind pub x|x ${CC}get pub_get
bind pub p|p ${CC}botinfo pub_botinfo
bind pub p|p ${CC}chat pub_chat
bind pub p|p ${CC}channel pub_channel
bind pub p|p ${CC}time pub_time
bind pub o|o ${CC}kick pub_kick
bind pub p|o ${CC}k pub_k
bind pub p|p ${CC}channels pub_channels
bind pub o|o ${CC}botinfo pub_botinfo
bind pub o|o ${CC}trace pub_trace
bind pub o|o ${CC}stick pub_stick
bind pub o|o ${CC}unstick pub_unstick
bind pub o|o ${CC}su pub_su
bind pub p|p ${CC}page pub_page
bind pub p|p ${CC}help pub_help
bind pub p|p ${CC}comment pub_comment
bind pub o|o ${CC}+t mode_+t
bind pub o|o ${CC}+n mode_+n 
bind pub o|o ${CC}+s mode_+s
bind pub o|o ${CC}+i mode_+i
bind pub o|o ${CC}+p mode_+p
bind pub o|o ${CC}+m mode_+m
bind pub o|o ${CC}+k mode_+k
bind pub o|o ${CC}+l mode_+l
bind pub o|o ${CC}+voice mode_+v
bind pub o|o ${CC}-voice mode_-v
bind pub o|o ${CC}+v mode_+v
bind pub o|o ${CC}-v mode_-v
bind pub o|o ${CC}-t mode_-t
bind pub o|o ${CC}-s mode_-s
bind pub o|o ${CC}-l mode_-l
bind pub o|o ${CC}-k mode_-k
bind pub o|o ${CC}-m mode_-m 
bind pub o|o ${CC}-i mode_-i
bind pub o|o ${CC}-n mode_-n
bind pub o|o ${CC}-p mode_-p
bind pub p|p ${CC}email pub_email
bind pub p|p ${CC}url pub_url
bind pub p|p ${CC}greet pub_greet
bind pub p|p ${CC}userinfo pub_userinfo
bind pub p|p ${CC}ui pub_userinfo
}

if {$mastercommands==1} {
bind pub m ${CC}adduser pub_adduser
bind pub m ${CC}+user pub_+user
bind pub m ${CC}-user pub_-user
bind pub m ${CC}deluser pub_deluser
bind pub m ${CC}+bot pub_+bot
bind pub m ${CC}-bot pub_-bot
bind pub p ${CC}+host pub_+host
bind pub p ${CC}-host pub_-host
bind pub m ${CC}chattr pub_chattr
bind pub m ${CC}save pub_save
bind pub m ${CC}chpass pub_chpass
bind pub m ${CC}chinfo pub_chinfo
bind pub m ${CC}chnick pub_chnick
bind pub m ${CC}chcomment pub_chcomment
bind pub m ${CC}+ignore pub_+ignore
bind pub m ${CC}-ignore pub_-ignore
bind pub m ${CC}ignores pub_ignores
bind pub m ${CC}reload pub_reload
bind pub m ${CC}jump pub_jump
bind pub m ${CC}rehash pub_rehash
bind pub m ${CC}restart pub_restart
bind dcc m join cmd_join
bind pub m ${CC}join pub_join
bind dcc m part cmd_part
bind pub m ${CC}part pub_part
bind dcc m global cmd_global
bind pub m ${CC}chaddr pub_chaddr
bind pub m ${CC}filestats pub_filestats
bind pub m ${CC}fixcodes pub_fixcodes
bind pub m ${CC}strip pub_strip
bind pub m ${CC}link pub_link
bind pub m ${CC}unlink pub_unlink
bind pub m ${CC}chbotattr pub_chbotattr
bind pub m ${CC}assoc pub_assoc
bind pub m ${CC}status pub_status
bind pub m ${CC}chaninfo pub_chaninfo
bind pub m ${CC}boot pub_boot
bind pub m ${CC}relay pub_relay
bind pub m ${CC}set pub_set
bind pub m ${CC}flush pub_flush
bind pub m ${CC}banner pub_banner
bind pub m ${CC}reset pub_reset
bind pub m ${CC}binds pub_binds
bind pub m ${CC}dump pub_dump
bind pub m ${CC}debug pub_debug
bind pub m ${CC}+chrec pub_+chrec
bind pub m ${CC}-chrec pub_-chrec
bind pub m ${CC}dccstat pub_dccstat
bind pub m ${CC}botattr pub_botattr
bind pub m ${CC}chemail pub_cchemail
bind pub m ${CC}churl pub_churl
bind pub m ${CC}chgreet pub_chgreet
bind dcc m chemail dcc_chemail
bind dcc m churl dcc_churl
bind dcc m chgreet dcc_chgreet
bind pub m ${CC}chemail pub_chemail
bind pub m ${CC}churl pub_churl
bind pub m ${CC}chgreet pub_chgreet
}

if {$ownercommands==1} {
bind dcc n botnick dcc_botnick
bind pub n ${CC}botnick pub_botnick
bind pub n ${CC}die pub_die
bind pub n ${CC}chanset pub_chanset
bind pub n ${CC}chansave pub_chansave
bind pub n ${CC}chanload pub_chanload
bind pub n ${CC}+chan pub_+chan
bind pub n ${CC}-chan pub_-chan
bind pub n ${CC}simul pub_simul
bind pub n ${CC}modules pub_modules
bind pub n ${CC}loadmodule pub_loadmodule
bind pub n ${CC}unloadmodule pub_unloadmodule
bind dcc n flsave dcc_flsave 
}

if {$moredcc==1} {
bind dcc o|o userlist cmd_userlist
bind dcc p|p channels cmd_channels
bind dcc o|o flagnote cmd_flagnote
bind dcc o|o say cmd_say
bind dcc o|o act cmd_act
bind dcc o|o addlog cmd_addlog
bind dcc o|o op cmd_op
bind dcc o|o deop cmd_deop
bind dcc m aop cmd_aop
bind dcc m raop cmd_raop
bind dcc o|o match dcc_match
bind filt p \001ACTION*\001 cmd_action
bind dcc p|p email dcc_email
bind dcc p|p url dcc_url
bind dcc p|p greet dcc_greet
bind dcc p|p userinfo dcc_userinfo
bind dcc p|p ui dcc_userinfo
bind dcc p|p wi dcc_wi
}

if {$combot==1} {
bind pub m ${CC}aop pub_aop
bind pub m ${CC}raop pub_raop
bind pub o|o ${CC}userlist pub_userlist
bind pub o|o ${CC}me pub_me
bind pub o|o up pub_up
bind pub o|o ${CC}up pub_up
bind pub o|o down pub_down
bind pub o|o ${CC}down pub_down
bind pub p|p ${CC}pong pub_pong
bind pub p|p ${CC}ping pub_ping
bind pub p|p ${CC}access pub_access
bind dcc p|p access dcc_access
bind pub -|- rollcall pub_rollcall
bind pub -|- ${CC}rollcall pub_rollcall
bind pub m ${CC}massunban pub_massunban
bind pub m ${CC}mub pub_massunban
bind dcc m massunban dcc_massunban
bind dcc m mub dcc_mub
bind dcc m massdeop dcc_massdeop
bind dcc m massop dcc_massop
bind dcc m mdeop cmd_mdeop
bind dcc m mop cmd_mop
bind pub m ${CC}massdeop pub_massdeop
bind pub m ${CC}massop pub_massop
bind pub m ${CC}mop pub_massop
bind pub m ${CC}mdeop pub_massdeop
}


if {$funny_stuff==1} {
bind pub p|p ${CC}pez pub_pez
bind pub p|p ${CC}ramen pub_ramen
}

if {$rrated_funny_stuff==1} {
bind pub p|p ${CC}beer pub_beer
bind pub p|p ${CC}drug pub_drug
}

## modes via pubic cmd -- start
proc mode_+v {nick uhost hand chan rest} {  
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}+v <nick>"
  return 0
 }
 if {[onchan $rest $chan] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 $rest is not on the channel."
  return 0
 }
 if {[isvoice $rest $chan] == 1} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 $rest is already +v"
 }
 if {[onchan $rest $chan] == 1} {
  pushmode $chan +v $rest
 }
}

proc mode_-v {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
}
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}-v <nick>"
  return 0
 }
 if {[onchan $rest $chan] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 $rest is not on the channel."
  return 0
 }
 if {[isvoice $rest $chan] == 1} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 $rest is already -v"
 }
 if {[onchan $rest $chan] == 1} {
  pushmode $chan -v $rest
 }
}

proc mode_+t {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +t
}

proc mode_-t {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -t
}

proc mode_+s {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +s-p
}

proc mode_-s {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -s
}

proc mode_+p {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +p-s
}

proc mode_-p {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -p
}

proc mode_+n {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +n
}

proc mode_-n {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -n
}

proc mode_+i {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +i
}

proc mode_-i {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -i
}

proc mode_+m {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan +m
}

proc mode_-m {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -m
}

proc mode_+l {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}+l <limit>"
  return 0
 }
 pushmode $chan +l $rest
}

proc mode_-l {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -l $rest
}

proc mode_+k {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}+k <key>"
  return 0
 }
 pushmode $chan +k $rest
}

proc mode_-k {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 pushmode $chan -k $rest
}

proc mode_+b {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}+b <hostmask>"
  return 0
 }
 pushmode $chan +b $rest
}

proc mode_-b {nick uhost hand chan rest} { 
 global CC botnick
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 This command requires you to authenticate yourself. Please /msg $botnick auth <password>"
  return 0
 }
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}-b <hostmask>"
  return 0
 }
 pushmode $chan -b $rest
}
## modes via pubic cmd -- stop


## public cmd echo -- start
proc pub_echo {nick uhost hand chan rest} {
global botnick version CC
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 echo is only available via dcc chat."
} 

## public cmd seen -- start
proc pub_seen {nick uhost hand chan rest} {
global botnick version CC
set handle [lindex $rest 0]
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: ${CC}seen <handle>"
   return 0
 }
 if {[validuser $handle] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 No such user in my userlist."
  return 0
 }
 if {[string tolower $handle] == [string tolower $nick]} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 You are here."
  return 0
 }
 if {[onchan $handle $chan] == 1} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 $handle is currently on $chan."
  return 0
 }
 set lastseen [getuser $handle LASTON]
 if {$lastseen == ""} {puthelp "NOTICE $nick :\002\[Eggchris\]\002 $handle was never here";return 0}
  set lastseen [lindex $lastseen 0]
	set totalyear [expr [unixtime] - $lastseen]
	if {$totalyear < 60} {
		return "$handle has left $chan less than a minute ago."
                return 0
	}
	if {$totalyear >= 31536000} {
		set yearsfull [expr $totalyear/31536000]
		set years [expr int($yearsfull)]
		set yearssub [expr 31536000*$years]
		set totalday [expr $totalyear - $yearssub]
	}
	if {$totalyear < 31536000} {
		set totalday $totalyear
		set years 0
	}
	if {$totalday >= 86400} {
		set daysfull [expr $totalday/86400]
		set days [expr int($daysfull)]
		set dayssub [expr 86400*$days]
		set totalhour [expr $totalday - $dayssub]
	}
	if {$totalday < 86400} {
		set totalhour $totalday
		set days 0
	}
	if {$totalhour >= 3600} {
		set hoursfull [expr $totalhour/3600]
		set hours [expr int($hoursfull)]
		set hourssub [expr 3600*$hours]
		set totalmin [expr $totalhour - $hourssub]
	}
	if {$totalhour < 3600} {
		set totalmin $totalhour
		set hours 0
	}
	if {$totalmin >= 60} {
		set minsfull [expr $totalmin/60]
		set mins [expr int($minsfull)]
	}
	if {$totalmin < 60} {
		set mins 0
	}
	if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "$years year, "} {set yearstext "$years years, "}

	if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "$days day, "} {set daystext "$days days, "}

	if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "$hours hour, "} {set hourstext "$hours hours, "}

	if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "$mins minute"} {set minstext "$mins minutes"}

	set output $yearstext$daystext$hourstext$minstext
	set output [string trimright $output ", "]
        puthelp "NOTICE $nick :\002\[Eggchris\]\002 $nick, I last saw $handle $output ago"
}
## pub cmd seen -- stop

## msg cmd auth -- start
proc msg_auth {nick uhost hand rest} {
 global botnick
 set pw [lindex $rest 0]
 if {$pw == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: /msg $botnick auth <password>"
  return 0
 }
 if {[matchattr $hand Q] == 1} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 You are already Authenticated."
  return 0
 }
 set ch [passwdok $hand ""]
 if {$ch == 1} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 No password set. Type /msg $botnick pass <password>" 
  return 0
 }
 if {[passwdok $hand $pw] == 1} {
  chattr $hand +Q
  putcmdlog "\002\[Eggchris\]\002 #$hand# auth ..."
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Authentication successful!"
 }
 if {[passwdok $hand $pw] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Authentication failed!"
 }
}
## msg cmd auth -- stop

## msg cmd deauth -- start
proc msg_deauth {nick uhost hand rest} {
 global botnick
 if {$rest == ""} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 Usage: /msg $botnick auth <password>"
  return 0
 }
 if {[matchattr $hand Q] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 You never authenticated."
  return 0
 }
 if {[passwdok $hand $rest] == 1} {
  chattr $hand -Q
  putcmdlog "\002\[Eggchris\]\002 #$hand# deauth ..."
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 DeAuthentication successful!"
 }
 if {[passwdok $hand $rest] == 0} {
  puthelp "NOTICE $nick :\002\[Eggchris\]\002 DeAuthentication failed!"
 }
}
## msg cmd deauth -- stop

## sign cmd deauth -- start
proc sign_deauth {nick uhost hand chan rest} { 
 if {[matchattr $hand Q] == 1} {
  chattr $hand -Q
  putlog "\002\[Eggchris\]\002 $nick has signed off, automatic deauthentication."
 }
 if {[matchattr $hand Q] == 0} {
  return 0
 }
}
## sign cmd deauth -- stop

## part cmd deauth -- start
proc part_deauth {nick uhost hand chan rest} {
  if {[matchattr $hand Q] == 1} {
  chattr $hand -Q
  putlog "\002\[Eggchris\]\002 $nick has parted $chan, automatic deauthentication."
 }
 if {[matchattr $hand Q] == 0} {
  return 0
 }
}
## part cmd deauth -- stop

## public cmd about -- start
proc pub_about {nick uhost hand chan rest} {
 global vers
 putcmdlog "\002\[Eggchris\]\002 #$hand# about Eggchris.tcl"
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 \26Eggchris.tcl\26 $vers Editing by Chrisna <chrisna@chrisna.org>"
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 Based on a script by Chrisna."
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 Special thanks to Awan for everythinks."
}
## public cmd about -- stop

## dcc cmd about -- start
proc dcc_about {hand idx args} {
 global vers
 putcmdlog "\002\[Eggchris\]\002 #$hand# about Eggchris.tcl"
 putdcc $idx "\002\[Eggchris\]\002 \26Eggchris.tcl\26 $vers by Kindred <kindred@kindreds.net>"
 putdcc $idx "\002\[Eggchris\]\002 Based on a script by quest."
 putdcc $idx "\002\[Eggchris\]\002 Special thanks to zen and guppy for their work."
}
## dcc cmd about - stop

## public cmd version -- start
proc pub_version {nick uhost hand chan rest} {
 putcmdlog "\002\[Eggchris\]\002 #$hand# version"
 global vers
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 \26Eggchris.tcl\26 $vers"
}
## public cmd version -- stop

## dcc cmd version -- start
proc dcc_version {hand idx args} {
 global vers
 putcmdlog "\002\[Eggchris\]\002 #$hand# version"
 putdcc $idx "\002\[Eggchris\]\002 \26Eggchris.tcl\26 $vers"
}
## dcc cmd version -- stop

## public cmd help -- start
proc pub_help {nick uhost hand chan rest} {
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 help is only available via dcc chat."
} 
## public cmd help -- stop

## public cmd FLHelp -- start
proc pub_flhelp {nick uhost hand chan rest} {
 puthelp "NOTICE $nick :\002\[Eggchris\]\002 FLHelp is only available via dcc chat."
}
## public cmd FLHelp -- stop

## dcc cmd FLHelp -- start
proc dcc_flhelp {hand idx args} {
 global botnick version vers
 set FL "\002\[Eggchris\]\002"
 set args [lindex $args 0]
 global CC NC
 if {$args == ""} {
  putdcc $idx "$FL \26Eggchris.tcl\26 ${vers}, Author Kindred <kindred@kindreds.net>"
  putdcc $idx "$FL PUBLIC COMMANDS for $botnick, eggdrop v[lindex $version 0]"
  putdcc $idx "$FL MY DCC CMD CHAR IS: \002'\002.\002'\002 MY PUBLIC CMD CHAR IS: \002'\002${CC}\002'\002"
  putdcc $idx "$FL"
  putdcc $idx "$FL \002\[\002\037For partyline users\037\002\]\002"
  putdcc $idx "$FL   ping         access        version      time"
  putdcc $idx "$FL   pong         rollcall      about        seen"
  if {[matchattr $hand o] == 1} {
   putdcc $idx "$FL \002\[\002\037For channel ops\037\002\]\002"
   putdcc $idx "$FL   who          +ban         say          away        quit"
   putdcc $idx "$FL   whom         -ban         msg          back        servers"
   putdcc $idx "$FL   whois        ban          act          note        channel"
   putdcc $idx "$FL   match        bans         me           files       kick"
   putdcc $idx "$FL   bots         addlog       newpass      su          k"    
   putdcc $idx "$FL   bottree      op           invite       console     kickban"
   putdcc $idx "$FL   notes        deop         nick         email       kb"
   putdcc $idx "$FL   echo         up           stick        unstick     info"
   putdcc $idx "$FL   trace        down         filestats    page        strip"
   putdcc $idx "$FL   topic        fixcodes     userlist     flagnote    comment"
   putdcc $idx "$FL   chat         botinfo      motd         modes       info"
   putdcc $idx "$FL   wi           ui"
  }
  if {[matchattr $hand m] == 1} {
   putdcc $idx "$FL \002\[\002\037For masters\037\002\]\002"
   putdcc $idx "$FL   adduser      +host        chattr       save        reload"
   putdcc $idx "$FL   deluser      -host        status       boot        chaninfo"
   putdcc $idx "$FL   +bot         botattr      chnick       chpass      chinfo"
   putdcc $idx "$FL   -bot         link         unlink       chaddr      chcomment"
   putdcc $idx "$FL   +user        set          jump         dump        +ignores"
   putdcc $idx "$FL   -user        flush        dccstat      debug       -ignores"
   putdcc $idx "$FL   join         aop          +chrec       reset       ignores"
   putdcc $idx "$FL   part         raop         -chrec       rehash      restart"   
   putdcc $idx "$FL   massop       mop          massunban    boot        banner"
   putdcc $idx "$FL   massdeop     mdeop        mub          assoc       relay"
   putdcc $idx "$FL   botattr"
  }
  if {[matchattr $hand n] == 1} {
   putdcc $idx "$FL \002\[\002\037For owners\037\002\]\002"
   putdcc $idx "$FL   chanset      chansave     chanload     simul"
   putdcc $idx "$FL   +chan        -chan        die          botnick"
   putdcc $idx "$FL   modules      loadmodule   unloadmodule"
  }
  putdcc $idx "$FL All of these commands are available in the channel and in dcc chat."
  return 0
 }
 if {[string tolower $args] == "kb"} {
   putcmdlog "$FL #$hand# FLHelp kb"
   putdcc $idx "$FL \#\#\# kb"
   putdcc $idx "$FL kickbans a user off of the channel."
   return 0
 }
 if {[string tolower $args] == "chcomment"} {
   putcmdlog "$FL #$hand# FLHelp chcomment"
   putdcc $idx "$FL \#\#\# chcomment"
   putdcc $idx "$FL Allows masters/owners to set users comment line."
   return 0
 }
 if {[string tolower $args] == "seen"} {
   putcmdlog "$FL #$hand# FLHelp seen"
   putdcc $idx "$FL \#\#\# seen"
   putdcc $idx "$FL Gives the last time a user was on the channel."
   return 0
 }
 if {[string tolower $args] == "time"} {
   putcmdlog "$FL #$hand# FLHelp time"
   putdcc $idx "$FL \#\#\# time"
   putdcc $idx "$FL Gives the user the current time according to the bots location."
   return 0
 }
 if {[string tolower $args] == "mdeop"} {
   putc