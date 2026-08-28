#!/bin/bash

case "$1" in
  sourdough )
        mac='18:66:DA:4E:30:D5'
    ;;
  rye )
        mac='18:66:DA:4E:38:47'
    ;;
  hardtack )
        mac='D0:50:99:C1:EB:D1'
    ;;

  *)
    echo "Usage: $0 {sourdough|rye|hardtack}"
    exit
    ;;
esac

wakeonlan -i 192.168.50.255 $mac
