import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:devsite_web/presentation/widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

import '../../common/space.dart';
import '../../common/style.dart';
import 'contact_view.dart';

/// Dedicated tablet layout: the contact form centered and capped to a readable
/// width so inputs don't span the full tablet width.
class ContactTabletView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ContactTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Contact", style: Theme.of(context).textTheme.displaySmall),
              Space.height(2.h)!,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Flexible(
                    child: Text(
                      "Get in touch or drop an email directly at:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextButton(
                        onPressed: () {
                          Clipboard.setData(
                                  const ClipboardData(text: "office.devsite@gmail.com"))
                              .then((_) {
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
                        },
                        child: const Text("office.devsite@gmail.com")),
                  ),
                ],
              ),
              Space.height(2.h)!,
              const Divider(),
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'Name',
                        validator: (value) => requiredValidator(value, 'Name'),
                        decoration: const InputDecoration(
                            filled: true, hintText: "Name", border: InputBorder.none),
                      ),
                      Space.height(2.h)!,
                      FormBuilderTextField(
                        name: 'Email',
                        validator: emailValidator,
                        decoration: const InputDecoration(
                            filled: true, hintText: "Email", border: InputBorder.none),
                      ),
                      Space.height(2.h)!,
                      FormBuilderTextField(
                        name: 'Message',
                        validator: (value) => requiredValidator(value, 'Message'),
                        maxLines: 8,
                        decoration: const InputDecoration(
                            filled: true, hintText: "Message", border: InputBorder.none),
                      ),
                      const Divider(),
                      Space.height(2.h)!,
                      SubmitButton(
                        label: "SUBMIT",
                        onSubmit: () async {
                          if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
                            alertMessage(
                                context, "Please complete all fields with valid values.", kcRed);
                            return;
                          }
                          final formData = _formKey.currentState!.value;
                          await sendEmail(
                            context,
                            formData['Name'],
                            formData['Email'],
                            formData['Message'],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
