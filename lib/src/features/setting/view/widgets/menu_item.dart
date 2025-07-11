import 'package:dobipay/src/features/setting/controller/account_menu_controller.dart';
import 'package:dobipay/src/features/setting/model/account_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuItem extends ConsumerStatefulWidget {
  final String? title;
  const MenuItem({super.key, this.title});

  @override
  ConsumerState<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends ConsumerState<MenuItem> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    ref
        .read(accountMenuProvider.notifier)
        .getMenuData()
        .then(
          (value) => setState(() {
            loading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final AccountMenuData accountMenu = ref
        .watch(accountMenuProvider.notifier)
        .accountMenu;
    return loading
        ? Container()
        : Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    accountMenu.data!
                        .firstWhere((element) => element.title == widget.title)
                        .title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      55 *
                      accountMenu.data!
                          .firstWhere(
                            (element) => element.title == widget.title,
                          )
                          .menu!
                          .length
                          .toDouble(),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: accountMenu.data!
                        .firstWhere((element) => element.title == widget.title)
                        .menu!
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              accountMenu.data!
                                  .firstWhere(
                                    (element) => element.title == widget.title,
                                  )
                                  .menu![index]
                                  .title!,
                            ),
                            Image.asset(
                              'assets/icons/navbar/arrow-next.png',
                              width: 16,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(color: Colors.transparent);
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
