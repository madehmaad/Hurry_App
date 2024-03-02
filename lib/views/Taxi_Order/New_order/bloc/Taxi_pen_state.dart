// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'Taxi_pen_bloc.dart';

@immutable
sealed class PendState {}

final class PendInitial extends PendState {}

// ignore: must_be_immutable
class SuccessPend extends PendState {}

// ignore: must_be_immutable
class ErrorPend extends PendState {
  ErrorModel error;
  ErrorPend({required this.error});
}

// ignore: must_be_immutable
class ExcptionPend extends PendState {
  List excption;
  ExcptionPend({required this.excption});
}

class LoadingPend extends PendState {}
