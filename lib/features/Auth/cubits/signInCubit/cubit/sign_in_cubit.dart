import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/entity/User.dart';
import '../../../Data/repos/authRepo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo) : super(SignInInitial());

  Future<void> signInUserWithEmailAndPassword({required String email , required password}) async {
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInUserWithEmailPassword(email: email, password: password);
      emit(user.fold((user) => SignInSuccess(user), (failure) => SignInFailure(failure.message)));
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInWithGoogle();
      emit(user.fold((user) => SignInSuccess(user), (failure) => SignInFailure(failure.message)));
    } catch (e) {
      log('message from signInWithGoogle Cubit : ${e.toString()}');
      emit(SignInFailure(e.toString()));
    }
  }

  Future<void>signInWithFaceBook()async{
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInWithFacebook();
      emit(user.fold((user) => SignInSuccess(user), (failure) => SignInFailure(failure.message)));
    } catch (e) {
      log('message from signInWithFaceBook Cubit : ${e.toString()}');
      emit(SignInFailure(e.toString()));
    }
  }

  Future<void>signInWithApple()async{
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInWithApple();
      emit(user.fold((user) => SignInSuccess(user), (failure) => SignInFailure(failure.message)));
    } catch (e) {
      log('message from signInWithApple Cubit : ${e.toString()}');
      emit(SignInFailure(e.toString()));
    }
  }
}
