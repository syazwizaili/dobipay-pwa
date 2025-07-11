class AccountMenuData {
  List<AccountMenu>? data;

  AccountMenuData({this.data});

  AccountMenuData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AccountMenu>[];
      json['data'].forEach((v) {
        data!.add(AccountMenu.fromJson(v));
      });
    }
  }
}

class AccountMenu {
  String? title;
  List<MenuItem>? menu;

  AccountMenu({this.title, this.menu});

  AccountMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    menu = json['menu'] != null
        ? (json['menu'] as List).map((i) => MenuItem.fromJson(i)).toList()
        : null;
  }
}

class MenuItem {
  String? title;
  String? route;

  MenuItem({this.title, this.route});

  MenuItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    route = json['route'];
  }
}
