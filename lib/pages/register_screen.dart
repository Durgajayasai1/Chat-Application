import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatelessWidget {
  // email and pwtext controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  // tap to go to login page
  final void Function()? onTap;

  RegisterScreen({Key? key, required this.onTap}) : super(key: key);

  // register method
  void register(BuildContext context) {
    // get Auth service
    final _auth = AuthService();

    // if password matches -> create an user
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }

    //passwords don't match -> tell user to fix
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords don't match!"),
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
              "Let's create an account for you 😎",
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
              height: 10,
            ),

            //confirm pw text field
            MyTextfield(
              hintText: 'Confirm password',
              obsecureText: true,
              controller: _confirmpwController,
            ),

            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              button: 'Register',
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login',
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
