#!/bin/bash

# === Configuration ===
UUID="E28CA8CB8CA89C13" # 🔁 Replace this with your actual partition UUID
MOUNT_POINT="/mnt/ntfs" # 🔁 Change this to your preferred mount point

# === Auto-detect device by UUID ===
DEVICE=$(blkid -U "$UUID")

# === Error if device not found ===
if [ -z "$DEVICE" ]; then
    echo "Error: No device with UUID $UUID found."
    exit 1
fi

# === Create mount point if it doesn't exist ===
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Creating mount point at $MOUNT_POINT"
    sudo mkdir -p "$MOUNT_POINT"
fi

# === Mount the drive ===
echo "Mounting $DEVICE to $MOUNT_POINT"
sudo mount "$DEVICE" "$MOUNT_POINT"

# === Optional: change ownership to current user ===
sudo chown "$USER":"$USER" "$MOUNT_POINT"

echo "Drive mounted successfully."
