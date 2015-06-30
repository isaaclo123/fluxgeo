# fluxgeo

##About
Fluxgeo is a simple python script for linux-based systems that pipes your location data to xflux. It is intended as addon to the f.lux project, a project that helps computer users sleep easier. You can find more information about them on https://justgetflux.com/.

##Dependencies
* xflux [will be installed by setup script]
* GeoLite City [will be installed by setup script]
* geoip-bin, geoip-database
* Python 2.7

##Installation
1. Make sure geoip-bin, geoip-database, and Python 2.7 are installed.
2. In a terminal window, "cd" to the fluxgeo directory.
3. Run "sudo sh setup.sh" (without quotation marks).

##Usage
To run the script, run "fluxgeo" in a terminal.
The script can be placed in an autostart file, /etc/rc.local, and more.

##Software credit
* This product includes GeoLite data created by MaxMind, available from (http://www.maxmind.com)
* This software uses xflux (https://justgetflux.com/)
* This software uses Python 2.7 (https://www.python.org/)
