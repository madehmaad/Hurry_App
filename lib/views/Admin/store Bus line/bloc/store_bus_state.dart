part of 'store_bus_bloc.dart';

@immutable
sealed class StoreBusState {}

final class StoreBusInitial extends StoreBusState {}

class SuccessStoreBus extends StoreBusState {}

// ignore: must_be_immutable
class ErrorInStoreBus extends StoreBusState {
  ErrorModel error;
  ErrorInStoreBus({required this.error});
}

// ignore: must_be_immutable
class ExcptionInStoreBus extends StoreBusState {
  ExceptionModel excption;
  ExcptionInStoreBus({required this.excption});
}

class LoadingToStoreBus extends StoreBusState {}