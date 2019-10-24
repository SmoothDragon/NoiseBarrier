# NoiseBarrier
Turn a Raspberry Pi into a sound blocking machine
Repeatedly plays a brown noise audio file.

# Requires mplayer
sudo apt-get install mplayer

# Installation
Copy script to init.d and add to system startup.
```bash
sudo cp noise_barrier.sh /etc/init.d
sudo update-rc.d noise_barrier.sh defaults
```

# Volume
After rebooting, the volume was reset to something quiet. The following command was needed in the script to restore the volume to max. (Note that 99% reports as 96 volume, so 75% is actually muted.)

amixer set PCM -- 100%

