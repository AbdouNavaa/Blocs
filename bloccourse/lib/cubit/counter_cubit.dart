import 'package:bloccourse/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0, 0, 0));
  incrementA() {
    emit(IncrementCounter(state.counterA + 1, state.counterB, state.counterC));
  }

  // decrement
  decrementA() {
    emit(DecrementCounter(state.counterA - 1, state.counterB, state.counterC));
  }

  // B
  incrementB() {
    emit(IncrementCounter(state.counterA, state.counterB + 1, state.counterC));
  }

  decrementB() {
    emit(IncrementCounter(state.counterA, state.counterB - 1, state.counterC));
  }

  // C
  incrementC() {
    emit(IncrementCounter(state.counterA, state.counterB, state.counterC + 1));
  }

  decrementC() {
    emit(IncrementCounter(state.counterA, state.counterB, state.counterC - 1));
  }
}
