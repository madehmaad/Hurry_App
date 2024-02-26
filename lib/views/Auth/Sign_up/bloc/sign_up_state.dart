part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SuccessSignUp extends SignUpState {}

// ignore: must_be_immutable
class ErrorInSignUp extends SignUpState {
  ErrorModel error;
  ErrorInSignUp({required this.error});
}

// ignore: must_be_immutable
class ExcptionInSignUp extends SignUpState {
  ExceptionModel excption;
  ExcptionInSignUp({required this.excption});
}

class LoadingToSignUp extends SignUpState {}