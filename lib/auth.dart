import 'package:google_sign_in/google_sign_in.dart';

import "user.dart";
import 'package:firebase_auth/firebase_auth.dart';

// define all the different methods that will interact with firebase 

class AuthService {



  // call a firebase auth instance do something with interact with firebase auth instance use the auth property 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); 

  // create user object based on Firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google

  Future signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,

  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  return _userFromFirebaseUser(user);

  }

  // sign out 

  Future signout() async {
    try {
      return await _auth.signOut();

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void signOutGoogle() async {
    
  await _googleSignIn.signOut();

  print("User Sign Out");
}

}