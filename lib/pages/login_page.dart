// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(elevation: 0),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 40),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your Email and Password to Sign In",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 3, fontSize: 18),
              ),

              SizedBox(height: 20),

              //username and password

              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,

                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white)),
                  hintText: " Email or Username",
                  hintStyle:
                      TextStyle(color: Colors.deepPurple[100], fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,

                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.white,
                  ),
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white)),
                  hintText: " Password",

                  hintStyle:
                      TextStyle(color: Colors.deepPurple[100], fontSize: 18),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 150),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
