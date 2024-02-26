part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

// ignore: must_be_immutable
class SignUp extends SignUpEvent {
  RegisterModel NewUser;
  SignUp({required this.NewUser});

}
