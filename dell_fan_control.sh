#!/usr/bin/env bash
# Dynamic Fan Control for Dell PowerEdge (R430)
# set up service (also in dotfiles) by placing the service file symlink in /etc/systemd/system/
# sudo systemctl daemon-reload
# sudo systemctl enable --now dell_fan_control.service

# Thermals (°C)
TEMP_LOW=50     # Below this: minimum fan speed
TEMP_HIGH=75    # Above this: restore automatic iDRAC control

# Fan Speeds (%)
SPEED_LOW_HEX="0x0a"   # 10% speed
SPEED_MED_HEX="0x19"   # 25% speed

MANUAL_MODE=0

# Ensure kernel modules are loaded
modprobe ipmi_devintf 2>/dev/null
modprobe ipmi_si 2>/dev/null

enable_manual() {
    if [ "$MANUAL_MODE" -ne 1 ]; then
        ipmitool raw 0x30 0x30 0x01 0x00 >/dev/null 2>&1
        MANUAL_MODE=1
    fi
}

enable_auto() {
    if [ "$MANUAL_MODE" -ne 0 ]; then
        ipmitool raw 0x30 0x30 0x01 0x01 >/dev/null 2>&1
        MANUAL_MODE=0
    fi
}

# Restore iDRAC auto-control on service exit/kill
trap "enable_auto; exit 0" SIGINT SIGTERM EXIT

while true; do
    # Get peak temperature across all CPU cores/package sensors
    MAX_TEMP=$(ipmitool sdr type Temperature | grep -i "Temp" | awk -F'|' '{print $5}' | tr -d ' degrees C' | grep -E '^[0-9]+$' | sort -nr | head -n1)

    # Fallback safety check if reading failed
    if [ -z "$MAX_TEMP" ]; then
        enable_auto
        sleep 10
        continue
    fi

    if [ "$MAX_TEMP" -ge "$TEMP_HIGH" ]; then
        # Restore full iDRAC auto curve if server gets hot
        #echo "Temp ($MAX_TEMP°C) >= $TEMP_HIGH°C. Restoring iDRAC auto-control."
        enable_auto
    elif [ "$MAX_TEMP" -ge "$TEMP_LOW" ]; then
        # Intermediate speed (25%)
        #echo "Temp ($MAX_TEMP°C) >= $TEMP_LOW°C. Setting fans to medium (25%)."
        enable_manual
        ipmitool raw 0x30 0x30 0x02 0xff "$SPEED_MED_HEX" >/dev/null 2>&1
    else
        # Low noise baseline (10%)
        #echo "Temp ($MAX_TEMP°C) is nominal. Setting fans to low (10%)."
        enable_manual
        ipmitool raw 0x30 0x30 0x02 0xff "$SPEED_LOW_HEX" >/dev/null 2>&1
    fi

    sleep 5
done
