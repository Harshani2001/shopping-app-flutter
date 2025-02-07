import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/bloc/sign_in_event.dart';
import 'package:my_project/auth/bloc/sign_in_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // Add your authentication logic here
        await Future.delayed(const Duration(seconds: 1));
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}