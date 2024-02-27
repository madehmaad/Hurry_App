// import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/config/bloc_obs.dart';
import 'package:hurry_project/Views/Auth/Sign_in/sign_in.dart';
import 'package:hurry_project/core/config/get_it.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
 
  // Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high);
  // print(position);


  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SinginScreen(),
    );
  }
}
