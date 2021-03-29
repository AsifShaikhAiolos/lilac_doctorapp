import 'package:flutter/material.dart';
import 'package:lilac_doctorapp/provider/auth_provider.dart';
import 'package:lilac_doctorapp/provider/dashboard_provider.dart';
import 'package:lilac_doctorapp/provider/repository/auth_repository.dart';
import 'package:lilac_doctorapp/screens/login_screen.dart';
import 'package:lilac_doctorapp/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
          ChangeNotifierProvider(create: (context) => di.sl<DashboardProvider>()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return
      // ChangeNotifierProvider(
      // create: (context)=> di.sl<AuthProvider>(),
      // child:
      MaterialApp(
        title: 'Flutter Demo',
        home: LoginScreen(),
      // ),
    );
  }
}
