import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient {
  final FirebaseAuth instance;
  const FirebaseAuthClient(this.instance);

  Future<User?> signIn(final String email, final String password) async {
    final userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredentials.user;
  }

  Future<User?> signUp(final String email, final String password) async {
    final credential = await instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<void> resetPassword(final String email) => instance.sendPasswordResetEmail(email: email);

  Future<void> signOut() => instance.signOut();

  Future<void> deleteUser() => instance.currentUser!.delete();

  Future<void> resendVerificationEmail() => instance.currentUser!.sendEmailVerification();

}
