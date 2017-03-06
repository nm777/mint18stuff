#!/bin/bash
pactl set-card-profile bluez_card.00_1A_7D_B2_5E_45 headset_head_unit
echo -e "disconnect 00:1A:7D:B2:5E:45 \n exit" | bluetoothctl
echo -e "connect 00:1A:7D:B2:5E:45 \n exit" | bluetoothctl
pactl set-card-profile bluez_card.00_1A_7D_B2_5E_45 a2dp_sink
