import 'package:dobipay/src/features/frame/controller/frame_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends ConsumerStatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  ConsumerState<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends ConsumerState<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(frameControllerProvider);

    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (value) => _onTap(value),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 14.0,
      unselectedFontSize: 14.0,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/navbar/home.png', width: 20),
          activeIcon: Image.asset(
            'assets/icons/navbar/home-active.png',
            width: 20,
          ),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/navbar/transaction.png', width: 20),
          activeIcon: Image.asset(
            'assets/icons/navbar/transaction-active.png',
            width: 20,
          ),
          label: "Sales",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/navbar/machine.png', width: 20),
          activeIcon: Image.asset(
            'assets/icons/navbar/machine-active.png',
            width: 20,
          ),
          label: "Machines",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/navbar/users.png', width: 20),
          activeIcon: Image.asset(
            'assets/icons/navbar/users-active.png',
            width: 20,
          ),
          label: "Customers",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/navbar/settings.png', width: 20),
          activeIcon: Image.asset(
            'assets/icons/navbar/settings.png',
            width: 20,
          ),
          label: "Settings",
        ),
      ],
    );
  }

  void _onTap(index) {
    ref.read(frameControllerProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/transaction');
        break;
      case 2:
        context.go('/machine');
        break;
      case 3:
        context.go('/customer');
        break;
      case 4:
        context.go('/setting');
        break;
      default:
    }
  }
}
