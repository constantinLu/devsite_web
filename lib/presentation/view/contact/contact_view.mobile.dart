import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

import '../../common/space.dart';
import '../../common/style.dart';

class ContactMobileView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ContactMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        children: [
          Text(
            "Contact",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Space.height(2.h)!,
          Text(
            "Get in touch or drop an email directly at:",
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 5,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: "office.devsite@gmail.com")).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Email address copied to clipboard"),
                      elevation: 0,
                      backgroundColor: kcWhiteCultured,
                    ));
                  });
                  // copied successfully
                },
                child: Text("office.devsite@gmail.com")),
          ),
          Space.height(2.h)!,
          const Divider(),
          FormBuilder(
            key: _formKey,
            onChanged: () => Center(
              child: Text("Form has been changed"),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'Namee',
                    decoration: const InputDecoration(
                        filled: true, hintText: "Name", border: InputBorder.none),
                  ),
                  Space.height(2.h)!,
                  FormBuilderTextField(
                    name: 'Email',
                    decoration: const InputDecoration(
                        filled: true, hintText: "Email", border: InputBorder.none),
                  ),
                  Space.height(2.h)!,
                  FormBuilderTextField(
                    name: 'Messagee',
                    maxLines: 10,
                    decoration: const InputDecoration(
                        filled: true, hintText: "Message", border: InputBorder.none),
                  ),
                  const Divider(),
                  Space.height(2.h)!,
                  RetroButton(
                      label: "SUBMIT",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                                child: Text("Email sent!",
                                    style: montserratStyleWithColor(
                                        context, 16, kcBlackFull, FontWeight.w400))),
                            elevation: 0,
                            backgroundColor: kcTitleTurquoise,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
