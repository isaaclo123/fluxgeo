#!/usr/bin/env python

__author__ = "Isaac Lo"
__copyright__ = "Copyright (C) 2015 Isaac Lo"

import subprocess
import sys
import httplib
import os

def output(args):
    args = args.split(" ")
    return subprocess.Popen(args, stdout=subprocess.PIPE).communicate()[0].rstrip()

def run(args):
    subprocess.call(args, shell = True)

def have_internet():
    conn = httplib.HTTPConnection("minecraft.net")
    try:
        conn.request("HEAD", "/")
        return True
    except:
        return False

home = os.path.expanduser('~/.fluxgeo')

if have_internet() == True:

    thelat = open(str(home + "/lat"), 'w')
    thelong = open(str(home + "/long"), 'w')

    ip = output("curl ident.me")

    location = output("geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat " + ip)

    location = location.split(", ")

    lat = location[6]
    long = location[7]

    thelat.truncate()
    thelong.truncate()

    thelat.write(lat)
    thelong.write(long)

elif have_internet() == False:

    thelat = open(str(home + "/lat"), 'r')
    thelong = open(str(home + "/long"), 'r')

    lat = str(thelat.readline()).rstrip()
    long = str(thelong.readline()).rstrip()

run("killall xflux")
run("xflux -l " + lat + " -g " + long)

sys.exit(0)
