import 'package:dobipay/src/features/frame/view/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pwa_install/pwa_install.dart';

class FrameLayout extends ConsumerStatefulWidget {
  final Widget child;
  const FrameLayout({required this.child, super.key});

  @override
  ConsumerState<FrameLayout> createState() => _FrameLayoutState();
}

class _FrameLayoutState extends ConsumerState<FrameLayout> {
  String? error;
  static bool _dialogShown = false;

  @override
  Widget build(BuildContext context) {
    // Show install prompt only once and only if not already installed
    if (PWAInstall().installPromptEnabled && PWAInstall().hasPrompt) {
      // Use a static variable to ensure dialog is shown only once per app session
      // (You can use a more persistent solution if needed)
      // ignore: prefer_const_declarations

      if (!_dialogShown) {
        _dialogShown = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Install App'),
              content: const Text(
                'Would you like to install DobiPay to your device?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('No, thanks'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    PWAInstall().promptInstall_();
                  },
                  child: const Text('Install'),
                ),
              ],
            ),
          );
        });
      }
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
