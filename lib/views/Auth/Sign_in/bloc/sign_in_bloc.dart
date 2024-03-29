import 'package:bloc/bloc.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/login_model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:hurry_project/core/domain/service/Post/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<Login>((event, emit) async {
      emit(LoadingToLogin());
       Model temp = await LoginService().login(model: event.user);

      if (temp is TokenModel ) {
        config
          .get<SharedPreferences>()
          .setString('token', temp.token);
        emit(SuccessInLogin());
      } else if (temp is ErrorModel) {
        emit(ErrorInLogin(error: temp));
      } else {
        emit(ExcptionInLogin(excption: temp as ExceptionModel));
      }
    });
  }
}