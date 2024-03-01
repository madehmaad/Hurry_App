import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/request_model/shortest_path_model.dart';
import 'package:hurry_project/core/domain/service/Get/short_path.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/login_model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:hurry_project/core/domain/service/Post/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'Short_event.dart';
part 'Short_state.dart';

List vertices = [];

class ShortBloc extends Bloc<ShortEvent, ShortState> {
  ShortBloc() : super(ShortInitial()) {
    on<Shortpath>((event, emit) async {
      emit(LoadingShort());
      List temp = await ShortPathService().getShortPath(model: event.path);

      if (temp is List<int>) {
        vertices = temp;
        emit(SuccessShort());
      } else if (temp is List<ErrorModel>) {
        emit(ErrorShort(error: ErrorModel(error: temp.toString())));
      } else {
        emit(ExcptionShort(excption: temp));
      }
    });
  }
}
