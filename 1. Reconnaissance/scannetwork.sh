#!/bin/bash

is_alive_ping() {
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo Node with IP: $i is up.
}

for first_octet in {10..10}; do
  for second_octet in {1..255}; do
    for third_octet in {1..255}; do
      for fourth_octet in {1..255}; do
        ip_address="$first_octet.$second_octet.$third_octet.$fourth_octet"
        is_alive_ping $ip_address & disown
      done
    done
  done
done
