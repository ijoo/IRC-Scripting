# This Python Script Sample For Eggdrop
# Eggdrop 1.9.6+ with python module needed.
# Simple IP Check Sripting
# Author = iJoo - evochat.id

from eggdrop import bind
from eggdrop.tcl import putmsg, putlog
import requests

def get_location(nick, user, hand, chan, text, **kwargs):
    ip_address = text or "8.8.8.8"
    response = requests.get(f'https://ipapi.co/{ip_address}/json/').json()
    kota = response.get('city') or "-"
    region = response.get('region') or "-"
    negara = response.get('country_name') or "-"
    asnnya = response.get('asn') or "-"
    orgnya = response.get('org') or "-"
    putmsg(chan, f"\002IP:\002 "+ ip_address)
    putmsg(chan, f"\002Location:\002 " + kota + ", " + region + " (" + negara + ")")
    putmsg(chan, f"\002ASN:\002 " + asnnya + " (" + orgnya + ")")

bind("pub", "*", "!ip", get_location)
