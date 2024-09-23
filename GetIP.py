# This Python Script Sample For Eggdrop
# Eggdrop 1.9.6+ with python module needed.
# Simple IP Check Sripting [versi 1.4 2024/Sept]
# Author = iJoo - evochat.id

from eggdrop import bind
from eggdrop.tcl import putmsg, putlog
import requests

def get_ip(nick, user, hand, chan, text, **kwargs):
    if text == "":
            putmsg(chan, f"Gunakan: !ip <IP Address/Domain>")
    else:
        ip_address = text or "8.8.8.8"
        response = requests.get(f'http://ip-api.com/json/{ip_address}?fields=26443583').json()
        statusnya = response.get('status') or "-"
        if statusnya == "success":
            dicari = response.get('query')
            negara = response.get('country') or "None"
            kodenegara = response.get('countryCode') or "None"
            regionname = response.get('regionName') or "None"
            kota = response.get('city') or "-"
            timezone = response.get('timezone') or "None"
            asnnya = response.get('as') or "None"

            reserv = response.get('reverse')
            if reserv == "":
                hostname = "None"
            else:
                hostname = reserv
            
            mobile = str(response.get('mobile'))
            proxy = str(response.get('proxy'))
            hosting = str(response.get('hosting'))
            putmsg(chan, f"\002IP:\002 "+ dicari +" ("+ hostname +") - \002Location:\002 " + kota +" (" + regionname +"), " + negara +" (" + kodenegara + ") - \002ASN:\002 " + asnnya +" - \002Timezone:\002 " + timezone + " - \002Mobile:\002 "+ mobile +" - \002Proxy:\002 "+ proxy +" - \002Hosting:\002 " + hosting )
        else:
            putmsg(chan, f"Tidak menemukan Informasi IP!")

bind("pub", "*", "!ip", get_ip)
