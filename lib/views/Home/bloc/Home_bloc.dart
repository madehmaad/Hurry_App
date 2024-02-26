import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/views/Home/bloc/Home_event.dart';
import 'package:hurry_project/views/Home/bloc/Home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}