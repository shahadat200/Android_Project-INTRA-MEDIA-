import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intra_media/login_screen/login_screen.dart';

class splash_services {
  void islogin(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Longin_screen()))
            });
  }
}
