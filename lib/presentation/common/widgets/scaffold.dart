import 'package:flutter/material.dart';

/* Scaffold with safe area */
class AppScaffold extends StatelessWidget {
  final Widget body;
  final AppBar appBar;
  final BottomNavigationBar bottomNavBar;

  AppScaffold({@required this.body, this.appBar, this.bottomNavBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: body,
        //For iPhone11,12 bottoms
        bottom: false,
      ),
      bottomNavigationBar: bottomNavBar,
      resizeToAvoidBottomPadding: false,
    );
  }
}
