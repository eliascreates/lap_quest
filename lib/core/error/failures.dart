import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  String get message;

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {

  @override
  final String message;

  CacheFailure(this.message);
}

class DatabaseFailure extends Failure {

  @override
  final String message;

  DatabaseFailure(this.message);
}
