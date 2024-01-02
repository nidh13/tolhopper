import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class UndefinedCountryFailure extends Failure {}

class WrongEmailOrPassword extends Failure {}

class UserExistFailure extends Failure {}

class UserNotExistFailure extends Failure {}

class ConnexionFailure extends Failure {}

class CacheFailure extends Failure {}

class LocationFailure extends Failure {}
