import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'EMAIL_PUBLIC_KEY', obfuscate: false)
  static final String emailPublicKey = _Env.emailPublicKey;
  @EnviedField(varName: 'EMAIL_SERVICE_ID', obfuscate: false)
  static final String emailServiceId = _Env.emailServiceId;
  @EnviedField(varName: 'EMAIL_TEMPLATE_ID', obfuscate: false)
  static final String emailTemplateId = _Env.emailTemplateId;
}
