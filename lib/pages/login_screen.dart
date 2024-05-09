import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // email and pwtext controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;
  LoginScreen({Key? key, required this.onTap}) : super(key: key);

  // login method
  void login(BuildContext context) async {
    // auth service
    final authservice = AuthService();
    // try login
    try {
      await authservice.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }
    // catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            //welcome back message
            Text(
              'Welcome back buddy 🖤',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(
              height: 25,
            ),
            //email text field
            MyTextfield(
              hintText: 'Email',
              obsecureText: false,
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            //pw text field
            MyTextfield(
              hintText: 'Password',
              obsecureText: true,
              controller: _pwController,
            ),

            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              button: 'Login',
              onTap: () => login(context),
            ),

            const SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
