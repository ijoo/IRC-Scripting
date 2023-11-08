set iklan_chan "#dReaMer"
set iklan_time 30
set iklan_msgs {
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@help\00315 For Full Command list \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@mp3\0030 <singer> - <song title> \00315or \0030<youtube URL>\00315 to download mp3 \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@mp4\0030 <URL>\00315 to get direct download link \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@torrent\0030 <keyword>\00315 to searching torrent files \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \00312@xhamster\0030 <keyword>\00315 to searching xhamster sites \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \00312@xnxx\0030 <keyword>\00315 to searching XNXX/XVideos sites \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \00312@redtube\0030 <keyword>\00315 to searching redtube sites \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@port\0030 <host> <port>\00315 to check port \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@zod\0030 <horoscope sign>\00315 to read your sign \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@nama\0030 <your name>\00315 untuk mengetahui makna nama kamu \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@hp\0030 <phone number>\00315 untuk mengetahui perhitungan angka hoki di no HP kamu \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@kurs \00315see today kurs \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \00314@dns\0030 <domain> \00315see DNS resolve \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \00314@ip\0030 <8.8.8.8> \00315see IP Information \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Type \0038@cari\0030 <keyword> \00315searching Youtube sites \003 \0034,4#\0034,1dReaMer\0034,4 \003"
"\0034,4#\0034,1dReaMer\0034,4 \003 \00315,1 Powered By iJoo.oRg \003 \0034,4#\0034,1dReaMer\0034,4 \003"
}

proc iklan_start {} {
  global iklan_time
  if {[string match *iklan_sendmsg* [timers]]} {return 0}
  timer [expr [rand $iklan_time] + 1] iklan_sendmsg
}
proc iklan_sendmsg {} {
  global botnick iklan_chan iklan_msgs iklan_time
  if {[validchan $iklan_chan] && [onchan $botnick $iklan_chan]} {
    puthelp "PRIVMSG $iklan_chan :[lindex $iklan_msgs [rand [llength $iklan_msgs]]]"
  }
  timer [expr [rand $iklan_time] + 1] iklan_sendmsg
}
set iklan_chan [string tolower $iklan_chan]
iklan_start
putlog "=== Iklan TCL Loaded" 
