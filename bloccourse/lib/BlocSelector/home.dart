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
            BlocSelector<CounterCubit, CounterState, int>(
                selector: (state) => state.counterA,
                builder: (context, counterA) {
                  if (counterA is IncrementCounter) {
                    return Text(
                      '${counterA}',
                      style: TextStyle(fontSize: 50, color: Colors.green),
                    );
                  } else if (counterA is DecrementCounter) {
                    return Text(
                      '${counterA}',
                      style: TextStyle(fontSize: 50, color: Colors.red),
                    );
                  } else {
                    return Text(
                      '${counterA}',
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
            child: Text('Show Value Counter A'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementB();
                },
                icon: Icons.add),
            BlocSelector<CounterCubit, CounterState, int>(
                selector: (state) => state.counterB,
                builder: (context, counterB) {
                  if (counterB is IncrementCounter) {
                    return Text(
                      '${counterB}',
                      style: TextStyle(fontSize: 50, color: Colors.green),
                    );
                  } else if (counterB is DecrementCounter) {
                    return Text(
                      '${counterB}',
                      style: TextStyle(fontSize: 50, color: Colors.red),
                    );
                  } else {
                    return Text(
                      '${counterB}',
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    );
                  }
                }),
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementB();
                },
                icon: Icons.remove),
          ]),
          MaterialButton(
            onPressed: () {
              // print(state.counter);
            },
            child: Text('Show Value Counter B'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementC();
                },
                icon: Icons.add),
            BlocSelector<CounterCubit, CounterState, int>(
                selector: (state) => state.counterC,
                builder: (context, counterC) {
                  if (counterC is IncrementCounter) {
                    return Text(
                      '${counterC}',
                      style: TextStyle(fontSize: 50, color: Colors.green),
                    );
                  } else if (counterC is DecrementCounter) {
                    return Text(
                      '${counterC}',
                      style: TextStyle(fontSize: 50, color: Colors.red),
                    );
                  } else {
                    return Text(
                      '${counterC}',
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    );
                  }
                }),
            MyButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementC();
                },
                icon: Icons.remove),
          ]),
          MaterialButton(
            onPressed: () {
              // print(state.counter);
            },
            child: Text('Show Value Counter C'),
          ),
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
