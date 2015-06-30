#!/usr/bin/env python

__author__ = "Isaac Lo"
__copyright__ = "Copyright (C) 2015 Isaac Lo"

import subprocess
import sys

def output(args):
    args = args.split(" ")
    return subprocess.Popen(args, stdout=subprocess.PIPE).communicate()[0].rstrip()

def run(args):
    subprocess.call(args, shell = True)

ip = output("curl ident.me")

location = output("geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat " + ip)

location = location.split(", ")

lat = location[6]
long = location[7]
run("killall xflux")
run("xflux -l " + lat + " -g " + long)

sys.exit(0)
