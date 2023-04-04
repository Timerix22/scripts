#!/bin/sh
set -e

if [ $# -eq 0 ] || [ "$1" = "help" ] || [ "$1" = "h" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "/?" ]; then
	echo "	usage: ffmpeg_dir_convert.sh [DIR_SRC] [SRC_FILE_EXT] [OUT_DIR] [OUT_FILE_EXT]
	optional: [FFMPEG_ARGS] [FFMPEG_ARGS_PRE] [FFMPEG_ARGS_POST]
		additional args for ffmpeg
	EXAMPLE: ffmpeg_dir_convert.sh downloads ogg music/new mp3 \"-c aac\""
	exit 0
fi
SRC_DIR="$1"
SRC_FILE_EXT="$2"
OUT_DIR="$3"
OUT_FILE_EXT="$4"
FFMPEG_ARGS="$5"
FFMPEG_ARGS_PRE="$6"
FFMPEG_ARGS_POST="$7"
# codec detection
if [[ -z $FFMPEG_ARGS ]]; then
	echo "ffmpeg_args is null, setting codec to $OUT_FILE_EXT"
	FFMPEG_ARGS="-c $OUT_FILE_EXT"
fi
FFMPEG_ARGS="-y -hide_banner -loglevel warning -stats  $FFMPEG_ARGS"
mkdir -p "$OUT_DIR"
# for loop ignore spaces
IFS=$'\n'
for SRC_FILE in $(find "$SRC_DIR" -type f -name "*.$SRC_FILE_EXT" )
do
	OUT_FILE="$OUT_DIR"/$(basename "$SRC_FILE" ".$SRC_FILE_EXT")."$OUT_FILE_EXT"
	echo "$SRC_FILE -> $OUT_FILE"
	IFS=$' '
	ffmpeg $FFMPEG_ARGS_PRE -i "$SRC_FILE" $FFMPEG_ARGS "$OUT_FILE" $FFMPEG_ARGS_POST
	IFS=$'\n'
	echo ""
done
