import 'dart:convert';

import 'package:dobipay/src/features/setting/model/account_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountMenuProvider = StateNotifierProvider<AccountMenuProvider, String>((
  ref,
) {
  return AccountMenuProvider('my_account');
});

class AccountMenuProvider extends StateNotifier<String> {
  AccountMenuProvider(super.state);
  late AccountMenuData accountMenu = AccountMenuData();

  Future<AccountMenuData> getMenuData() async {
    final String response = await rootBundle.loadString(
      'assets/data/account_menu_en.json',
    );
    final data = await json.decode(response);

    accountMenu = AccountMenuData.fromJson(data);
    print(accountMenu.data!.first.menu!.first.title);
    return accountMenu;
  }
}
