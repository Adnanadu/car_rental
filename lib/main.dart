import 'package:car_rental/injection_container.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/bloc/car_event.dart';
import 'package:car_rental/presentation/pages/on_boarding_page.dart';
import 'package:car_rental/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.call<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnBoardingPage(),
      ),
    );
  }
}
