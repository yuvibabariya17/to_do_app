import 'package:flutter/material.dart';
import 'package:to_do_app/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: "Save", onpressed: onsave),
                const SizedBox(
                  width: 10,
                ),
                Mybutton(text: "Cancel", onpressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
