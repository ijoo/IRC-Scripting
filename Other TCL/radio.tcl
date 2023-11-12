##########################################################
# Tcl Feita por MrBoss (MrBoss@BRASnet.org)              #
# A tcl de !Dj foi desenvolvida para auxiliar os DJs     #  
# da IRADIO. Agora estou publicando esta TCL no site.    #
#            (http://www.portaltcl.com.br)               #
##########################################################
##########################################################
# COMANDO DA TCL DJ :                                    #
#                                                        #
# /msg CANAL !DJ NICK PROGRAMA                           #
# (COMANDO EXCLUSIVO PARA OS OPERADORES DO CANAL SETADO) #
#                                                        #
##########################################################
##########################################################
# COMANDOS DA TCL REPORTER:                              #
#                                                        #
# /msg BOTNICK !Pedido PEDIDO                            #
#                                                        #
# /msg BOTNICK !Recado RECADO                            #
#                                                        #
#            ou                                          #
#                                                        #
# /msg CANAL !Pedido PEDIDO                              #
#                                                        #
# /msg CANAL !Recado RECADO                              #
#                                                        #
# OUTROS COMANDOS:                                       #
#                                                        #
# /msg BOTNICK !Info                                     #
# (Informa o número de pedidos e recados enviados,       #
#  DJ ativo e o canal selecionado)                       #
#                                                        #
# /msg BOTNICK !Zerar                                    #
# (Zera o número de pedidos e recados enviados e o log)  #
# (COMANDO EXCLUSIVO PARA OPERADOR DO CANAL)             #
#                                                        #
##########################################################
# Inicialmente esta TCL era um projeto da iradio, agora  #
# agora resolvi divulgar a TCL com o sistema de reporte  #
# para ajudar as rádios que existem no IRC.              #
##########################################################
# Inicialmente esta TCL era um projeto da iradio, agora  #
# agora resolvi divulgar a TCL com o sistema de !DJ      #
# para ajudar as rádios que existem no IRC.              #
##########################################################
# De inicio essa TCL foi um pedido do PRIZE e do Br0ther #
# ambos da Iradio.                                       #
##########################################################

#Set o canal na qual a TCL deverá fucionar
set canal "#eMaster"

#Set o link para ouvir a rádio
set link "8,1http://radio.cajau.com ou digite /radio"

#Set o nome da rádio
set radio "-=eMaster=- .::0,1A Sua melhor Rádio da Internet!::."

#Set o tópico para o canal
# %dj = ao nick que esta como locutor
# %programa = ao programa do Dj
# %radio = nome da rádio
# %link = link para ouvir a rádio
# %canal = canal na qual a TCL deverá fucionar

set topico "0,2((8Rádio0)) ((8eMaster0)) 0,2A melhor Rádio da Internet!! Locutor(a): %dj Programa: %programa 0,2 8,2((0PARCERIAS8)) 8,2#Cebolinha 4,2ESCUTE EM http://radio.cajau.com "

#Para LOGAR os pedidos e recados
# 1 = irá gravar no TXT
# 0 = NÃO irá gravar no TXT
set write "1"

#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###
#Não mexer em nada###

set dj "N/a"
set programa "N/a"

bind nick - * proc_nick
bind pub - !DJ pub_dj

proc proc_nick {nick uhost handle channel newnick} {
    global programa dj canal topico botnick link radio
    if {[string tolower $dj] == [string tolower $nick]} {
        set dj $newnick
              topic $canal "[replace $topico $dj $programa $canal $radio $link]"
    }
}


proc pub_dj {nick uhost hand channel rest} {
    global canal botnick topico dj programa radio link
    if {[string tolower $channel] != [string tolower $canal]} {
        putserv "notice $nick :$nick Este comando só é valido no $canal"
        return 0
    } else {
        if {[lrange $rest 0 end] == ""} {
            putserv "notice $nick :$radio"
            putserv "notice $nick :DJ Online: $dj"
            putserv "notice $nick :Programa: $programa"
            putserv "notice $nick :Para ouvir: $link"
            putserv "notice $nick :Pedidos/Recados: !pedido para fazer seu pedido ou !recado para dar o seu recado"
        }
        if {[botisop $canal]} {
            if {[isop $nick $canal]} {
                if {[lrange $rest 0 end] != ""} {
                    set dj [lindex $rest 0]
                    set programa [lrange $rest 1 end]
                    if {$programa == ""} { set programa N/a }
                    topic $canal "[replace $topico $dj $programa $canal $radio $link]"
                }
            }
        }
    }
    if {[isop $nick $canal]} {
        if {![botisop $canal]} {
            putserv "notice $nick :$nick não sou Operador(@) do $canal."
            return 0
        }
    }
    if {![isop $nick $canal]} {
        if {![botisop $canal]} {
            putserv "notice $nick :ERRO: Comando invalido"
            return 0
        }
    }
    if {![isop $nick $canal]} {
        if {[botisop $canal]} {
            putserv "notice $nick :$radio"
            putserv "notice $nick :DJ Online: $dj"
            putserv "notice $nick :Programa: $programa"
            putserv "notice $nick :Para ouvir: $link"
            putserv "notice $nick :Pedidos/Recados: !pedido para fazer seu pedido ou !recado para dar o seu recado"
            return
        }
    }
}

###########################################################################################
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!! #
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!! #
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!! #
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!! #
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!! #
###########################################################################################

set nickx "N/a"
set msg "N/a"
set pedido "0"
set recado "0"
set frecado recados.txt
set fpedido pedidos.txt

bind msg - "!Pedido" msg_pedido
bind msg - "!Recado" msg_recado
bind pub - "!Pedido" pub_pedido
bind pub - "!Recado" pub_recado
bind msg - "!info" msg_info
bind msg - "!Zerar" msg_zerar

proc msg_info {nick uhost hand rest} {
    global canal dj programa pedido recado
    putserv "PRIVMSG $nick :O canal ativo é o $canal"
    putserv "PRIVMSG $nick :Dj online $dj"
    putserv "PRIVMSG $nick :Estilo do Dj $programa"
    putserv "PRIVMSG $nick :Já foram enviado(s) $recado recado(s)"
    putserv "PRIVMSG $nick :Já foram enviado(s) $pedido pedido(s)"
}

proc msg_zerar {nick uhost hand rest} {
    global canal dj programa pedido recado fpedido frecado
    if {[isop $nick $canal]} {
        putserv "PRIVMSG $nick :Zerando . . ."
        set pedido "0"
        set recado "0"
        putserv "PRIVMSG $nick :Zerando recado(s)"
        putserv "PRIVMSG $nick :Zerando pedido(s)"
        if {[file exists $fpedido]} {
            exec $fpedido
        }
        if {[file exists $frecado]} {
            exec $frecado
        }
    }

}

proc msg_pedido {nick uhost hand rest} {
    global botnick dj programa msg pedido fpedido write msg
    set msg [lrange $rest 0 end]
    set data "[strftime %d/%m/%Y]"
    set hora "[strftime %H:%M:%S]"
    if {[string tolower $dj] == [string tolower $nick]} { putserv "privmsg $nick :para que enviar para voce mesmo? " }
    if {$dj != ""} {
        if {[string tolower $dj] != [string tolower $nick]} {
            incr pedido  
            putserv "PRIVMSG $dj :» $pedidoº « Pedido do{a} $nick ø O pedido é: $msg"  
            putlog "Enviando Pedido para $dj de $nick com o seguinte pedido $msg"
            putserv "PRIVMSG $nick :Às $hora Seu Pedido Enviado com sucesso para $dj."
            if {$write} {
                set msgx "$pedido Pedido foi enviado às $hora do dia $data por: $nick para o DJ: $dj. O pedido foi: '$msg'"
                set file [open $fpedido a]
                puts $file "$msgx"
                close $file
            }
        }
    }
}

proc pub_recado {nick uhost hand channel rest} {
    global botnick dj programa msg recado frecado write msg
    set msg [lrange $rest 1 end]
    set data "[strftime %d/%m/%Y]"
    set hora "[strftime %H:%M:%S]"
    if {[string tolower $dj] == [string tolower $nick]} { putserv "privmsg $nick :para que enviar para voce mesmo? " }
    if {$dj != ""} {
        if {[string tolower $dj] != [string tolower $nick]} {
            incr recado
            putserv "PRIVMSG $dj :» $recadoº « ø Recado do{a} $nick ø O recado é: $msg"  
            putlog "Enviando Recado para $dj de $nick com o seguinte recado $msg"
            putserv "PRIVMSG $nick :Às $hora Recado Enviado com sucesso para $dj."
            if {$write} {           
                set msgx "$recado Recado foi enviado às $hora do dia $data por: $nick para o DJ: $dj. O Recado foi: '$msg'"
                set file [open $frecado a]
                puts $file "$msgx"
                close $file
            }
        }
    }
}

proc pub_pedido {nick uhost hand channel rest} {
    global botnick dj programa msg pedido fpedido write msg
    set msg [lrange $rest 1 end]
    set data "[strftime %d/%m/%Y]"
    set hora "[strftime %H:%M:%S]"
    if {[string tolower $dj] == [string tolower $nick]} { putserv "privmsg $nick :para que enviar para voce mesmo? " }
    if {$dj != ""} {
        if {[string tolower $dj] != [string tolower $nick]} {
            incr pedido  
            putserv "PRIVMSG $dj :» $pedidoº « Pedido do{a} $nick ø O pedido é: $msg"  
            putlog "Enviando Pedido para $dj de $nick com o seguinte pedido $msg"
            putserv "PRIVMSG $nick :Às $hora Seu Pedido Enviado com sucesso para $dj."
            if {$write} {           
                set msgx "$pedido Pedido foi enviado às $hora do dia $data por: $nick para o DJ: $dj. O pedido foi: '$msg'"
                set file [open $fpedido a]
                puts $file "$msgx"
                close $file
            }
        }
    }
}

proc msg_recado {nick uhost hand rest} {
    global botnick dj programa msg recado frecado write msg
    set msg [lrange $rest 0 end]
    set data "[strftime %d/%m/%Y]"
    set hora "[strftime %H:%M:%S]"
    if {[string tolower $dj] == [string tolower $nick]} { putserv "privmsg $nick :para que enviar para voce mesmo? " }
    if {$dj != ""} {
        if {[string tolower $dj] != [string tolower $nick]} {
            incr recado
            putserv "PRIVMSG $dj :» $recadoº « ø Recado do{a} $nick ø O recado é: $msg"  
            putlog "Enviando Recado para $dj de $nick com o seguinte recado $msg"
            putserv "PRIVMSG $nick :Às $hora Recado Enviado com sucesso para $dj."
            if {$write} {
                set msgx "$recado Recado foi enviado às $hora do dia $data por: $nick para o DJ: $dj. O Recado foi: '$msg'"
                set file [open $frecado a]
                puts $file "$msgx"
                close $file
            }
        }
    }
}

proc topic {canal text} {
    putserv "TOPIC $canal :$text"
    putlog "Tópico do $canal alterado para $text"
}

proc replace {arg dj programa canal radio link} {
    regsub -all "%dj" $arg "$dj" arg
    regsub -all "%programa" $arg "$programa" arg
    regsub -all "%canal" $arg "$canal" arg
    regsub -all "%radio" $arg "$radio" arg
    regsub -all "%link" $arg "$link" arg
    return $arg
}

putlog "Tcl de reporte feita para o $canal. CARREGADA"
putlog "TCl de Dj carregada"
putlog "TCL feita por MrBoss ¦ Versão 1.7"