## ----------------------------------------------------------------
## Set global variables and specificic
## ----------------------------------------------------------------

## -=[ ALO ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "*"
set hello_chans "*"

## -=[ BRB ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "*"
set brb_chans "*"

## -=[ GTG ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "*"
set bye_chans "*"

## -=[ PING ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "*"
set ping_chans "*"


## ----------------------------------------------------------------
## --- Don't change anything below here if you don't know how ! ---
## ----------------------------------------------------------------

######################################################################
##--------------------------------------------------------------------
##--- F O R     ---   E N T E R T A I N M E N T  ---    CHANNEL   ----
##--------------------------------------------------------------------
######################################################################         
##  PING PONG ##
set Reponden2.v "Ping Respon"
bind pub - !ping ping_speak 
bind pub - `ping ping_speak
bind pub - .ping ping_speak
  
set ranping {
  ",pong"
  ",kamu ping-in punya anak atau ping-in punya cucu hehe.."
  ",waw masih suka nonton film ping-uin yah kekek...ajak-ajak donk"
  ",Your Not that lagged. Ping Reply :7 second"
  ",waw kamu lagg banget sampai 10 menit 10 second keke.. becanda"
  ",ping in naik HAJI yacht kmu eeee"
  ",Ping..pong.. ayo kita maen ping pong kamu bisa kan :)"
  ",jangan ping melulu donk gue juga lagg nich bukan kamu aja"
  ",minta ping ni ye.. :) ping aku juga donk :)"
  ",ping...pong"
  ",Your ping reply took 180 seconds"
  ",jangan serius banget ping nya nanti kena kena pong kan bisa brb loh"
  "waduh.. minta ping sampai.. gue lupa menghitung berapa second lagg kamu sorry :P"
  "ehm.. menurut saya lagg kamu ngak begitu lag kali ya.. ;p"
  "Your lagged, but not to bad. Ping Reply:12 ops... salah hitung.."
  "ping-in kamu mau berapa second ping nya. kalau mau 10 anggap aja 10 second :) mudahkan"
  "pinguuin yang ada di gambar pada linux program yah"
  "bosan ni.. elo minta ping melulu sekali2 ke minta yang lain ;p kayak kiss atau apa"
  "anda ngak begitu lag kok cuman 1 second ;p becanda"
  "waw kasihan kamu lagg nya minta ampun sampai 1 menit perline kekek.. "
  "ping pong itu apa sih??"
  ",ping in di TONJOK yacht kmu eeee"
  ",jangan becanda lah massa kamu pingin kawin lagi kekeke.."
  "bener ni minta ping.."
  "ping-in apa lu ? pingin diriku ato pingin sex?"
  "ping teh naon ? bahan pembuat emping ? ato semacam penyakit kuping?"
  "ping-in apa? cucu ya? cucu dancow? ato cucu milo?"
  ",bener-bener minta ping ni kalau di suruh pilih mau di kiss atau mau minta ping"
  "ketik aja /ctcp yournickname ping"
  "ping sini ping sana, lag sini lag sana, pakailah server yang cepat"
  "gimana sih rasanya di ping?"
  "kenapa dengan ping-gang gua? sexy ya hueuheue"
  "PING sendiri donk :P"
  "gimana rasanya di pong? tanpa ping"
  "ada yang pingsan ya?"
  "ping-in di BOLOTIN ya? biar kuping elo enggak bolot:P"
  "sini gua ping-in, bayar cepek dulu yah ^_*"
  "ping ping mulu, lagi ngidem ya? ohh udah hamil brapa bulan nich hehehe"
  "[PING reply]: 2 seconds -[hehehe..]-"
  "eh tolong tuh , ada orang minta PING"
  "lu mo pingsan jangan disini!! dipelukanku saja hihihihiihih"
  "di ping itu di apain sih? dibikin pingsan ya? ato di kasih liat pinggang sexy?"
  "ping yang lu maksud apa nih? dedenya pinguin musuh batman? ato semacam olahraga?"
  "ping teh naon ? bahan pembuat emping ? ato semacam penyakit kuping?"
  "ping (boongan) elo adalah 3,123456789 detik, hehehehehe"
  "ping mulu, kebanyakan ping, ntar lumalah jadi LAG lhooooo"
}

proc ping_speak {nick uhost hand chan text} {
 global botnick ping_chans ranping
if {(([lsearch -exact [string tolower $ping_chans] [string tolower $chan]] != -1) || ($ping_chans == "*"))} {
set pings [lindex $ranping [rand [llength $ranping]]]
putserv "PRIVMSG $chan :$nick $pings"
  }
} 

##  hello ##
set Reponden3.v "hello Respon"
bind pub - hello hello_speak 
bind pub - alo hello_speak 
bind pub - hallo hello_speak 
bind pub - hai hello_speak 
bind pub - hi hello_speak 

set ranhello {
  "hello there, nice to meet you"
  "hello how are you ^_^"
  "ramein channel donk saayyyy"
  "halo halo JOMBANG, wakil bos gua orang JOMBANG"
  "Hi too, ohh ur so cutee xP~"
  "halooooooooo"
  "apaaaaaaa , suka yaaaaa"
  "chat in channel please"
  "yes, Hello too, do I know ya ?"
  "alo sayank"
  "Hi there"
  "hello, whats up"
  "oi oi oi oi oi"  
  "Halo juga nich, kamu sapa nich, kok sok kenal banget =P"
  "hello how are you ^_^"
  "Hai bro apa kabarmu, bagaimana dengan kabar keluargamu ?"
  "hey whats up"
  "yeah, yeah hi HI"
  "hello, nice to see yea!"
  "Hi i'm happy today!!"
  "hai hai hai hai juga"
  "apa khabar nich nama kamu siapa"
  "halo juga perkenalkan nama ku sarisha kalau kamu siapa?"
  "asl gua = 26 f jombang JATIM, rumah gua di Jombang, tebak yg mana :P"
  "hi ,  =)  , kenalan yukk"
  "asl pls, I like to chat with you in channel"
  "Hi juga, kamu makin kiyut aja dech, gemesssss"
  "alo juga, siapa disitu ?"
  ",konnichiwa (halo dalam bahasa jepang)<== maklum baru belajar :P"
  ",how do you do? i'm happy to meet you"
  ",halo juga saya senang dapat berjumpa dengan anda lagi"
  "it was nice meeting you"
  "menyenangkan dapat bertemu dengan anda lagi"
  "how are you today ? are you okay ?"
}

proc hello_speak {nick uhost hand chan text} {
 global botnick hello_chans ranhello
if {(([lsearch -exact [string tolower $hello_chans] [string tolower $chan]] != -1) || ($hello_chans == "*"))} {
set helos [lindex $ranhello [rand [llength $ranhello]]]
putserv "PRIVMSG $chan :$nick $helos"
  }
} 

##  Brb  ##
set Reponden4.v "Brb Respon"
bind pub - brb brb_speak 
set ranbrb {
  "ok deggh"
  "mau kemana loe MANDRA ?"
  "me too, smoke time!"
  "brb mau makan ya ajak² dong..!!"
  "when you coming back. miss ya already! ;)"
  "brb mo kemana nich, kok ga ngajak ngajak hehehe"
  ",BRB nya jangan lama lama yah :))"
  "kalo brb ke WC aku ikut, kalo ke kamar juga hehehehhe"
  "u want to brb ? ok darling, but don't be so long ok pls, I need You honey"
  ",Alesan .. paling juga gebetan"
  "brbnya 5 menit aja hehehehehee"
  "Betulin Rambut Bawah yacht :þ~"
  "tunggu aku dong say, jangan BrB dulu"
  "ikut brb ahhhhhh"
  ",ape ?? mo kmana lu jang ? TEGA LUH tinggalin gua sendiri ?? co macam apa pulak kau :("
  "brb boleh tapi nicknamenya tetep disini kan ?"
  "ok,  saya tunggu yah.. jangan lama2 kangen nich kekek.."
  "brb mau kemana.. mau beli makanan yah.. ikut donk.."
  "ye.. baru juga elo masuk udah brb payah.. loe..."
}

proc brb_speak {nick uhost hand chan text} {
 global botnick brb_chans ranbrb
if {(([lsearch -exact [string tolower $brb_chans] [string tolower $chan]] != -1) || ($brb_chans == "*"))} {
set brbs [lindex $ranbrb [rand [llength $ranbrb]]]
putserv "PRIVMSG $chan :$nick $brbs"
  }
} 

##  gtg  ##
set Reponden5.v "Bye respon"
bind pub - bye bye_speak 
set ranbye {
  "ati ati dijalan yahh, byeee, kalo jatoh, bangun sendiri yahhh"
  "sampe jumpa besok di waktu dan jam yang sama hihihihi tha tha"
  "thathaaa"
  "nice to meet you today, hope can see you agaiin tomorrow"
  "ati-ati di jalan bro!!"
  "ok see u later fren"
  "kok buru-buru amat tadikan baru datang kok udah mau pergi.."
  "ok deh.. bye.. juga"
  "see u tommorow night"
  "see u tonight"
  "good bye say.......emangnya elo sayuran...kekekekekekek"
  "mata ashita (sampai jumpa besok)"
  "sayoonara fren :)"
  "sampai besok sobat"
  "iyah..take care yaahh ^_^"
  "take care fren, nice to meet u :)"
  "good bye.. juga :)"
  "nice to meet you today, hope can see you agaiin tomorrow"
  "makacih ya udah join dan maen disini"
}

## -----------------------------------------------------------------------
putlog "-=-=   ENTERTAINMENT  PROSES   =-=-=-=-=-"
putlog "Entertainment Channel (auto/respon) Ver 1.0:"
putlog "loaded Successfuly..."
##------------------------------------------------------------------------
##                      ***    E N D   OF  ENT1.1.TCL ***
## -----------------------------------------------------------------------
