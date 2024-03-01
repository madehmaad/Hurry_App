// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'Short_bloc.dart';

@immutable
sealed class ShortState {}

final class ShortInitial extends ShortState {}

// ignore: must_be_immutable
class SuccessShort extends ShortState {}

// ignore: must_be_immutable
class ErrorShort extends ShortState {
  ErrorModel error;
  ErrorShort({required this.error});
}

// ignore: must_be_immutable
class ExcptionShort extends ShortState {
  List excption;
  ExcptionShort({required this.excption});
}

class LoadingShort extends ShortState {}
