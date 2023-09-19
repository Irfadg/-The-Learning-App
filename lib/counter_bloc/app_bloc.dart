import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/counter_bloc/app_event.dart';
import 'package:learning_app/counter_bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
// AppBloc(super.(CounterInit()));

  AppBloc() : super(CounterInit()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
  }
}
