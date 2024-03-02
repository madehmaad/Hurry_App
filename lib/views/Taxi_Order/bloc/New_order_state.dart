// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'New_order_bloc.dart';

@immutable
sealed class NewState {}

final class NewInitial extends NewState {}

// ignore: must_be_immutable
class SuccessNew extends NewState {}

// ignore: must_be_immutable
class ErrorNew extends NewState {
  ErrorModel error;
  ErrorNew({required this.error});
}

// ignore: must_be_immutable
class ExcptionNew extends NewState {
  ExceptionModel excption;
  ExcptionNew({required this.excption});
}

class LoadingNew extends NewState {}
