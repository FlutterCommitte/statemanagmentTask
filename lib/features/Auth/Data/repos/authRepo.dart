import 'package:dartz/dartz.dart';

import '../../../../Core/errors/Failure.dart';
import '../entity/User.dart';

abstract class AuthRepo {
  Future<Either<UserData, Failure>> createUserWithEmailPassword(
      {required String email, required String password, required String name});

  Future<Either<UserData, Failure>> signInUserWithEmailPassword(
      {required String email, required String password});

  Future<Either<UserData, Failure>> signInWithGoogle();
  Future<Either<UserData, Failure>> signInWithFacebook();
  Future<Either<UserData,Failure>>signInWithApple();    
}
