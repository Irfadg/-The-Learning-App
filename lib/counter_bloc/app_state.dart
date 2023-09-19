class AppState{
  int counter;
  AppState({required this.counter});
}


class CounterInit extends AppState{
  CounterInit():super(counter: 23);

}