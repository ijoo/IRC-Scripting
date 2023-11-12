### iseng wae ###

bind pub - !bunga pub_bunga
proc pub_bunga {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !bunga <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... accciiikk 2dikacih bunga euuy.. 6tengkyuuhhh... mwaaa... mwaaaa"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick dacal peyits.. 6bunganya koq 2buat dili cendili cih... 6dacal .. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2ngasih setangkai bunga plastik buat6 $person 2cuuupssss... ^_* 6ai lop yu, yu lop mi, mek lop yuk say...." 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !kiss pub_kiss
bind pub - !cium pub_kiss
proc pub_kiss {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !kiss <nick> atau !cium <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... napa koq sayah mau 2dikiiisss.. 6udagh gocok gigi belom $nick ... dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick didilzz.. 6mana bica kamuh mau 2kiss dili cendili cih... 6dacal genits.. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2kiisssseeees very hot6 $person di bibilnya yang item 2muaccchhh.... muaachhhh... cuuupssss.. cuuupssss... ^_* 6sampe $person basah kuyup.... hehehe.. " 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !ban pub_banmu
proc pub_banmu {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !ban <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... enak ajah sayah 2dibaannn... 6calah apakah diliku .. dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick dah ngga walas yah.. 6koq kamuh mau 2nge baann 6dili cendili cih.. dacal genits.. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2ngalungin ban traktor ke6 $person 2sebagai tanda rasa cintah... 2GuuBBRaaXXxx..... 6ai lop yu haniiihh... du yu lop mi tu ??" 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !kill pub_kill
bind pub - !bunuh pub_kill
proc pub_kill {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !kill <nick> atau !bunuh <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... napa koq sayah mau 2dibunuuhh sech.. 6calah apakah diliku .. dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick dah ngga walas yah.. 6koq kamuh mau 2bunuh dili cih... 6dacal genits.. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2teemmbaakkkk6 $person 2pake sinar penghancur... 2BBiiPPP.. BBiiiPPp... BBiiiPPPp... 6$person lari ketakutan sampe kolornya melorot rot rot.... lasain loe... hehehe.. " 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !kick pub_kick
bind pub - !tendang pub_kick
proc pub_kick {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !kick <nick> atau !tendang <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... napa koq sayah mau 2ditendaangg.. 6ndak mau ahh.. dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick dah ngga walas yah.. 6koq kamuh mau 2nendaaangg 6dili cendili cih.. dacal genits.. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2teenndaaanggg6 $person di pantat 2pake sepatu kuda dari baja... 2DeeZZiiNGhHH.. GuuuBBRaaaXXxxx... 6cukuliiinnn loe... pecah ngga tuh bisulnya.. hehehe" 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !slap pub_slap
proc pub_slap {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !slap <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... enak ajah sayah 2dislapsss.. 6ndak mau ahh.. dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Walaahh... 2$nick dah ngga walas yah.. 6koq kamuh mau 2slapsss 6dili cendili cih.. dacal genits.. :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2slaaaaapsssssss6 $person di jidat 2pake kursi, kompor, penggorengan, keyboard, monitor, linggis... 2JeGuuuERRR... PleeTHaaQQQ.. DeeZZiiNGhHH.. 6cukuliiinnn loe... monyong ngga tuh jidat.. ha.ha:p~" 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !gantung pub_gantung
proc pub_gantung {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !gantung <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... enak ajah sayah 2digantung.. 6ndak mau ahh.. dacal ih!!"
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Waaaaaa... 2$nick dah ngga walas yah.. 6koq kamuh mau 2gantung 6dili cendili cih.. dacal :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6AaYooooo... kita 2ganntuuung6 $person di pohon tomat 2pake tali kolornya $nick... 2SrruuutTT... SReeeTTT.. 6lasain loe... makanya jangan nakal yah.. " 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !hug pub_hug
bind pub - !peluk pub_hug
proc pub_hug {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !hug <nick> atau !peluk <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Waaaaaa... enak euuyy 2di peyuuk 6sama $nick.. nakcil cama cayah yah.."
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Waaaaaa... 2$nick duduttss.. 6mana bica peyuk kamu 2peyuuukkk 6dili cendili cih.. dacal :P"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2peelluuuukkk mesraahh6 $person di ketiak... 2HHemmmmPPP... HhhMMppPP.. 6angeett euuyy ^_* .. 2tapi koq agak bau dikit... 6bau apa yah.. " 
    } else {
        putserv "PRIVMSG $chan :6Yeyy... si $nick duduts banget deh, 2mana ada nick $person di sini.. 6dacaL dudiL"
    }
}

bind pub - !cakar pub_cakar
proc pub_cakar {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !cakar <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Enak aja maen 2cakar cakar.... 6$nick.. minta digigit yaaaaaaa.."
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Wew dasar bodoh... 2$nick dudullss.. 6masak mo 2nyakar 6sendiri...gak lagi kumat gilanya kan"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2cakar cakar 6 $person dengan gaya kucing mengeong..... 2meeeeeeeooooooonnnnnnggggggg 6hueks....." 
    } else {
        putserv "PRIVMSG $chan :6Wah pasti gak pake kacamata yaaaaa..... oi $nick ...2si $person gak ada di sini.. 6dasar"
    }
}

bind pub - !banting pub_banting
proc pub_banting {nick uhost handle chan arg} {
    global botnick
    if {$arg == ""} {
      putserv "NOTICE $nick :Usage !cakar <nick>"
      return 0
    }
    set person [lindex $arg 0]
    if {$person == $botnick} {
       putserv "PRIVMSG $chan :6Eh......eh...... 6$nick.. 2bantingnya ditempat tidur aja yaaaaa.."
    } elseif {$person == $nick} {
       putserv "PRIVMSG $chan :6Emangnya..... 2$nick.. 6bisa 2banting 6diri sendiri...paling yang ada juga jatuhin diri"
    } elseif {[onchan $person $chan]} {
        putserv "PRIVMSG $chan :6$nick 2banting 6 $person keatas tempat tidur..... 2maen yuk.... 6yuk ah yuuuuuuuuuuuuuuuuukkkkkkkkkkkkkkk....." 
    } else {
        putserv "PRIVMSG $chan :6Pasti lagi pusing nih..... si $nick ...2 $person yang mo dibanting aja gak ada koq.. 6gilak -_-'"
    }
}


putlog "Sukses diloaded.."