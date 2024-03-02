import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/request_model/New_order_model.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/service/Post/New_order_service.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';

part 'New_order_event.dart';
part 'New_order_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc() : super(NewInitial()) {
    on<Ordering>((event, emit) async {
      emit(LoadingNew());
      Model temp = await NewOrderService().OrderNew(model: event.New);

      if (temp is OrdersModel) {
        emit(SuccessNew());
      } else if (temp is ErrorModel) {
        emit(ErrorNew(error: ErrorModel(error: temp.toString())));
      } else {
        emit(ExcptionNew(excption: ExceptionModel(excption: temp.toString())));
      }
    });
  }
}
