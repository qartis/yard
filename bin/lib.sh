#!/bin/sh

is_pos_int() {
	case "$1" in
	*[!0-9]*) return 1 ;;
	*)        return 0 ;;
	esac
}

in_range() {
	# $1 <= $2 <= $3
	[ "$1" -le "$2" ] && [ "$2" -le "$3" ];
}

channel_can_run_indefinitely() {
	# 0-5 are water zones, not safe to run indefinitely
	case "$1" in
	0) return 1 ;;
	1) return 1 ;;
	2) return 1 ;;
	3) return 1 ;;
	4) return 1 ;;
	5) return 1 ;;
	*) return 0 ;;
	esac
}

interruptible_sleep() {
	sleep $1 &
	wait $!
}
