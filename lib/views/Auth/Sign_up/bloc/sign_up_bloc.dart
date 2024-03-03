import 'package:bloc/bloc.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/response_model/regester_model.dart';
import 'package:hurry_project/core/domain/service/Post/Sign_up_service.dart';
import 'package:meta/meta.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      emit(LoadingToSignUp());
      Model temp = await SignUpService().SignUp(model: event.NewUser);

      if (temp is TokenModel) {
        config.get<SharedPreferences>().setString('token', temp.token);
        emit(SuccessSignUp());
      } else if (temp is ErrorModel) {
        emit(ErrorInSignUp(error: temp));
      } else {
        emit(ExcptionInSignUp(excption: temp as ExceptionModel));
      }
    });
  }
}
