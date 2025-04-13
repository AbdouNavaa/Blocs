class CounterState {
  final int counterA;
  final int counterB;
  final int counterC;
  CounterState(this.counterA, this.counterB, this.counterC);
}

class IncrementCounter extends CounterState {
  IncrementCounter(super.counterA, super.counterB, super.counterC);
}

class DecrementCounter extends CounterState {
  DecrementCounter(super.counterA, super.counterB, super.counterC);
}
