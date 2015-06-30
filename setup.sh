#!/bin/sh

if [ "$(id -u)" != "0" ]; then
   echo "This install script must be run as root" 1>&2
   exit 1
fi

echo "FluxGeo Installation"

read -p "Would you like to install this script? [y/n]" response
    case $response in [yY])

      echo "Stopping xflux daemon"
      kill xflux

      echo "Installing xflux"
       if [ "$(uname -m | grep '64')" != "" ]; then
        echo "Detected 64 bit arch"
        sudo cp xflux64 /usr/local/bin/xflux
      else
        echo "Detected 32 bit arch"
        sudo cp xflux32 /usr/local/bin/xflux
      fi

      echo "Installing GeoIP database"
      sudo mkdir /usr/share/GeoIP
      sudo cp GeoLiteCity.dat /usr/share/GeoIP/GeoLiteCity.dat

      echo "Installing fluxgeo"
      sudo cp fluxgeo.py /usr/local/bin/fluxgeo
      sudo chmod +x /usr/local/bin/fluxgeo

      echo "Starting fluxgeo"
      fluxgeo

      echo "Installation Finished"
        ;;

    *)

        echo "Installation Aborted"
        ;;

esac
exit 0
