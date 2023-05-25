#!/bin/bash
set -e
if [ $# -eq 0 ] || [ "$1" = "help" ] || [ "$1" = "h" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "/?" ]; then
	echo "	usage: 
		[-f] [FILEPATH]  -  removes spaces from FILEPATH name
		[-d] [DIR]   -  removes spaces from names of all FILEPATHs in dir"
	exit 0
fi

function _rename() {
	local FILEPATH="$1"
	FILEPATH_WiTHOUT_SPACES=$(echo "$FILEPATH"|tr ' ' '_')
	echo "$FILEPATH -> $FILEPATH_WiTHOUT_SPACES"
	mv "$FILEPATH" "$FILEPATH_WiTHOUT_SPACES"
}

case $1 in
	"-f")
		FILEPATH="$2"
		_rename "$FILEPATH"
	;;
	"-d")
		DIR=$2
		cd "$DIR"
		IFS=$'\n'
		for FILEPATH in $(find . )
		do
			if [[ "$FILEPATH" != "." ]] || [[ "$FILEPATH" != "." ]]; then
				_rename "$FILEPATH"
			fi
		done
	;;
	*)
		echo "invalid argument: $1"
		exit 1
	;;
esac
