bind pub o|o `rusakhelp rusakhelp
bind pub o|o `rusakstart rusakstart
bind pub o|o `rusakstop rusakstop
bind pub o|o `rusakchan rusakchan
bind pub o|o `rusaktimer rusaktimer
#-----------------
bind pub o|o `listtimer xlisttimer
bind pub o|o `killtimer xkilltimer
bind pub o|o `procrun xprocrun

set rusak_chans "*"
set rusak_time 0
set isplaying 1

proc rusakhelp {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :`rusakstart, `rusakstop, `rusakchan \"#channel1 #channel2\", `rusaktimer <menit>"
}
proc rusakstart {nick uhost hand chan text} {
  global isplaying rusak_time
  if {$isplaying} {
    putserv "PRIVMSG $chan :already running"
  } else {
    set isplaying 1
    putserv "PRIVMSG $chan :is started"
  }
  if {$rusak_time < 1} {set rusak_time 5}
  timer $rusak_time rusak_speaks
}
proc rusakstop {nick uhost hand chan text} {
  global isplaying
  if {$isplaying} {
    set isplaying 0
    putserv "PRIVMSG $chan :is stoped"
  } else {
    putserv "PRIVMSG $chan :already stoped"
  }
    foreach t [timers] {
       if [string match *rusak_speaks* [lindex $t 1]] {
         killtimer [lindex $t end]
       }
    }    
}
proc rusakchan {nick uhost hand chan text} {
  global rusak_chans
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `rusakchans \"#channel1 #channel2\" , current channel is $rusak_chans"
  } else {
    set rusak_chans $text
    putserv "PRIVMSG $chan :rusakchan set to : $rusak_chans"
  }
}
proc rusaktimer {nick uhost hand chan text} {
  global rusak_time
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `rusaktimer <menit> , current timer is $rusak_time"
  } else {
    if {$text < 1} {set text 5}
    set rusak_time $text
    putserv "PRIVMSG $chan :rusaktimer set to : $rusak_time"
  }
}
proc xkilltimer {nick uhost hand chan text} {
  if { $text == "" } {
    putserv "PRIVMSG $chan :$nick, usage : `killtimer <timerid>"
  } else {
    killtimer $text
    putserv "PRIVMSG $chan :timer $text is killed."
  }
}
proc xlisttimer {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :[timers]"
}
proc xprocrun {nick uhost hand chan text} {
  [$text]
  putserv "[$text]"
}

set rusak_msg {
 {"bolongane ono ra ki... lha kok kontil kabehh ki piye..?"}
 {"ahh jembat kok.. do meneng koyo patung"}
 {"wasyu ki do ra nganu.."}
 {"lha ndii bokepppee? ndi ki pakar2 bokepe kok rung nyebar\!"}
 {"sing jenenge oscar ki apikkan tapi senengane ngocokan lha bojone nang jogja ki.."}
 {"penak nan ki nek kenthu ro wedokkan ayu yo.."}
 {"\!seen gawuuuuuuuk"}
 {"wong semene ki do ngopo? rambokep wae.. asyuuu"}
 {"sing moco tulisanku ra koyo KIRIK tapi pancen KIRIK"}
 {"do sembayang po piye jo kenthu ae..."}
 {"susune sopo yo iki (.v.)kok cilik "}
 {"do nyapune warnet po piye..resik..resik..buen kinclong "}
 {"anak-sehat ki sehat awake ning ra iso ngaceng"}
 {"wis tak itungi tekan 5 menit kok do ra ngobrol nang chanel? ngocok kabeh po?"}
 {"waduhh anuku.... njepat"}
 {"ngaji ah... alifff lammmmm mimmmm.."}
 {"Gole gebetan ah....ben luweh mantab"}
 {"ahh mending sholat tahajud mengko.. ndongo ben ordere tembus"}
 {"uhukss...test...tist..."}
 {"channel ko sepi men ... ra ono seng ngoceh..."}
 {"reyna oh..evelyn..oh..ce_Allien..mana yah...:P"}
 {"nok...nok...nok...nok...nono-e sopo iki..."}
 {"cuci tangan cuci kaki cuci muka langsung mancal kenthu.."}
 {"Jalan terbaik untuk menjaga persahabatanmu tetap HIDUP adalah dengan MENGUBUR kesalahan teman2mu..."}
 {"Betapa istimewa rasanya, menCINTAi seseorang dengan sungguh2 & tidak menuntut apa2 dari perasaan itu. Cukup dengan merasakannya dan menghargai apa adanya......"}
 {"Cinta boleh hancur... Kemauan boleh tak terwujud. Tapi... putus asa tak boleh ada. Bangkit dan terus berjuang...demi kehidupan panjang di hari esok...."}
 {"Ngomong...oiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii...koyo kuburan iki sepineee"}
 {"mo cari shell buka ajah di mendoan.com adatuh..."}
 {"pengin merasakan lagi nikmatnya bercinta :P"}
 {"Sepi.Sepi.Sepi.Sepi.Sepi.Sepi.Sepi.Sepi.Com.Net.Org.Info.Biz.As.La"}
 {"Brb ah dolanan gawuk..."}
 {"mo dload tcl yg nda kena akil dalnet buka ajah di semut-hitam.com rasakan sendiri saja..:P"}
 {"waduh Ndasku pisah mbe tangan ki..."}
 {"si boss klo ke yk pasty main di warnet Nandanet..."}
}

if {![string match "*rusak_speaks*" [timers]]} {
 timer $rusak_time rusak_speaks
}
proc rusak_speaks {} {
 global rusak_msg rusak_chans rusak_time
 if {$rusak_chans == "*"} {
  set rusak_temp [channels]
 } else {
  set rusak_temp $rusak_chans
 }
 foreach chan $rusak_temp {
  set rusak_rmsg [lindex $rusak_msg [rand [llength $rusak_msg]]]
  foreach msgline $rusak_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*rusak_speaks*" [timers]]} {
  timer $rusak_time rusak_speaks
 }
}
putlog "-=-=   busuk. rusak.tcl   =-=-=-=-=-"
bind pub -|- `rusak randrusak

proc randrusak {nick uhost hand chan text} {
 global rusak_msg notc
  set rusak_rmsg [lindex $rusak_msg [rand [llength $rusak_msg]]]
  foreach msgline $rusak_rmsg {
   puthelp "PRIVMSG $chan :$notc $nick, 14[subst $msgline]"
  }
}
