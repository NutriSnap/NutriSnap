import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_providers.g.dart';

/// Provides access to a [FirebaseAuth.instance].
@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

/// Provides access to [FirebaseAuth.authStateChanges].
@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

// Old way:
// final firebaseAuthProvider =
//     Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
/// Provides access to [FirebaseAuth.authStateChanges].
// final authStateChangesProvider = StreamProvider<User?>(
//     (ref) => ref.watch(firebaseAuthProvider).authStateChanges());
