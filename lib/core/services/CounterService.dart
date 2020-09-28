import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/observable_ish.dart';
//inally now I can show you the problem that stacked makes easier. 
// If you run the code now with the ReactiveExampleView as the home layout you will see
//  if you tap the blue counter the value will increase but the counter on 
//  the right won't change, even though they're 
//  using the same value from the service. 
//  We want all ViewModels using this simple service to update when the value changes.
//   This is where the Reactive functionality comes in. 
//   It's literally in the first iteration of it so any feedback or help i
//   n making it a more complete feature would be appreciated. 
//   Here are the steps to making a service value reactive.
// Mix in the ReactiveServiceMixin
// Wrap the value to use in an RxValue
// call listenToReactiveValues and pass in all values to react to.
@lazySingleton
class CounterService with ReactiveServiceMixin{
  RxValue<int> _counter = RxValue<int>(initial: 1);
  
  CounterService() {
    //3
    listenToReactiveValues([_counter]);
  }
  int get counter => _counter?.value ?? 0;

  void incrementCounter() {
    _counter.value++;
  }

  void doubleCounter() {
    _counter.value *= 2;
  }
}