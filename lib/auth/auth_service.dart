import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?>signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        return null;
      }

      //obtain auth detail from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      //create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);


      return userCredential.user;
    }catch(e){
      print('Error on sign in');
      return null;
    }
  }

  Future<void> SignOut() async{
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }


}