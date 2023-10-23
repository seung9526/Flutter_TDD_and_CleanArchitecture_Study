import 'dart:io';

String fixture(String flieName) =>
    File('test/fixtures/$flieName').readAsStringSync();