import 'package:dobipay/src/features/setting/view/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            MenuItem(title: 'My Account'),
            SizedBox(height: 16),
            MenuItem(title: 'Others'),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
