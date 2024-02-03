#!/bin/bash
# gen apk
echo "Start deploy by android"
echo "It takes time...cup of tea?"
cd ~/yishou-client
echo "Build apk file"
#flutter build apk
echo "copy apk to deploy"
cp -rf ~/yishou-client/build/app/outputs/apk/release/* ~/deploy
# upload to server
echo "Upload apk to server"
scp ~/deploy/app-release.apk ubuntu@1.117.61.5:~/apk
echo "Records to server"
# add json in with dart script to mysql
cd ~/deploy
dart bin/main.dart $1
echo "done."
