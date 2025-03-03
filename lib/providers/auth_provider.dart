// state provider to manage authOption
import 'package:amazon/core/constants/enum.dart';
import 'package:amazon/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthStateNotifier extends StateNotifier<AuthOption> {
//   AuthStateNotifier(AuthOption state) : super(state);

//   void setAuthOption(AuthOption option) {
//     state = option;
//   }
// }

final authOptionProvider = StateProvider<AuthOption>((ref) => AuthOption.login);
final obscurePasswordProvider = StateProvider<bool>((ref) => true);
final AuthRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
}); 

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(AuthRepositoryProvider).authStateChanges;
});
