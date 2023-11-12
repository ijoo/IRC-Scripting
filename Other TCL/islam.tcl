bind pub o|o `islamhelp islamhelp
bind pub o|o `islamstart islamstart
bind pub o|o `islamstop islamstop
bind pub o|o `islamchan islamchan
bind pub o|o `islamtimer islamtimer
#-----------------
bind pub o|o `listtimer xlisttimer
bind pub o|o `killtimer xkilltimer
bind pub o|o `procrun xprocrun

set islam_chans "*"
set islam_time 0
set isplaying 1

proc islamhelp {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :`islamstart, `islamstop, `islamchan \"#channel1 #channel2\", `islamtimer <menit>"
}
proc islamstart {nick uhost hand chan text} {
  global isplaying islam_time
  if {$isplaying} {
    putserv "PRIVMSG $chan :already running"
  } else {
    set isplaying 1
    putserv "PRIVMSG $chan :is started"
  }
  if {$islam_time < 1} {set islam_time 5}
  timer $islam_time islam_speaks
}
proc islamstop {nick uhost hand chan text} {
  global isplaying
  if {$isplaying} {
    set isplaying 0
    putserv "PRIVMSG $chan :is stoped"
  } else {
    putserv "PRIVMSG $chan :already stoped"
  }
    foreach t [timers] {
       if [string match *islam_speaks* [lindex $t 1]] {
         killtimer [lindex $t end]
       }
    }    
}
proc islamchan {nick uhost hand chan text} {
  global islam_chans
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `islamchans \"#channel1 #channel2\" , current channel is $islam_chans"
  } else {
    set islam_chans $text
    putserv "PRIVMSG $chan :islamchan set to : $islam_chans"
  }
}
proc islamtimer {nick uhost hand chan text} {
  global islam_time
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `islamtimer <menit> , current timer is $islam_time"
  } else {
    if {$text < 1} {set text 5}
    set islam_time $text
    putserv "PRIVMSG $chan :islamtimer set to : $islam_time"
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
set islam_msg {
{"14Dari Ibnu Abbas r.a Penduduk Khaibar puasa pada hari Asyura dan menjadikannya sebagai Hari Raya, di mana wanita mereka memakai perhiasan dan pakaian yang indah pada hari itu. Lalu Rasulullah s.a.w. bersabda Puasalah kamu (pada hari itu).(Sahih Muslim)\002"}
{"14Dari Aisyah r.a, Rasulullah s.a.w bersabda Barangsiapa yang tidak sampai mengqada puasa hendaklah keluarganya mengantikan puasa tersebut. (Sahih Bukhari \& Muslim)\002"}
{"14Tegakkan syariat dalam dirimu  barulah syariat dapat tegak di negerimu\002"}
{"14Dari Abu Mas\'ud r.a, Rasulullah s.a.w bersabda Apabila seorang laki-laki memberikan nafkah kepada keluarganya dengan ikhlas, maka (pahala) nafkah itu sama dengan (pahala) sadaqah. (Sahih Bukhari)\002"}
{"14Dari Abu Hurairah r.a, Rasulullah s.a.w bersabda Allah berfirman Setiap amal anak Adam adalah untuk anak Adam itu sendiri melainkan puasa. Sesungguhnya puasa itu bagiKu dan Aku membalasi puasanya itu. (Sahih Bukhari)\002"}
{"14Tidurnya orang yang puasa tetap dalam ibadat dan diamnya dianggap tasbih dan amalnya dilipatgandakan dan doanya mustajab dan dosanya diampunkan. (HR Al Baihaqi)\002"}
{"14Nikah adalah sebagian dari sunnahku, barangsiapa tidak suka terhadap sunnahku maka tidak termasuk golonganku (HR Bukhari)\002"}
{"14Tidak akan datang hari kiamat sehingga orang-orang Islam memerangi dan membunuh orang-orang Yahudi (HR Muslim)\002"}    
{"14Dari Abu Hurairah r.a, Rasulullah s.a.w bersabda Apabila Ramadhan telah datang maka dibukakan pintu rahmat, dikunci Neraka Jahanam dan dibelenggu semua syaitan.(Sahih Muslim)\002"}
{"14Keajaiban yang sangat mengherankan terhadap orang yang lari dari apa yang sangat dibutuhkan, dan tidak dapat lepas daripadanya. Dan berusaha mencari apa yang tidak akan kekal padanya. Sesungguhnya bukan mata kepala yang buta, tetapi yang buta ialah mata hati yang ada di dalam dada.(Kitab Al Hikam , Syehh Ahmad Attaillah) \ 002"}
{"14Dan barangsiapa yang tidak diberi cahaya oleh Allah, maka orang itupun tidak akan memperoleh cahaya apapun. (QS. An-Nur 40) \002"}
{"14Hai manusia, sesungguhnya janji Allah adalah benar, maka sekali-kali janganlah kehidupan dunia memperdayakan kamu dan sekali-kali janganlah syaitan yang pandai menipu, memperdayakan kamu tentang Allah (QS. Faathir 35 : 5)\002"}
{"14Demi waktu, sesungguhnya manusia itu benar-benar berada dalam kerugian, kecuali orang-orang yang beriman dan mengerjakan amal saleh dan saling nasehat-menasehati dalam menatapi kebenaran dan nasehat-menasehati dalam menetapi kesabaran \(Q.S. AI Ashr: (103): 1-3\)\002"}
{"14Kamu sekali-kali tidak sampai kepada kebaktian (yang sempurna), sebelum kamu menafkahkan sebahagian harta yang kamu cintai. Dan apa saja yang kamu nafkahkan, maka sesungguhnya Allah mengetahuinya. (QS. Ali Imran 3:92)\002"}
{"14sesungguhnya telah datang kepadamu seorang rosul dari kamu sendiri, berat terasa olehnya penderitaanmu, sangat mengiginkan (keimanan dan keselamatan) bagimu, amat belas kasihan lagi penyayang terhadap orang-orang mukmin (surat At Taubah : 128 )\002"}
{"14Wahai anak Adam aku adalah hari yang baru, dan aku datang untuk menyaksikan amalan kamu. Oleh sebab itu manfaatkanlah aku sebaik-baiknya. Karena aku tidak kembali lagi sehingga hari pengadilan. (H.R. Turmudzi)\002"}
{"14Sesungguhnya telah ada pada diri Rasulullah itu suri tauladan yang baik bagimu (yaitu) bagi orang-orang yang mengharap rahmat Allah ... (QS. Al Ahzab (33) : 21)\002"}
{"14Sesungguhnya Allah tidak merubah keadaan suatu kaum sehingga mereka merubah keadaan yang ada pada diri mereka sendiri. (QS. Ar Ra\'d 13:11)\002"}
{"14Padahal mereka tidak disuruh, kecuali supaya menyembah Allah dengan memurnikan ketaatan kepada-Nya dalam (menjalankan) agama dengan lurus dan supaya mereka mendirikan shalat serta menunaikan zakat, dan yang demikian itulah agama yang lurus (QS. Al Bayyinah (98) : 5)\002"}
{"14wahai orang-orang yang beriman diwajibkan kepada kalian untuk berpuasa sebagaimana telah diwajibkan kepada orang-orang sebelum kalian agar kalian bertaqwa (surat Al Baqarah : 183)\002"}
{"14Barangsiapa yang bersyukur maka sesungguhnya dia bersyukur untuk (kebaikan) dirinya sendiri dan barangsiapa yang ingkar, maka sesungguhnya Tuhanku Maha Kaya lagi Maha Mulia. (QS. An Naml 27:40)\002"}
{"14Sesuatu yang bernyawa tidak akan mati melainkan dengan izin Allah, sebagai ketetapan yang telah ditentukan waktunya. Barangsiapa menghendaki pahala dunia, niscaya Kami berikan kepadanya pahala dunia itu, dan barangsiapa menghendaki pahala akhirat, Kami berikan (pula) kepadanya pahala akhirat. Dan kami akan memberi balasan kepada orang-orang yang bersyukur. (QS. Ali Imran 3:145)\002"}
{"14Katakanlah: Jika kamu (benar-benar) mencintai Allah, ikutilah aku, niscaya Allah mengasihi dan mengampuni dosa-dosamu. Allah Maha Pengampun lagi Maha Penyayang. (QS. Ali Imran 3:31)\002"}
{"14Dan tolong-menolonglah kamu dalam mengerjakan kebajikan dan takwa dan janganlah kamu tolong-menolong dalam berbuat dosa dan pelanggaran. Dan bertakwalah kamu kepada Allah, sesungguhnya Allah amat berat siksanya. (QS. Al-Maidah: 2)\002"}
{"14Semua amal anak Adam dapat dicampuri kepentingan hawa nafsu, kecuali shaum. Maka sesungguhnya shaum itu semata-mata untuk-Ku dan Aku sendiri yang akan membalasnya (Hr. Bukhari Muslim)\002"}
{"14Sesungguhnya Allah SWT suka kepada hamba yang berkarya dan terampil. Barang siapa bersusah payah mencari nafkah untuk keluarganya, maka dia serupa dengan seorang mujahid fisabilillah. (HR.Imam Ahmad)\002"}
{"14Sesungguhnya Jibril alaihis salam selalu menemui Nabi shallallahu alaihi wa salllam untuk membacakan Al Quran baginya.(HR. Al Bukhari dan Muslim dari Ibnu Abbas Radhiyallahu anhu)\002"}
{"14Sesungguhnya setan itu bermaksud hendak menimbulkan permusuhan dan kebencian di antara kamu lantaran (meminum) khamar dan berjudi itu, dan menghalangi kamu dari mengingat Allah dan sembahyang; maka berhentilah kamu (dari mengerjakan pekerjaan itu)\002"}
{"14sesungguhnya Allah tidak mengampuni dosa mempersekutukan (sesuatu) dengan Dia, dan Dia mengampuni dosa selain dari syirik itu bagi siapa yang di kehendaki-Nya. (an Nisa\': 116)\002"}
{"14Dan siapakah yang lebih zhalim dari pada orang yang telah diperingatkan dengan ayat-ayat tuhan-Nya, kemudian ia berpaling daripadanya? Sesungguhnya kami akan memberikan pembalasan kepada orang-orang yang berdosa.(As Sajdah: 32)\002"}
{"14Mereka mempunyai tikar tidur dari api nereka dan di atas mereka ada selimut (api nereka). Demikianlah Kami memberi balasan kepada orang-orang yang zalim \002"}
{"14Kemudian tatkala dia melihat matahari terbit dia berkata: Inilah Tuhanku, ini yang lebih besar, maka tatkala matahari itu telah terbenam, dia berkata: Hai kaumku, sesungguhnya aku berlepas diri dari apa yang kamu persekutukan \002"}
{"14Dan sebagian dari tanda-tanda kekuasaan-Nya ialah malam, siang, matahari dan bulan. Janganlah bersujud kepada matahari dan janganlah (pula) kepada bulan, tetapi bersujudlah kepada Allah Yang menciptakannya, jika kamu hanya kepada-Nya saja menyembah \002"}
{"14Dia menciptakan langit dan bumi dengan (tujuan) yang benar; Dia menutupkan malam atas siang dan menutupkan siang atas malam dan menundukkan matahari dan bulan, masing-masing berjalan menurut waktu yang ditentukan.Ingatlah Dialah Yang Maha Perkasa lagi Maha Pengampun \002"}
{"14Maka sabarlah kamu atas apa yang mereka katakan, dan bertasbihlah dengan memuji Tuhanmu,sebelumterbit matahari dan terbenamnya dan bertasbih pulalah pada waktu-waktu di malam hari dan pada waktu-waktu di siang hari, supaya akmu merasa senang \002"}
{"14Apakah kamu tidak memperhatikan (penciptaan) Tuhanmu, bagaimana Dia memanjangkan (dan memendekkan) bayang-bayang; dan kalau Dia menghendaki niscaya Dia menjadikan tetap bayang-bayang itu, kemudian Kami jadikan matahari sebagai petunjuk atas bayang-bayang itu \002"}
{"14Dia memasukkan malam ke dalam siang dan memasukkan siang ke dalam malam dan menundukkan matahari dan bulan, masing-masing berjalan menurut waktu yang ditentukan.Yang (berbuat) demikian itulah Allah Tuhan-mu, kepunyaan-Nyalah kerajaan.Dan orang-orang yang kamu seru (sembah) selain Allah tiada mempunyai apa-apa walaupun setipis kulit ari \002"}
{"14Berkata Musa:Waktu untuk pertemuan (kami dengan) kamu itu ialah di hari raya dan hendaklah dikumpulkan manusia pada waktu matahari sepenggalahan naik \002"}
{"14Dan jagalah dirimu dari (\'azab) hari (kiamat, yang pada hari itu) seseorang tidak dapat membela orang lain, walau seikitpun; dan (begitu pula) tidak diterima syafa\'at dan tebusan daripadanya, dan tidaklah mereka akan ditolong \002"}
{"14Dan orang-orang Yahudi berkata: Orang-orang Nasrani itu tidak punya suatu pegangan, dan orang-orang Nasrani berkata: Orang-orang Yahudi tidak mempunyai sesuatu pegangan, padahal mereka (sama-sama) membaca Al-Kitab. Demikian pula orang-orang yang tidak mengetahui, mengucapkan seperti ucapan mereka itu. Maka Allah akan mengadili diantara mereka pada hari kiamat, tentang apa-apa yang mereka erselisih padanya \002"}
{"14Dan bagi tiap-tiap ummat ada kiblatnya (sendiri) yang ia menghadap kepadanya. Maka berlomba-lombalah kamu (dalam membuat) kebaikan. Di mana saja kamu berada pasti Allah akan mengumpulkan kamu sekalian (pada hari kiamat). Seungguhnya Allah Maha Kuasa atas segala sesuatu \002"}
{"14Dan di antara manusia ada orang-orang yang menyembah tandingan-tandingan selain Allah; mereka mencintainya sebagaimana mereka mencintai Allah. Adapan orang-orang yang beriman amat sangat cintanya kepada Allah. Dan jika seandainya orang-orang yang berbuat zalim itu mengetahui ketika mereka melihat siksa (pada Hari Kiamat), bahwa kekuatan itu kepunyaan Allah semuanya, dan bahwa Allah amat berat siksa-Nya (niscaya mereka menyesal) \002"}
{"14Sesungguhnya orang-orang yang menyembunyikan apa-apa yang telah diturunkan Allah, yaitu Al-Kitab dan menjualnya dengan harga yang sedikit (murah), mereka itu sebenarnya tidak memakan (tidak menelan) ke dalam perutnya melainkan api, dan Allah tidak akan berbicara kepada mereka pada Hari Kiamat dan tidak mensucikan mereka dan bagi mereka siksa yang amat pedih \002"}
{"14Tiada yang mereka nanti-nantikan (pada hari Kiamat) melainkan datangnya (siksa) Allah dalam naungan awan dan malaikat, dan diputuskanlah perkaranya. Dan hanya kepada Allah dikembalikan segala urusan \002"}
{"14Kehidupan dunia dijadikan indah dalam pandangan orang-orang kafir, dan mereka memandang hina orang-orang yang beriman. Padahal orang-orang yang bertaqwa itu lebih mulia dari pada mereka di hari Kiamat. Dan Allah memberi rezki kepada orang-orang yang dikehendaki-Nya tanpa batas \002"}
{"14Berilah peringatan\! Dan Rabb-Mu agungkanlah, dan pakaianmu bersihkanlah, dan perbuatan dosa tinggalkanlah, dan janganlah kamu memberi (dengan maksud) memperoleh (belasan) yang lebih banyak. Dan untuk (memenuhi perintah) Rabb-Mu, bersabarlah\! (Al-Muddatstsir:1-7)\002"}
}

if {![string match "*islam_speaks*" [timers]]} {
 timer $islam_time islam_speaks
}
proc islam_speaks {} {
 global islam_msg islam_chans islam_time
 if {$islam_chans == "*"} {
  set islam_temp [channels]
 } else {
  set islam_temp $islam_chans
 }
 foreach chan $islam_temp {
  set islam_rmsg [lindex $islam_msg [rand [llength $islam_msg]]]
  foreach msgline $islam_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*islam_speaks*" [timers]]} {
  timer $islam_time islam_speaks
 }
}
putlog "-=-=   busuk. islam.tcl   =-=-=-=-=-"
bind pub -|- `islam randislam

proc randislam {nick uhost hand chan text} {
 global islam_msg notc
  set islam_rmsg [lindex $islam_msg [rand [llength $islam_msg]]]
  foreach msgline $islam_rmsg {
   puthelp "PRIVMSG $chan :$notc $nick, 14[subst $msgline]"
  }
}

