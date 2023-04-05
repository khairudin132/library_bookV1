import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_book/router/router.gr.dart';

class LibraryNavigationDrawer extends StatelessWidget {
  const LibraryNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/mountain.jpg'),
              ),
            ),
            child: SizedBox(),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Borrowed'),
//            onTap: () => {Navigator.of(context).pop()},
            onTap: () => context.router.push(const ListBorrowedBookPageRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          // ListTile(
          //   leading: const Icon(Icons.exit_to_app),
          //   title: const Text('Logout'),
          //   onTap: () async {
          //     CurrentUser currentUser =
          //         Provider.of<CurrentUser>(context, listen: false);
          //
          //     String? result;
          //
          //     String result = await currentUser.signOut().whenComplete(() {
          //       if (result == 'success') {
          //         context.router.replaceAll([OurRoot()])
          //
          //         Navigator.pushAndRemoveUntil(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const OurRoot(),
          //             ),
          //                 (route) => false);
          //       }
          //     });
          //
          //   },
          // ),
        ],
      ),
    );
  }
}
