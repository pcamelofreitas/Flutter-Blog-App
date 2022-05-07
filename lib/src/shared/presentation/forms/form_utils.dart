import 'package:blog_app_2/src/shared/errors/form_error.dart';
import 'package:blog_app_2/src/shared/types/form_field.dart';
import 'package:blog_app_2/src/shared/types/maybe.dart';
import 'package:blog_app_2/src/shared/types/result.dart';

class FormUtils {
  Result<String> validateField({
    required Maybe field,
    required List<String? Function(String)> validators,
  }) {
    List<String> errorMsgs = [];

    for (Function validator in validators) {
      String? error = validator(field.when(
        nothing: () => '',
        just: (val) => val != null ? val.toString() : '',
      ));
      if (error != null) errorMsgs.add(error);
    }

    return errorMsgs.isEmpty
        ? const Success('')
        : Failure(
            FormError(
              slug: errorMsgs.first,
            ),
          );
  }

  Map<String, dynamic> fieldsToJson(List<FormField> fields) {
    final data = <String, dynamic>{};

    fields.forEach(
      (e) {
        e.field.map(
          nothing: (_) => {},
          just: (val) {
            data[e.name] = val.value;
          },
        );
      },
    );

    return data;
  }
}
