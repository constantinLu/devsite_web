import 'package:devsite_web/presentation/common/style.dart';
import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

import '../../common/color_picker.dart';
import '../../common/space.dart';
import 'contact_view.dart';

class ContactDesktopView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ContactDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        children: [
          Text(
            "Contact",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Space.height(2.h)!,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                          content: Center(
                            child: Text("Email address copied to clipboard",
                                style: montserratStyleWithColor(
                                    context, 16, kcBlackFull, FontWeight.w500)),
                          ),
                          elevation: 0,
                          backgroundColor: kcTitleTurquoise,
                        ));
                      });
                      // copied successfully
                    },
                    child: Text("office.devsite@gmail.com")),
              ),
            ],
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
                    name: 'Name',
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
                    name: 'Message',
                    maxLines: 10,
                    decoration: const InputDecoration(
                        filled: true, hintText: "Message", border: InputBorder.none),
                  ),
                  const Divider(),
                  Space.height(2.h)!,
                  RetroButton(
                    label: "SUBMIT",
                    onPressed: () async {
                      var snackBar;
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        Map<String, dynamic> formData = _formKey.currentState!.value;
                        String name = formData['Name'];
                        String email = formData['Email'];
                        String message = formData['Message'];
                        snackBar = await sendEmail(context, name, email, message);
                        // Clear the form after successful email send
                        _formKey.currentState?.reset();
                      } else {
                        snackBar =
                            alertMessage(context, "Mailing provider had some issues! Please try again later", kcRed);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
