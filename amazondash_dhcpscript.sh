#!/bin/sh
# copy to /etc/ and add dash macaddr in lowercase to MACADDR and add the config to /etc/config/network like
#
# config dnsmasq
#        option dhcpscript '/etc/dhcpscript.sh'
#        ...
# config host
#        option mac 'AC:63:BE:B3:FD:5B'
#        option name 'amazondash'
#        option dns '1'
#        #e.g. send localhost ip to block internet
#        option ip '127.0.0.254'


MACADDR="ac:63:be:b3:ff:ff"

[ -z "$1" ] && echo "error, dnsmasq only" && exit 1

if [ "$1" == "add" ] && [ "$MACADDR" == "$2" ]
then
  #example for sending telegrammsg
  MSG="Paket ist da"
  CHATID="123456"
  BOTID="123456:ABCDE"
  PAYLOAD="{\"chat_id\": \"$CHATID\", \"text\": \"$MSG\", \"disable_notification\": true}"
  curl -q -X POST -H 'Content-Type: application/json' -d "$PAYLOAD" https://api.telegram.org/bot$BOTID/sendMessage
fi

exit 0
