import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  signInWithGoogle() async{

    print('Now Google Sign in is done');
    //begin interactive Sign in process
    final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication googleAuth=await googleUser!.authentication;

    //create a new credentials for user
    final credential=GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);


  }
  Future<User?> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      //Begin Interactive Sign in
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;
      //Obtain outh details from requast
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      //Create New Credentials for users
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //Lets the users si
      final UserCredential authResult = await auth.signInWithCredential(
          credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
     // print("Error signing in with Google: $error");
      return null;
    }
  }


}