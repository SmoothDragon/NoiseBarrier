#! /bin/sh
### BEGIN INIT INFO
# Provides:          noise_barrier
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: noise_barrier
# Description:       plays soundblocking noise
### END INIT INFO
/usr/bin/amixer set PCM -- 100%
/usr/bin/mplayer -quiet -loop 0 /home/pi/noise/brown.m4a < /dev/null &
exit 0
