import 'dart:io';

String jsonReader(String name) =>
    File('test/additional/json/$name').readAsStringSync();
