import 'package:dartz/dartz.dart';
import 'package:profile_demo_app/models/app_user.dart';

abstract class AuthenticationRepository {
  Stream<AppUser?> get user;

  Future<Either<String, bool>> login({
    required String username,
    required String password,
  });

  Future<Either<String, bool>> signUp({
    required String username,
    required String password,
  });

  Future<Either<String, bool>> logout();
}
