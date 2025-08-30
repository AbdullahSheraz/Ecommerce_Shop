import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/route/router.dart' as router;
import 'package:shop/theme/app_theme.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final installTime = prefs.getInt("install_time");
  if (installTime == null) {
    await prefs.setInt("install_time", DateTime.now().millisecondsSinceEpoch);
  }

  runApp(const ProviderScope(child: TrialCheckerApp()));
}

class TrialCheckerApp extends StatefulWidget {
  const TrialCheckerApp({super.key});

  @override
  State<TrialCheckerApp> createState() => _TrialCheckerAppState();
}

class _TrialCheckerAppState extends State<TrialCheckerApp> {
  late Future<bool> _trialExpiredFuture;

 Future<bool> checkTrialExpired() async {
  final prefs = await SharedPreferences.getInstance();
  final installTime = prefs.getInt("install_time")!;
  final now = DateTime.now().millisecondsSinceEpoch;

  const trialDuration = 7 * 24 * 60 * 60 * 1000;

  return now - installTime > trialDuration;
}


  @override
  void initState() {
    super.initState();
    _trialExpiredFuture = checkTrialExpired();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _trialExpiredFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final expired = snapshot.data!;
        if (expired) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: TrialExpiredScreen(),
          );
        } else {
          return const ProviderScope(child: MyApp());
        }
      },
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: themeMode,
      routerConfig: router.router,
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
    );
  }
}

class TrialExpiredScreen extends StatelessWidget {
  const TrialExpiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "This is an Demo Shop App\n Now you cannot Access this app.",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
