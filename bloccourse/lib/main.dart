import 'package:bloccourse/BlocConsumer/home.dart';
import 'package:bloccourse/cubit/counter_cubit.dart';
import 'package:bloccourse/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: MaterialApp(
          title: 'Course Bloc',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Course Bloc'),
        ));
  }
}
