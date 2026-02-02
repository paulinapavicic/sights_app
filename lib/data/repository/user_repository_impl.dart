import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/data/client/firebase_auth_client.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/user_repository.dart';

import '../../presentation/core/error/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthClient firebaseClient;

  UserRepositoryImpl(this.firebaseClient);



  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      final result = await firebaseClient.resetPassword(email);

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, User?>> signIn(String email, String password) async {
    try {
      final result = await firebaseClient.signIn(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> signUp(String email, String password) async {

    try {
      final result = await firebaseClient.signUp(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resendVerificationEmail() async {
    try{
      final result = firebaseClient.resendVerificationEmail();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut()async {
    try {
      final result = firebaseClient.signOut();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      final result = firebaseClient.deleteUser();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }
}