import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/domain/model/result.dart';

import '../../presentation/core/error/failure.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User?>> signIn(final String email, final String password);

  Future<Either<Failure, User?>> signUp(final String email, final String
  password);
  Future<Either<Failure, void>> resetPassword(final String email);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> resendVerificationEmail();

  Future<Either<Failure, void>> deleteUser();
}