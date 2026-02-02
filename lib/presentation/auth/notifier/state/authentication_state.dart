import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';

sealed class AuthenticationState {
  const AuthenticationState();
}



 class LoadingState extends AuthenticationState {
  const LoadingState();
}

class AuthenticatedState extends AuthenticationState {
  final User currentUser;

  AuthenticatedState(this.currentUser);
}

class ErrorState extends AuthenticationState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class UnauthenticatedAuthState extends AuthenticationState {
  final Failure? error;
  final bool fromSignIn;

  const UnauthenticatedAuthState({this.error, required this.fromSignIn});
}