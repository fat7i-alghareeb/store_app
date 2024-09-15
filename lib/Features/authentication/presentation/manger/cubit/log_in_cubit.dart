import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/domain/entity/user_entity.dart';
import '../../../data/domain/repo/auth_repo.dart';
part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(LogInLoading());
    final results = await authRepo.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
    results.fold(
      (failure) {
        emit(LogInFailure(message: failure.message));
      },
      (user) {
        emit(LogInSuccess(userEntity: user));
      },
    );
  }
}