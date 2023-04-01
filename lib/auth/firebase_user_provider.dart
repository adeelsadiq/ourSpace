import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OurSpaceAppFirebaseUser {
  OurSpaceAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

OurSpaceAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OurSpaceAppFirebaseUser> ourSpaceAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<OurSpaceAppFirebaseUser>(
      (user) {
        currentUser = OurSpaceAppFirebaseUser(user);
        return currentUser!;
      },
    );
