abstract interface class AuthenticationService {
  Stream<AuthState?> get state$;

  void signUpWithEmailAndPassword(String email, String password);

  void loginWithEmailAndPassword(String email, String password);

  void logout();
}

final class AuthState {
  const AuthState({required this.email});

  final String email;
}
