import 'package:blog_app_2/src/shared/presentation/forms/form_utils.dart';
import 'package:blog_app_2/src/shared/presentation/forms/validators.dart';
import 'package:blog_app_2/src/shared/types/form_field.dart';
import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.freezed.dart';

@freezed
class SignUpForm with _$SignUpForm, FormUtils {
  const SignUpForm._();
  const factory SignUpForm({
    @Default(FormField<String>(name: 'name')) FormField<String> name,
    @Default(FormField<String>(name: 'email')) FormField<String> email,
    @Default(FormField<String>(name: 'password')) FormField<String> password,
    @Default(FormField<String>(name: 'confirmPassword'))
        FormField<String> confirmPassword,
    @Default(FormField<String>(name: 'selfie')) FormField<String> selfie,
  }) = _SignUpForm;

  Result<String> get nameValidation => validateField(
        field: name.field,
        validators: Validators.required,
      );

  Result<String> get emailValidation => validateField(
        field: email.field,
        validators: Validators.email,
      );
  Result<String> get passwordValidation => validateField(
        field: password.field,
        validators: Validators.password,
      );
  Result<String> get confirmPasswordValidation => validateField(
        field: confirmPassword.field,
        validators: [
          ...Validators.password,
          ...Validators.genIsEqual(password.field.getOrElse(''))
        ],
      );

  Map<String, dynamic> toJson() => fieldsToJson([email, password]);
}
