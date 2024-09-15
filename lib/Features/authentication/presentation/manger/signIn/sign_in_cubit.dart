import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Features/authentication/data/domain/repo/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(SignInLoading());
    final results = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      userName: userName,
    );
    results.fold(
      (failure) {
        emit(SignInFailure(message: failure.message));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final results = await authRepo.signInWithGoogle();
    results.fold(
      (failure) {
        emit(SignInFailure(message: failure.message));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }
}