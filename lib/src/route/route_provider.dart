import 'package:dobipay/src/features/customer/view/customer_view.dart';
import 'package:dobipay/src/features/frame/view/frame_view.dart';
import 'package:dobipay/src/features/home/view/home_view.dart';
import 'package:dobipay/src/features/machine/view/machine_view.dart';
import 'package:dobipay/src/features/notification/view/notification_view.dart';
import 'package:dobipay/src/features/setting/view/account_view.dart';
import 'package:dobipay/src/features/transaction/view/transaction_view.dart';
import 'package:dobipay/src/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(
  debugLabel: 'shell',
);

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            FrameLayout(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: home,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomeView(key: state.pageKey));
            },
          ),
          GoRoute(
            path: '/transaction',
            name: transaction,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: TransactionView(key: state.pageKey),
              );
            },
          ),
          GoRoute(
            path: '/machine',
            name: machine,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: MachineView(key: state.pageKey));
            },
          ),
          GoRoute(
            path: '/customer',
            name: customer,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: CustomerView(key: state.pageKey));
            },
          ),
          GoRoute(
            path: '/setting',
            name: setting,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: AccountView(key: state.pageKey));
            },
          ),
        ],
      ),
      GoRoute(
        path: '/notification',
        name: notification,
        parentNavigatorKey: _rootNavigator,
        pageBuilder: (context, state) =>
            MaterialPage<void>(key: state.pageKey, child: NotificationView()),
      ),
    ],
  );
});
