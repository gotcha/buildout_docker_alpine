#!/usr/bin/env bash
# TODO: kill zope before exit
MAX=${1:-30}
nohup "$HOME/bin/instance" fg &
c=0
while ! grep -s -q 'Zope Ready to handle requests' "$HOME/nohup.out"; do
	sleep 1
	echo "$c seconds"
	c=$((c + 1))
	if [[ c -eq $MAX ]]; then
		echo "Could not start: $(cat "$HOME/nohup.out")"
		exit 1
	fi
done
echo "OK: Zope Ready to handle requests"
