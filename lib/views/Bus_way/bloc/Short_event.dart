part of 'Short_bloc.dart';

@immutable
sealed class ShortEvent {}

// ignore: must_be_immutable
class Shortpath extends ShortEvent {
  ShortestPathModel path;
  Shortpath({required this.path});
}