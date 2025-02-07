import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/bloc/sign_up_event.dart';
import 'package:my_project/auth/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(SignUpLoading());
      try {
        // Add your sign up logic here
        await Future.delayed(const Duration(seconds: 1));
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
  }
}