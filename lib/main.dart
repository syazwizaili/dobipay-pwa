import 'package:dobipay/src/config/theme.dart';
import 'package:dobipay/src/route/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pwa_install/pwa_install.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  PWAInstall().setup(
    installCallback: () {
      debugPrint('APP INSTALLED!');
    },
  );

  runApp(const ProviderScope(child: DobiPayApp()));
}

class DobiPayApp extends ConsumerStatefulWidget {
  const DobiPayApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DobiPayAppState();
}

class _DobiPayAppState extends ConsumerState<DobiPayApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppTheme.themeData.appBarTheme,
      ),
    );
  }
}
