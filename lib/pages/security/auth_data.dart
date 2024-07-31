import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class AuthenticationDataSource{
  Future<void> register(String Email,String password,String confinmPassword);
  Future<void> login(String Email,String password);
  Future<void> googleSignIn();
}
class AuthenticationRemote extends AuthenticationDataSource {
  @override
  Future<void> login(String emailAddress, String myPassword) async {
    // print('The Email Id ${email}');
    //try{}
    //final creadentials=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    try {
      //print('eamil $emailAddress');
      // print('eamil $password');
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: myPassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> register(String email, String password,
      String confirmPassword) async {
    if (password == confirmPassword) {
      print('FireBase Call Fro Create');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    }
  }

  @override
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
      print("Error signing in with Google: $error");
      return null;
    }
  }

}