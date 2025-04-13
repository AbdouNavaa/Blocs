import 'package:bloccourse/bloc/post_bloc.dart';
import 'package:bloccourse/cubit/post_cubit.dart';
import 'package:bloccourse/home_cubit.dart';
import 'package:bloccourse/home_bloc.dart';
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
        create: (context) => PostBloc(),
        // create: (context) => PostCubit(),
        child: MaterialApp(
            title: 'Course Bloc',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            // home: HomePage()
            home: BlocHomePage()));
  }
}
