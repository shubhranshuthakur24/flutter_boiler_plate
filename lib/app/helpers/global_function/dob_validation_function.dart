import 'package:intl/intl.dart';

bool kValidationDob({required String dobYear}) {
  bool returnResult = false;
  try {
    returnResult = !(int.parse(dobYear.trim()) <= (int.parse(DateFormat('y').format(DateTime.now())) - 120));
    if (int.parse(dobYear.trim()) >= int.parse(DateFormat('y').format(DateTime.now())) - 17) {
      returnResult = false;
    }
  } catch (error) {
    returnResult = false;
    // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace, hintTextForSentry: dobYear);
  }

  return returnResult;
}
