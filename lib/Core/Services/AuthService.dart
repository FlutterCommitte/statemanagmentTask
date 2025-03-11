import 'package:dartz/dartz.dart';

import '../../features/Auth/Data/entity/User.dart';
import '../errors/Failure.dart';

abstract class AuthService {
  Future<Either<UserData, Failure>> createUserWithEmailPassword(
      {required String email, required String password});
  Future<Either<UserData, Failure>> signInUserWithEmailPassword(
      {required String email, required String password});

  Future<Either<UserData , Failure>> signInWithGoogle(); 
  Future<Either<UserData , Failure>> signInWithFacebook();
  Future<Either<UserData , Failure>> signInWithApple();
}
