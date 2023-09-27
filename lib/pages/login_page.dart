

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slutprojekt/components/my_button.dart';
import 'package:slutprojekt/components/my_text_field.dart';
import 'package:slutprojekt/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;

  // Constructor
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  void signIn() async {

// get the auth service
  final authService = Provider.of<AuthService>(context, listen: false);

  try {
    await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
    );
  } catch (e) {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              //logo
              Align(
                alignment: Alignment.topLeft, // Flytta ikonen till vänster
                child: Icon(
                  Icons.messenger_outline_outlined,
                  size: 90,
                  color: Colors.green[800],
                ),
              ),

                const SizedBox(height: 25),


                const Text('Welcome, start chatting now!',
                style: TextStyle(
                  fontSize: 16,
                ),
                ),

                const SizedBox(height: 25),


                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
              ),

                const SizedBox(height: 10),


                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                ),

                const SizedBox(height: 25),
                
                MyButton(onTap: signIn, text: "Log in"),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text('Not a member?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Create account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}