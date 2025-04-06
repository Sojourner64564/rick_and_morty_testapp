abstract class Failure {}

class NoInternetFailure extends Failure {
  final String error;

  NoInternetFailure(this.error);
}

class ServerFailure extends Failure {
  final String error;

  ServerFailure(this.error);
}

class AppFailure extends Failure {
  final String error;

  AppFailure(this.error);
}

class CacheFailure extends Failure {}
