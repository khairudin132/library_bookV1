import 'package:flutter/cupertino.dart';
import 'package:library_book/screen/home_screen.dart';
import 'package:library_book/screen/login/login.dart';
import 'package:library_book/states/current_user.dart';
import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  String currentUid;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //get the state, check current User, set AuthStatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();
    if (_returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}
