#!/usr/bin/env sh

if [ ! -f ~/.keyboard_started ]; then
	wvkbd-mobintl &
	touch ~/.keyboard_started
else
	killall wvkbd-mobintl
	rm ~/.keyboard_started
fi

