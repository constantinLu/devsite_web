import 'package:flutter/material.dart';

class SendEmailButton extends StatelessWidget {
  final Function()? onTap;

  const SendEmailButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Send Email',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }
}
