import 'package:dartz/dartz.dart';
import 'package:teenstar/DOMAIN/core/failures.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(String input, int maxLength) {
  printDev();
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLenght(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateMaxStringLengthAndNoNull(String input, int maxLength) {
  printDev();
  if (input.length <= maxLength && input.length > 0) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLenghtOrNull(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  printDev();
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  printDev();
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  printDev();
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateTelephone(String input) {
  printDev();
  const telephoneRegex =
      r"""^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})$""";
  if (RegExp(telephoneRegex).hasMatch(input) || input.length == 0) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  printDev();
  if (input.length > 3) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePasswordConfirmation(String input, String input2) {
  printDev();
  if (input == input2) {
    return right(input);
  } else {
    return left(ValueFailure.confirmationPasswordFail(failedValue: input));
  }
}
