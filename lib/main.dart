import 'package:flutter/material.dart';
import 'package:african_time/pages/home.dart';
import 'package:african_time/constant/loading.dart';
import 'package:african_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));

