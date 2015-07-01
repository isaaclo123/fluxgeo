#!/bin/sh

echo "FluxGeo Installation"

read -p "Would you like to install this script? [y/n]" response
    case $response in [yY])

      echo "Stopping xflux daemon"
      killall xflux

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

      echo "Setting up fluxgeo"
      mkdir ~/.fluxgeo
      chmod 777 ~/.fluxgeo

      touch ~/.fluxgeo/lat
      echo "0" >> ~/.fluxgeo/lat
      chmod 777 ~/.fluxgeo/lat

      touch ~/.fluxgeo/long
      echo "0" >> ~/.fluxgeo/long
      chmod 777 ~/.fluxgeo/long

      echo "Installation Finished"
      echo "Starting fluxgeo"
        ;;

    *)

        echo "Installation Aborted"
        ;;

esac
exit 0
