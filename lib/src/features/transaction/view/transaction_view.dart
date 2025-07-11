import 'dart:math';

import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales"),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/navbar/calendar.png', width: 16),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[100], height: 1),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.white,
              leading: Image.asset(
                [
                  "assets/icons/transaction/duitnow.png",
                  "assets/icons/transaction/token.png",
                  "assets/icons/transaction/tng.png",
                ][Random().nextInt(3)],
                width: 30,
              ),
              title: Row(
                children: [
                  Text(
                    'Washer ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'RM ${Random().nextInt(10) + 1}.00',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Central Residence, Sg Besi",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    DateTime.now()
                        .subtract(Duration(days: index))
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Success",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
