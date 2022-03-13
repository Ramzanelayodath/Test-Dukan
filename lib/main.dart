import 'package:flutter/material.dart';
import 'package:machine_test_dukan/network/network.dart';
import 'package:machine_test_dukan/repository/repository.dart';
import 'package:machine_test_dukan/util/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(AppRouter()));
}

class MyApp extends StatelessWidget {
  AppRouter router;
   MyApp(this.router, {Key? key}) : super(key: key) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}


