part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

// ignore: must_be_immutable
class Login extends SignInEvent {
  LoginModel user;
  Login({required this.user});
}