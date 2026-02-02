
sealed class Failure {
  String message;

  Failure({required this.message});
}

class FirebaseError extends Failure {
  FirebaseError({required super.message});
}

class GeneralError extends Failure {
  GeneralError({required super.message});
}

class NetworkError extends Failure {
  NetworkError({required super.message});
}
