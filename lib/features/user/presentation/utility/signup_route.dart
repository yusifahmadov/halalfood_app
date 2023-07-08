import 'package:flutter/material.dart';

enum SignUpRoute { firstPage, secondPage }

final signUpNavigatorKey = GlobalKey<NavigatorState>();
final signUpContext = signUpNavigatorKey.currentContext;
