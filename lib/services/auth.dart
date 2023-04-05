import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_book/states/current_user.dart';
import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

@RoutePage()
class LibraryRoot extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LibraryRoot({super.key});

  // ------------------------------- PROPERTIES --------------------------------

  @override
  State<LibraryRoot> createState() => _LibraryRootState();
}

class _LibraryRootState extends State<LibraryRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  String? currentUserId;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //get the state, check current User, set AuthStatus based on state
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    String returnString = await currentUser.onStartUp();
    if (returnString == 'success') {
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
    return const Placeholder();
    // switch (_authStatus) {
    //   case AuthStatus.notLoggedIn:
    //     return const Login();
    //   case AuthStatus.loggedIn:
    //     return const HomeScreen();
    // }
  }
}
