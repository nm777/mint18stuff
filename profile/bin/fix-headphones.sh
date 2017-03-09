#!/bin/bash
pacmd set-card-profile bluez_card.00_1A_7D_B2_5E_45 headset_head_unit
sleep 1s
echo -e "disconnect 00:1A:7D:B2:5E:45 \n exit" | bluetoothctl
sleep 5s
echo -e "connect 00:1A:7D:B2:5E:45 \n exit" | bluetoothctl
sleep 5s
pacmd set-card-profile bluez_card.00_1A_7D_B2_5E_45 a2dp_sink
sleep 1s
pacmd set-default-sink bluez_sink.00_1A_7D_B2_5E_45
pacmd set-default-source bluez_card.00_1A_7D_B2_5E_45
