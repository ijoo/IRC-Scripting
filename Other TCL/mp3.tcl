# mp3.tcl v0.1 by {4}m0N`Ra (#anticristo@ircnet)
#
# set the bot say that is listening for an mp3 for a random time

set mp3_enable 1
set mp3_time 60
set mp3_msgs { "Friday i'm in love - the cure" "Love Song - The Cure" "Lullaby - The Cure" "The Cure - In Orange (live 1986) - 00 - Introduction" "The Cure - In Orange (live 1986) - 03 - Play For Today" "The Cure - In Orange (live 1986) - 04 - A Strange Day" "REM - Losing My Religion" "SlipKnoT - 02 - (Sic)" "Slipknot - Wait and Bleed" "Mr Big - To Be With You" "Marlene Kuntz - Nuotando Nell'Aria" "Korn & Rammstein - Good God" "Korn - 06 - Thoughtless" "Extreme - More Than Words" "99 Posse - Curre Curre Cuaglio" }
set mp3_msgs1 { "Friday i'm in love - the cure" "Love Song - The Cure" "Lullaby - The Cure" "The Cure - In Orange (live 1986) - 00 - Introduction" "The Cure - In Orange (live 1986) - 03 - Play For Today" "The Cure - In Orange (live 1986) - 04 - A Strange Day" "REM - Losing My Religion" "SlipKnoT - 02 - (Sic)" "Slipknot - Wait and Bleed" "Mr Big - To Be With You" "Marlene Kuntz - Nuotando Nell'Aria" "Korn & Rammstein - Good God" "Korn - 06 - Thoughtless" "Extreme - More Than Words" "99 Posse - Curre Curre Cuaglio" }
set mp3_status 0
set mp3_msg  ""
set mp3_gone 0

proc mp3_timer {} {
  global mp3_enable mp3_time mp3_msgs mp3_msgs1 mp3_status mp3_msg mp3_msg1 mp3_gone
  if {$mp3_enable} {
    if {$mp3_status} {
      foreach chan [channels] { puthelp "PRIVMSG $chan :\001ACTION 13>>4X13<< Mp3 :: »\002 0,4 $mp3_msg1  « \002:: Mp3 13>>4X13<<\001" }
      putserv "AWAY"
      set mp3_status 0
    } else {
      set mp3_msg [lindex $mp3_msgs [rand [llength $mp3_msgs]]]
      foreach chan [channels] { puthelp "PRIVMSG $chan :\001ACTION 13>>4X13<< Mp3 :: »\002 0,4 $mp3_msg  « \002:: Mp3 13>>4X13<<\001"  }
      putserv "MP3 :$mp3_msg"
      set mp3_status 1
      set mp3_gone [clock seconds]
    }
  if {![string match "*time_mp3*" [timers]]} { timer [expr [rand $mp3_time] + 1] mp3_timer }
  }
}

proc mp3_dcc {hand idx arg} {
 global mp3_enable mp3_time
 switch -exact -- [string tolower [lindex $arg 0]] {
  "now" {
   putdcc $idx "mp3: now"
   mp3_timer
  }
  "enable" {
   if {([lindex $arg 1] != 0) && ([lindex $arg 1] != 1)} { putdcc $idx "Usage: mp3 enable 0/1" ; return 0 }
   set mp3_enable [lindex $arg 1]
   putdcc $idx "mp3: $mp3_enable"
  }
  "time" {
   if {[lindex $arg 1] == ""} { putdcc $idx "Usage: mp3 time max_time" ; return 0 }
   putdcc $idx "mp3 time: [lindex $arg 1]"
   set mp3_time [lindex $arg 1]
  }
  default {
   putdcc $idx "mp3.tcl v0.1 by {4}m0N`Ra (anticristo@ircnet)"
   putdcc $idx "Usage: mp3 now"
   putdcc $idx "       mp3 enable 0/1      (actual: $mp3_enable)"
   putdcc $idx "       mp3 time   max_time (actual: $mp3_time)"
  }
 }
}

if {![string match "*mp3_timer*" [timers]]} { timer [expr [rand $mp3_time] + 1] mp3_timer }

bind dcc m mp3system mp3_dcc

putlog "Loaded mp3.tcl v0.1 by {4}m0N`Ra"