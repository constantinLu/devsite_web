import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../common/space.dart';

class ContactDesktopView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ContactDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Column(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            children: [
              Text(
                "Contact",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Space.height(2.h)!,
              Text("Get in touch or drop an email directly at: office.devsite@gmail.com"),
              Space.height(2.h)!,
              Row(
                children: [
                  Text("Drop a message on whatsup: ",
                      style: Theme.of(context).textTheme.titleLarge),
                  IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.whatsapp)),
                ],
              ),
              //
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
                      RetroButton(label: "SUBMIT", onPressed: () => null,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

sendemail() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final httpHeadears = {
    'content-type': 'application/json',
  };
  final requestBody = {
    'service_id': 'asd',
    'template_id': 'asd',
    'user_id': 'asd',
    'accessToken': 'asd'
  };

  final response = await http.post(url, body: requestBody);
  print(response.body);
  print(response.headers);
}
