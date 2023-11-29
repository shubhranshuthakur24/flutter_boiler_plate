import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/modules/user_account_modules/signup/services/sign_up_mixin.dart';
import 'package:get/get.dart';
import '../../../../routes/screen_names.dart';
import '../../../../styles/constants.dart';

class SignupScreenServices extends GetxController with  SignUpApiMixin {
  void textFieldValidation() {
    formKeyFirstName.currentState?.validate();
    formKeyLasttName.currentState?.validate();
    formKeyEmail.currentState?.validate();
    formKeyPassword.currentState?.validate();
    formKeyConfirmPassword.currentState?.validate();
    if (firstNameController.text.trim().isEmpty) {
    } else if (lastNameController.text.trim().isEmpty) {
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
      } else {}
    } else if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 7))) {
      } else {}
    } else if (confirmPasswordConfirmController.text.trim().isEmpty) {
    } else if (passwordController.text == confirmPasswordConfirmController.text) {
      buttonPressed.value = true;
      firebaseSignUpWithEmailAndPassword();
    } else {}
  }


  Future<void> firebaseSignUpWithEmailAndPassword() async {
    SignupScreenServices signupScreenServices = Get.find();

    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signupScreenServices.emailController.text.trim(),
          password: signupScreenServices.passwordController.text.trim());

      if (result.user != null) {
        // User registration successful
        signupScreenServices.buttonPressed.value = true;
        showPrint(result.toString());
        showPrint("line 24");
        apiSignUp(
          firebaseToken: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email,
          firebaseProfilePicUrl: "",
          name: FirebaseAuth.instance.currentUser!.displayName,
        );
      } else {
        // Handle the case when result.user is null
        throw Exception("User registration failed.");
      }
    } on FirebaseAuthException catch (e) {
      String er;
      if (e.code == 'weak-password') {
        er = "thePasswordProvidedIsTooWeak";
        showPrint("line 28");
      } else if (e.code == 'email-already-in-use') {
        er = 'The account already exists for that email. Please login instead';
        showPrint("line 38");
      } else {
        er = e.message!; // Use the error message for other cases
        showPrint(e.code.toString());
        showPrint("line 40");
      }
      signupScreenServices.buttonPressed.value = false;
      showPrint("line 42");
    } catch (e, stackTrace) {
      String er = e.toString();
      showPrint(er);
      showErrorDialog(er); // Display an error dialog
    }
  }

  void showErrorDialog(String error) {
    Get.dialog(
      AlertDialog(
        title: const Text("Error"),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

}

