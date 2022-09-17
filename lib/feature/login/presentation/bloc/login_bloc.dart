import 'package:bloc/bloc.dart';
import 'package:eterex/core/res/api_response.dart';
import 'package:eterex/feature/login/domain/entities/login_request_entity.dart';
import 'package:eterex/feature/login/domain/use_cases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  var email = 'eve.holt@reqres.in';
  var password = 'cityslicka';

  LoginBloc(this._loginUseCase) : super(Login()) {
    on<LoginEvent>((event, emit) async {
      if (event is OnLoginClick) {
        var previousState = state;
        emit(Loading());
        ApiResponse<String> response = await _loginUseCase
            .call(LoginRequestEntity(email: email, password: password));
        if (response.data != null) {
          emit(GoToMainScreen());
        } else {
          emit(previousState);
        }
        // emit event change screen
      } else if (event is OnChangeStatusClick) {
        if (state is Login) {
          emit(SignUp());
        } else if (state is SignUp) {
          emit(Login());
        }
      } else if (event is ChangeEmail) {
        email = event.email;
      } else if (event is ChangePass) {
        password = event.pass;
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ');
      }
    });
  }
}
