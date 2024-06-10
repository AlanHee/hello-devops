#!/bin/bash
source funs.sh

showHelp() {
	cat <<EOF
${greenf}
dt      Dart test
dte     Dart test -r expande
dab     Dart pub add dev:build_runner
daj			Dart pub add dev:json_serializable
dat			Dart pub add dev:build_test
drw     Dart run build_runner watch
drb     Dart run build_runner build
drs     Dart run build_runner serve
drt			Dart run build_runner test
fr      Flutter run
frr     Flutter run --release
fr      Flutter clean
fcr     Flutter clean && flutter run
u       Flutter unlock thread
g       Flutter update modules
fu      Flutter upgrade --force
fb      Flutter build model to Json
fba     Flutter build apk
fbi     Flutter build ios
e       Flutter open android emulator
dbi     dart pub global activate --source path .
dpm     dart pub upgrade --major-versions
EOF
}

doAction() {
	case $1 in
	dt) dart test ;;
	dte) dart test -r expanded $2 ;;
	frr) flutter run --release ;;
	dab) dart pub add dev:build_runner ;;
	daj) dart pub add dev:json_serializable ;;
	dat) dart pub add dev:build_test ;;
	dbb) dart run build_runner build --delete-conflicting-outputs ;;
	drw) dart run build_runner watch --delete-conflicting-outputs	;; 
	drs) dart run build_runner serve	;; 
	drt) dart run build_runner test	;; 
	fr) flutter run ;;
	e | android-emulator) flutter emulators --launch Pixel_3a_API_30_x86 ;;
	u | flutter-unloack) rm ~/Documents/flutter/bin/cache/lockfile ;;
	fb) flutter packages pub run build_runner build ;;
	fba) flutter build apk ;;
	fbi) flutter build ios ;;
	fc) flutter clean ;;
	fcr) flutter clean && flutter run ;;
	fu) flutter upgrade --force ;;
	g | flutter) flutter pub get ;;
	dbi) dart pub global activate --source path . ;;
	dpm) dart pub upgrade --major-versions ;;
	quit | q) exit 0 ;;
	h | help) showHelp ;;
	esac
	exit 0
}

initializeANSI
if [ "$1" = "" ]; then
	showHelp
	while read command args; do
		doAction $command
	done
elif [ -n $1 ]; then
	doAction $1
fi
