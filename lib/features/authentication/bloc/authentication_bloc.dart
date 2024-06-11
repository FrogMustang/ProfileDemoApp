import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:profile_demo_app/models/app_user.dart';
import 'package:profile_demo_app/repositories/repositories.dart';
import 'package:profile_demo_app/utils/utils.dart';
import 'package:quiver/core.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.auth,
  }) : super(const AuthenticationState()) {
    on<AuthenticationUserChanged>(_onUserChanged);
    on<AuthenticationLoggedIn>(_onLogin);
    on<AuthenticationSignedUp>(_onSignUp);
    on<AuthenticationLoggedOut>(_onLogOut);

    _userSubscription = auth.user.listen(
      (AppUser? user) => add(AuthenticationUserChanged(newUser: user)),
    );
  }

  final AuthenticationRepository auth;
  late final StreamSubscription<AppUser?> _userSubscription;

  void _onUserChanged(
    AuthenticationUserChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      state.copyWith(
        user: Optional.fromNullable(
          event.newUser,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onLogin(
    AuthenticationLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
        ),
      );

      final Either<String, bool> res = await auth.login(
        username: event.username,
        password: event.password,
      );

      res.fold(
        (String error) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              error: error,
            ),
          );
        },
        (bool success) {
          emit(
            state.copyWith(
              status: success
                  ? FormzStatus.submissionSuccess
                  : FormzStatus.submissionFailure,
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      logger.e('Failed to log in: \n'
          'ERROR: $e \n'
          '$stackTrace');
    }
  }

  Future<void> _onSignUp(
    AuthenticationSignedUp event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
        ),
      );

      final Either<String, bool> res = await auth.signUp(
        username: event.username,
        password: event.password,
      );

      res.fold(
        (String error) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              error: error,
            ),
          );
        },
        (bool success) {
          emit(
            state.copyWith(
              status: success
                  ? FormzStatus.submissionSuccess
                  : FormzStatus.submissionFailure,
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      logger.e('Failed to create a new account: \n'
          'ERROR: $e \n'
          '$stackTrace');
    }
  }

  Future<void> _onLogOut(
    AuthenticationLoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
        ),
      );

      final Either<String, bool> res = await auth.logout();

      res.fold(
        (String error) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              error: error,
            ),
          );
        },
        (bool success) {
          emit(
            state.copyWith(
              status: success
                  ? FormzStatus.submissionSuccess
                  : FormzStatus.submissionFailure,
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      logger.e('Failed to log out: \n'
          'ERROR: $e \n'
          '$stackTrace');
    }
  }
}
