import 'package:flutter/material.dart';
// "MERCEDES - FORTECH",
// "SECUR AUTH - FORTECH",
// "RESUME - FORTECH",
// "OFFICE SPACE - FORTECH",
// "FORCAST APP - FORTECH",
// "REVOLUT - BAILIFF - DEBT COLLECTION - MIGRATING + ADDING NEW FEATURES",
// "REVOLUT - EBA - FEATURES",
// "SEPA INSTANT - MAINTENANCE",
// "SEPA NON INSTANT - MAINTENANCE",
// "SEPA - PROJECT TESTER OF TRANSACTION WITH BANKS IN DEV-MODE",
// "WEBSHOP - ORANGE",
// "EUROCONTROL - CNS-CAP"

import '../common/app_constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller; // This is extra, but we'll need it very shortly
  const InputField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration.collapsed(
          hintText: 'Enter your Email',
          hintStyle: TextStyle(
            color: Color(0xff989898),
          ),
          filled: true,
          fillColor: Color(0xFF232323),
        ),
      ),
      width: kdDesktopMaxContentWidth * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
