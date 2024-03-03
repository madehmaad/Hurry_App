part of 'store_bus_bloc.dart';

@immutable
sealed class StoreBusEvent {}

// ignore: must_be_immutable
class Store extends StoreBusEvent {
  PostBuslineModel NewBusLine;
  Store({required this.NewBusLine});

}
