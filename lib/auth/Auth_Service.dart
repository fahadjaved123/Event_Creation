import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // create the instance
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
   final GoogleSignIn _googleSignIn = GoogleSignIn();
  // sign in
  Future<UserCredential> Signup(
    String email,
    String password,
    String firstname,
    String lastname,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        // Save additional user data to Firestore
        await _firestore.collection("users").doc(user.uid).set({
          "firstName": firstname,
          "lastName": lastname,
          "email": email,
          "uid": user.uid,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }
      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  // Login
  Future<UserCredential> Login(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseException catch (error) {
      throw (error.code);
    }
  }

  // Sign out
  Future<void> Signout() async {
    await _auth.signOut();
  }

  // for using Google 
   Future<User?> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in

      // Obtain Google Sign-In authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }
}
