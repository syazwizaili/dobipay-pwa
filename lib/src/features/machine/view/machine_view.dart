import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MachineView extends ConsumerStatefulWidget {
  const MachineView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MachineViewState();
}

class _MachineViewState extends ConsumerState<MachineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Machines')),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[100], height: 1),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.white,

              title: Row(
                children: [
                  Text(
                    (index.isEven
                        ? 'Washer ${((index ~/ 2) % 10) + 1}'
                        : 'Dryer ${((index ~/ 2) % 10) + 1}'),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: (index.isEven ? Colors.green : Colors.red),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: (index.isEven ? Colors.green[50] : Colors.red[50]),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      (index.isEven ? 'Iddle' : 'Busy'),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wifi: MCH${(1000 + index).toString().padLeft(4, '0')}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    "Version: 3.01qq.${(100 + index).toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              trailing: Text(
                "RM ${(6 + (index * 997) % 7).toString()}.00",
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            );
          },
        ),
      ),
    );
  }
}
