part of 'registre_bloc.dart';

@immutable
abstract class RegistreState {}

class RegistreInitial extends RegistreState {}

class RegistreLoded extends RegistreState {}

class RegistreEnsegniantSuccessed extends RegistreState {}

class RegistreStudentSuccessed extends RegistreState {}

class RegistreError extends RegistreState {
  final String message;
  RegistreError({required this.message});
}