import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../Core/Services/AuthService.dart';
import '../../../../Core/errors/Failure.dart';
import '../../../../Core/errors/ServerFailure.dart';
import '../entity/User.dart';
import 'authRepo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthService authService;

  AuthRepoImp({required this.authService});
  @override
  @override
  Future<Either<UserData, Failure>> createUserWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var result = await authService.createUserWithEmailPassword(
        email: email,
        password: password,
      );

      return result.fold(
        (user) => left(user),
        (exception) => right(ServerFailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth  ${e.toString()}');
      return right(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      var result = await authService.signInUserWithEmailPassword(
        email: email,
        password: password,
      );

      return result.fold(
        (user) => left(user),
        (exception) => right(ServerFailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth  ${e.toString()}');
      return right(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithGoogle() async {
    try {
      var result = await authService.signInWithGoogle();

      return result.fold(
        (user) => left(user),
        (exception) => right(ServerFailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithApple() async {
    try {
      var result = await authService.signInWithApple();

      return result.fold(
        (user) => left(user),
        (exception) => right(ServerFailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithFacebook() async {
    try {
      var result = await authService.signInWithFacebook();

      return result.fold(
        (user) => left(user),
        (exception) => right(ServerFailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(ServerFailure(e.toString()));
    }
  }
}
