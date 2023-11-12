#cgi.tcl 4.5
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#
#brought to you by strobe, anarkhos@anarchism.org
#special thanx to Tris for help on http, CGI, and eggdrop control
#cgi.tcl allows one to query any CGI script via http--three examples are included
#cgi.faq Frequently Answered Questions
#cgi_tutorial.tcl is a very simple example how to use cgi.tcl
#cgi_stock.tcl Stock and fund quotes and graphs.
#cgi_currency.tcl Currency Converter
#cgi_translate.tcl Converts a phrase to a different language
#cgi_bible.tcl Bible search
#cgi_quotes.tcl Searches for quotes by famous people
#cgi_siskel.tcl Gives Siskel and Ebert reviews
#cgi_debug.tcl Handy debug command
#cgi_define.tcl is a very complex example which queries the CGI recursively
#cgi_chat.tcl Allows anybody to access these commands in a separate telnet session
#Do not distribute without the examples

#cgi.tcl 1.0  first version, did dictionary, thesaurus, wildcard, and stock reports
#cgi.tcl 1.1  Time to fix the first version! Works with any eggdrop
#cgi.tcl 1.2  Time to fix that misspell bug
#cgi.tcl 1.3  <FORMS BABY! formtocgi will take a form in html and create a CGI query 
#cgi.tcl 1.4  STUPID mistake fixed, damn I need a brain
#cgi.tcl 1.5  Add more features, get more bugs
#cgi.tcl 1.6  Fixed every bug I could find! formtocgi works MUCH better now, supporting every kind of form I could find except secure. 
#cgi.tcl 1.7  Removed a couple putlogs (whoops).
#cgi.tcl 1.8  Fixed a MAJOR bug. Difference in files, the two characters " " and "1". Didn't have a bot in a long period, explaining the delay
#cgi.tcl 1.9  Fixed public query bug
#cgi.tcl 1.10 Wrote F.A.Q.
#cgi.tcl 1.11 Revamping cgi_stock.tcl

#cgi.tcl 2.0  stocks are a hell of a lot cooler now
#cgi.tcl 2.1  added different chart options including today's chart
#cgi.tcl 2.2  limited list legnth to a dozen. Added cgi_wrapup.tcl
#cgi.tcl 2.3  Added detailed information for cgi_stock.tcl. Added <td*> in strtoirc
#cgi.tcl 2.4  Fixed lynx path detection
#cgi.tcl 2.5  Fixed bug in formtocgi handling many form selections
#cgi.tcl 2.6  Generalized list display, aking cgi.tcl larger and cgi_define.tcl smaller. Also fixed cgi_reply
#cgi.tcl 2.7  Fixed formtocgi a lot. Now radio works and some other fixes
#cgi.tcl 2.8  Added listfromvars, useful for debugging
#cgi.tcl 2.9  Fixed formtocgi again, handles mixed select lists
#cgi.tcl 2.10 Fixed formtocgi yet again. Improved regsubs
#cgi.tcl 2.11 Added currency converter
#cgi.tcl 2.12 Fixed stupid bugs in cgi_currency.tcl
#cgi.tcl 2.13 Fixed lynx and wget detection
#cgi.tcl 2.14 Fixed currency error reply
#cgi.tcl 2.15 Fixed cgi_stock.tcl lynx and wget detection + misc errors
#cgi.tcl 2.16 Fixed formtocgi, cleaned up code, began work on cgi_translate.tcl

#cgi.tcl 3.0  Finished cgi_translate.tcl
#cgi.tcl 3.1  Fixed cgi_translate.tcl and strtoirc
#cgi.tcl 3.2  Fixed formtocgi (again). Added cgi_quotes.tcl (very similar to translate)
#cgi.tcl 3.3  Fixed formtocgi (again!). Added cgi_russian.tcl
#cgi.tcl 3.4  Fixed formtocgi a *LOT*. Added cgi_debug.tcl. Fixed radio bug in listfromvars
#cgi.tcl 3.5  Fixed cgi_define.tcl (hung 2)
#cgi.tcl 3.6  Fixed cgi_debug.tcl and strtoirc
#cgi.tcl 3.7  Added cgi_siskel.tcl. Improved strtoirc
#cgi.tcl 3.8  Got rid of all but one eval! Improved cgi_receive a little.
#cgi.tcl 3.9  strtoirc now handles alt=. edited cgi_siskel.tcl accordingly
#cgi.tcl 3.10 Added cgi_chat.tcl. Now you can use a seperate telnet connection for cgi.tcl functions
#cgi.tcl 3.11 Added infofromurl. *_dcc error reply is now putdcc. Updated cgi_debug.tcl

#cgi.tcl 4.0  Improved strtoirc a *lot*. Also improved cgi_receive, and cgi_debug.tcl
#cgi.tcl 4.1  Added color support in strtoirc and cgi_reply
#cgi.tcl 4.2  Fixed and improved strtocgi a lot. Basically 4.1 should NOT have been released |-p
#cgi.tcl 4.3  oops, cgi_debug.tcl shoudln't have strtoirc any longer
#cgi.tcl 4.4  Added cgi_bible.tcl for you 'bible people'. Fixed strtoirc so tabs weren't superfluous
#cgi.tcl 4.5  Fixed strtoirc. Added form submission in cgi_debug.tcl. Added port to infofromurl. Moved chatcmds declarations. Fixed aload of crap

#TODO in no particular order (tell me if you know how to do any of these):
#Fix <area... bug
#support ascii graphs in cgi_stock.tcl

##"cgi" globals##
set cgi_globals() ""

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"cgi" functions
#what these procs do:
#cgi_send: nick retr server port receive method location query globals arglist
#This function initiates the http session and the global variables
#
#cgi_receive: idx input
#This function sends the unformatted http reply to whoever sent the query.
#Typically one would use their own function instead of this function. This 
#is here for debugging reasons.
#
#cgi_reply: nick retr reply
#This function takes styled text and makes sure it will be sent to the
#specified user or channel using the specified method. It is tuned for
#EFnet.
#
#strtoirc: str
#This proc parses very simple html for IRC. Usually you would use this
#function after cropping and removing gremlins from your html.
#
#strtocgi: str
#This proc converts characters so the CGI can use them
#
#formtocgi: str selectlist textlist
#This function takes an html <FORM> and creates a CGI query much like a
#browser would.
#
#listfromvars: str
#This function takes an html <FORM> and returns all the options available
#in a format understandable when using formtocgi. VERY useful for debugging
#
#selecttolist: str
#Takes the text from a <select..../select> list and orders it. Used for
#displaying lists like browsers do. Does NOT display the cgi variable.
#
#infofromurl
#Takes a URL or path and returns the server, port, and path. Server will be blank if
#input was a path.

proc cgi_send { nick retr server port receive method location query globals arglist } {
#nick: nick or handle to send info to
#retr: method by which to send info
#server: server to send http request to 
#port: http port the server is listening on viz. 80
#receive: name of function to recieve data viz. cgi_receive
#method: GET or POST
#location: there the CGI is viz. /cgi-bin/testcgi
#query: cgi variable definitions
#globals: list of global arrays to be used after http server reply
#arglist: list of arguments for global arrays 4-on
#the nick variable will be stored in the first global array
#the retr variable will be stored in the second global array
#the third global array is reserved for the body of text
#the forth and later arrays will be set to args or "NONE"
#I placed the first and second args seperate from the rest because they are required
#the globals variable will be stored in cgi_globals

#local vars
set index 0
eval set legnth \[llength \$globals\]
#globals
global cgi_globals
global "$globals"
#The next line used to be necessary. If you get errors (and you know what you're doing) try it (tcl is flaky)
#eval set globals $$globals
foreach gvar $globals {
	global "$gvar"
}
#connect
	set idx [connect $server $port]
	while { $index < $legnth } {
		if { ($index < 3) || ([lindex $arglist [expr $index -3]] == "") } {
			array set [lindex $globals $index] "$idx NONE"
		} else {
			array set [lindex $globals $index] "$idx {[lindex $arglist [expr $index -3]]}"
		}
		set index [expr $index +1]
	}
	array set [lindex $globals 0] "$idx $nick"
	array set [lindex $globals 1] "$idx $retr"
	set cgi_globals($idx) $globals
	
	control $idx $receive
	if {[string tolower $method] == "get"} {
		if { $query == "" } {
			putdcc $idx "GET $location HTTP/1.0\n\n"
		} else {
			putdcc $idx "GET $location?$query HTTP/1.0\n\n"
		}
	} elseif {[string tolower $method] == "post"} {
	#POST is a little more finicky
		set length [string length $query]
		putdcc $idx "POST $location HTTP/1.0\nContent-type: application/x-www-form-urlencoded\nContent-length: $length\n\n$query\n"
	} else {
		putlog "\002ERROR, BAD METHOD: $method, not GET or POST (proc cgi_send)"
	}
}

#simple receive
proc cgi_receive { idx input } {
#globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		cgi_reply [lindex [array get [lindex $globals 0] $idx] 1] [lindex [array get [lindex $globals 1] $idx] 1] "Finished downloading"
		foreach line [strtoirc [lindex [array get [lindex $globals 2] $idx] 1]] {
				regsub -all "\001" $line "{" line
				regsub -all "\004" $line "}" line
			cgi_reply [lindex [array get [lindex $globals 0] $idx] 1] [lindex [array get [lindex $globals 1] $idx] 1] $line
		}
	} else {
		regsub -all "{" $input "\001" input
		regsub -all "}" $input "\004" input
		if { [lindex [array get [lindex $globals 2] $idx] 1] == "NONE" } {
			if { [string match "*http*" [string tolower $input]] } {
				if { ![string match "*200*" $input] } {
					array set [lindex $globals 2] "{$idx} {\002$input\002\n}"
				}
			} elseif {  ([string match "content-location:*" [string tolower $input]]) || ([string match "accept-ranges:*" [string tolower $input]]) || ([string match "last-modified:*" [string tolower $input]]) || ([string match "etag:*" [string tolower $input]]) || ([string match "content-length:*" [string tolower $input]]) || ([string match "connection:*" [string tolower $input]]) || ([string match "date:*" [string tolower $input]]) || ([string match "server:*" [string tolower $input]]) || ([string match "content-type:*" [string tolower $input]]) } {
			} else {
				array set [lindex $globals 2] "{$idx} {$input}"
			}
		} else {
			array set [lindex $globals 2] "{$idx} {[lindex [array get [lindex $globals 2] $idx] 1]$input}"
		}
	}
}

proc cgi_reply { nick retr reply } {
#This currently does try keep track of text style, in a less dumbass manner than previous versions

#I checked one client for maximum legnth for DCC CHAT, got 247
#this was obviously a bug in the client, but it's not very important
set prebold ""
set preinvert ""
set preunder ""
set head ""
set index 0
set char ""
	if { $retr == "DCC" } {
		if { [string length $reply] > 247 } {
			set head [string range $reply 0 246]
			putdcc $nick $head
			set char [string index $head $index]
			while { $char != "" } {
				switch -- $char {
					"\002"	{ append prebold "\002" }
					"\026"	{ append preinvert "\026" }
					"\037"	{ append preunder "\037" }
				}
			set index [expr $index +1]
			set char [string index $head $index]
			}
			regsub -all "\002\002" $prebold "" prebold
			regsub -all "\026\026" $preinvert "" preinvert
			regsub -all "\037\037" $preunder "" preunder
			cgi_reply $nick $retr "$prebold$preinvert$preunder[string range $reply 247 end]"
		} else {
			putdcc $nick $reply
		}
	} elseif { $retr == "MSG" } {
	#funnily enough, my EFnet server split up a large PRIVMSG into two smaller ones.
	#I won't trust all servers to do this.
		if { [string length $reply] > 250 } {
			set head [string range $reply 0 249]
			putserv "PRIVMSG $nick :$head"
			set char [string index $head $index]
			while { $char != "" } {
				switch -- $char {
					"\002"	{ append prebold "\002" }
					"\026"	{ append preinvert "\026" }
					"\037"	{ append preunder "\037" }
				}
			set index [expr $index +1]
			set char [string index $head $index]
			}
			regsub -all "\002\002" $prebold "" prebold
			regsub -all "\026\026" $preinvert "" preinvert
			regsub -all "\037\037" $preunder "" preunder
			cgi_reply $nick $retr "$prebold$preinvert$preunder[string range $reply 250 end]"
		} else {
			putserv "PRIVMSG $nick :$reply"
		}
	} elseif { $retr == "NOTICE" } {
		if { [string length $reply] > 250 } {
			set head [string range $reply 0 249]
			putserv "NOTICE $nick :$head"
			set char [string index $head $index]
			while { $char != "" } {
				switch -- $char {
					"\002"	{ append prebold "\002" }
					"\026"	{ append preinvert "\026" }
					"\037"	{ append preunder "\037" }
				}
			set index [expr $index +1]
			set char [string index $head $index]
			}
			regsub -all "\002\002" $prebold "" prebold
			regsub -all "\026\026" $preinvert "" preinvert
			regsub -all "\037\037" $preunder "" preunder
			cgi_reply $nick $retr "$prebold$preinvert$preunder[string range $reply 250 end]"
		} else {
			putserv "NOTICE $nick :$reply"
		}
	} else {
		putlog "\002ERROR, BAD RETR (proc cgi_reply)"
		putlog $retr
	}
}

proc strtoirc { str } {
#This converts *simple* HTML into IRC
#currently very crude
#any "\r" or equivalent like "<br>" will result in a tcl list. Example:
#foreach line [strtoirc $my_cropped_html_string] {
#	cgi_reply $my_nick($idx) $my_retr($idx) $line
#}

#tables will sometimes look better if you use this prior to strtoirc:
#regsub -all -nocase "</td>" $body "<br>" body
#or:
#regsub -all -nocase "</tr>" $body "<br>" body

#comments
	while { [string match "*<!--*-->*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<!--" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<!--" [string tolower $str]] end]
		set cut [string range $latter 0 [expr [string first "-->" [string tolower $latter]] +2]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
#BOLD: 002
#INVERT: 026
#UNDERLINE: 037
regsub -all -nocase "<b>" $str "\002" str
regsub -all -nocase "</b>" $str "\002" str
regsub -all -nocase "<th>" $str "\002" str
regsub -all -nocase "</th>" $str "\002" str
regsub -all -nocase "<i>" $str "\037" str
regsub -all -nocase "</i>" $str "\037" str
#fonts
#rough values 
#0  is white               FFFFFF
#1  is black               000000
#2  is dark blue           000080
#3  is green               0033CC
#4  is red                 FF0033
#5  is brown               996633
#6  is violet              660099
#7  is orange              FF9900
#8  is yellow              FFFF33
#9  is bright green        00FF33
#10 is dark cyan           0099CC
#11 is cyan                99FFFF
#12 is blue                0033CC
#13 is bright violet       FF0099
#14 is dark grey           666666
#15 is light grey          999999
array set termcolors "FFFFFF {\0030 } "
array set termcolors "000000 {\0031 } "
array set termcolors "000080 {\0032 } "
array set termcolors "0033CC {\0033 } "
array set termcolors "FF0033 {\0034 } "
array set termcolors "996633 {\0035 } "
array set termcolors "660099 {\0036 } "
array set termcolors "FF9900 {\0037 } "
array set termcolors "FFFF33 {\0038 } "
array set termcolors "00FF33 {\0039 } "
array set termcolors "0099CC {\00310} "
array set termcolors "99FFFF {\00311} "
array set termcolors "0033CC {\00312} "
array set termcolors "FF0099 {\00313} "
array set termcolors "666666 {\00314} "
array set termcolors "999999 {\00315} "
regsub -all -nocase "<h1>" $str "***" str
regsub -all -nocase "</h1>" $str "***" str
regsub -all -nocase "<h2>" $str "**" str
regsub -all -nocase "</h2>" $str "**" str
regsub -all -nocase "<h3>" $str "*" str
regsub -all -nocase "</h3>" $str "*" str
regsub -all -nocase "<big>" $str "*" str
regsub -all -nocase "</big>" $str "*" str
regsub -all -nocase "<h4>" $str "\037" str
regsub -all -nocase "</h4>" $str "\037" str
regsub -all -nocase "<h5>" $str "\037" str
regsub -all -nocase "</h5>" $str "\037" str
regsub -all -nocase "<h6>" $str "\037" str
regsub -all -nocase "</h6>" $str "\037" str
regsub -all -nocase "<small>" $str "\037" str
regsub -all -nocase "</small>" $str "\037" str
regsub -all -nocase "<strong>" $str "\002" str
regsub -all -nocase "</strong>" $str "\002" str
	while { [string match "*<font*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<font" [string tolower $str]] -1 ]]
		set tag [string range $str [string first "<font" [string tolower $str]] end]
		set tag [string range $tag 0 [string first ">" [string tolower $tag]]]
		if { [string match "*color=*" [string tolower $tag]] } {
			set color [string range $tag [expr [string first "color=" [string tolower $tag]] + 6] end]
			if { [string index $color 0] == "\"" } {
				set color [string range $color 1 end]
				set color [string range $color 0 [expr [string first "\"" $color] -1 ]]
			} else {
				regsub ">" $color " " color
				set color [string range $color 0 [expr [string first " " $color] -1 ]]
			}
			if { ![string match "#*" $color] } {
				if { [string match "white" [string tolower $color]] } {
					set color "#FFFFFF"
				} elseif { [string match "black" [string tolower $color]] } {
					set color "#000000"
				} elseif { [string match "navy" [string tolower $color]] } {
					set color "#000080"
				} elseif { [string match "green" [string tolower $color]] } {
					set color "#008000"
				} elseif { [string match "red" [string tolower $color]] } {
					set color "#FF0000"
				} elseif { [string match "maroon" [string tolower $color]] } {
					set color "#800000"
				} elseif { [string match "fuschia" [string tolower $color]] } {
					set color "#FFCC99"
				} elseif { [string match "purple" [string tolower $color]] } {
					set color "#800080"
				} elseif { [string match "olive" [string tolower $color]] } {
					set color "#6B8E23"
				} elseif { [string match "yellow" [string tolower $color]] } {
					set color "#FFCC99"
				} elseif { [string match "lime" [string tolower $color]] } {
					set color "#00FF00"
				} elseif { [string match "teal" [string tolower $color]] } {
					set color "#008080"
				} elseif { [string match "aqua" [string tolower $color]] } {
					set color "#00FFFF"
				} elseif { [string match "blue" [string tolower $color]] } {
					set color "#0000FF"
				} elseif { [string match "gray" [string tolower $color]] } {
					set color "#808080"
				} elseif { [string match "silver" [string tolower $color]] } {
					set color "#C0C0C0"
				}
			}
			if { [string match "#*" $color] } {
				set color [string range $color 1 end]
				set value "999999"
				set id [array startsearch termcolors]
				set c [array nextelement termcolors $id]
				while { $c != "" } {
set temp [expr abs( "0x[string range $c 0 1]" - "0x[string range $color 0 1]" ) + abs( "0x[string range $c 2 3]" - "0x[string range $color 2 3]" ) + abs( "0x[string range $c 4 5]" - "0x[string range $color 4 5]" )]
					if { $temp < $value } {
						set value $temp
						set ctemp $termcolors($c)
					}
				set c [array nextelement termcolors $id]
				}
				array donesearch termcolors $id
				set color $ctemp
			} else {
				set color ""
			}
		} else {
			set color ""
		}
		set latter [string range $str [string first "<font" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		regsub -nocase "</font>" $end $color end
		set str "$beg$color$end"
	}
regsub -all -nocase "</font>" $str "" str
#headers
	while { [string match "*<!doctype*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<doctype" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<doctype" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
	while { [string match "*<meta*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<meta" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<meta" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
	while { [string match "*<base*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<base" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<base" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
	while { [string match "*<link*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<link" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<link" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "<title>" $str "\n\002TITLE: \002" str
regsub -all -nocase "</title>" $str "\n" str
	while { [string match "*<body*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<body" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<body" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "</body>" $str "" str
regsub -all -nocase "<head>" $str "" str
regsub -all -nocase "</head>" $str "" str
regsub -all -nocase "<html>" $str "" str
regsub -all -nocase "</html>" $str "" str
	while { [string match "*<script*/script>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<script" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<script" [string tolower $str]] end]
		set cut [string range $latter 0 [expr [string first "/script>" [string tolower $latter]] +7]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\002< SCRIPT.../SCRIPT>\002$end"
	}
#maps, printing alt=
	while { [string match "*<map*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<map" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<map" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\002< MAP...>\002$end"
	}
regsub -all -nocase "</map>" $str "\002< /MAP>\002" str
	while { [string match "*<area*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<area" [string tolower $str]] -1 ]]
		set tag [string range $str [string first "<area" [string tolower $str]] end]
		set tag [string range $tag 0 [string first ">" [string tolower $tag]]]
		if { [string match "*alt=*" [string tolower $tag]] } {
			set middle [string range $tag [expr [string first "alt=" [string tolower $tag]] + 4] end]
			if { [string index $middle 0] == "\"" } {
				set middle [string range $middle 1 end]
				set middle [string range $middle 0 [expr [string first "\"" $middle] -1 ]]
			} else {
				regsub ">" $middle " " middle
				set middle [string range $middle 0 [expr [string first " " $middle] -1 ]]
			}
		} else {
			set middle ""
		}
		set latter [string range $str [string first "<img" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$middle$end"
	}
#links
	while { [string match "*<a*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<a" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<a" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "</a>" $str "" str
#images, printing alt=
	while { [string match "*<img*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<img" [string tolower $str]] -1 ]]
		set tag [string range $str [string first "<img" [string tolower $str]] end]
		set tag [string range $tag 0 [string first ">" [string tolower $tag]]]
		if { [string match "*alt=*" [string tolower $tag]] } {
			set middle [string range $tag [expr [string first "alt=" [string tolower $tag]] + 4] end]
			if { [string index $middle 0] == "\"" } {
				set middle [string range $middle 1 end]
				set middle [string range $middle 0 [expr [string first "\"" $middle] -1 ]]
			} else {
				regsub ">" $middle " " middle
				set middle [string range $middle 0 [expr [string first " " $middle] -1 ]]
			}
		} else {
			set middle ""
		}
		set latter [string range $str [string first "<img" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$middle$end"
	}
#tables etc
	while { [string match "*<table*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<table" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<table" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "</table>" $str "" str
regsub -all -nocase "<center>" $str "" str
regsub -all -nocase "</center>" $str "" str
	while { [string match "*<td*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<td" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<td" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "</td>" $str "" str
	while { [string match "*<tr*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<tr" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<tr" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg$end"
	}
regsub -all -nocase "</tr>" $str "" str
	while { [string match "*<hr*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<hr" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<hr" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n$end"
	}
#clean up
regsub -all -nocase "<tt>" $str "" str
regsub -all -nocase "</tt>" $str "" str
regsub -all -nocase "<sub>" $str "" str
regsub -all -nocase "</sub>" $str "" str
regsub -all -nocase "<sup>" $str "" str
regsub -all -nocase "</sup>" $str "" str
regsub -all -nocase "<pre>" $str "" str
regsub -all -nocase "</pre>" $str "" str
regsub -all "\011" $str " " str
#Special Characters
#unfortunately there is no consistency between unix, mac, and PC for other characters. MIME IRC anyone?
regsub -all -nocase "&quot;" $str "\"" str
regsub -all -nocase "\&amp;" $str "\\&" str
regsub -all -nocase "&lt;" $str "<" str
regsub -all -nocase "&gt;" $str ">" str
regsub -all "\267" $str "-" str
#dot
regsub -all "\&\#183;" $str "-" str
#forms
	while { [string match "*<form*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<form" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<form" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\002< FORM...>\002$end"
	}
regsub -all -nocase "</form>" $str "\002< /FORM>\002" str
	while { [string match "*<select*/select>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<select" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<select" [string tolower $str]] end]
		set cut [string range $latter 0 [expr [string first "/select>" [string tolower $latter]] +7]]
		set end [string range $str [string length "$beg$cut"] end]
		set middle [selecttolist [string range $str [string first "<select" [string tolower $str]] [expr [string first "</select>" [string tolower $str]] +9]]]
		set str "$beg\002Select List:\002$middle$end"
	}
	while { [string match "*<input*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<input" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<input" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\002< INPUT...>\002$end"
	}
	while { [string match "*<textarea*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<textarea" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<textarea" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\002< TEXTAREA...>\002$end"
	}
#Next line and tabs, spaces
	while { [string match "*<br*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<br" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<br" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n$end"
	}
	while { [string match "*<p*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<p" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<p" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n\t$end"
	}
regsub -all -nocase "</p>" $str "\n" str
	while { [string match "*<ul*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<ul" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<ul" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n\t$end"
	}
regsub -all -nocase "<blockquote>" $str "\t" str
regsub -all -nocase "</blockquote>" $str "" str
regsub -all -nocase "</ul>" $str "\n" str
regsub -all -nocase "<ol>" $str "\n\t" str
regsub -all -nocase "</p>" $str "\n" str
	while { [string match "*<ol*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<ol" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<ol" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n\t$end"
	}
regsub -all -nocase "</ol>" $str "\n" str
	while { [string match "*<dir*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<dir" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<dir" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n\t$end"
	}
regsub -all -nocase "</dir>" $str "\n" str
	while { [string match "*<menu*>*" [string tolower $str]] } {
		set beg [string range $str 0 [expr [string first "<menu" [string tolower $str]] -1 ]]
		set latter [string range $str [string first "<menu" [string tolower $str]] end]
		set cut [string range $latter 0 [string first ">" [string tolower $latter]]]
		set end [string range $str [string length "$beg$cut"] end]
		set str "$beg\n\t$end"
	}
regsub -all -nocase "</menu>" $str "\n" str
regsub -all -nocase "<li>" $str "\n" str
regsub -all -nocase "</li>" $str "\n" str
regsub -all -nocase "<dl>" $str "\n" str
regsub -all -nocase "</dl>" $str "\n" str
regsub -all -nocase "<dd>" $str "\t" str
regsub -all -nocase "&nbsp;" $str " " str
#regsub -all "\t\r" $str "\r" str
#regsub -all "\t" $str "    " str
#split \n
set result ""
set prebold ""
set preinvert ""
set preunder ""
set char ""
set index 0
set char [string index $str $index]
while { $char != "" } {
	switch -- $char {
		"\002"	{ append prebold "\002" }
		"\026"	{ append preinvert "\026" }
		"\037"	{ append preunder "\037" }
		"\t"	{
			set beg [string range $str 0 [expr $index -1]]
			if { [string match "\n" [string index $str [expr $index +1]]] } {
				set end [string range $str [expr $index +2] end]
			} else {
				set end "    [string range $str [expr $index +1] end]"
			}
			set str "$beg$end"
		}
		"\n"	{
			regsub -all "\002\002" $prebold "" prebold
			regsub -all "\026\026" $preinvert "" preinvert
			regsub -all "\037\037" $preunder "" preunder
			lappend result [string range $str 0 $index]
			set str "$prebold$preinvert$preunder[string range $str [expr $index +1] end]"
			set index -1
			set prebold ""
			set preinvert ""
			set preunder ""
		}
	}
set index [expr $index +1]
set char [string index $str $index]
}
lappend result $str
#set str [split $str "\n"]
return $result
}

proc strtocgi { str } {
#This converts variables so that the CGI can read them
#currenly *very* crude
set i 0
set result ""
	while {$i <= [string length $str]} {
	set l [string index $str $i]
		if { $l == "\[" } {
			append result %5B
		} elseif { $l == "\]" } {
			append result %5D
		} elseif { $l == " " } {
			append result "\+"
		} else {
			append result $l
		}
incr i
}
#regsub -all \\+ $result " " result
regsub -all "\"" $result "%22" result
regsub -all ";" $result "%3B" result
regsub -all , $result "%2C" result
#regsub -all = $result "%3D" result
#regsub -all \[ $result "%5B" result
#regsub -all \] $result "%5D" result
return $result
}


proc formtocgi { str selectlist textlist } {
#This takes the first <form ... /form> in str and returns the variables for query in a list
#The elements in the returned list are in this order: method action(location or URL) query
#This does not clean text for CGI queries, use strtocgi after using this proc
#tcl might not like a HUGE value for str so beware
#selectlist: list of list selections for...
#(1) <select tag single (one number signifying order)
#(2) <select multiple> (list of numbers)
#(3) radio <input (one while number per variable)
#(4) checkbox <input (1 or 0)
#(5) button <input (1 or 0)
#(6) submit (or image) <input (1 or 0)
#textlist: list of text for...
#(1) <input 
#(2) <textarea entries
#both lists should be ordered as the tags are in html, and COMPLETE. I warned you, COUNT CAREFULLY AND NOTE THE ORDER IN HTML
#YES, tags are case insensitive, don't use tolower prior to this or else the form may not work!!!
#NO, I don't support <keygen yet! Are you NUTS?
set sl 0
set tl 0
set radioselect() ""
set radionow() ""
set result ""
set query ""
set input ""
set select ""
set textarea ""
set tag ""
set type ""
set value ""
set name ""
#clean up
regsub -all "\n" $str "" str
set str [string range $str [string first "<form" [string tolower $str]] end]
set str [string range $str 0 [expr [string first "</form>" [string tolower $str]] + 6]]
#<form: set method and action(location)
	set tag [string range $str 0 [string first ">" [string tolower $str]]]
	regsub ">" $tag " " tag
	if { [string match "*method=*" [string tolower $tag]] } {
		set value [string range $tag [expr [string first "method=" [string tolower $tag]] + 7] end]
		if { [string index $value 0] == "\"" } {
			lappend result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end ]]]
		} else {
			lappend result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
		}
	} else {
		lappend result "GET"
	}
	set value [string range $tag [expr [string first "action=" [string tolower $tag]] + 7] end]
	if { [string index $value 0] == "\"" } {
		lappend result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end ]]]
	} else {
		lappend result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
	}
#do inputs and selects (wish tcl had an until function)
set input [string first "<input" [string tolower $str]]
set select [string first "<select" [string tolower $str]]
set textarea [string first "<textarea" [string tolower $str]]
while { ( $input != -1 ) || ( $select != -1 ) || ( $textarea != -1 ) } {
	if { ( $input != -1 ) && (( $input < $select ) || ( $select == -1 )) && (( $input < $textarea ) || ( $textarea == -1 )) } {
	#do input
		set str [string range $str [string first "<input" [string tolower $str]] end]
		set tag [string range $str 0 [string first ">" [string tolower $str]]]
	#remove input from str
		set str [string range $str [expr [string first ">" [string tolower $str]] + 1] end]
	#check type
		regsub ">" $tag " " tag
		if { [string match "*type=*" [string tolower $tag]] } {
			set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
			set type [string trim [string tolower [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]] "\"" ]
		} else {
			set type "text"
		}
		if { $type == "hidden" } {
		#type=hidden: set name and value
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
			set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
			if { [string index $value 0] == "\"" } {
				append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
		} elseif { ($type == "button") } {
		#type=button: set name and value (check for no value)
			if { [string match "*value=*" [string tolower $tag]] && [lindex $selectlist $sl] } {
				set value [string range $tag [expr [string first "button=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
				set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
				if { [string index $value 0] == "\"" } {
					append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "text" } {
		#type=text: set set name and text
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
			append query "=[lindex $textlist $tl]"
			set tl [expr $tl + 1 ]
		} elseif { $type == "password" } {
		#type=password: set set name and text
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
			append query "=[lindex $textlist $tl]"
			set tl [expr $tl + 1 ]
		} elseif { $type == "checkbox" } {
		#set checkbox?
			if { [lindex $selectlist $sl] } {
				regsub ">" $tag " " tag
				set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
				set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
				if { [string index $value 0] == "\"" } {
					append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "radio" } {
		#set radio box, check if already set
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				set value [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				set value [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			if { [lsearch -exact [array names radioselect] $value] != -1 } {
				set radionow($value) [expr $radionow($value) + 1]
			} else {
				set radioselect($value) [lindex $selectlist $sl]
				set sl [expr $sl + 1 ]
				set radionow($value) 1
			}
			if { $radioselect($value) == $radionow($value) } {
				append query "&$value"
				set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
				if { [string index $value 0] == "\"" } {
					append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
			}
		} elseif { $type == "submit" } {
		#type=submit: if name= exists set name and type, otherwise do nothing
			if { [string match "*name=*" [string tolower $tag]] && [lindex $selectlist $sl] } {
				set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
				if { [string match "*value=*" [string tolower $tag]] } {
					set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
					if { [string index $value 0] == "\"" } {
						append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
					if { [string index $value 0] == "\"" } {
						append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				}
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "image" } {
		#type=image: like submit
			if { [string match "*name=*" [string tolower $tag]] && [lindex $selectlist $sl] } {
				set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
				if { [string match "*value=*" [string tolower $tag]] } {
					set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
					if { [string index $value 0] == "\"" } {
						append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
					if { [string index $value 0] == "\"" } {
						append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				}
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "reset" } {
		#type=reset: do nothing
		} elseif { $type == "file" } {
		#type=file: do nothing for now, anybody want to be able to DCC files to a web page?
			putlog "\002 FILE expected, not given (proc formtocgi)"
		} elseif { $type == "scribble" } {
		#type=scribble: um, no
			putlog "\002 SCRIBBLE expected, not given (proc formtocgi)"
		} else {
			putlog "\002 UNKNOWN TYPE: $type (proc formtocgi)"
		}
	} elseif { ( $select != -1 ) && (( $select < $input ) || ( $input == -1 )) && (( $select < $textarea ) || ( $textarea == -1 )) } {
	#do select, checking multiple> ignoring selected
		set str [string range $str [string first "<select" [string tolower $str]] end]
		set tag [string range $str 0 [expr [string first "</select>" [string tolower $str]] + 8]]
		regsub -all -nocase "</option>" $tag "" tag
	#remove input from str
		set str [string range $str [expr [string first "</select>" [string tolower $str]] + 9] end]
	#check multiple>
		set value [string range $tag 0 [expr [string first ">" $tag] -1]]
		if { [string match  "*multiple*" [string tolower $value]] } {
			regsub ">" $tag " " value
			set value [string range $value [expr [string first "name=" [string tolower $value]] + 5] end]
			if { [string index $value 0] == "\"" } {
				set name "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				set name "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
			set c 1
			while { [string first "<option" [string tolower $tag]] != -1 } {
				#find <option
				set tag [string range $tag [expr [string first "<option" [string tolower $tag]] +7 ] end]
				if { [lsearch -exact [lindex $selectlist $sl] $c] != -1 } {
					append query $name
					set value [string range $tag 0 [string first ">" [string tolower $tag]]]
					if { [string match "*value=*" [string tolower $value]]} {
						set value [string range $value [expr [string first "value=" [string tolower $value]] + 6] end]
						regsub ">" $value " " value
						if { [string index $value 0] == "\"" } {
							append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
						} else {
							append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
						}
					} else {
						set tag [string range $tag [expr [string first ">" [string tolower $tag]] + 1 ] end]
						append query "=[string trim [string range $tag 0 [expr [string first "<" [string tolower $tag]] - 1 ]]]"
					}
				}
			set c [expr $c + 1]
			}
		} else {
	#non-multiple: set name and value, ignore size
			regsub ">" $tag " " value
			set value [string range $value [expr [string first "name=" [string tolower $value]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
			set c 1
			while { [string first "<option" [string tolower $tag]] != -1 } {
				#find <option
				set tag [string range $tag [expr [string first "<option" [string tolower $tag]] +7 ] end]
				if { $c == [lindex $selectlist $sl] } {
				set value [string range $tag 0 [string first ">" [string tolower $tag]]]
					if { [string match "*value=*" [string tolower $value]]} {
						set value [string range $value [expr [string first "value=" [string tolower $value]] + 6] end]
						regsub ">" $value " " value
						if { [string index $value 0] == "\"" } {
							append query "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
						} else {
							append query "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
						}
					} else {
						set tag [string range $tag [expr [string first ">" [string tolower $tag]] + 1 ] end]
						append query "=[string trim [string range $tag 0 [expr [string first "<" [string tolower $tag]] - 1 ]]]"
					}
				}
			set c [expr $c + 1]
			}
		}
	set sl [expr $sl + 1 ]
	} elseif { ( $textarea != -1 ) && (( $textarea < $input ) || ( $input == -1 )) && (( $textarea < $select ) || ( $select == -1 )) } {
	#do textarea, remember to use strtocgi afterwards
		set str [string range $str [string first "<textarea" [string tolower $str]] end]
		set tag [string range $str 0 [expr [string first "</textarea>" [string tolower $str]] + 10]]
	#remove input from str
		set str [string range $str [expr [string first "</textarea>" [string tolower $str]] + 11] end]
	#set name and value
		set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
		if { [string index $value 0] == "\"" } {
			append query "&[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
		} else {
			append query "&[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
		}
		append query "=[lindex $textlist $tl]"
		set tl [expr $tl + 1 ]
	} else {
		putlog "\002 THAT'S IMPOSSIBLE! (proc formtocgi)"
	}
	set input [string first "<input" [string tolower $str]]
	set select [string first "<select" [string tolower $str]]
	set textarea [string first "<textarea" [string tolower $str]]
}
#remove "&" and reply
lappend result [string range $query 1 end]
return $result
}

proc listfromvars { str } {
#Tags are case insensitive, don't use tolower prior to this or else the form may not work!!!
#I don't support <keygen
set sl 1
set tl 1
set radioselect() ""
set radionow() ""
set result ""
set input ""
set select ""
set textarea ""
set tag ""
set type ""
set value ""
set name ""
#clean up
regsub -all "\n" $str "" str
set str [string range $str [string first "<form" [string tolower $str]] end]
set str [string range $str 0 [expr [string first "</form>" [string tolower $str]] + 6]]
#<form: set method and action(location)
	set tag [string range $str 0 [string first ">" [string tolower $str]]]
	regsub ">" $tag " " tag
	append result "\002METHOD:\002 "
	if { [string match "*method=*" [string tolower $tag]] } {
		set value [string range $tag [expr [string first "method=" [string tolower $tag]] + 7] end]
		if { [string index $value 0] == "\"" } {
			append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end ]]]
		} else {
			append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
		}
	} else {
		append result "GET"
	}
	append result "\n\002ACTION:\002 "
	set value [string range $tag [expr [string first "action=" [string tolower $tag]] + 7] end]
	if { [string index $value 0] == "\"" } {
		append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end ]]]
	} else {
		append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
	}
#do inputs and selects (wish tcl had an until function)
set input [string first "<input" [string tolower $str]]
set select [string first "<select" [string tolower $str]]
set textarea [string first "<textarea" [string tolower $str]]
while { ( $input != -1 ) || ( $select != -1 ) || ( $textarea != -1 ) } {
	if { ( $input != -1 ) && (( $input < $select ) || ( $select == -1 )) && (( $input < $textarea ) || ( $textarea == -1 )) } {
	#do input
		set str [string range $str [string first "<input" [string tolower $str]] end]
		set tag [string range $str 0 [string first ">" [string tolower $str]]]
	#remove input from str
		set str [string range $str [expr [string first ">" [string tolower $str]] + 1] end]
	#check type
		regsub ">" $tag " " tag
		if { [string match "*type=*" [string tolower $tag]] } {
			set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
			set type [string trim [string tolower [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]] "\"" ]
		} else {
			set type "text"
		}
		if { $type == "hidden" } {
		#type=hidden: set name and value
			append result "\nHidden: "
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
			if { [string index $value 0] == "\"" } {
				append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
		} elseif { ($type == "button") } {
		#type=button: set name and value (check for no value)
			if { [string match "*value=*" [string tolower $tag]] } {
				append result "\nButton \[\002$sl\002\]: "
				set value [string range $tag [expr [string first "button=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
				} else {
					append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
				}
				set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
				if { [string index $value 0] == "\"" } {
					append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
				} else {
					append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
				}
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "text" } {
		#type=text: set set name and text
			append result "\nText \[\002$tl\002\]: "
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			append result "=\002<text input>\002"
			set tl [expr $tl + 1 ]
		} elseif { $type == "password" } {
		#type=password: set set name and text
			append result "\nPassword \[\002$tl\002\]: "
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			append result "=\002<password(text) input>\002"
			set tl [expr $tl + 1 ]
		} elseif { $type == "checkbox" } {
		#set checkbox?
			append result "\nCheckbox \[\002$sl\002\]: "
			regsub ">" $tag " " tag
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
			if { [string index $value 0] == "\"" } {
				append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "radio" } {
		#set radio box, check if already set
			set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
			if { [string index $value 0] == "\"" } {
				set value [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				set value [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			if { [lsearch -exact [array names radionow] $value] != -1 } {
				set radionow($value) [expr $radionow($value) + 1]
			} else {
				if { [llength [array names radionow]] != 1 } {
					set sl [expr $sl + 1 ]
				}
				set radionow($value) 1
			}
			append result "\nRadio \[\002$sl\002\]-\[\002$radionow($value)\002\]: "
			append result $value
			set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
			if { [string index $value 0] == "\"" } {
				append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
			} else {
				append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
			}
		} elseif { $type == "submit" } {
		#type=submit: if name= exists set name and type, otherwise do nothing
		append result "\nSubmit \[\002$sl\002\]: "
			if { [string match "*name=*" [string tolower $tag]] } {
				set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
				} else {
					append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
				}
				if { [string match "*value=*" [string tolower $tag]] } {
					set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				}
			} else {
				append result "no \"name=\" found (select value ignored)"
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "image" } {
		#type=image: like submit
		append result "\nImage \[\002$sl\002\]: "
			if { [string match "*name=*" [string tolower $tag]] } {
				set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
				if { [string index $value 0] == "\"" } {
					append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
				} else {
					append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
				}
				if { [string match "*value=*" [string tolower $tag]] } {
					set value [string range $tag [expr [string first "value=" [string tolower $tag]] + 6] end]
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set value [string range $tag [expr [string first "type=" [string tolower $tag]] + 5] end]
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				}
			} else {
				append result "no \"name=\" found (select value ignored)"
			}
		set sl [expr $sl + 1 ]
		} elseif { $type == "reset" } {
		#type=reset: do nothing
		} elseif { $type == "file" } {
		#type=file: do nothing for now, anybody want to be able to DCC files to a web page?
			putlog "\002 FILE expected, not given (proc listfromvars)"
		} elseif { $type == "scribble" } {
		#type=scribble: um, no
			putlog "\002 SCRIBBLE expected, not given (proc listfromvars)"
		} else {
			putlog "\002 UNKNOWN TYPE: $type (proc listfromvars)"
		}
	} elseif { ( $select != -1 ) && (( $select < $input ) || ( $input == -1 )) && (( $select < $textarea ) || ( $textarea == -1 )) } {
	#do select, checking multiple> ignoring selected
		set str [string range $str [string first "<select" [string tolower $str]] end]
		set tag [string range $str 0 [expr [string first "</select>" [string tolower $str]] + 8]]
		regsub -all "</option>" $tag "" tag
	#remove input from str
		set str [string range $str [expr [string first "</select>" [string tolower $str]] + 9] end]
	#check multiple>
		set value [string range $tag 0 [expr [string first ">" $tag] -1]]
		if { [string match  "*multiple*" [string tolower $value]] } {
			append result "\nMultiple Select Options \[\002$sl\002\]: "
			regsub ">" $tag " " value
			set value [string range $value [expr [string first "name=" [string tolower $value]] + 5] end]
			if { [string index $value 0] == "\"" } {
				set name [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				set name [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			set c 1
			while { [string first "<option" [string tolower $tag]] != -1 } {
				append result "\nOption \[\002$c\002\]: "
				#find <option
				set tag [string range $tag [expr [string first "<option" [string tolower $tag]] +7 ] end]
				append result $name
				set value [string range $tag 0 [string first ">" [string tolower $tag]]]
				if { [string match "*value=*" [string tolower $value]]} {
					set value [string range $value [expr [string first "value=" [string tolower $value]] + 6] end]
					regsub ">" $value " " value
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set tag [string range $tag [expr [string first ">" [string tolower $tag]] + 1 ] end]
					append result "=[string trim [string range $tag 0 [expr [string first "<" [string tolower $tag]] - 1 ]]]"
				}
			set c [expr $c + 1]
			}
		} else {
	#non-multiple: set name and value, ignore size
			append result "\nSelect Options \[\002$sl\002\]: "
			regsub ">" $tag " " value
			set value [string range $value [expr [string first "name=" [string tolower $value]] + 5] end]
			if { [string index $value 0] == "\"" } {
				append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
			} else {
				append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
			}
			set c 1
			while { [string first "<option" [string tolower $tag]] != -1 } {
				append result "\nOption \[\002$c\002\]: "
				#find <option
				set tag [string range $tag [expr [string first "<option" [string tolower $tag]] +7 ] end]
				set value [string range $tag 0 [string first ">" [string tolower $tag]]]
				if { [string match "*value=*" [string tolower $value]]} {
					set value [string range $value [expr [string first "value=" [string tolower $value]] + 6] end]
					regsub ">" $value " " value
					if { [string index $value 0] == "\"" } {
						append result "=[string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]"
					} else {
						append result "=[string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]"
					}
				} else {
					set tag [string range $tag [expr [string first ">" [string tolower $tag]] + 1 ] end]
					append result "=[string trim [string range $tag 0 [expr [string first "<" [string tolower $tag]] - 1 ]]]"
				}
			set c [expr $c + 1]
			}
		}
	set sl [expr $sl + 1 ]
	} elseif { ( $textarea != -1 ) && (( $textarea < $input ) || ( $input == -1 )) && (( $textarea < $select ) || ( $select == -1 )) } {
		append result "\nText Area \[\002$tl\002\]: "
	#do textarea, remember to use strtocgi afterwards
		set str [string range $str [string first "<textarea" [string tolower $str]] end]
		set tag [string range $str 0 [expr [string first "</textarea>" [string tolower $str]] + 10]]
	#remove input from str
		set str [string range $str [expr [string first "</textarea>" [string tolower $str]] + 11] end]
	#set name and value
		set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
		if { [string index $value 0] == "\"" } {
			append result [string range $value 1 [string first "\"" [string range [string tolower $value] 1 end]]]
		} else {
			append result [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]]
		}
		append result "=\002Text\002"
		set tl [expr $tl + 1 ]
	} else {
		putlog "\002 THAT'S IMPOSSIBLE! (proc listfromvars)"
	}
	set input [string first "<input" [string tolower $str]]
	set select [string first "<select" [string tolower $str]]
	set textarea [string first "<textarea" [string tolower $str]]
}
return $result
}

proc selecttolist { str } {
#selecttolist takes ONE <select ... </select> list and returns the list text in numbered order
#do not use tolower prior to calling selecttolist
#vars
set text ""
set tag ""
set value ""
set result ""
#clean up
regsub -all "\n" $str "" str
set str [string range $str [string first "<select" [string tolower $str]] end]
set tag [string range $str 0 [expr [string first "</select>" [string tolower $str]] + 8]]
regsub -all "</option>" $tag "" tag
#check multiple>
	if { [string match  "*multiple>*" [string tolower $tag]] } {
		append result "Multiple choice: "
	}
set value [string range $tag [expr [string first "name=" [string tolower $tag]] + 5] end]
set name "&[string trim [string range $value 0 [expr [string first " " [string tolower $value]] - 1 ]] "\"" ]"
set c 1
	while { [string first "<option" [string tolower $tag]] != -1 } {
		#find <option
		set tag [string range $tag [string first "<option" [string tolower $tag]] end]
		set tag [string range $tag [expr [string first ">" [string tolower $tag]] + 1 ] end]	
		append result "\[\002$c\002\]-[string trim [string range $tag 0 [expr [string first "<" [string tolower $tag]] - 1 ]]] "
	set c [expr $c + 1]
	}
return $result
}

proc infofromurl { str } {
	if { [string match "http://*" $str ] } {
		set temp [string range $str 7 end]
		set server [string range $temp 0 [expr [string first "/" $temp] -1 ]]
		if { [string match "*:*" $server] } {
			set port [string range $server [expr [string first ":" $server] +1] end]
			set server [string range $server 0 [expr [string first ":" $server] -1]]
		} else {
			set port "80"
		}
		set theinfo $server
		lappend theinfo $port
		lappend theinfo [string range $temp [string first "/" $temp] end]
	} elseif { [string index $str 0] == "/" } {
		set theinfo "{} {80}"
		lappend theinfo $str
	} else {
		putlog "\002ERROR\002 Bad URL (infofromurl)"
	}
return $theinfo
}

#------------------ cgi.faq cut here ---------------------
#.Frequently Answered Questions................................
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org

#Q) So WTF is this anyway?
#A) cgi.tcl is a series of procs designed to make grabbing information
#   from the web (like CGIs) and displaying them on IRC easy. 
#
#Q) So why would I want that?
#A) Lots of databases now have a CGI interface to access useful data. 
#   Dictionaries, almanacs, thesauruses, movie lists, encyclopedias, etc.
#   can now be accessed easily by your eggdrop bot. 
#
#Q) So how would I use this then?
#A) Typically only three steps need to be taken:
# 1) Send a query to the web site for the html page containing the <FORM>
# 2) Crop and send the result to formtocgi which will return the CGI query
# 3) Format this result for IRC and send to the persion who queried your bot
#
#Q) Could you elaborate on the first step?
#A) The <FORM> html code tells the web browser (viz. Netscape) how to contruct
#   the CGI query. You can skip this first step if you know the query beforehand.
#   This will save time as your bot doesn't have to retrieve the first page every
#   time. Most web designers should know what the query should be, however you
#   can also save the result of the first step or use -trace mode with lynx.
#   Sometimes a web site will change their <FORM> and break your script.
#   Downloading the first page every time (or every so often, saving the result)
#   makes the script more robust, albiet slower.
#
#Q) Maybe if you elaborate on the second step I'll understand whatever you said.
#A) Once you download the first page, it's better to crop the code such that
#   it only contains everything from "<form>" to "</form>". Remember it *must*
#   contain "</form>"! formtocgi will take the html and construct a query...
#
#Q) <interrupting> b-but what about empty fields and radio boxes?
#A)	formtocgi has two other inputs, a list of toggle inputs and text inputs.
#   This is akin to selecting options and entering text in the html FORM. The
#   order of the lists is crucial! If there are three text fields the text list
#   should have three items in the order they appear in the html code. For the
#   most part the inputs should be obvious. However you should read the
#   comments in formtocgi to make sure.
#
#Q) Umm...OK. What about the last step?
#A) Formatting the html result to IRC involves some cropping and regsubbing.
#   Thanks to yours truely, this has been simplified a little using the proc
#   strtoirc. Before you ask, no I'm not going to rewrite lynx in tcl. Perhaps
#   some other masochist would like to.
#
#Q) When I edit my script it takes ages to upload it to my shell
#A) Don't append your script to cgi.tcl. Add it as a seperate file in your
#   eggdrop configuration file. 
#
#Q) Do you have a tutorial how to use this?
#A) Why yes I do, aren't I sweet? It's cgi_tutorial.tcl
#
#Q) I improved cgi.tcl or added a cool script using your functions. Can you add it?
#A) Sure, just mail it to me.
#
#Q) I found a bug. Can you fix it?
#A) See above.
#
#Q) I found a super cool CGI on the web. Can you program an eggdrop interface for
#   it? I'm not cool like you.
#A) See above.
#
#Q) I have another ques....
#A) See above.

#---------------- cgi_tutorial.tcl cut here ------------------
#cgi_tutorial.tcl version 1.0
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#uses cgi.tcl

#1.0 works well enough for a tutorial


##"tutorial" binds##
#Here we have binds for partyline, privmsg, and channel message respectively.
bind dcc - nasdaq tutorial_dcc

array set chatcmds "nasdaq tutorial_dcc"

bind msg - nasdaq tutorial_msg

bind pub - !nasdaq tutorial_pub

##"tutorial" globals##
#After a query is sent any variables you need after recieving the result
#must be stored in a global array. Here we have three variables which is the 
#absolute minimum. See the comments in the proc cgi_send for more info.

#The nickname or idx of the client who queried your bot.
set tutorial_nick() ""

#The method to send the query reply. Either DCC, MSG, or NOTICE. For those
#sadists out there who want to send the result publicly to a channel, use
#that channel as the nick.
set tutorial_retr() ""

#This is the text to send. cgi_reply automatically splits lines too long for
#EFnet.
set tutorial_body() ""

#three is the minimum. Order counts! See cgi_send for more info.
set tutorial_globals "tutorial_nick tutorial_retr tutorial_body"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"tutorial" functions##
#The following three functions handle the query from the clients.
proc tutorial_dcc { hand idx arg } {
putlog "#$hand# nasdaq..."
global tutorial_globals
	cgi_send $idx "DCC" "www.nasdaq.com" 80 "tutorial_receive" "GET" "/asp/quotes_multi.asp" "mode=Stock&symbol=$arg" $tutorial_globals ""
}

proc tutorial_msg { nick uhost handle arg } {
putlog "$nick looked up this stock: $arg"
global tutorial_globals
	cgi_send $nick "MSG" "www.nasdaq.com" 80 "tutorial_receive" "GET" "/asp/quotes_multi.asp" "mode=Stock&symbol=$arg" $tutorial_globals ""
}

proc tutorial_pub { nick uhost handle channel arg } {
putlog "$nick on $channel looked up this stock: $arg"
global tutorial_globals
	cgi_send $nick "NOTICE" "www.nasdaq.com" 80 "tutorial_receive" "GET" "/asp/quotes_multi.asp" "mode=Stock&symbol=$arg" $tutorial_globals ""
}
#All very similar as you can see. You do not need to support all three or use
#the nickname as the reply target. For instance you could use one public function
#which sent the query result to the channel:
#
#bind pub m|m !annoy tutorial_annoy
#
#proc tutorial_annoy { nick uhost handle channel arg } {
#putlog "$nick on $channel annoyed everybody"
#global tutorial_globals
#	cgi_send $channel "MSG" "www.nasdaq.com" 80 "tutorial_receive" "GET" "/asp/quotes_multi.asp" "mode=Stock&symbol=$arg" $tutorial_globals ""
#}

#This handles the html while it is downloaded per LINE. This means after every carrige
#return a string will be sent to this proc ($input). At the end of the transfer the
#proc is called with an empty string. If you want to deal with the entire html as a whole
#store each string in a global variable until ($input == ""). Be careful, tcl is a
#clumsy ass and sometimes trips over long strings. 
proc tutorial_receive { idx input } {
#globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {   #Remember if $input is empty the transfer is finished.
		#traps. Traps are very important especially when your script breaks.
		#You should check for all the server errors you can think of. If you
		#send a query you should get the result or an error. If you do not
		#fix your code! This simple trap checks if the symbol exists or not:
		if { [string match "*is not available*" $tutorial_body($idx)] } {
			cgi_reply $tutorial_nick($idx) $tutorial_retr($idx) "\002DOH! That symbol doesn't exist!"
		#Sometimes traps are performed line for line then throw an exception. If that is the
		#case we would place the traps after the last 'else' in this proc.
		} else {
		#typically one would have a global boolean variable to signify an
		#exception thrown if a trap caught an error. However this is a lazy tutorial.
		#You're lazy aren't you? cgi_stock.tcl has a better example how to catch errors.
		#cgi_define.tcl has a shitload of traps if you want a better example.
		#
		#In this tutorial I just append all the html into my body global, which as
		#a rule of thumb is stupid. Typically you should make another global variable
		#to store your html.
			set tutorial_body($idx) [string range $tutorial_body($idx) [expr [string first "<nobr><b>" $tutorial_body($idx)] + 9] end]
			set tutorial_body($idx) [string range $tutorial_body($idx) 0 [expr [string first "</b>&nbsp" $tutorial_body($idx)] - 1 ]]
			cgi_reply $tutorial_nick($idx) $tutorial_retr($idx) $tutorial_body($idx)
		}
	} else {   #transfer not finished yet
	#again, this is the lazy (i.e. stupid) way to store your html into one piece. 
	append tutorial_body($idx) $input
	}
}
#How simple was THAT!!! In only a few lines of code (not counting my comments) I created
#a script which queries a CGI on the web, crops the result, and sends it to your bot user.
#Now anybody wanting to know the price of their stock just has to type !nasdaq followed by the 
#stock symbol viz. !nasdaq AAPL.

#Some debugging tips:

#Create a simple version which works first. The script above took a minute to code. I can
#easily add more features, or more importantly make it more robust. Adding more global variables
#is very easy so long you keep track of the order. I would create another variable to store the
#symbol searched for. This way the user doesn't only recieve a price. I would also add a help,
#which ought to appear when no arguments exist. Check out cgi_define.tcl for a complete example.

#I didn't use formtocgi in this example for three reasons. 1) It's faster to avoid downloading the
#first page for every query. 2) The FORM was very simple, and used GET so I only had to use
#netscape to determine the query string. 3) I didn't write formtocgi when I wrote this script |-).
#formtocgi is useful for several things.1) Determining the query if it's POST and therefore hidden
#from anybody using netscape.2) Being lazy, as one typically only has to dump the first page into
#the proc with one string to get the correct cgi.3) Making a script more robust, like
#cgi_translate.tcl. Even though the query structure of that CGI changes often, it always only has
#one text field to begin with. Typically if the graphical interface to a CGI remains constant
#however the query changes often this is a good strategy. 4) Handling recursive queries. Queries
#like those in cgi_define.tcl call the server several times before the result is had. formtocgi
#makes this tremendously easier.
#If you want to avoid the delay you can send a query with the text field being "test" then take
#the result and replace "test" with "\$text". Do this perhaps once a day (use the timer function).
#You can store this query as stored_query and use it by storing $text then calling the eval
#function [eval $stored_query]. I'll implement this myself one day. 

#The easiest method to determine the correct POST query is to gather all the html between <FORM*
#and </FORM> then call putlog [listfromvars $theform]. This will give you a summary of all the FORM
#options as inputs one would use in formtocgi. 

#Another method to determine the correct POST query is using lynx with the -trace option. Trace
#fills your screen up a lot so be warned. The POST query will be one of the first things shown
#when you send a query at which point I usually BREAK to avoid the flood. 

#If you are unsure how to crop your html try looking at the source in a web browser. Many browsers
#like Nutscrape don't send the POST when trying to view the source. Sometimes placing the query as
#a GET works, otherwise save the html in a file within your script. 90% of my time is spent yelling
#at my browser in vain.

#Purposely send bad queries to build a list of traps. Also send bad locations for the same purpose. 

#Nasdaq, Nasdaq National Market, Nasdaq-100, Nasdaq-100 Index, OTC Bulletin Board,
#Nasdaq/NMS, Nasdaq/NMS Composite, Nasdaq-Financial, Nasdaq-Financial Index,
#Nasdaq/NMS Industrial, ACES, NTV, NDX and INFORMM are registered service/trademarks
#of The Nasdaq Stock Market, Inc. The Nasdaq Stock Market, The Nasdaq SmallCap Market, Nasdaq
#International, Nasdaq International Marketing Initiatives, NIMI, SelectNet, Multi Quotes, FlashQuotes,
#InfoQuotes, Nasdaq Workstation IITM, Nasdaq Composite, Nasdaq Computer Index, Nasdaq Industrial
#Index, Nasdaq National Market Composite, Nasdaq/NMS Industrial Index, Nasdaq
#Telecommunications Index, FIPS, CAES, MBARS, TARS, SOES, Stock Watch Automated Tracking
#System, SWAT, Nasdaq Online, MarketSite, Nasdaq Trader, Nasdaq Newsroom, LogoTickerTM,
#Shaping the New World of Investing_ and the logos identifying Nasdaq indexes and products are
#service/trademarks of The Nasdaq Stock Market, Inc. Nasdaq stock symbols are proprietary to The
#Nasdaq Stock Market, Inc. NASD and PROCTOR are registered service/trademarks of the National
#Association of Securities Dealers, Inc. MediaSource, PC Focus and NASDnet are servicemarks of the
#National Association of Securities Dealers, Inc. NASDR and NASD Regulation are servicemarks of
#NASD Regulation, Inc. Featured logos are service/trademarks of their respective owners. 

#----------------- cgi_stock.tcl cut here ---------------------
#cgi_stock.tcl version 1.6
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#uses cgi.tcl

#also uses lynx to download binary files. I tried to use tcl for this putpose but tcl or eggdrop
#sucks, I'm not sure which. You can replace lynx with wget if you want. I stuck with lynx because
#it's more common.

#typically you do NOT need to reset this path if it is incorrect. My script should do that automatically
#If you lack the shell command "whereis" just edit this path
set cgi_stock_path "/usr/local/bin/lynx -dump"
#set cgi_stock_path "/usr/local/bin/wget -O- -q"

proc cgi_find_path { tried } {
global cgi_stock_path
	if { [catch { eval exec $cgi_stock_path http://www }] } {
		putlog "\002cgi_stock.tcl:\002 lynx or wget NOT found"
		putlog "\002path:\002 $cgi_stock_path"
		if { [catch { exec whereis -b ls }] } {
			putlog "You don't even have whereis! How can I find lynx or wget without whereis?"
			set tried 3
		}
		if { $tried < 1 } {
			putlog "looking for lynx..."
			set cgi_stock_path "[string range [exec whereis -b lynx] [string first "/" [exec whereis lynx]] end] -dump"
			if { [string index $cgi_stock_path 0] == "/" } {
				putlog "Trying: $cgi_stock_path"
				cgi_find_path 1
				set tried 3
			} else {
			putlog "Search failed..."
			}
		}
		if { $tried < 2 } {
			putlog "looking for wget..."
			set cgi_stock_path "[string range [exec whereis -b wget] [string first "/" [exec whereis wget]] end] end] -O- -q"
			if { [string index $cgi_stock_path 0] == "/" } {
				putlog "Trying: $cgi_stock_path"
				cgi_find_path 2
				set tried 3
			} else {
				putlog "Search failed"
			}
		}
		if { [string index $cgi_stock_path 0] != "/" } {
			putlog "Please install lynx or wget"
			putlog "Chart option will not work until you do"
			set cgi_stock_path "NONE"
		}
	} else {
		putlog "\002cgi_stock.tcl:\002 lynx or wget found"
	}
}

cgi_find_path 0
#the ascii option requires a utility to convert GIF into an ascii image
#http://www.paru.cas.cz/~hubicka/
#not implemented yet

#1.0 initial release
#1.1 yahoo changed their CGI
#1.2 yahoo removed their CGI |-( Using NASDAQ now
#1.3 Going back to yahoo, adding more features
#1.4 Fixed lynx and wget detection
#1.5 Improved lynx/wget detection
#1.6 ditto

##"stock" binds##
bind dcc - stock stock_dcc

array set chatcmds "stock stock_dcc"

bind msg - stock stock_msg

bind pub - !stock stock_pub

##"stock" globals##
set stock_nick() ""

set stock_retr() ""

set stock_body() ""

set stock_symbol() ""

set stock_nerr() ""

set stock_globals "stock_nick stock_retr stock_body stock_symbol stock_nerr"


######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"stock" functions##
proc stock_dcc { hand idx arg } {
putlog "#$hand# stock..."
global stock_globals
	if { [lindex $arg 0] == "" } {
		putdcc $idx "Works for stocks or funds"
		putdcc $idx "To get the current price: .stock <symbol>"
		putdcc $idx "To get a detailed summary: .stock <symbol> D"
		#putdcc $idx "To get a GIF chart (uses dcc send): /msg $botnick stock <symbol> G"
		#putdcc $idx "To get an ascii chart: /msg $botnick stock <symbol> A"
		putdcc $idx "To look up a symbol: .stock <keyword(s)> L"
		putdcc $idx "example: \002.stock rydex ursa l\002 will find the Rydex Ursa fund"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "stock quotes and charts provided by Yahoo <http://quote.yahoo.com/>"
	} elseif { [lindex $arg 1] == "" } {
		cgi_send $idx "DCC" "quote.yahoo.com" "80" "stock_price_receive" "GET" "/q" "s=[lindex $arg 0]&d=v1" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Dd\]" [lindex $arg end]] } {
		cgi_send $idx "DCC" "quote.yahoo.com" "80" "stock_detailed_receive" "GET" "/q" "s=[lindex $arg 0]&d=t" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Ll\]" [lindex $arg end]] } {
		cgi_send $idx "DCC" "quote.yahoo.com" "80" "stock_lookup_receive" "GET" "/l" "s=[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]&d=v1" $stock_globals "[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]"
	} elseif { [string match "\[Gg\]" [lindex $arg end]] } {
		putdcc $idx "GIF chart option not available for partyline!"
	} elseif { [string match "\[Aa\]" [lindex $arg end]] } {
		putdcc $idx "ascii chart not available yet!"
	} else {
		putdcc $idx "\002Bad option!"
	}
}

proc stock_msg { nick uhost handle arg } {
global cgi_stock_path
global stock_globals
global botnick
	if { [lindex $arg 0] == "" } {
		putlog "$nick got stock help"
		putserv "PRIVMSG $nick :Works for stocks or funds"
		putserv "PRIVMSG $nick :To get the current price: /msg $botnick stock <symbol>"
		putserv "PRIVMSG $nick :To get a detailed summary: /msg $botnick stock <symbol> D"
		putserv "PRIVMSG $nick :To get a GIF chart (uses dcc send): /msg $botnick stock <symbol> <timespan> G"
		putserv "PRIVMSG $nick :To get an ascii chart: /msg $botnick stock <symbol> <timespan> A"
		putserv "PRIVMSG $nick :<timespan> can be 1d | 5d | 3m | 1y | 2y | 5y | max. Default is 1y"
		putserv "PRIVMSG $nick :example: \002/msg $botnick stock AAPL 1d g\002 will retrieve the chart for today's performance"
		putserv "PRIVMSG $nick :To look up a symbol: /msg $botnick stock <keyword(s)> L"
		putserv "PRIVMSG $nick :example: \002/msg $botnick stock rydex ursa l\002 will find the Rydex Ursa fund"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :stock quotes and charts provided by Yahoo <http://quote.yahoo.com/>"
	} elseif { [lindex $arg 1] == "" } {
		putlog "$nick got the last bid for [lindex $arg 0]"
		cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_price_receive" "GET" "/q" "s=[lindex $arg 0]&d=v1" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Dd\]" [lindex $arg end]] } {
		putlog "$nick got a detailed summary for [lindex $arg 0]"
		cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_detailed_receive" "GET" "/q" "s=[lindex $arg 0]&d=t" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Ll\]" [lindex $arg end]] } {
		putlog "$nick looked for a stock symbol"
		cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_lookup_receive" "GET" "/l" "s=[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]&d=v1" $stock_globals "[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]"
	} elseif { [string match "\[Gg\]" [lindex $arg end]] } {
		if { $cgi_stock_path == "NONE" } {
			putlog "$nick got pissed because you don't have lynx or wget installed"
			putserv "PRIVMSG $nick :Damn, this shell doesn't have lynx or wget installed"
		} else {
			putlog "$nick got the GIF chart for [lindex $arg 0]"
			if { [llength $arg] == 2 } {
				cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=1y" $stock_globals "[lindex $arg 0]"
			} else {
				switch [lindex $arg 1] {
				1d -
				5d -
				3m -
				1y -
				2y -
				5y { cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=[lindex $arg 1]" $stock_globals "[lindex $arg 0]" }
				max { cgi_send $nick "MSG" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=my" $stock_globals "[lindex $arg 0]" }
				default {
						putserv "PRIVMSG $nick :\002Bad timespan:\002 [lindex $arg 1]"
						putserv "PRIVMSG $nick :\002Should be:\002 1d | 5d | 3m | 1y | 2y | 5y | max or omitted"
					}
				}
			}
		}
	} elseif { [string match "\[Aa\]" [lindex $arg end]] } {
		putlog "$nick got the ascii chart for [lindex $arg 0]"
		putserv "PRIVMSG $nick :ascii chart not available yet!"
	} else {
		putserv "PRIVMSG $nick :\002Bad option!"
	}
}

proc stock_pub { nick uhost handle channel arg } {
global cgi_stock_path
global stock_globals
	if { [lindex $arg 0] == "" } {
		putlog "$nick got stock help"
		putserv "NOTICE $nick :Works for stocks or funds"
		putserv "NOTICE $nick :To get the current price: !stock <symbol>"
		putserv "NOTICE $nick :To get a detailed summary: !stock <symbol> D"
		putserv "NOTICE $nick :To get a GIF chart (uses dcc send): !stock <symbol> <timespan> G"
		putserv "NOTICE $nick :To get an ascii chart: !stock <symbol> <timespan> A"
		putserv "NOTICE $nick :<timespan> can be 1d | 5d | 3m | 1y | 2y | 5y | max. Default is 1y"
		putserv "NOTICE $nick :example: \002!stock AAPL 1d g\002 will retrieve the chart for today's performance"
		putserv "NOTICE $nick :To look up a symbol: !stock <keyword(s)> L"
		putserv "NOTICE $nick :example: \002!stock rydex ursa l\002 will find the Rydex Ursa fund"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :stock quotes and charts provided by Yahoo <http://quote.yahoo.com/>"
	} elseif { [lindex $arg 1] == "" } {
		putlog "$nick on $channel got the last bid for [lindex $arg 0]"
		cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_price_receive" "GET" "/q" "s=[lindex $arg 0]&d=v1" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Dd\]" [lindex $arg end]] } {
		putlog "$nick on $channel got a detailed summary for [lindex $arg 0]"
		cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_detailed_receive" "GET" "/q" "s=[lindex $arg 0]&d=t" $stock_globals "[lindex $arg 0]"
	} elseif { [string match "\[Ll\]" [lindex $arg end]] } {
		putlog "$nick on $channel looked for a stock symbol"
		cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_lookup_receive" "GET" "/l" "s=[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]&d=v1" $stock_globals "[strtocgi [lrange $arg 0 [expr [llength $arg] -2]]]"
	} elseif { [string match "\[Gg\]" [lindex $arg end]] } {
		if { $cgi_stock_path == "NONE" } {
			putlog "$nick on $channel got pissed because you don't have lynx or wget installed"
			putserv "NOTICE $nick :Damn, this shell doesn't have lynx or wget installed"
		} else {
			putlog "$nick on $channel got the GIF chart for [lindex $arg 0]"
			if { [llength $arg] == 2 } {
				cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=1y" $stock_globals "[lindex $arg 0]"
			} else {
				switch [lindex $arg 1] {
				1d -
				5d -
				3m -
				1y -
				2y -
				5y { cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=[lindex $arg 1]" $stock_globals "[lindex $arg 0]" }
				max { cgi_send $nick "NOTICE" "quote.yahoo.com" "80" "stock_dcc_chart" "GET" "/q" "s=[lindex $arg 0]&d=my" $stock_globals "[lindex $arg 0]" }
				default {
						putserv "NOTICE $nick :\002Bad timespan:\002 [lindex $arg 1]"
						putserv "NOTICE $nick :\002Should be:\002 1d | 5d | 3m | 1y | 2y | 5y | max or omitted"
					}
				}
			}
		}
	} elseif { [string match "\[Aa\]" [lindex $arg end]] } {
		putlog "$nick on $channel got the ascii chart for [lindex $arg 0]"
		putserv "NOTICE $nick :ascii chart not available yet!"
	} else {
		putserv "NOTICE $nick :\002Bad option!"
	}
}

proc stock_price_receive { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		set stock_body($idx) [string range $stock_body($idx) 15 end]
		cgi_reply $stock_nick($idx) $stock_retr($idx) "\037$stock_symbol($idx)\037: [lindex [strtoirc $stock_body($idx)] 0]"
	} elseif { $stock_nerr($idx) == "NONE" } {
		if { [string match "*No such ticker symbol*" $input] } {
			set stock_nerr($idx) "NTICK"
			append stock_body($idx) "           No such ticker symbol!"
		} elseif { [string match "*<b>*" $input] && [string match "*nowrap*" $input] } {
			append stock_body($idx) $input
		}
	}
}

proc stock_detailed_receive { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		foreach line [strtoirc $stock_body($idx)] {
			cgi_reply $stock_nick($idx) $stock_retr($idx) $line
		}
	} elseif { $stock_nerr($idx) == "NONE" } {
		if { [string match "*Last Trade*" $input] } {
			append stock_body($idx) "<b>$input:</b> "
			set stock_nerr($idx) "BEGIN"
		} elseif { [string match "*colspan=7*" $input] } {
			set stock_body($idx) "\037$stock_symbol($idx)\037: [string range $input [string first "<b>" $input] [expr [string first "More Info" $input] -4]]<br>"
		}
	} elseif { $stock_nerr($idx) == "BEGIN" } {
		if { [string match "*No such ticker symbol*" $input] } {
			set stock_nerr($idx) "NTICKD"
			append stock_body($idx) "           No such ticker symbol!"
		} elseif { [string match "*</td>*" $input] } {
			append stock_body($idx) "$input | "
		} elseif { [string match "*<td*" $input] } {
			append stock_body($idx) "<b>$input:</b>"
		} elseif { [string match "*</tr>*" $input] } {
			append stock_body($idx) "<br>"
		} elseif { [string match "*Quotes delayed*" $input] } { 
			set stock_nerr($idx) "STOP"
		}
	}
}

proc stock_dcc_chart { idx input } {
global cgi_stock_path
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		set stock_body($idx) [string range $stock_body($idx) 4 end]
		if { $stock_nerr($idx) == "NONE" } {
			set dirname "/tmp/[rand 10000]"
			exec /bin/mkdir $dirname
			eval exec $cgi_stock_path $stock_body($idx) > $dirname/$stock_symbol($idx).gif
			dccsend "$dirname/$stock_symbol($idx).gif" $stock_nick($idx)
			exec /bin/rm -rf $dirname
		} else {
			cgi_reply $stock_nick($idx) $stock_retr($idx) "\037$stock_symbol($idx)\037: [lindex [strtoirc $stock_body($idx)] 0]"
		}
	} elseif { $stock_nerr($idx) == "NONE" } {
		if { [string match "*No such ticker symbol*" $input] } {
			set stock_nerr($idx) "NTICKG"
			append stock_body($idx) "<b>DOH!</b> No such ticker symbol!"
		} elseif { [string match "*http://chart.yahoo.com/*" $input]} {
			append stock_body($idx) [string range $input [string first "http://" $input] [expr [string first ".gif" $input] +3]]
		} elseif { [string match "*http://ichart.yahoo.com/*" $input]} {
			append stock_body($idx) [string range $input [string first "http://" $input] [expr [string first [string tolower $stock_symbol($idx)] $input] + [string length $stock_symbol($idx)] -1 ]]
		}
	}
}

proc stock_lookup_receive { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		set stock_body($idx) [string range $stock_body($idx) 4 end]
		set reply [strtoirc $stock_body($idx)]
		set c 0
		while { ($c <= [llength $reply]) && ($c <= 13) } {
			if { $c >= 13 } {
				cgi_reply $stock_nick($idx) $stock_retr($idx) "\002List too long!\002 (over 12)"
				cgi_reply $stock_nick($idx) $stock_retr($idx) "\002Go here to see full list:\002 http://quote.yahoo.com/l?s=$stock_symbol($idx)"
			} else {
				cgi_reply $stock_nick($idx) $stock_retr($idx) [lindex $reply $c]
			}
		set c [expr $c +1]
		}
	} elseif { $stock_nerr($idx) == "NONE" } {
		if { [string match "*returned no matches*" $input] } {
			set stock_nerr($idx) "NMATCH"
			append stock_body($idx) "<b>DOH!</b> No match for your query!"
		} elseif { [string match "*<td>*" $input] } {
			if { [string match "*href=*" $input] } {
				append stock_body($idx) "<b>$input:</b> "	
			} else {
				append stock_body($idx) "$input<br>"
			}
		} elseif { [lindex $input 0] == "Symbol" } {
			append stock_body($idx) "$input<br>"
		}
	}
}

proc stock_graphic { idx input } {
#This doesn't F*&%^(*^%(*^(*& work!
#either tcl or eggdrop doesn't like binary downloads
putlog "IDX is $idx"
global stock_body
global stock_gif_begin
global stock_nick
global dirname
global tmpfile
	if { [string match "" $input] } {
		#set dirname "/tmp/[rand 10000]"
		putlog "The file is: $dirname/my.gif"
		#exec /bin/mkdir $dirname
		#set tmpfile [open "$dirname/my.gif" w]
		#puts -nonewline $tmpfile $stock_body($idx) 
		flush $tmpfile
		close $tmpfile
		dccsend "$dirname/my.gif" $stock_nick($idx)
		#file delete $filename
		#exec /bin/rm -rf $dirname
	} else {
			#if { $stock_gif_begin($idx) } {
			#putlog "WOOP"
			#	if { [string match "*GIF87*" $input] } {
			#	putlog "WOW"
			#		set stock_body($idx) $input
			#		set stock_gif_begin($idx) 0
			#	}
			#} else {
				#append stock_body($idx) $input
				#append stock_body($idx) "\n"
			#}
		puts $tmpfile $input
	}
}

#Yahoo!, the Yahoo! logo, Yahooligans!, the "Jumpin' Y Guy" logo, Do You Yahoo!?,
#My Yahoo!, Art Soup, the Eyeballs design, Homework Answers, Get Local, the Kid's
#Web Guide, the World's Favorite Internet Guide, School Bell, the Sunglasses design,
#and other Yahoo! logos and product and service names are trademarks of Yahoo! Inc.
#Beatrice's Web Guide is a trademark of Yahoo! Inc. and Wire Networks, Inc. 

#--------------- cgi_currency.tcl cut here ---------------------
#cgi_currency.tcl version 1.3
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#cgi_currency.tcl converts virtually any currency
#Uses this CGI: http://www.xe.net/currency/full/

#1.0 First working version
#1.1 Fixed bugs
#1.2 Clean up crap
#1.3 Finally got error to show
##"currency" binds##

bind pub - !cc currency_pub

bind msg - cc currency_msg

bind dcc - cc currency_dcc

array set chatcmds "cc currency_dcc"

##"currency" globals##
set currency_nick() ""

set currency_retr() ""

set currency_body() ""

set currency_code1() ""

set currency_code2() ""

set currency_nerr() ""

set currency_globals "currency_nick currency_retr currency_body currency_code1 currency_code2 currency_nerr"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"currency" functions##
proc currency_pub { nick uhost handle channel arg } {
global currency_globals
global botnick
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick on $channel got currency help"
		putserv "NOTICE $nick :To convert currency: !cc <amount> <of currency> <to this currency>"
		putserv "NOTICE $nick :where <currency> is the ISO 4217 currency code"
		putserv "NOTICE $nick :Example: !cc 1 GBP USD will convert one British Pound to one US Dollar"
		putserv "NOTICE $nick :To get currency code table: http://www.xe.net/currency/iso4217.htm"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :Currency conversion provided by Xenon Laboratories <http://www.xe.net/currency/>"
	} elseif { [llength $arg] == 3 } {
		putlog "$nick on $channel converted a currency"
		cgi_send $nick "NOTICE" "www.xe.net" "80" "currency_receive" "POST" "/cgi-bin/ucc/anc_convert" "language=zz&Amount=[lindex $arg 0]&From=[string toupper [lindex $arg 1]]&To=[string toupper [lindex $arg 2]]" $currency_globals "[string toupper [lindex $arg 1]] [string toupper [lindex $arg 2]]"
	} else {
		putserv "NOTICE $nick :\002Bad syntax!"
	}
}

proc currency_msg { nick uhost handle arg } {
global currency_globals
global botnick
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got currency help"
		putserv "PRIVMSG $nick :To convert currency: /msg $botnick cc <amount> <of currency> <to this currency>"
		putserv "PRIVMSG $nick :where <currency> is the ISO 4217 currency code"
		putserv "PRIVMSG $nick :Example: /msg $botnick cc 1 GBP USD will convert one British Pound to one US Dollar"
		putserv "PRIVMSG $nick :To get currency code table: http://www.xe.net/currency/iso4217.htm"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :Currency conversion provided by Xenon Laboratories <http://www.xe.net/currency/>"
	} elseif { [llength $arg] == 3 } {
		putlog "$nick converted a currency"
		cgi_send $nick "MSG" "www.xe.net" "80" "currency_receive" "POST" "/cgi-bin/ucc/anc_convert" "language=zz&Amount=[lindex $arg 0]&From=[string toupper [lindex $arg 1]]&To=[string toupper [lindex $arg 2]]" $currency_globals "[string toupper [lindex $arg 1]] [string toupper [lindex $arg 2]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc currency_dcc { hand idx arg } {
putlog "#$hand# cc..."
global currency_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx "To convert currency: .cc <amount> <of currency> <to this currency>"
		putdcc $idx "where <currency> is the ISO 4217 currency code"
		putdcc $idx "Example: .cc 1 GBP USD will convert one British Pound to one US Dollar"
		putdcc $idx "To get currency code table: http://www.xe.net/currency/iso4217.htm"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Currency conversion provided by Xenon Laboratories <http://www.xe.net/currency/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		cgi_send $idx "DCC" "www.xe.net" "80" "currency_list" "GET" "/currency/full/" "" $currency_globals ""
	} elseif { [llength $arg] == 3 } {
		cgi_send $idx "DCC" "www.xe.net" "80" "currency_receive" "POST" "/cgi-bin/ucc/anc_convert" "language=zz&Amount=[lindex $arg 0]&From=[string toupper [lindex $arg 1]]&To=[string toupper [lindex $arg 2]]" $currency_globals "[string toupper [lindex $arg 1]] [string toupper [lindex $arg 2]]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}
proc currency_receive { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		if { $currency_body($idx) == "NONE" } {
			cgi_reply $currency_nick($idx) $currency_retr($idx) "\002ERROR:\002 Probably bad currency code. Used: $currency_code1($idx) $currency_code2($idx)"
		} else {
			set currency_body($idx) [string range $currency_body($idx) 18 end]
			cgi_reply $currency_nick($idx) $currency_retr($idx) [lindex [strtoirc $currency_body($idx)] 0]
		}
	} elseif { $currency_nerr($idx) == "NONE" } {
		if { [string match "*this is a fat error*" $input] } {
			set currency_nerr($idx) "WTF"
			append currency_body($idx) "No such ticker currency!"
		} elseif { [string match "<FONT SIZE=+1><B>*" $input] } {
			append currency_body($idx) $input
		}
	}
}

proc currency_list { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		if { $currency_body($idx) == "NONE" } {
			cgi_reply $currency_nick($idx) $currency_retr($idx) "\002ERROR:\002 Bad list URL"
		} else {
			cgi_reply $currency_nick($idx) $currency_retr($idx) [selecttolist $currency_body($idx)]
		}
	} elseif { $currency_nerr($idx) == "NONE" } {
		if { [string match "*this is a fat error**" $input] } {
			set currency_nerr($idx) "WTF"
			append currency_body($idx) "BAD!"
		} elseif { [string match "*<SELECT*" $input] || [string match "*<option*" $input] } {
			append currency_body($idx) $input
		} elseif { [string match "*</SELECT>*" $input] } {
			append currency_body($idx) $input
			set currency_nerr($idx) "STOP"
		}
	}
}

#Universal Currency Converter services, programs, compiled binaries, interface text and graphics,
#and documentation is copyright  1995-1998 Xenon Laboratories Incorporated, all rights reserved.
#Universal Currency Converter and the spinning currency logo are trade marks of Xenon Laboratories
#Incorporated.

#--------------- cgi_translate.tcl cut here ---------------------
#cgi_translate.tcl version 1.1
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#Translates phrases to different languages using Altavista's CGI

#1.0 First working version
#1.1 Fixed translate_receive

##"translate" binds##

bind pub - !translate translate_pub

bind msg - translate translate_msg

bind dcc - translate translate_dcc

array set chatcmds "translate translate_dcc"

##"translate" globals##
set translate_nick() ""

set translate_retr() ""

set translate_body() ""

set translate_option() ""

set translate_phrase() ""

set translate_nerr() ""

set translate_globals "translate_nick translate_retr translate_body translate_option translate_phrase translate_nerr"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"translate" functions##
proc translate_pub { nick uhost handle channel arg } {
global translate_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick on $channel got translate help"
		putserv "NOTICE $nick :To translate a phrase: !translate <option#> phrase"
		putserv "NOTICE $nick :where <option#> is the number to signify how to translate"
		putserv "NOTICE $nick :To receive a list of options: !translate list"
		putserv "NOTICE $nick :example: !translate 5 Peter is tall"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :Translator provided by AltaVista <http://babelfish.altavista.com/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick on $channel got translation options list"
		cgi_send $nick "NOTICE" "babelfish.altavista.com" "80" "translate_list" "GET" "/" "" $translate_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick on $channel translated a phrase"
		cgi_send $nick "NOTICE" "babelfish.altavista.com" "80" "translate_receive" "GET" "/" "" $translate_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "NOTICE $nick :\002Bad syntax!"
	}
}

proc translate_msg { nick uhost handle arg } {
global botnick
global translate_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got translate help"
		putserv "PRIVMSG $nick :To translate a phrase: /msg $botnick translate <option#> phrase"
		putserv "PRIVMSG $nick :where <option#> is the number to signify how to translate"
		putserv "PRIVMSG $nick :To receive a list of options: /msg $botnick translate list"
		putserv "PRIVMSG $nick :example: /msg $botnick translate 5 Peter is tall"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :Translator provided by AltaVista <http://babelfish.altavista.com/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick got translation options list"
		cgi_send $nick "MSG" "babelfish.altavista.com" "80" "translate_list" "GET" "/" "" $translate_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick translated a phrase"
		cgi_send $nick "MSG" "babelfish.altavista.com" "80" "translate_receive" "GET" "/" "" $translate_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc translate_dcc { hand idx arg } {
putlog "#$hand# translate..."
global translate_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx "To translate a phrase: .translate <option#> phrase"
		putdcc $idx "where <option#> is the number to signify how to translate"
		putdcc $idx "To receive a list of options: .translate list"
		putdcc $idx "example: .translate 5 Peter is tall"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Translator provided by AltaVista <http://babelfish.altavista.com/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		cgi_send $idx "DCC" "babelfish.altavista.com" "80" "translate_list" "GET" "/" "" $translate_globals ""
	} elseif { [llength $arg] > 1 } {
		cgi_send $idx "DCC" "babelfish.altavista.com" "80" "translate_receive" "GET" "/" "" $translate_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc translate_receive { idx input } {
global translate_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { $translate_phrase($idx) == "NONE" } {
		if { [string match "" $input] } {
			if { $translate_body($idx) == "NONE" } {
				cgi_reply $translate_nick($idx) $translate_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (translate_receive \0021\002)"
			} else {
				set translate_body($idx) [string range $translate_body($idx) 4 end]
				regsub -all -nocase "<br>" $translate_body($idx) "" translate_body($idx)
				cgi_reply $translate_nick($idx) $translate_retr($idx) [lindex [strtoirc $translate_body($idx)] 0]
			}
		} elseif { $translate_nerr($idx) == "NONE" } {
			if { [string match "*Server Error*" $input] } {
				set translate_nerr($idx) "SERR"
				set translate_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*colspan=2*" $input] } {
				set translate_nerr($idx) "BEGIN"
			}
		} elseif { $translate_nerr($idx) == "BEGIN" } {
			if { [string match "*Server Error*" $input] } {
				set translate_nerr($idx) "SERR"
				set translate_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*</table>*" $input] } {
				set translate_nerr($idx) "STOP"
			} else {
				append translate_body($idx) $input
			}
		}
	} else {
		if { [string match "" $input] } {
			if { $translate_body($idx) == "NONE" } {
				cgi_reply $translate_nick($idx) $translate_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (translate_receive \0022\002)"
			} else {
				set tmpform [formtocgi $translate_body($idx) $translate_option($idx) $translate_phrase($idx)]
				cgi_send $translate_nick($idx) $translate_retr($idx) "babelfish.altavista.com" "80" "translate_receive" [lindex $tmpform 0] [lindex $tmpform 1] [lindex $tmpform 2] $translate_globals ""
			}
		} elseif { $translate_nerr($idx) == "NONE" } {
			if { [string match "*this is a fat error*" $input] } {
				set translate_nerr($idx) "WTF"
				set translate_body($idx) "ERROR, bitch to strobe! (translate_receive)"
			} elseif { [string match "*<form*" $input] } {
				append translate_body($idx) $input
				set translate_nerr($idx) "BEGIN"
			}
		} elseif { $translate_nerr($idx) == "BEGIN" } {
			if { [string match "*this is a fat error*" $input] } {
				set translate_nerr($idx) "WTF"
				set translate_body($idx) "ERROR, bitch to strobe! (translate_receive)"
			} elseif { [string match "*</form>*" $input] } {
				append translate_body($idx) $input
				set translate_nerr($idx) "STOP"
			} else {
				append translate_body($idx) $input
			}
		}
	}
}

proc translate_list { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		if { $translate_body($idx) == "NONE" } {
			cgi_reply $translate_nick($idx) $translate_retr($idx) "\002ERROR:\002 Bad URL, bitch to strobe"
		} else {
			cgi_reply $translate_nick($idx) $translate_retr($idx) [selecttolist $translate_body($idx)]
		}
	} elseif { $translate_nerr($idx) == "NONE" } {
		if { [string match "*this is a fat error**" $input] } {
			set translate_nerr($idx) "WTF"
			append translate_body($idx) "ERROR, bitch to strobe! (translate_list)"
		} elseif { [string match "*<select*" $input] || [string match "*<option*" $input] } {
			append translate_body($idx) $input
		} elseif { [string match "*</select>*" $input] } {
			append translate_body($idx) $input
			set translate_nerr($idx) "STOP"
		}
	}
}

#--------------- cgi_bible.tcl cut here ---------------------
#cgi_bible.tcl version 1.0
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#bible search

#1.0 First working version

##"bible" binds##
bind pub - !bible bible_pub

bind msg - bible bible_msg

bind dcc - bible bible_dcc

array set chatcmds "bible bible_dcc"

##"bible" globals##
set bible_nick() ""

set bible_retr() ""

set bible_body() ""

set bible_option() ""

set bible_phrase() ""

set bible_nerr() ""

set bible_globals "bible_nick bible_retr bible_body bible_option bible_phrase bible_nerr"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"bible" functions##
proc bible_pub { nick uhost handle channel arg } {
global bible_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got bible help"
		putserv "NOTICE $nick :To search for verses: !bible <bible#> phrase"
		putserv "NOTICE $nick :where <bible#> is the number to signify the version of bible"
		putserv "NOTICE $nick :To receive a list of bibles: !bible list"
		putserv "NOTICE $nick :example: !bible 4 the meek shall inherit"
		putserv "NOTICE $nick :If over 10 results, a summary list will be given"
		putserv "NOTICE $nick :CAUTION: Site is often slow/bogged, complain to GCN"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :bibles provided by The Gospel Communications Network <http://www.gospelcom.net/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick on $channel got bible list"
		cgi_send $nick "NOTICE" "bible.gospelcom.net" "80" "bible_list" "GET" "/cgi-bin/bible" "" $bible_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick on $channel searched for a verse"
		cgi_send $nick "NOTICE" "bible.gospelcom.net" "80" "bible_receive" "GET" "/cgi-bin/bible" "" $bible_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc bible_msg { nick uhost handle arg } {
global botnick
global bible_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got bible help"
		putserv "PRIVMSG $nick :To search for verses: /msg $botnick bible <bible#> phrase"
		putserv "PRIVMSG $nick :where <bible#> is the number to signify the version of bible"
		putserv "PRIVMSG $nick :To receive a list of bibles: /msg $botnick bible list"
		putserv "PRIVMSG $nick :example: /msg $botnick bible 4 the meek shall inherit"
		putserv "PRIVMSG $nick :If over 10 results, a summary list will be given"
		putserv "PRIVMSG $nick :CAUTION: Site is often slow/bogged, complain to GCN"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :bibles provided by The Gospel Communications Network <http://www.gospelcom.net/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick got bible list"
		cgi_send $nick "MSG" "bible.gospelcom.net" "80" "bible_list" "GET" "/cgi-bin/bible" "" $bible_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick searched for a verse"
		cgi_send $nick "MSG" "bible.gospelcom.net" "80" "bible_receive" "GET" "/cgi-bin/bible" "" $bible_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc bible_dcc { hand idx arg } {
putlog "#$hand# bible..."
global bible_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx "To search for verses: .bible <bible#> phrase"
		putdcc $idx "where <bible#> is the number to signify the version of bible"
		putdcc $idx "To receive a list of bibles: .bible list"
		putdcc $idx "example: .bible 4 the meek shall inherit"
		putdcc $idx "If over 10 results, a summary list will be given"
		putdcc $idx "CAUTION: Site is often slow/bogged, complain to GCN"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "bibles provided by The Gospel Communications Network <http://www.gospelcom.net/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		cgi_send $idx "DCC" "bible.gospelcom.net" "80" "bible_list" "GET" "/cgi-bin/bible" "" $bible_globals ""
	} elseif { [llength $arg] > 1 } {
		cgi_send $idx "DCC" "bible.gospelcom.net" "80" "bible_receive" "GET" "/cgi-bin/bible" "" $bible_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc bible_receive { idx input } {
global bible_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { $bible_phrase($idx) == "NONE" } {
		if { [string match "" $input] } {
			if { $bible_body($idx) == "NONE" } {
				cgi_reply $bible_nick($idx) $bible_retr($idx) "\002ERROR:\002 Probably slow/bogged server, complain to GCN, try query again"
			} else {
				set bible_body($idx) [string range $bible_body($idx) 4 end]
				foreach line [strtoirc $bible_body($idx)] {
					cgi_reply $bible_nick($idx) $bible_retr($idx) $line
				}
			}
		} elseif { $bible_nerr($idx) == "NONE" } {
			if { [string match "*Server Error*" $input] } {
				set bible_nerr($idx) "SERR"
				set bible_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*Found no matches*" $input] } {
				set bible_nerr($idx) "NMATCH"
				append bible_body($idx) $input
			} elseif { [string match "*<H1>*" $input] } {
				append bible_body($idx) $input
				set bible_nerr($idx) "BEGIN"
			}
		} elseif { $bible_nerr($idx) == "BEGIN" } {
			if { [string match "*Server Error*" $input] } {
				set bible_nerr($idx) "SERR"
				set bible_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*<hr><TABLE>*" $input] } {
				append bible_body($idx) $input
				set bible_nerr($idx) "STOP"
			} else {
				append bible_body($idx) $input
			}
		}
	} else {
		if { [string match "" $input] } {
			if { $bible_body($idx) == "NONE" } {
				cgi_reply $bible_nick($idx) $bible_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (bible_receive \0022\002)"
			} else {
				set tmpform [formtocgi $bible_body($idx) "$bible_option($idx) 0 1 1" "{} {$bible_phrase($idx)} {} 10"]
				cgi_send $bible_nick($idx) $bible_retr($idx) "bible.gospelcom.net" "80" "bible_receive" [lindex $tmpform 0] [lindex $tmpform 1] [lindex $tmpform 2] $bible_globals ""
			}
		} elseif { $bible_nerr($idx) == "NONE" } {
			if { [string match "*this is a fat error*" $input] } {
				set bible_nerr($idx) "WTF"
				set bible_body($idx) "ERROR, bitch to strobe! (bible_receive)"
			} elseif { [string match "*<FORM*" $input] } {
				append bible_body($idx) $input
				set bible_nerr($idx) "BEGIN"
			}
		} elseif { $bible_nerr($idx) == "BEGIN" } {
			if { [string match "*this is a fat error*" $input] } {
				set bible_nerr($idx) "WTF"
				set bible_body($idx) "ERROR, bitch to strobe! (bible_receive)"
			} elseif { [string match "*</FORM>*" $input] } {
				append bible_body($idx) $input
				set bible_nerr($idx) "STOP"
			} else {
				append bible_body($idx) $input
			}
		}
	}
}

proc bible_list { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		if { $bible_body($idx) == "NONE" } {
			cgi_reply $bible_nick($idx) $bible_retr($idx) "\002ERROR:\002 Bad URL, bitch to strobe"
		} else {
			cgi_reply $bible_nick($idx) $bible_retr($idx) [selecttolist $bible_body($idx)]
		}
	} elseif { $bible_nerr($idx) == "NONE" } {
		if { [string match "*this is a fat error**" $input] } {
			set bible_nerr($idx) "WTF"
			append bible_body($idx) "ERROR, bitch to strobe! (bible_list)"
		} elseif { [string match "*<SELECT*" $input] || [string match "*<OPTION*" $input] } {
			append bible_body($idx) $input
		} elseif { [string match "*</SELECT>*" $input] } {
			append bible_body($idx) $input
			set bible_nerr($idx) "STOP"
		}
	}
}

#The Bible Gateway(TM) is a service of The Gospel Communications Network (GCN)
#A ministry of Gospel Films, Inc
       
#--------------- cgi_quotes.tcl cut here ---------------------
#cgi_quotes.tcl version 1.0
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl

#1.0 First working version

##"quotes" binds##
bind pub - !quotes quotes_pub

bind msg - quotes quotes_msg

bind dcc - quotes quotes_dcc

array set chatcmds "quotes quotes_dcc"

##"quotes" globals##
set quotes_nick() ""

set quotes_retr() ""

set quotes_body() ""

set quotes_option() ""

set quotes_phrase() ""

set quotes_nerr() ""

set quotes_globals "quotes_nick quotes_retr quotes_body quotes_option quotes_phrase quotes_nerr"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"quotes" functions##
proc quotes_pub { nick uhost handle channel arg } {
global quotes_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick on $channel got quotes help"
		putserv "NOTICE $nick :To search for a quote: !quotes <collection#> phrase"
		putserv "NOTICE $nick :where <collection#> is the number to signify the collection list selection"
		putserv "NOTICE $nick :To receive a list of collections: !quotes list"
		putserv "NOTICE $nick :To receive some random quotes: !quotes rand"
		putserv "NOTICE $nick :example: !quotes 1 remove all doubt"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :Quotes provided by The Quotations Page <http://www.starlingtech.com/quotes/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick on $channel got collections list"
		cgi_send $nick "NOTICE" "www.starlingtech.com" "80" "quotes_list" "GET" "/quotes/search.html" "" $quotes_globals ""
	} elseif { [string tolower [lindex $arg 0]] == "rand" } {
		putlog "$nick on $channel got some random quotes"
		cgi_send $nick "NOTICE" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/randquote.cgi" "" $quotes_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick on $channel searched for a quote"
		cgi_send $nick "NOTICE" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/search.html" "" $quotes_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc quotes_msg { nick uhost handle arg } {
global botnick
global quotes_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got quotes help"
		putserv "PRIVMSG $nick :To search for a quote: /msg $botnick quotes <collection#> phrase"
		putserv "PRIVMSG $nick :where <collection#> is the number to signify the collection list selection"
		putserv "PRIVMSG $nick :To receive a list of collections: /msg $botnick quotes list"
		putserv "PRIVMSG $nick :To receive some random quotes: /msg $botnick quotes rand"
		putserv "PRIVMSG $nick :example: /msg $botnick quotes 1 remove all doubt"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :Quotes provided by The Quotations Page <http://www.starlingtech.com/quotes/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		putlog "$nick got collections list"
		cgi_send $nick "MSG" "www.starlingtech.com" "80" "quotes_list" "GET" "/quotes/search.html" "" $quotes_globals ""
	} elseif { [string tolower [lindex $arg 0]] == "rand" } {
		putlog "$nick got some random quotes"
		cgi_send $nick "MSG" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/randquote.cgi" "" $quotes_globals ""
	} elseif { [llength $arg] > 1 } {
		putlog "$nick searched for a quote"
		cgi_send $nick "MSG" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/search.html" "" $quotes_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc quotes_dcc { hand idx arg } {
putlog "#$hand# quotes..."
global quotes_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx "To search for a quote: .quotes <collection#> phrase"
		putdcc $idx "where <collection#> is the number to signify the collection list selection"
		putdcc $idx "To receive a list of collections: .quotes list"
		putdcc $idx "To receive some random quotes: .quotes rand"
		putdcc $idx "example: .quotes 1 remove all doubt"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Quotes provided by The Quotations Page <http://www.starlingtech.com/quotes/>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		cgi_send $idx "DCC" "www.starlingtech.com" "80" "quotes_list" "GET" "/quotes/search.html" "" $quotes_globals ""
	} elseif { [string tolower [lindex $arg 0]] == "rand" } {
		cgi_send $idx "DCC" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/randquote.cgi" "" $quotes_globals ""
	} elseif { [llength $arg] > 1 } {
		cgi_send $idx "DCC" "www.starlingtech.com" "80" "quotes_receive" "GET" "/quotes/search.html" "" $quotes_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc quotes_receive { idx input } {
global quotes_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { $quotes_phrase($idx) == "NONE" } {
		if { [string match "" $input] } {
			if { $quotes_body($idx) == "NONE" } {
				cgi_reply $quotes_nick($idx) $quotes_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (quotes_receive \0021\002)"
			} else {
				set quotes_body($idx) [string range $quotes_body($idx) 4 end]
				regsub -nocase "<DT>" $quotes_body($idx) "" quotes_body($idx)
				regsub -all -nocase "<DT>" $quotes_body($idx) "<br>" quotes_body($idx)
				regsub -all -nocase "<DD>" $quotes_body($idx) "" quotes_body($idx)
				regsub -all -nocase "<P>" $quotes_body($idx) "" quotes_body($idx)
				foreach line [strtoirc $quotes_body($idx)] {
					cgi_reply $quotes_nick($idx) $quotes_retr($idx) $line
				}
			}
		} elseif { $quotes_nerr($idx) == "NONE" } {
			if { [string match "*Server Error*" $input] } {
				set quotes_nerr($idx) "SERR"
				set quotes_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*Found no matches*" $input] } {
				set quotes_nerr($idx) "NMATCH"
				append quotes_body($idx) $input
			} elseif { [string match "*<DL>*" $input] } {
				set quotes_nerr($idx) "BEGIN"
			}
		} elseif { $quotes_nerr($idx) == "BEGIN" } {
			if { [string match "*Server Error*" $input] } {
				set quotes_nerr($idx) "SERR"
				set quotes_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*</DL>*" $input] } {
				set quotes_nerr($idx) "STOP"
			} else {
				append quotes_body($idx) $input
			}
		}
	} else {
		if { [string match "" $input] } {
			if { $quotes_body($idx) == "NONE" } {
				cgi_reply $quotes_nick($idx) $quotes_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (quotes_receive \0022\002)"
			} else {
				set tmpform [formtocgi $quotes_body($idx) $quotes_option($idx) $quotes_phrase($idx)]
				cgi_send $quotes_nick($idx) $quotes_retr($idx) "www.starlingtech.com" "80" "quotes_receive" [lindex $tmpform 0] "/quotes/[lindex $tmpform 1]" [lindex $tmpform 2] $quotes_globals ""
			}
		} elseif { $quotes_nerr($idx) == "NONE" } {
			if { [string match "*this is a fat error*" $input] } {
				set quotes_nerr($idx) "WTF"
				set quotes_body($idx) "ERROR, bitch to strobe! (quotes_receive)"
			} elseif { [string match "*<FORM*" $input] } {
				append quotes_body($idx) $input
				set quotes_nerr($idx) "BEGIN"
			}
		} elseif { $quotes_nerr($idx) == "BEGIN" } {
			if { [string match "*this is a fat error*" $input] } {
				set quotes_nerr($idx) "WTF"
				set quotes_body($idx) "ERROR, bitch to strobe! (quotes_receive)"
			} elseif { [string match "*</FORM>*" $input] } {
				append quotes_body($idx) $input
				set quotes_nerr($idx) "STOP"
			} else {
				append quotes_body($idx) $input
			}
		}
	}
}

proc quotes_list { idx input } {
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		if { $quotes_body($idx) == "NONE" } {
			cgi_reply $quotes_nick($idx) $quotes_retr($idx) "\002ERROR:\002 Bad URL, bitch to strobe"
		} else {
			cgi_reply $quotes_nick($idx) $quotes_retr($idx) [selecttolist $quotes_body($idx)]
		}
	} elseif { $quotes_nerr($idx) == "NONE" } {
		if { [string match "*this is a fat error**" $input] } {
			set quotes_nerr($idx) "WTF"
			append quotes_body($idx) "ERROR, bitch to strobe! (quotes_list)"
		} elseif { [string match "*<select*" $input] || [string match "*<option*" $input] } {
			append quotes_body($idx) $input
		} elseif { [string match "*</select>*" $input] } {
			append quotes_body($idx) $input
			set quotes_nerr($idx) "STOP"
		}
	}
}


#--------------- cgi_russian.tcl cut here ---------------------
#cgi_russian.tcl version 1.0
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#Translates english to russian

#1.0 First working version

##"russian" binds##
bind dcc - russian russian_dcc

array set chatcmds "russian russian_dcc"

##"russian" globals##
set russian_nick() ""

set russian_retr() ""

set russian_body() ""

set russian_option() ""

set russian_phrase() ""

set russian_nerr() ""

set russian_globals "russian_nick russian_retr russian_body russian_option russian_phrase russian_nerr"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"russian" functions##
proc russian_dcc { hand idx arg } {
putlog "#$hand# russian..."
global russian_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx "To translate a word to Russian: .russian <option#> word"
		putdcc $idx "where <option#> is the number to signify what non-ascii code table to use"
		putdcc $idx "To receive a list of codes: .russian list"
		putdcc $idx "example: .russian 2 dance"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Translator provided by <http://www.sigma.net/stas/engrus>"
	} elseif { [string tolower [lindex $arg 0]] == "list" } {
		cgi_send $idx "DCC" "www.sigma.net" "80" "russian_receive" "GET" "/stas/engrus" "" $russian_globals "list"
	} elseif { [llength $arg] > 1 } {
		cgi_send $idx "DCC" "www.sigma.net" "80" "russian_receive" "GET" "/stas/engrus" "" $russian_globals "[lindex $arg 0] [strtocgi [lrange $arg 1 end]]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc russian_receive { idx input } {
global russian_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { $russian_option($idx) == "NONE" } {
		if { [string match "" $input] } {
			if { $russian_body($idx) == "NONE" } {
				cgi_reply $russian_nick($idx) $russian_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (russian_receive \0021\002)"
			} else {
				set russian_body($idx) [string range $russian_body($idx) 4 end]
				regsub -nocase "<DT>" $russian_body($idx) "" russian_body($idx)
				regsub -all -nocase "<DT>" $russian_body($idx) "<br>" russian_body($idx)
				regsub -all -nocase "<DD>" $russian_body($idx) "" russian_body($idx)
				regsub -all -nocase "</DL>" $russian_body($idx) "" russian_body($idx)
				foreach line [strtoirc $russian_body($idx)] {
					cgi_reply $russian_nick($idx) $russian_retr($idx) $line
				}
			}
		} elseif { $russian_nerr($idx) == "NONE" } {
			if { [string match "*Server Error*" $input] } {
				set russian_nerr($idx) "SERR"
				set russian_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*<DL>*" $input] } {
				set russian_nerr($idx) "BEGIN"
			}
		} elseif { $russian_nerr($idx) == "BEGIN" } {
			if { [string match "*Server Error*" $input] } {
				set russian_nerr($idx) "SERR"
				set russian_body($idx) "    \002Server Error\002, perhaps try again?"
			} elseif { [string match "*</DL>*" $input] } {
				append russian_body($idx) $input
				set russian_nerr($idx) "STOP"
			} else {
				append russian_body($idx) $input
			}
		}
	} else {
		if { [string match "" $input] } {
			if { $russian_body($idx) == "NONE" } {
				cgi_reply $russian_nick($idx) $russian_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (russian_receive \0022\002)"
			} elseif { $russian_option($idx) == "list" } {
				cgi_reply $russian_nick($idx) $russian_retr($idx) [selecttolist $russian_body($idx)]
			} else {
				set tmpform [formtocgi $russian_body($idx) $russian_option($idx) $russian_phrase($idx)]
				cgi_send $russian_nick($idx) $russian_retr($idx) "www.sigma.net" "80" "russian_receive" [lindex $tmpform 0] "/stas/engrus" [lindex $tmpform 2] $russian_globals ""
			}
		} elseif { $russian_nerr($idx) == "NONE" } {
			if { [string match "*this is a fat error*" $input] } {
				set russian_nerr($idx) "WTF"
				set russian_body($idx) "ERROR, bitch to strobe! (russian_receive)"
			} elseif { [string match "*<FORM*" $input] } {
				append russian_body($idx) $input
				set russian_nerr($idx) "BEGIN"
			}
		} elseif { $russian_nerr($idx) == "BEGIN" } {
			if { [string match "*this is a fat error*" $input] } {
				set russian_nerr($idx) "WTF"
				set russian_body($idx) "ERROR, bitch to strobe! (russian_receive)"
			} elseif { [string match "*</FORM>*" $input] } {
				append russian_body($idx) $input
				set russian_nerr($idx) "STOP"
			} else {
				append russian_body($idx) $input
			}
		}
	}
}

#--------------- cgi_siskel.tcl cut here ---------------------
#cgi_siskel.tcl version 1.1
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl

#1.0 First version
#1.1 strtoirc now handles alt=

##"siskel" binds##
bind pub - !siskel siskel_pub

bind msg - siskel siskel_msg

bind dcc - siskel siskel_dcc

array set chatcmds "siskel siskel_dcc"

##"siskel" globals##
set siskel_nick() ""

set siskel_retr() ""

set siskel_body() ""

set siskel_nerr() ""

set siskel_refuse() ""

set siskel_html() ""

set siskel_globals "siskel_nick siskel_retr siskel_body siskel_nerr siskel_refuse siskel_html"

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"siskel" functions##
proc siskel_pub { nick uhost handle channel arg } {
global siskel_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick on $channel got siskel help"
		putserv "NOTICE $nick :To get a movie rating: !siskel movie"
		putserv "NOTICE $nick :example: !siskel dances with wolves"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :Ratings provided by Buena Vista/Touchstone Television:"
		putserv "NOTICE $nick :<http://www.tvplex.com/BuenaVista/SiskelAndEbert/>"
	} elseif { [llength $arg] > 0} {
		putlog "$nick on $channel Got a movie review"
		cgi_send $nick "NOTICE" "apps.tvplex.com" "80" "siskel_receive" "GET" "/SiskelAndEbert/tutd.cgi" "frame=0&title=[strtocgi $arg]&swas=all&PROCESS=Find%20My%20Film%21&detect=no" $siskel_globals ""
	} else {
		putserv "NOTICE $nick :\002Bad syntax!"
	}
}

proc siskel_msg { nick uhost handle arg } {
global botnick
global siskel_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putlog "$nick got siskel help"
		putserv "PRIVMSG $nick :To get a movie rating: /msg $botnick siskel movie"
		putserv "PRIVMSG $nick :example: /msg $botnick siskel dances with wolves"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :Ratings provided by Buena Vista/Touchstone Television:"
		putserv "PRIVMSG $nick :<http://www.tvplex.com/BuenaVista/SiskelAndEbert/>"
	} elseif { [llength $arg] > 0} {
		putlog "$nick Got a movie review"
		cgi_send $nick "MSG" "apps.tvplex.com" "80" "siskel_receive" "GET" "/SiskelAndEbert/tutd.cgi" "frame=0&title=[strtocgi $arg]&swas=all&PROCESS=Find%20My%20Film%21&detect=no" $siskel_globals ""
	} else {
		putserv "PRIVMSG $nick :\002Bad syntax!"
	}
}

proc siskel_dcc { hand idx arg } {
putlog "#$hand# siskel..."
global siskel_globals
	if { ([lindex $arg 0] == "") } {
		putdcc $idx "To get a movie rating: .siskel movie"
		putdcc $idx "example: .siskel dances with wolves"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Ratings provided by Buena Vista/Touchstone Television:"
		putdcc $idx "<http://www.tvplex.com/BuenaVista/SiskelAndEbert/>"
	} elseif { [llength $arg] > 0 } {
		cgi_send $idx "DCC" "apps.tvplex.com" "80" "siskel_receive" "GET" "/SiskelAndEbert/tutd.cgi" "frame=0&title=[strtocgi $arg]&swas=all&PROCESS=Find%20My%20Film%21&detect=no" $siskel_globals ""
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc siskel_receive { idx input } {
global siskel_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { [string match "" $input] } {
		while { [string match "*gif\">*" $siskel_html($idx)] } {
			append siskel_body($idx) "<br>"
			append siskel_body($idx) [string range $siskel_html($idx) [string first "<B>" $siskel_html($idx)] [expr [string first "<BR>" $siskel_html($idx)] -1]]
			append siskel_body($idx) ":</b> "
			append siskel_body($idx) [string range $siskel_html($idx) [string first "<IMG" $siskel_html($idx)] [expr [string first "gif\">" $siskel_html($idx)] +4]]
			set siskel_html($idx) [string range $siskel_html($idx) [expr [string first "gif\">" $siskel_html($idx)] +4] end]
		}
		if { $siskel_body($idx) == "NONE" } {
			cgi_reply $siskel_nick($idx) $siskel_retr($idx) "\002ERROR:\002 Probably bad programmer, bitch to strobe (siskel_receive)"
		} else {
			set siskel_body($idx) [string range $siskel_body($idx) 4 end]
			foreach line [strtoirc $siskel_body($idx)] {
				cgi_reply $siskel_nick($idx) $siskel_retr($idx) $line
			}
		}
	} elseif { $siskel_nerr($idx) == "NONE" } {
		if { [string match "*Server Error*" $input] } {
			set siskel_nerr($idx) "SERR"
			set siskel_body($idx) "    \002Server Error\002, perhaps try again?"
		} elseif { [string match "*No matches were found*" $input] } {
			set siskel_nerr($idx) "NMATCH"
			append siskel_body($idx) $input
		} elseif { [string match "*<CENTER><FONT*" $input] } {
			set siskel_nerr($idx) "BEGIN"
			append siskel_html($idx) $input
		}
	} elseif { $siskel_nerr($idx) == "BEGIN" } {
		if { [string match "*<OBJECT*" $input] } {
			set siskel_nerr($idx) "NONE"
		} else {
			append siskel_html($idx) $input
		}
	}
}

# Buena Vista/Touchstone Television. All rights reserved.

#--------------- cgi_debug.tcl cut here ---------------------
#cgi_debug.tcl version 1.5
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl

#1.0 First version
#1.1 Added strtoirc to remove comments
#1.2 Got rid of putlogs for putdccs
#1.3 Added 'dump' after cgi_receive and strtoirc improved
#1.4 Removed strtoirc |-p
#1.5 Added form submission

##"cgidebug" binds##
bind dcc - cgidebug cgidebug_dcc

array set chatcmds "cgidebug cgidebug_dcc"

##"cgidebug" globals##
set cgidebug_nick() ""

set cgidebug_retr() ""

set cgidebug_body() ""

set cgidebug_option() ""

set cgidebug_fl() ""

set cgidebug_server() ""

set cgidebug_selectlist() ""

set cgidebug_textlist() ""

set cgidebug_nerr() ""

set cgidebug_padding() ""

set cgidebug_form() ""

set cgidebug_globals "cgidebug_nick cgidebug_retr cgidebug_body cgidebug_option cgidebug_fl cgidebug_server cgidebug_selectlist cgidebug_textlist cgidebug_padding cgidebug_nerr cgidebug_form"

##"cgidebug" functions##
proc cgidebug_dcc { hand idx arg } {
putlog "#$hand# cgidebug..."
global cgidebug_globals
	if { ([lindex $arg 0] == "") || ([string tolower [lindex $arg 0]] == "help") } {
		putdcc $idx ".cgidebug <#> url"
		putdcc $idx "url must have path viz. \"/\""
		putdcc $idx "To debug forms use 0 for <#> first, then the number of the form to examine"
		putdcc $idx "To submit a form: .cgidebug <#> url \"{<selectlist>}\" \"{<textlist>}\""
		putdcc $idx "To view semi-formatted page use \"dump\" for <#>"
		putdcc $idx "Programmed by \002\026\037STROBE"
	} elseif { [string match "http://*" [string tolower [lindex $arg 1]]] && [string tolower [lindex $arg 0]] == "dump" } {
		set temp [infofromurl [lindex $arg 1]]
		cgi_send $idx "DCC" [lindex $temp 0] [lindex $temp 1] "cgi_receive" "GET" [lindex $temp 2] "" $cgidebug_globals "[lindex $arg 0] 0 [lindex $temp 0]"
	} elseif { [string match "http://*" [string tolower [lindex $arg 1]]] } {
		set temp [infofromurl [lindex $arg 1]]
		cgi_send $idx "DCC" [lindex $temp 0] [lindex $temp 1] "cgidebug_receive" "GET" [lindex $temp 2] "" $cgidebug_globals "[lindex $arg 0] 0 [lindex $temp 0] [lindex $arg 2] [lindex $arg 3]"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc cgidebug_receive { idx input } {
global cgidebug_globals
global cgi_globals
set globals $cgi_globals($idx)
foreach gvar $globals {
	global "$gvar"
}
	if { $input == "" } {
cgi_reply $cgidebug_nick($idx) $cgidebug_retr($idx) "Finished downloading"
		if { $cgidebug_body($idx) != "NONE" } {
			cgi_reply $cgidebug_nick($idx) $cgidebug_retr($idx) "\002hrm, this is odd:\002 $cgidebug_body($idx)"
		} elseif { $cgidebug_option($idx) == 0 } {
			cgi_reply $cgidebug_nick($idx) $cgidebug_retr($idx)  "Number of <forms>: $cgidebug_fl($idx)"
		} elseif { $cgidebug_selectlist($idx) != "NONE" } {
			if { $cgidebug_textlist($idx) == "NONE" } {
				cgi_reply $cgidebug_nick($idx) $cgidebug_retr($idx) "You need a list for both <selectlist> and <textlist> to send a form"
			} else {
			set form $cgidebug_form($idx:$cgidebug_option($idx))
			while { [string match "*<!--*-->*" [string tolower $form]] } {
				set beg [string range $form 0 [expr [string first "<!--" [string tolower $form]] -1 ]]
				set latter [string range $form [string first "<!--" [string tolower $form]] end]
				set cut [string range $latter 0 [expr [string first "-->" [string tolower $latter]] +2]]
				set end [string range $form [string length "$beg$cut"] end]
				set form "$beg$end"
			}
				set tmpform [formtocgi $form $cgidebug_selectlist($idx) $cgidebug_textlist($idx)]
				set tmpinfo [infofromurl [lindex $tmpform 1]]
				if { [lindex $tmpinfo 0] == "" } {
					cgi_send $cgidebug_nick($idx) $cgidebug_retr($idx) $cgidebug_server($idx) [lindex $tmpinfo 1] "cgi_receive" [lindex $tmpform 0] [lindex $tmpinfo 2] [lindex $tmpform 2] $cgidebug_globals ""
				} else {
					cgi_send $cgidebug_nick($idx) $cgidebug_retr($idx) [lindex $tmpinfo 0] [lindex $tmpinfo 1] "cgi_receive" [lindex $tmpform 0] [lindex $tmpinfo 2] [lindex $tmpform 2] $cgidebug_globals ""
				}
			}
		} else {
			set form $cgidebug_form($idx:$cgidebug_option($idx))
			while { [string match "*<!--*-->*" [string tolower $form]] } {
				set beg [string range $form 0 [expr [string first "<!--" [string tolower $form]] -1 ]]
				set latter [string range $form [string first "<!--" [string tolower $form]] end]
				set cut [string range $latter 0 [expr [string first "-->" [string tolower $latter]] +2]]
				set end [string range $form [string length "$beg$cut"] end]
				set form "$beg$end"
			}
			foreach line [split [listfromvars $form] "\n"] {
				cgi_reply $cgidebug_nick($idx) $cgidebug_retr($idx) $line
			}
			
		}
	} else {
		if { $cgidebug_nerr($idx) == "NONE" } {
			if { [string match "*http*" [string tolower $input]] } {
				if { [string match "*200*" $input] } {
					set cgidebug_nerr($idx) "NFORM"
				} else {
					set cgidebug_body($idx) "\002$input"
					set cgidebug_nerr($idx) "BAD"
				}
			} elseif { [string match "*content-type*" [string tolower $input]] } {
					set cgidebug_body($idx) "\002WTF? no HTTP!"
			}
		} elseif { $cgidebug_nerr($idx) == "NFORM" } {
			if { [string match "*error*" [string tolower $input]] } {
				set cgidebug_body($idx) "\002Error detected"
				set cgidebug_nerr($idx) "ERR"
			} elseif { [string match "*<form*" [string tolower $input]] } {
				set cgidebug_fl($idx) [expr $cgidebug_fl($idx) + 1]
				if { [string match "*</form>*" [string tolower $input]] } {
					set cgidebug_form($idx:$cgidebug_fl($idx)) $cgidebug_body($idx)
				} else {
					set cgidebug_body($idx) $input
					set cgidebug_nerr($idx) "FORM"
				}
			}
		} elseif { $cgidebug_nerr($idx) == "FORM" } {
			if { [string match "*</form>*" [string tolower $input]] } {
				append cgidebug_body($idx) $input
				set cgidebug_nerr($idx) "NFORM"
				set cgidebug_form($idx:$cgidebug_fl($idx)) $cgidebug_body($idx)
				set cgidebug_body($idx) "NONE"
			} else {
				append cgidebug_body($idx) $input
			}
		}
	}
}

#--------------- cgi_define.tcl cut here ---------------------
#cgi_define.tcl version 1.11
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#cgi_define.tcl is a Dictionary, Thesaurus, and wildcard search in one!
#special thanx to Tris for help on http, CGI, and eggdrop control
#Uses the Merriam Webster server at http://www.m-w.com/dictionary
#Pray that Merriam Webster doesn't change their CGI

#1.0b1 Released to a few select people
#1.0  First public release
#1.1  Fixed large definitions bug (does not check for text style)
#1.2  Removed <sub>, <sup> html tag; define_webfault bug fixed; 
#1.3  After more than a year of neglect, it's back and more stable than EVER. Works with any eggdrop
#1.4  major bugs fixed, extra comments. Known bugs linger
#1.5  Fixed the splitting-bold words bug. 
#1.6  Uses cgi.tcl common functions
#1.7  Bugs squashed! Now alternate words are matched
#1.8  Now uses formstocgi proc to create queries. This eliminated the misspell bug and made the script more rubust
#1.9  Now uses selecttolist instead of custom list function
#1.10 Now uses standard function names
#1.11 Fixed hung 2

#NO MORE AUTONOMOUS VERSIONS
#delete any distributions of define.tcl. Distribute cgi.tcl instead.

##"define" binds##
bind pub - !define define_pub

bind msg - define define_msg

bind dcc - define define_dcc

array set chatcmds "define define_dcc"

##"define" globals##
#use define_ for global variables so no conflicts
#list of words returned
set define_weblist() ""

#html form
set define_webform() ""

#definition of word
set define_webdef() ""

#error page
set define_webfault() ""

#Boolean: 0 if Dictionary, 1 if Thesaurus
set define_thesaurus() ""

#List of list selections. [lindex define_number($idx) 0] for current list selection
set define_number() ""

#Method of eggdrop reply. DCC, MSG, NOTICE
set define_method() ""

#Word that was searched for
set define_hdwd() ""

#nickname or channel to send reply to (idx if dcc)
set define_sendnick() ""

#html parsing (mainly tables)
set define_delcrap() ""

#define globals list (yes, order DOES count!)
set define_globals "define_sendnick define_method define_webdef define_hdwd define_thesaurus define_number define_delcrap define_weblist define_webform define_webfault"


######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"define" functions##
proc define_pub { nick uhost handle channel arg } {
putlog "$nick searched Webster on $channel"
global define_globals
	if { [lindex $arg 0] == "" } {
		putserv "NOTICE $nick :To search Dictionary: !define <keyword> (may use wildcards \* and \?)"
		putserv "NOTICE $nick :To search Thesaurus: !define <keyword> T"
		putserv "NOTICE $nick :To search two words: !define <dump+truck>"
		putserv "NOTICE $nick :After search: !define <keyword> <selection> (may make recursive selections)"
		putserv "NOTICE $nick :Example: \"!define d?m\* t 2 1\" Would search for d?m\* in the Thesaurus, select the second element (perhaps 'damage'), then select the first element of that result"
		putserv "NOTICE $nick :Programmed by \002\026\037STROBE"
		putserv "NOTICE $nick :Dictionary and Thesaurus provided by Merriam Webster <http://www.m-w.com/dictionary>"
	} elseif { [lindex $arg 1] == "" } {
		cgi_send $nick "NOTICE" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=$arg" $define_globals "$arg 0 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 1]] && ![string match "\[Tt\]" [lindex $arg [expr [llength $arg] -1]]] } {
		cgi_send $nick "NOTICE" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 0 {[lrange $arg 1 [expr [llength $arg] -1]]} 0"
	} elseif { ![string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $nick "NOTICE" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $nick "NOTICE" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {[lrange $arg 2 [expr [llength $arg] -1]]} 0"
	} else {
		putserv "NOTICE $nick :\002Bad toggle!"
	}
}


proc define_msg { nick uhost handle arg } {
putlog "$nick searched Webster"
global botnick
global define_globals
	if { [lindex $arg 0] == "" } {
		putserv "PRIVMSG $nick :To search Dictionary: /msg $botnick define <keyword> (may use wildcards \* and \?)"
		putserv "PRIVMSG $nick :To search Thesaurus: /msg $botnick define <keyword> T"
		putserv "PRIVMSG $nick :To search two words: /msg $botnick define <dump+truck>"
		putserv "PRIVMSG $nick :After search: /msg $botnick define <keyword> <selection> (may make recursive selections)"
		putserv "PRIVMSG $nick :Example: \"/msg $botnick define d?m\* t 2 1\" Would search for d?m\* in the Thesaurus, select the second element (perhaps 'damage'), then select the first element of that result"
		putserv "PRIVMSG $nick :Programmed by \002\026\037STROBE"
		putserv "PRIVMSG $nick :Dictionary and Thesaurus provided by Merriam Webster <http://www.m-w.com/dictionary>"
	} elseif { [lindex $arg 1] == "" } {
		cgi_send $nick "MSG" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=$arg" $define_globals "$arg 0 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 1]] && ![string match "\[Tt\]" [lindex $arg [expr [llength $arg] -1]]] } {
		cgi_send $nick "MSG" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 0 {[lrange $arg 1 [expr [llength $arg] -1]]} 0"
	} elseif { ![string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $nick "MSG" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $nick "MSG" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {[lrange $arg 2 [expr [llength $arg] -1]]} 0"
	} else {
		putserv "PRIVMSG $nick :\002Bad toggle!"
	}
}

proc define_dcc { hand idx arg } {
putlog "#$hand# define..."
global define_globals
	if { [lindex $arg 0] == "" } {
		putdcc $idx "To search Dictionary: .define <keyword> (may use wildcards \* and \?)"
		putdcc $idx "To search Thesaurus: .define <keyword> T"
		putdcc $idx "To search two words: .define <dump+truck>"
		putdcc $idx "After search: .define <keyword> <selection> (may make recursive selections)"
		putdcc $idx "Example: \".define d?m\* t 2 1\" Would search for d?m\* in the Thesaurus, select the second element (perhaps 'damage'), then select the first element of that result"
		putdcc $idx "Programmed by \002\026\037STROBE"
		putdcc $idx "Dictionary and Thesaurus provided by Merriam Webster <http://www.m-w.com/dictionary>"
	} elseif { [lindex $arg 1] == "" } {
		cgi_send $idx "DCC" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=$arg" $define_globals "$arg 0 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 1]] && ![string match "\[Tt\]" [lindex $arg [expr [llength $arg] -1]]] } {
		cgi_send $idx "DCC" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/dictionary" "book=Dictionary&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 0 {[lrange $arg 1 [expr [llength $arg] -1]]} 0"
	} elseif { ![string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $idx "DCC" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {} 0"
	} elseif { [string match "*\[0-9\]*" [lindex $arg 2]] && [string match "\[Tt\]" [lindex $arg 1]] } {
		cgi_send $idx "DCC" "www.m-w.com" 80 "define_receive" "POST" "/cgi-bin/thesaurus" "book=Thesaurus&va=[lindex $arg 0]" $define_globals "[lindex $arg 0] 1 {[lrange $arg 2 [expr [llength $arg] -1]]} 0"
	} else {
		putdcc $idx "\002Bad toggle!"
	}
}

proc define_receive { idx input } {
#stupid lindex problem
if {[string match "*loose.dtd*" $input]} {
set input "HTTP/1.1"
}
#globals
global botnick
global define_globals
foreach gvar $define_globals {
	global "$gvar"
}

	if { [string match "" $input] } {
		if { $define_weblist($idx) != "NONE" } {
			if { $define_number($idx) != "NONE" } {
			#get query
				set query [strtocgi [lindex [formtocgi "$define_webform($idx) $define_weblist($idx) </form>" "1 [lindex $define_number($idx) 0]" "" ] 2 ]]
			} else {
				#show choices
				cgi_reply $define_sendnick($idx) $define_method($idx) [selecttolist "$define_webform($idx) $define_weblist($idx)"]
			}
		if { $define_thesaurus($idx) } {
			set location "/cgi-bin/thesaurus"
		} else {
			set location "/cgi-bin/dictionary"
		}
		if { $define_number($idx) != "NONE" } {
			if { [llength $define_number($idx)] == 1 } {
cgi_send $define_sendnick($idx) $define_method($idx) "www.m-w.com" 80 "define_receive" "POST" $location $query $define_globals "$define_hdwd($idx) $define_thesaurus($idx) {} 0 "
			} else {
cgi_send $define_sendnick($idx) $define_method($idx) "www.m-w.com" 80 "define_receive" "POST" $location $query $define_globals "$define_hdwd($idx) $define_thesaurus($idx) {[lrange $define_number($idx) 1 [expr [llength $define_number($idx)] -1]]} 0 "
			}
		}
		} elseif { $define_webdef($idx) != "NONE" } {
			foreach def [strtoirc $define_webdef($idx)] {
				cgi_reply $define_sendnick($idx) $define_method($idx) $def
			}
		} elseif { $define_webfault($idx) != "NONE"} {
				cgi_reply $define_sendnick($idx) $define_method($idx) $define_webfault($idx)
		} else {
				cgi_reply $define_sendnick($idx) $define_method($idx) "ERROR--server busy or strobe's fault, try again"
		}
	} else {
		#list of matches
		#check for first <table> (this is necessary to look for server errors)
		if { !$define_delcrap($idx) && [lindex $input 0] == "<table" } {
		set define_delcrap($idx) 1
		}
		#check for first </table>
		if { $define_delcrap($idx) && [lindex $input 0] == "</table>" } {
		set define_delcrap($idx) 0
		}
		#yea yea, the last piece of crap
		if { !$define_delcrap($idx) && [lindex $input 0] == "<p>For" } {
		set define_delcrap($idx) 1
		}
		#and another
		if { !$define_delcrap($idx) && [lindex $input 0] == "<p>Thesaurus" } {
		set define_delcrap($idx) 1
		}
		#delete
		if { $define_delcrap($idx) } {
		#<form
		} elseif { [string match "<pre><input*" $input] } {
			if {$define_webform($idx) == "NONE"} {set define_webform($idx) ""}
			append define_webform($idx) $input
		#options
		} elseif { [string match "<option*" $input] } {
			if {$define_webform($idx) == "NONE"} {
				putlog "\002 ERROR: THIS SHOULDN'T HAPPEN! (define_receive)"
			} else {
			append define_webform($idx) $input
			}
		#list
		} elseif { [string match "</select><input*" $input] } {
			if {$define_weblist($idx) == "NONE"} {set define_weblist($idx) ""}
			append define_weblist($idx) $input
		#Dictionary definition of word
		} elseif { [string match "*<b>:</b>*" $input] && $define_weblist($idx) == "NONE"} {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) ""}
			append define_webdef($idx) $input
		#Alternate word
		} elseif { [string match "<b>: *" $input] && $define_weblist($idx) == "NONE"} {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) ""}
			append define_webdef($idx) "Try this instead$input"
		#Alternate word #2
		} elseif { [string match "*<a href=\"netdict?*" $input] && $define_weblist($idx) == "NONE"} {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) ""}
			append define_webdef($idx) $input
		#Alternate word #3
		} elseif { [string match "<i>*" $input] && $define_weblist($idx) == "NONE"} {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) ""}
			append define_webdef($idx) $input
		#Thesaurus definition of word
		} elseif { [string match "Text:*" $input ] && $define_weblist($idx) == "NONE" } {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) ""}
			append define_webdef($idx) [string range $input 6 end]
		#Empty search
		} elseif { [string match "*No entries found that match your query*" $input] } {
			set define_webfault($idx) "\002No entries found that match your query"
		} elseif { [string match "*Unable to answer query in the 10 seconds allowed*" $input] } {
			set define_webfault($idx) "\002Unable to answer query in the 10 seconds allowed, try again"
		#Probable bad query
		} elseif { [string match "*Main Entry:	<input type=text name=va size=16>*" $input] } {
			set define_webfault($idx) "\002Default or Search Page Triggered; Probably bad query; Tell strobe"
		#Assumably bad query
		} elseif { [string match "*Your browser sent a request thatthis server could not understand*" $input] } {
					set define_webfault($idx) "\002Default or Search Page Triggered; Assumably bad query; Tell strobe"
		} elseif { [string index $input 0] == "<" } {
		} elseif { [string index $input 0] == "\[" } {
		#http garb
		} elseif { [lindex $input 0] == "HTTP/1.1" } {
		} elseif { [lindex $input 0] == "Server:" } {
		} elseif { [lindex $input 0] == "Connection:" } {
		} elseif { [lindex $input 0] == "Content-Type:" } {
		#webster garb (may change every so often |-(
		} elseif { [lindex $input 0] == "<!DOCTYPE" } {
		} elseif { [lindex $input 0] == "<a href=\"/help.htm\"><img src=\"/images/but.gif\"" } {
		} elseif { [lindex $input 0] == "ALINK=\"#FF0000\">" } {
		} elseif { [lindex $input 0] == "Help</a>" } {
		} elseif { [lindex $input 0] == "New Search</a>" } {
		} elseif { [string match "alt=\"*></a>" $input] } {
		#use the following if you want
		} elseif { [lindex $input 0] == "Pronunciation:" } {
		} elseif { [lindex $input 0] == "Function:" } {
		} elseif { [lindex $input 0] == "Usage:" } {
		} elseif { [lindex $input 0] == "Etymology:" } {
		} elseif { [lindex $input 0] == "Date:" } {
		} elseif { [lindex $input 0] == "Variant(s):" } {
		#This is for definitions where <b>:</b> (bold colon) is not present.
		} elseif { $define_weblist($idx) == "NONE" } {
			if {$define_webdef($idx) == "NONE"} {set define_webdef($idx) "\002The following may be poorly parsed:\002<br>"}
			append define_webdef($idx) $input
		}
	}
}

##

#Merriam-Webster's Copyright Notice:

#WWWebster Dictionary Copyright 1996 by Merriam-Webster, Incorporated 

#Word of the Day Copyright 1996 by Merriam-Webster, Incorporated 

#Merriam-Websters's Collegiate Dictionary, Tenth Edition Copyright 1994 by Merriam-Webster, Incorporated 

#WWWEBSTER DICTIONARY is a trademark of Merriam-Webster, Incorporated. A MERRIAM-WEBSTER, MERRIAM-WEBSTER,
#COLLEGIATE, WEBSTER'S COLLEGIATE, WEBSTER'S UNABRIDGED, WEBSTER'S THIRD NEW INTERNATIONAL AND
#DESIGN, MERRIAM-WEBSTER'S COLLEGIATE DICTIONARY AND DESIGN, CIRCLE WITH NW MONOGRAM AND WEBSTER'S,
#and NOT JUST WEBSTER. MERRIAM-WEBSTER. are trademarks of Merriam-Webster Incorporated. 

#All rights reserved. No part of the work embodied in Merriam-Webster's pages on the World Wide Web and covered by the copyrights hereon
#may be reproduced or copied in any form or by any means--graphic, electronic, or mechanical, including photocopying, taping, or information
#storage and retrieval systems--without the written permission of the publisher. 

#Requests for permission to use or reproduce of any part of WWWEBSTER'S DICTIONARY, MERRIAM-WEBSTER'S COLLEGIATE
#DICTIONARY, TENTH EDITION, or any other component of Merriam-Webster OnLine should be mailed to: Permissions Editor,
#Merriam-Webster Inc., P.O. Box 281, Springfield, MA 01102 

#Produced in the United States of America 

#--------------- cgi_chat.tcl cut here -----------------------
#cgi_chat.tcl version 1.1
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Uses cgi.tcl
#allows people to have a private DCC CHAT session
#Run this script *after* all other cgi_*.tcl scripts except cgi_wrapup.tcl which should be run *last*

#1.0 First version
#1.1 Placed the chatcmds where they are DCC defined

##"chat" binds##
bind pub - !cgichat cgichat_pub

bind msg - cgichat cgichat_msg

bind dcc - cgichat cgichat_dcc

##"chat" globals##
#chatcmds is set in the 'bind' area of their respective scripts

#free port
set cgi_chat_port "8888"

listen $cgi_chat_port script chat_listen

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######

##"chat" functions##
proc cgichat_pub { nick uhost handle channel arg } {
global cgi_chat_port
	putlog "$nick on $channel is using cgichat"
	putserv "PRIVMSG $nick :\001DCC CHAT CHAT [myip] $cgi_chat_port\001"
}

proc cgichat_msg { nick uhost handle arg } {
global cgi_chat_port
putlog "$nick is using cgichat"
	putserv "PRIVMSG $nick :\001DCC CHAT CHAT [myip] $cgi_chat_port\001"
}

proc cgichat_dcc { hand idx arg } {
global cgi_chat_port
putlog "#$hand# cgichat..."
	if { [lindex $arg 0] == "" } {
		putdcc $idx "syntax: .cgichat nickname"
	} elseif { [llength $arg] == 1 } {
		putserv "PRIVMSG $arg :\001DCC CHAT CHAT [myip] $cgi_chat_port\001"
	} else {
		putdcc $idx "\002Bad syntax!"
	}
}

proc chat_listen { idx } {
	putdcc $idx "Type \"help\" for available commands"
	control $idx chat_receive
}

proc chat_receive { idx input } {
global chatcmds 
	if { [string match "help" [string tolower $input]] } {
		putlog "#cgi_chat_user($idx)# help..."
		putdcc $idx "Commands available: [array names chatcmds]"
	} elseif { [lsearch -exact [array names chatcmds] [lindex $input 0]] != -1 } {
		putdcc $idx "[lindex [array get chatcmds [lindex $input 0]] 0]..."
		$chatcmds([lindex $input 0]) "cgi_chat_user($idx)" $idx [lrange $input 1 end]
	} elseif { [string index $input 0] == "." } {
		putdcc $idx "do NOT type a period before each command in this window"
	} else {
		putdcc $idx "huh? try help"
	}
}

#--------------- cgi_wrapup.tcl cut here ---------------------
#used to remove public binds
#useful if more than one bot on a channel uses this script
#typically the bot on the fastest connection should keep the public binds
#run this script *after* all other cgi_*.tcl scripts

#edit all you like
set cgi_nopub 0

switch $botnick {
	clonebot	-
	strobilus	-
	strobe		{
		set cgi_nopub 1
		putlog "\002cgi_wrapup.tcl:\002 Ignoring public binds"
	}
}

if { $cgi_nopub } {
	unbind pub - !nasdaq tutorial_pub
	unbind pub - !stock stock_pub
	unbind pub - !define define_pub
	unbind pub - !translate translate_pub
	unbind pub - !bible bible_pub
	unbind pub - !quotes quotes_pub
	unbind pub - !siskel siskel_pub
	unbind pub - !cc currency_pub
	unbind pub - !cgichat cgichat_pub
}
