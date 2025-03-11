import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:task/Core/errors/ServerFailure.dart';

import '../../features/Auth/Data/entity/User.dart';
import '../errors/Failure.dart';
import 'AuthService.dart';

class FireBaseAuthService extends AuthService {
  @override
  Future<Either<UserData, Failure>> createUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return left(UserData.fromFirebase(credential.user!));
    } on FirebaseAuthException catch (e) {
      log(
        'on FirebaseAuthException Sign Up with email and password catch (e) ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        return right(ServerFailure('لقد ادخلت كلمة مرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        return right(ServerFailure('البريد الالكتروني مستخدم بالفعل'));
      }
    } catch (e) {
      log('on  Sign Up with email and password catch (e) ${e.toString()}');
      return right(ServerFailure('لقد حدث خطأ ما'));
    }
    return right(ServerFailure('حدث خطأ ما'));
  }

  @override
  Future<Either<UserData, ServerFailure>> signInUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left(UserData.fromFirebase(credential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In catch (e) ${e.toString()}');
      if (e.code == 'user-not-found') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      } else if (e.code == 'wrong-password') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      } else if (e.code == 'user-disabled') {
        return right(ServerFailure('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'too-many-requests') {
        return right(
          ServerFailure('عدد كبير جدا من الطلبات. حاول مرة أخرى لاحقًا'),
        );
      } else if (e.code == 'operation-not-allowed') {
        return right(ServerFailure('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      }
    } catch (e) {
      log('on Sign In catch (e) ${e.toString()}');
      return right(ServerFailure('لقد حدث خطأ ما'));
    }
    return right(ServerFailure('لقد حدث خطأ ما'));
  }

  @override
  Future<Either<UserData, ServerFailure>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return left(UserData.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log(
        'on FirebaseAuthException Sign In with Google catch (e) ${e.toString()}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        return right(ServerFailure('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(ServerFailure('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(ServerFailure('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(ServerFailure('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      } else if (e.code == 'wrong-password') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      }
    } catch (e) {
      log(
        'on FirebaseAuthException Sign In with Google catch (e) ${e.toString()}',
      );
      return right(ServerFailure('لقد حدث خطأ ما'));
    }
    return right(ServerFailure('لقد حدث خطأ ما'));
  }

  @override
  Future<Either<UserData, ServerFailure>> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        oauthCredential,
      );
      return left(UserData.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log(
        'on FirebaseAuthException Sign In with Apple catch (e) ${e.toString()}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        return right(ServerFailure('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(ServerFailure('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(ServerFailure('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(ServerFailure('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      } else if (e.code == 'wrong-password') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      }
    } catch (e) {
      log('on Sign In with Apple catch (e) ${e.toString()}');
      return right(ServerFailure('لقد حدث خطأ ما'));
    }
    return right(ServerFailure('لقد حدث خطأ ما'));
  }

  @override
  Future<Either<UserData, ServerFailure>> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );
      return left(UserData.fromFirebase(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log(
        'on FirebaseAuthException Sign In with Facebook catch (e) ${e.toString()}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        return right(ServerFailure('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(ServerFailure('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(ServerFailure('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(ServerFailure('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      } else if (e.code == 'wrong-password') {
        return right(
          ServerFailure('البريد الالكتروني أو كلمة المرور غير صحيحة'),
        );
      }
    } catch (e) {
      log('on Sign In with Facebook catch (e) ${e.toString()}');
      return right(ServerFailure('لقد حدث خطأ ما'));
    }
    return right(ServerFailure('لقد حدث خطأ ما'));
  }
}
