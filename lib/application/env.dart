import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static final String? emailPublicKey = dotenv.env['EMAIL_PUBLIC_KEY'];
  static final String? emailServiceId = dotenv.env['EMAIL_SERVICE_ID'];
  static final String? emailTemplateId = dotenv.env['EMAIL_TEMPLATE_ID'];
}
