abstract class SignUpEvent {}

class SignUpRequested extends SignUpEvent {
  final String email;
  final String password;
  final String phone;
  final String username;

  SignUpRequested({
    required this.email,
    required this.password,
    required this.phone,
    required this.username,
  });
}
