// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'New_order_bloc.dart';

@immutable
sealed class NewEvent {}

// ignore: must_be_immutable
class Ordering extends NewEvent {
  NewOrdersModel New;
  Ordering({
    required this.New,
  });
}
