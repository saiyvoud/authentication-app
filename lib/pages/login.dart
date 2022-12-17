// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:authentication/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final form = GlobalKey<FormState>();
  bool eye = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.indigo.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ]),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email is require";
                    } else if (!value.contains("@gmail.com")) {
                      return "Email must include @gmail.com";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.indigo.shade800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ]),
                child: TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is require";
                    } else if (value.length < 5) {
                      return "password must be 6 or more";
                    }
                    return null;
                  },
                  obscureText: eye,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.security,
                      color: Colors.indigo.shade800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (form.currentState!.validate()) {
                    form.currentState!.save();
                    AuthService().login(
                        email: email.text.trim(),
                        password: password.text.trim(),
                        context: context);
                  }
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo.shade800,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
