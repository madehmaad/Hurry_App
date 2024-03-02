import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/service/Get/get_pendings.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';

part 'Taxi_pen_event.dart';
part 'Taxi_pen_state.dart';


class PendBloc extends Bloc<PendEvent, PendState> {
  PendBloc() : super(PendInitial()) {
    on<Pending>((event, emit) async {
      emit(LoadingPend());
      List temp = await PendingsService().getPendings(source: event.source);

      if (temp is List<OrdersModel>) {
        emit(SuccessPend());

      } else if (temp is List<ErrorModel>) {
        emit(ErrorPend(error: ErrorModel(error: temp.toString())));
      } else {
        emit(ExcptionPend(excption: temp));
      }
    });
  }
}
