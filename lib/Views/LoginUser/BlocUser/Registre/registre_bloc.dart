import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Repository/Api/ApiUser.dart';

part 'registre_event.dart';
part 'registre_state.dart';

class RegistreBloc extends Bloc<RegistreEvent, RegistreState> {
  final ApiUser user ;
  RegistreBloc(this.user) : super(RegistreInitial()) {
    on<RegistreEvent>((event, emit)async {
    if( event is Registree){
      emit(RegistreLoded());
      var data =await user.RegistreUser(event.nom,event.prenom,event.email,event.password,event.date,event.telephone,event.image);
        if(data['type']==0){
          emit(RegistreEnsegniantSuccessed());
        }else if(data['type']==1){
          emit(RegistreStudentSuccessed());
        }else {
          emit(RegistreError(message: data['message']));
        }
    }
    });
  }
}
