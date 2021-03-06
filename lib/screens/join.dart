import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/screens/login.dart';
import 'package:restaurant/screens/register.dart';

class JoinAppScreen extends StatefulWidget {
  @override
  _JoinAppScreenState createState() => _JoinAppScreenState();
}

class _JoinAppScreenState extends State<JoinAppScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: Theme.of(context).accentColor,
        labelColor: Theme.of(context).accentColor,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
        tabs: <Widget>[
          Tab(
            text: "Login",
          ),
          Tab(
            text: "Register",
          ),
        ],
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        LoginScreen(),
        RegisterScreen(),
      ]),
    );
  }
}
