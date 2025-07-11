import 'package:dobipay/src/features/transaction/view/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Transactions",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 80 * 3,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 3,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Column(
            children: [TransactionItem(), TransactionItem(), TransactionItem()],
          ),
        ),
      ],
    );
  }
}
