#!/bin/bash
# e.g: dart-generate-test.sh hello_test.dart
cat <<EOF >$1
import 'package:test/test.dart'; 
import 'package:test_process/test_process.dart'; 

void main() { 

   late TestProcess proc; 
   late int port; 
  
   setUp(() async { 
     proc = await TestProcess.start( 
       'dart', 
       ['bin/server.dart'], 
       environment: {'PORT': '0'}, 
     ); 
  
     final output = await proc.stdout.next; 
     final match = _listeningPattern.firstMatch(output)!; 
     port = int.parse(match[1]!); 
   }); 
  
   void testServer(String name, Future<void> Function(String host) func) { 
     test( 
       name, 
       () async { 
         await func('http://localhost:$port'); 
         await proc.kill(); 
       }, 
       timeout: _defaultTimeout, 
     ); 
   } 
  
   runTests(testServer); 
 } 

const _defaultTimeout = Timeout(Duration(seconds: 3)); 
final _listeningPattern = RegExp(r'Serving at http://[^:]+:(\d+)');  
EOF

mv $1 ~
vi ~/$1
