import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/onbording/bloc/onboarding_event.dart';
import 'package:my_project/onbording/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<StartOnboarding>((event, emit) async {
      emit(OnboardingInProgress());
      // Add any onboarding logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(OnboardingCompleted());
    });
  }
}