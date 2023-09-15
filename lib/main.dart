import 'package:flutter/material.dart';
import 'package:onboarding/darkmode/config_repo.dart';
import 'package:onboarding/darkmode/config_vm.dart';
import 'package:onboarding/screens/go_router/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = ConfigRepository(preferences);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ConfigViewModel(repository))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      // home: HomeScreen(),
    );
  }
}
