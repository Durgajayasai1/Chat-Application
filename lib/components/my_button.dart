import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String button;
  final void Function()? onTap;
  const MyButton({Key? key, required this.button, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(button),
        ),
      ),
    );
  }
}
