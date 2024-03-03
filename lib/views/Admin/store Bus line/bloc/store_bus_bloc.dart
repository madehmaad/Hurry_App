import 'package:bloc/bloc.dart';
import 'package:hurry_project/core/domain/model/response_model/store_busline_model.dart';
import 'package:hurry_project/core/domain/service/Post/Store_Busline_service.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';

part 'store_bus_event.dart';
part 'store_bus_state.dart';

class StoreBloc extends Bloc<StoreBusEvent, StoreBusState> {
  StoreBloc() : super(StoreBusInitial()) {
    on<Store>((event, emit) async {
      emit(LoadingToStoreBus());
      Model temp =
          await StoreBuslineService().StoreBus(model: event.NewBusLine);

      if (temp is ResoursBusLineModel) {
        emit(SuccessStoreBus());
      } else if (temp is ErrorModel) {
        emit(ErrorInStoreBus(error: temp));
      } else {
        emit(ExcptionInStoreBus(excption: temp as ExceptionModel));
      }
    });
  }
}
