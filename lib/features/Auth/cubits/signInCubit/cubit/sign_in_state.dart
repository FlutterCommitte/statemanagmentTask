part of 'sign_in_cubit.dart';

abstract class SignInState {}
final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {
  final UserData user;
  SignInSuccess(this.user);
}
final class SignInFailure extends SignInState {
  final String message;
  SignInFailure(this.message);
}