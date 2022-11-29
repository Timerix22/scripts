#!/bin/bash
set -e
if [ "$1" = "help" ] || [ "$1" = "h" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "/?" ]; then
	echo $1
	echo "[DIR SRC] [SRC FILE FORMAT] [TARGET DIR] [TARGET FORMAT]"
	echo "EXAMPLE: ffmpeg_dir_convert.sh downloads ogg music/new mp3"
	echo "!!! file names shouldnt contain spaces !!!"
	exit 0
fi
DIN="$1"
EXTIN="$2"
DOUT="$3"
EXTOUT="$4"
for FIN in $(find "$DIN" -name "*.$EXTIN" )
do
	FOUT="$DOUT"/$(basename "$FIN" "*.$EXTIN")."$EXTOUT"
	echo "$FIN -> $FOUT"
	ffmpeg -i "$FIN" -c mp3 "$FOUT" -y -hide_banner -loglevel error -stats
	echo ""
done
