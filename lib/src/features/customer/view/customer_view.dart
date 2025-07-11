import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_avatar/random_avatar.dart';

class CustomerView extends ConsumerStatefulWidget {
  const CustomerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomerViewState();
}

class _CustomerViewState extends ConsumerState<CustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[100], height: 1),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: RandomAvatar(
                    'customer_${index + 1}',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              title: Text(
                'Customer ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone: 01${(10000000 + (index * 12345) % 90000000).toString().padLeft(8, '0')}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sticker: ${index + 1}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Paid: ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'RM ${(10 + (index * 37) % 91).toString()}.00',
                            style: TextStyle(fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Avail Free: ${index + 1}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Text(
                        "Usage: ${index + 1}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
