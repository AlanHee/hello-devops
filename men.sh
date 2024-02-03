#!/bin/bash
source funs.sh

showHelp() {
	cat <<EOF
${greenf}
dt      Dart test
dte     Dart test -r expande
dbb     Dart run build and delete conflicting outputs
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
	dbb) dart pub run build_runner build --delete-conflicting-outputs ;;
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
