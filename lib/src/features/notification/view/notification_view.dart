import 'package:dobipay/src/utils/custom_back_button.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: const Text("Notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[100], height: 1),
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/icons/navbar/notification-active.png',
                width: 16,
              ),
              title: Text(
                [
                  "Payment Received",
                  "Account Updated",
                  "New Offer Available",
                  "Security Alert",
                  "Transaction Failed",
                  "Welcome to Dobipay",
                  "Profile Completed",
                  "Password Changed",
                  "Subscription Renewed",
                  "Reminder: Bill Due",
                ][index % 10],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Text(
                "This is the detail of notification ${index + 1}.",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              trailing: Text(
                "2 min ago",
                style: TextStyle(color: Colors.grey[600]),
              ),
            );
          },
        ),
      ),
    );
  }
}
