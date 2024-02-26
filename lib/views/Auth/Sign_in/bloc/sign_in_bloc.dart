import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/login_model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:hurry_project/core/domain/service/Post/login_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<Login>((event, emit) async {
      emit(LoadingToLogin());
      /*dynamic*/ Model temp = await LoginService().login(model: event.user);

      if (temp is TokenModel ) {
        emit(SuccessInLogin());
      } else if (temp is ErrorModel) {
        emit(ErrorInLogin(error: temp));
      } else {
        emit(ExcptionInLogin(excption: temp as ExceptionModel));
      }
    });
  }
}