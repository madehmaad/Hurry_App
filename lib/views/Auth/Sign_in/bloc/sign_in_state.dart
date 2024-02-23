part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

class SuccessInLogin extends SignInState {}

// ignore: must_be_immutable
class ErrorInLogin extends SignInState {
  ErrorModel error;
  ErrorInLogin({required this.error});
}

// ignore: must_be_immutable
class ExcptionInLogin extends SignInState {
  ExceptionModel excption;
  ExcptionInLogin({required this.excption});
}

class LoadingToLogin extends SignInState {}