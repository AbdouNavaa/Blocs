import 'package:bloccourse/cubit/counter_cubit.dart';
import 'package:bloccourse/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementA();
                },
                icon: Icons.add),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              if (state is IncrementCounter) {
                return Text(
                  '${state.counterA}',
                  style: TextStyle(fontSize: 50, color: Colors.green),
                );
              } else if (state is DecrementCounter) {
                return Text(
                  '${state.counterA}',
                  style: TextStyle(fontSize: 50, color: Colors.red),
                );
              } else {
                return Text(
                  '${state.counterA}',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                );
              }
            }),
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementA();
                },
                icon: Icons.remove),
          ]),
          MaterialButton(
            onPressed: () {
              // print(state.counter);
            },
            child: Text('Show Value Counter'),
          )
        ]));
  }
}

class MyButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 40,
        ));
  }
}
