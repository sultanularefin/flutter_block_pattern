class CounterState {
  int counter;
//  int test;



  CounterState._();
  factory CounterState.initial(){
    return CounterState._()..counter = 0;
    //    return CounterState._()..counter..test = 0;
  }


  //  latest code vs old codes -- above
  //  final int counter;
  //  const CounterState({this.counter});

  //  factory CounterState.initial() => CounterState(counter: 0);
}