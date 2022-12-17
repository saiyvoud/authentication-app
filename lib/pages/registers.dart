// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final form = GlobalKey<FormState>();

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
                "Create An Account",
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
                      )
                    ]),
                child: TextFormField(
                  controller: fullname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "full name is require";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Full Name",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.person,
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
                    AuthService().register(
                      fullname: fullname.text.trim(),
                      email: email.text.trim(),
                      password: password.text.trim(),
                      context: context,
                    );
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
                      ]),
                  child: Center(
                    child: Text(
                      "Sign Up",
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
