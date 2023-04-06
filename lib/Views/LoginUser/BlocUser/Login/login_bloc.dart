import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Repository/Api/ApiUser.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiUser Loginuser;
  LoginBloc(this.Loginuser) : super(LoginInitial()) {
    on<LoginEvent>((event, emit)async {
    if(event is Loginn){
      emit(LoginLoded());
      var datalogin = await Loginuser.LoginUser(event.email,event.password);
      if(datalogin['success']==true){
        emit(LoginEnsegniantSuccessed());
      }else if(datalogin['success']==false){
        emit(LoginEnsegniantSuccessed());
      }else if(datalogin['message']=="error"){
        emit(LoginError(message:'datalogin'));
      }
    }
    });
  }
}
