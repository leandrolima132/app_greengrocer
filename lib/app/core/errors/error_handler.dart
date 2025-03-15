import 'package:flutter/material.dart';
import 'package:greengrocer/app/core/errors/exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static void showErrorSnackBar(BuildContext context, Failure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(failure.message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static Failure mapExceptionToFailure(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    }
    return ServerFailure('Erro inesperado');
  }
}
