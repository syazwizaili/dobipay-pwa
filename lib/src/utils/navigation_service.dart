import 'package:flutter/material.dart';

navigatePush(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigatePop(BuildContext context) {
  Navigator.pop(context);
}
