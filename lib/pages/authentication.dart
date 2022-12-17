// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:authentication/pages/registers.dart';
import 'package:authentication/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List _children = [
    RegisterPage(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.indigo,
                Colors.indigo.shade800,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          onTap: _onTap,
          indicatorWeight: 2,
          indicator: UnderlineTabIndicator(),
          indicatorColor: Colors.white,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
              text: "Sign Up",
            ),
            Tab(
              text: "Sign In",
            ),
          ],
        ),
      ),
      body: _children[currentIndex],
    );
  }
}
