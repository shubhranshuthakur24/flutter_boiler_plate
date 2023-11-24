import 'package:flutter_boiler_plate/app/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/app/styles/font_styles.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/app/styles/colors.dart';
import '../../../components/chat_input_feild/chat_input_feild.dart';
import '../../../components/feedback/views/feedback_response_with_star_widget.dart';
import '../../../components/feedback/views/widgets/feedback_star_widget.dart';
import '../../../components/feedback/views/widgets/rating_text_widget.dart';
import '../../../components/feedback/views/widgets/response_recorded_dialog_widget.dart';
import '../../../components/feedback/views/widgets/star_rating_widget.dart';
import '../../../components/feedback/views/widgets/submit_button.dart';
import '../../../components/feedback/views/widgets/user_feedback_widget.dart';
import '../../../components/loading_widget/loading_chat_widget.dart';
import '../../../components/side_menu/views/widgets/side_bar_panel.dart';
import '../../../helpers/api_related_services/apis_endpoint.dart';
import '../../../utils/device_related/device_identify.dart';
import '../models/chat_with_claude_message_model.dart';
import '../services/chat_with_claude_model_screen_services.dart';
import '../../../components/message_widget/global_message_widget.dart'; // Import your message widget

class HomeScreen
    extends GetView<HomeScreenServices> {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBarPanel(
        rightSideMargin: false,
        showSideMenu: true,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 20,
                            color: kColorMaroon,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(color: kColorWhite, child:  Center(child: Text("Home Screen Content" , style: kFontNotoSans.copyWith(fontSize: 30),)),)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

