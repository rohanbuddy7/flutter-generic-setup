import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Common {

  static showToast(String msg, {bool isSuccess = true, bool isShort = true}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: isShort ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
            ? ToastGravity.CENTER
            : ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isSuccess ? Colors.black : Colors.orange,
        textColor: Colors.white);
  }

}
