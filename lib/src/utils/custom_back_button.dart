import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Image.asset(
        "assets/icons/navbar/arrow-back.png",
        width: 24,
        height: 24,
      ),
      //replace with our own icon data.
    );
  }
}
