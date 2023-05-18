import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notivate/services/authentication_service.dart';

class FirebaseAuthenticationService implements AuthenticationService {
  const FirebaseAuthenticationService({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthState?> get state$ => _firebaseAuth
      .authStateChanges()
      .distinct()
      .map((user) => user == null ? null : _firebaseUserToAuthState(user));

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    UserCredential? credentials;

    try {
      credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (ex, trace) {
      log(
        ex.message ?? "unknown error",
        error: ex,
        stackTrace: trace,
        name: "FirebaseAuthenticationService#signUpWithEmailAndPassword",
      );
      return;
    }

    final user = credentials.user;

    if (user == null) return;

    log(
      "User: $user",
      name: "FirebaseAuthenticationService#signUpWithEmailAndPassword",
    );
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    UserCredential? credentials;

    try {
      credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (ex, trace) {
      log(
        ex.message ?? "unknown error",
        error: ex,
        stackTrace: trace,
        name: "FirebaseAuthenticationService#loginWithEmailAndPassword",
      );
      return;
    }

    final user = credentials.user;

    if (user == null) return;

    log(
      "User: $user",
      name: "FirebaseAuthenticationService#loginWithEmailAndPassword",
    );
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (ex, trace) {
      log(
        "Error signing out",
        error: ex,
        stackTrace: trace,
        name: "FirebaseAuthenticationService#logout",
      );
    }
  }

  AuthState? _firebaseUserToAuthState(User user) {
    final email = user.email;
    if (email == null) return null;

    return AuthState(email: email);
  }
}
