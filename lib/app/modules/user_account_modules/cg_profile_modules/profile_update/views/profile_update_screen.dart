import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:image_picker/image_picker.dart';

import '../../../../../components/const_widgets/change_with_image_widget.dart';
import '../../../../../components/const_widgets/profile_text_field_widget.dart';
import '../../../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../../../helpers/global_function/string_manipulation.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/constantImageWidget.dart';
import '../../../../../styles/constants.dart';
import '../../../../../styles/font_styles.dart';
import '../../../../../styles/k_icons.dart';
import '../services/profile_update_services.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  ProfileUpdateServices controller = Get.put(ProfileUpdateServices());
  bool isImageLoading = false;

  // @override
  // void initState() {
  //   // try {
  //   //   careGiverUpdateServices.isPreviousScreenIsHome = Get.arguments;
  //   // } catch (ignoredError) {}
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: kColorSteelGray,
            body: SideBarPanel(
              showSideMenu: true,
              child: Obx(() {
                return controller.apiLoading.value == true? showSpinkitRing()
                    : controller.userScreenModel.value != null? Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 63,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              customInkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    const ChangeThisWidgetWithImage(),
                                    // Image.asset(
                                    //   "images/icons/backBlack.png",
                                    //   width: 15,
                                    //   height: 18,
                                    // ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "Back",
                                      style: kFontNotoSansS18W400Para1.copyWith(
                                          color: kColorBlack),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              // customInkWell(
                              //   onTap: () {
                              //     careGiverUpdateServices.cgProfileUpdate();
                              //   },
                              //   child: Text(
                              //     "Save",
                              //     style: kFontButton1S18W400NotoSans.copyWith(fontWeight: FontWeight.w600),
                              //   ),
                              // ),
                              Expanded(
                                child: customInkWell(
                                  onTap: () {
                                    controller.cgProfileUpdate();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 29, vertical: 9),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: kColorBlueDark,
                                            borderRadius: BorderRadius.circular(
                                                5)),
                                        child: Text(
                                          "Save",
                                          style:
                                          kFontNotoSansS18W400Para1.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: kColorWhite),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        SizedBox(
                          width: 130,
                          height: 120,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GetPlatform.isWeb
                                  ? controller.fileForWeb.path != "zz" ||
                                  false
                                  ? Container(
                                child: controller.fileForWeb.path == "zz"
                                    ? kImageWidget(
                                    imageRadius: 60,
                                    imageUrl: "",
                                    name: controller.cgFullNameEditingController
                                        .text)
                                    : ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: CircleAvatar(
                                      backgroundColor: kColorBlueExtraLight,
                                      radius: 60,
                                      backgroundImage: MemoryImage(
                                          controller.webImage), //here
                                    )),
                              )
                                  : nameImage(
                                  name: controller.cgFullNameEditingController
                                      .text)
                                  : controller.image == null
                                  ? kImageWidget(
                                  imageRadius: 60,
                                  imageUrl: "",
                                  name: controller.cgFullNameEditingController
                                      .text)
                                  : CircleAvatar(radius: 60,
                                  backgroundImage: FileImage(controller.file)),
                              // : nameImage(name: careGiverUpdateServices.cgFullNameEditingController.text),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: customInkWell(
                                    onTap: () async {
                                      setState(() {
                                        isImageLoading = true;
                                      });

                                      try {
                                        if (GetPlatform.isWeb) {
                                          setState(() {
                                            isImageLoading = false;
                                          });
                                          final ImagePicker picker = ImagePicker();

                                          XFile? image = await picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxHeight: 300,
                                              maxWidth: 300,
                                              imageQuality: 60);
                                          setState(() {
                                            isImageLoading = true;
                                          });
                                          if (image != null) {
                                            var f = await image.readAsBytes();
                                            setState(() {
                                              controller.fileForWeb = File("a");
                                              controller.webImage = f;
                                            });
                                          } else {}
                                        } else {
                                          controller.image =
                                          await controller.picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxHeight: 200,
                                              maxWidth: 200,
                                              imageQuality: 50);
                                          controller.file =
                                              File(controller.image!.path);
                                        }
                                      } catch (error, stackTrace) {
                                        // SentryFunction.captureErrorFromTryCatchBlock(error: error, stackTrace: stackTrace);
                                        setState(() {
                                          isImageLoading = false;
                                        });
                                      }
                                      setState(() {
                                        isImageLoading = false;
                                      });
                                    },
                                    child: const ChangeThisWidgetWithImage(),
                                    // Image.asset(
                                    //   "images/icons/editImageBlack.png",
                                    //   height: 20,
                                    //   width: 20,
                                    // )
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ProfileTextFieldsWidget(
                          assestImageName: "nameTagBlack.png",
                          textEditingController: controller
                              .cgFullNameEditingController,
                          type: "Name",
                          // text: "${careGiverUpdateServices.cgFirstName} ${careGiverUpdateServices.cgLastName}",
                          maxInputCharLength: 33,
                        ),
                        customInkWell(
                          onTap: () {},
                          child: IgnorePointer(
                            child: ProfileTextFieldsWidget(
                              textColor: kColorGray,
                              assestImageName: "emailBlack.png",
                              textEditingController: controller
                                  .cgEmailEditingController,
                              type: "email",
                              // text: careGiverUpdateServices.cgEmail,
                              maxInputCharLength: 32,
                            ),
                          ),
                        ),
                        // ProfileTextFieldsWidget(
                        //   assestImageName: "zipCode.png",
                        //   textEditingController: careGiverUpdateServices.cgZipcodeEditingController,
                        //   type: "Zip Code",
                        //   // text: careGiverUpdateServices.cgZipcode,
                        //   maxInputCharLength: 5,
                        //   textInputFormatter: [
                        //     FilteringTextInputFormatter.digitsOnly,
                        //   ],
                        // ),
                        // ProfileTextFieldsWidget(
                        //   assestImageName: "yearOfBirthBlack.png",
                        //   textEditingController: careGiverUpdateServices.cgDobEditingController,
                        //   type: "yearOfBirth",
                        //   // text: careGiverUpdateServices.dob,
                        //   maxInputCharLength: 4,
                        //   textInputFormatter: [
                        //     FilteringTextInputFormatter.digitsOnly,
                        //   ],
                        // ),
                        // ProfileTextFieldsWidget(
                        //   assestImageName: "contactNumberBlack.png",
                        //   textEditingController: careGiverUpdateServices.,
                        //   type: "contactNumberOptional",
                        //   // text: careGiverUpdateServices.cgContactDetails,
                        //   maxInputCharLength: 13,
                        //   textInputFormatter: [StringManipulation.maskTextInputFormatter],
                        // ),
                      ],
                    ),
                  ),
                ): showSpinkitRing();
              }),
            ),
          ),
        ),
        onWillPop: () async {
          if (controller.hasAnythingChanged == true) {
            // UserBioServices.apiGetCgProfile(navigateMethod: "off");
            // Get.offAll(() => const MenuScreen());
          } else {
            Navigator.pop(context);
          }

          return false;
        });
  }
}
