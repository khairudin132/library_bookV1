import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:library_book/model/user.dart';
import 'package:library_book/services/database.dart';

class CurrentUser extends ChangeNotifier {
  User _currentUser = User();

  User get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String returnVal = 'error';

    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      if (_currentUser != null) {
        _currentUser = await Database().getUserInfo(_firebaseUser.uid);
        if (_currentUser != null) {
          returnVal = 'success';
        }
      }
    } catch (e) {
      print(e);
    }

    return returnVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String returnVal = 'error ';
    User _user = User();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.fullName = fullName;
      String _returnString = await Database().createUser(_user);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }

    return returnVal;
  }

  Future<String> signOut() async {
    String returnVal = 'error ';

    try {
      await _auth.signOut();
      _currentUser = User();
      returnVal = 'success';
    } catch (e) {
      print(e);
    }

    return returnVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String returnVal = 'error ';

    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      _currentUser = await Database().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        returnVal = 'success';
      }
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }

    return returnVal;
  }
}
