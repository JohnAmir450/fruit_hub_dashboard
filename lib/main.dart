import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/routes.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';

import 'core/helper_functions/on_generate_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.dashboardView,
    );
  }
}

