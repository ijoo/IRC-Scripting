##############################################################################
##                                                                          ##
## TCL NAME     : ALKITAB TCL                                              ##
## VERSION      : 1.0                                                       ##
## DESCRIPTION  : Menampilkan ayat Alkitab (TB) dari database lokal        ##
##                                                                          ##
## PENGGUNAAN   :                                                           ##
##   !kitab Kej 1:1          - satu ayat                                    ##
##   !kitab Yoh 3:16         - satu ayat (contoh terkenal)                  ##
##   !kitab Yoh 3:16-18      - rentang ayat                                 ##
##   !kitab Mzm 23           - satu pasal                                   ##
##   !kitab                  - bantuan                                      ##
##                                                                          ##
##############################################################################

if {![info exists alkitab_cmds]} {set alkitab_cmds {"!kitab" ".kitab"}}
if {![info exists alkitab_file]} {set alkitab_file "scripts/alkitab.data"}
if {![info exists alkitab_label]} {set alkitab_label "TB"}
if {![info exists alkitab_flags]} {set alkitab_flags ""}
if {![info exists alkitab_max_lines]} {set alkitab_max_lines 6}
if {![info exists alkitab_line_len]} {set alkitab_line_len 400}

##############################################################################
## Daftar kitab: full name by book_id (dari tabel books alkitab.db)       ##
##############################################################################
foreach _it {
	{1  Kejadian}          {2  Keluaran}          {3  Imamat}
	{4  Bilangan}          {5  Ulangan}           {6  Yosua}
	{7  Hakim-Hakim}       {8  Rut}               {9  {1 Samuel}}
	{10 {2 Samuel}}        {11 {1 Raja-Raja}}     {12 {2 Raja-Raja}}
	{13 {1 Tawarikh}}      {14 {2 Tawarikh}}      {15 Ezra}
	{16 Nehemia}           {17 Ester}             {18 Ayub}
	{19 Mazmur}            {20 Amsal}             {21 Pengkhotbah}
	{22 {Kidung Agung}}    {23 Yesaya}            {24 Yeremia}
	{25 Ratapan}           {26 Yehezkiel}         {27 Daniel}
	{28 Hosea}             {29 Yoel}              {30 Amos}
	{31 Obaja}             {32 Yunus}             {33 Mikha}
	{34 Nahum}             {35 Habakuk}           {36 Zefanya}
	{37 Hagai}             {38 Zakharia}          {39 Maleakhi}
	{40 Matius}            {41 Markus}            {42 Lukas}
	{43 Yohanes}           {44 {Kisah Para Rasul}} {45 Roma}
	{46 {1 Korintus}}      {47 {2 Korintus}}      {48 Galatia}
	{49 Efesus}            {50 Filipi}            {51 Kolose}
	{52 {1 Tesalonika}}    {53 {2 Tesalonika}}    {54 {1 Timotius}}
	{55 {2 Timotius}}      {56 Titus}             {57 Filemon}
	{58 Ibrani}            {59 Yakobus}           {60 {1 Petrus}}
	{61 {2 Petrus}}        {62 {1 Yohanes}}       {63 {2 Yohanes}}
	{64 {3 Yohanes}}       {65 Yudas}             {66 Wahyu}
} {
	set alkitab:full([lindex $_it 0]) [lindex $_it 1]
}

##############################################################################
## Padanan nama kitab (sudah dinormalisasi: huruf kecil, tanpa spasi/dash) ##
##############################################################################
proc alkitab:mkaliases {} {
	global alkitab:alias alkitab:full

	catch {unset alkitab:alias}
	array set alkitab:alias {
		kej 1	kel 2	ima 3	bil 4	ul 5		yos 6
		hak 7	hakim 7	rut 8	1sam 9	2sam 10
		1raj 11	2raj 12	1taw 13	2taw 14	ezr 15
		neh 16	est 17	ayb 18	mzm 19	mz 19		ams 20
		pkh 21	pengkhotbah 21	kid 22	yes 23	yer 24
		rat 25	yeh 26	dan 27	hos 28	yl 29
		am 30	ob 31	yun 32	mi 33	nah 34
		hab 35	zef 36	hag 37	zak 38	mal 39
		mat 40	mrk 41	luk 42	yoh 43	kis 44
		rm 45	1kor 46	2kor 47	gal 48	efs 49
		flp 50	kol 51	1tes 52	2tes 53	1tim 54
		2tim 55	tit 56	flm 57	ibr 58	yak 59
		1ptr 60	2ptr 61	1yoh 62	2yoh 63	3yoh 64
		yud 65	why 66
	}
	foreach id [array names alkitab:full] {
		set alkitab:alias([alkitab:norm [set alkitab:full($id)]]) $id
	}
}

proc alkitab:norm {s} {
	set s [string tolower $s]
	set s [string map {" " "" "-" "" "." ""} $s]
	return $s
}

proc alkitab:resolve {name} {
	global alkitab:alias
	set n [alkitab:norm $name]
	if {[info exists alkitab:alias($n)]} {
		return [set alkitab:alias($n)]
	}
	return 0
}

##############################################################################
## Muat data ayat ke dalam array                                           ##
##############################################################################
proc alkitab:load {fname} {
	global alkitab:verses alkitab:loaded

	set alkitab:loaded 0
	catch {unset alkitab:verses}
	if {![file exists $fname]} {
		putlog "!alkitab! GAGAL: file data tidak ditemukan: $fname"
		return 0
	}
	set f [open $fname r]
	set n 0
	while {[gets $f line] != -1} {
		set line [string trim $line]
		if {$line == ""} continue
		set sep [string first "|" $line]
		if {$sep <= 0} continue
		set key [string range $line 0 [expr {$sep - 1}]]
		set txt [string range $line [expr {$sep + 1}] end]
		set alkitab:verses($key) $txt
		incr n
	}
	close $f
	alkitab:mkaliases
	set alkitab:loaded 1
	putlog "!alkitab! Muat $n ayat dari $fname"
	return 1
}

##############################################################################
## Utilitas                                                               ##
##############################################################################
proc alkitab:send {target text} {
	catch {puthelp "PRIVMSG $target :$text"}
	return 0
}

proc alkitab:chunk {text limit} {
	set lines {}
	set cur ""
	foreach w [split $text " "] {
		if {$cur == ""} {
			set cur $w
		} elseif {([string length $cur] + 1 + [string length $w]) <= $limit} {
			append cur " " $w
		} else {
			lappend lines $cur
			set cur $w
		}
	}
	if {$cur != ""} {
		lappend lines $cur
	}
	return $lines
}

##############################################################################
## Parse input: mode + komponen ref                                        ##
##############################################################################
proc alkitab:parse {rest} {
	if {[regexp -- {^(.*?)[ \t]+([0-9]+):([0-9]+)-([0-9]+)$} $rest -> mbook mch mfrom mto]} {
		return [list range $mbook $mch $mfrom $mto]
	}
	if {[regexp -- {^(.*?)[ \t]+([0-9]+):([0-9]+)$} $rest -> bk ch vs]} {
		return [list verse $bk $ch $vs 0]
	}
	if {[regexp -- {^(.*?)[ \t]+([0-9]+)$} $rest -> bk2 ch2]} {
		return [list chapter $bk2 $ch2 0 0]
	}
	return {}
}

##############################################################################
## Kirim satu ayat (dengan pemotongan baris aman)                          ##
##############################################################################
proc alkitab:emit {target bid fullname ch vstart vend} {
	global alkitab:verses alkitab_label alkitab_line_len alkitab_max_lines

	set any 0
	set count 0

	if {$vend == 0} {
		set vs $vstart
		while {1} {
			set key "$bid.$ch:$vs"
			if {![info exists alkitab:verses($key)]} break
			set any 1
			set pre "$fullname $ch:$vs ($alkitab_label): "
			set lim [expr {$alkitab_line_len - [string length $pre]}]
			if {$lim < 40} {set lim 40}
			foreach ln [alkitab:chunk [set alkitab:verses($key)] $lim] {
				if {$count >= $alkitab_max_lines} {
					alkitab:send $target "... (terpotong, gunakan rentang yang lebih pendek)"
					return 0
				}
				alkitab:send $target "$pre$ln"
				incr count
			}
			incr vs
		}
	} else {
		if {$vend < $vstart} {
			alkitab:send $target "$fullname $ch:$vstart-$vend tidak valid."
			return 0
		}
		for {set vs $vstart} {$vs <= $vend} {incr vs} {
			set key "$bid.$ch:$vs"
			if {![info exists alkitab:verses($key)]} break
			set any 1
			set pre "$fullname $ch:$vs ($alkitab_label): "
			set lim [expr {$alkitab_line_len - [string length $pre]}]
			if {$lim < 40} {set lim 40}
			foreach ln [alkitab:chunk [set alkitab:verses($key)] $lim] {
				if {$count >= $alkitab_max_lines} {
					alkitab:send $target "... (terpotong, gunakan rentang yang lebih pendek)"
					return 0
				}
				alkitab:send $target "$pre$ln"
				incr count
			}
		}
	}

	if {!$any} {
		alkitab:send $target "$fullname $ch:$vstart tidak ditemukan."
	}
	return 0
}

##############################################################################
## Handler utama                                                         ##
##############################################################################
proc alkitab:main {nick target rest} {
	global alkitab:verses alkitab:full alkitab:loaded alkitab_cmds

	set rest [string trim $rest]
	if {!${alkitab:loaded}} {
		alkitab:send $target "Database Alkitab belum dimuat. Periksa $::alkitab_file."
		return 0
	}
	if {$rest == "" || [string tolower $rest] == "help" || $rest == "?"} {
		alkitab:help $target
		return 0
	}

	set p [alkitab:parse $rest]
	if {[llength $p] == 0} {
		alkitab:send $target "Format tidak dikenal: \"$rest\". Contoh: [lindex $alkitab_cmds 0] Yoh 3:16"
		return 0
	}
	lassign $p mode bk ch v1 v2

	set bid [alkitab:resolve $bk]
	if {$bid == 0} {
		alkitab:send $target "Kitab \"$bk\" tidak dikenal. Contoh: [lindex $alkitab_cmds 0] Kej 1:1"
		return 0
	}
	set fullname [set alkitab:full($bid)]

	switch -- $mode {
		verse   {alkitab:emit $target $bid $fullname $ch $v1 $v1}
		range   {alkitab:emit $target $bid $fullname $ch $v1 $v2}
		chapter {alkitab:emit $target $bid $fullname $ch 1 0}
		default {alkitab:help $target}
	}
	return 0
}

proc alkitab:help {target} {
	global alkitab_cmds
	alkitab:send $target "Penggunaan: [lindex $alkitab_cmds 0] <kitab> <pasal:ayat>"
	alkitab:send $target "Contoh: [lindex $alkitab_cmds 0] Yoh 3:16 | rentang: [lindex $alkitab_cmds 0] Kej 1:1-5 | pasal: [lindex $alkitab_cmds 0] Mzm 23"
	return 0
}

proc alkitab:pub {nick uhost hand chan rest} {
	global alkitab_flags
	if {$alkitab_flags != ""} {
		if {![matchattr $hand $alkitab_flags $chan]} {return 0}
	}
	alkitab:main $nick $chan $rest
	return 0
}

proc alkitab:msg {nick uhost hand rest} {
	global alkitab_flags
	if {$alkitab_flags != ""} {
		if {![matchattr $hand $alkitab_flags "*"]} {return 0}
	}
	alkitab:main $nick $nick $rest
	return 0
}

foreach akcmd $alkitab_cmds {
	bind pub - $akcmd alkitab:pub
	bind msg - $akcmd alkitab:msg
	putlog "!alkitab! Bind command: $akcmd"
}

alkitab:load $alkitab_file

putlog "#######################################"
putlog "##      Alkitab.Tcl is Loaded!!      ##"
putlog "#######################################"
