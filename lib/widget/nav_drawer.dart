import 'package:flutter/material.dart';
import 'package:library_book/screen/list_borrowed_book_screen.dart';
import 'package:library_book/screen/root/root.dart';
import 'package:library_book/states/current_user.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/mountain.jpg'),
              ),
            ),
            child: const SizedBox(),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Borrowed'),
//            onTap: () => {Navigator.of(context).pop()},
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListBorrowedBook()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              CurrentUser _currentUser =
                  Provider.of<CurrentUser>(context, listen: false);
              String _returnString = await _currentUser.signOut();
              if (_returnString == 'success') {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OurRoot(),
                    ),
                    (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
