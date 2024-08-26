# This Python Script Sample For Eggdrop
# Eggdrop 1.9.6+ with python module needed.
# Simple IP Check Sripting

from eggdrop import bind
from eggdrop.tcl import putmsg, putlog
import requests

def get_location(nick, user, hand, chan, text, **kwargs):
    ip_address = text or "8.8.8.8"
    putlog("Mencari IP "+text)
    response = requests.get(f'https://ipapi.co/{ip_address}/json/').json()
    kota = response.get('city')
    region = response.get('region')
    negara = response.get('country_name')
    asnnya = response.get('asn')
    orgnya = response.get('org')
    putmsg(chan, f"\002IP:\002 "+ ip_address)
    putmsg(chan, f"\002Location:\002 " + kota + ", " + region + " (" + negara + ")")
    putmsg(chan, f"\002ASN:\002 " + asnnya + " (" +orgnya+ ")")

bind("pub", "*", "!ip", get_location)
