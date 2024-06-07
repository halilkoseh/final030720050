import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learner_prokit/Screens/LearnerAchievement.dart';
import 'package:learner_prokit/Screens/LearnerFavourites.dart';
import 'package:learner_prokit/Screens/LearnerMyFriends.dart';
import 'package:learner_prokit/main.dart';
import 'package:learner_prokit/utils/AppWidget.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerImages.dart';
import 'package:learner_prokit/utils/LearnerStrings.dart';
import 'package:nb_utils/nb_utils.dart';

class LearnerProfile extends StatefulWidget {
  @override
  _LearnerProfileState createState() => _LearnerProfileState();
}

class _LearnerProfileState extends State<LearnerProfile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: learner_white, width: 4)),
                      child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(learner_ic_Profile), radius: width / 8.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(kullanici_adi, fontFamily: fontSemibold, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
                        text(learner_lbl_390_290_points, textColor: learner_textColorPrimary),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            learnerAward(learner_ic_medal, learner_colorPrimary),
                            learnerAward(learner_ic_crown, learner_green),
                            learnerAward(learner_ic_cup, learner_light_pink),
                            learnerAward(learner_ic_flag, learner_orange_dark),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 16),
                child: text(learner_lbl_general, fontFamily: fontBold, textAllCaps: true, textColor: learner_textColorPrimary),
              ),
              8.height,
              Container(
                decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    learnerOption(learner_ic_heart, learner_lbl_favourite_courses).onTap(() {
                      LearnerFavourites().launch(context);
                    }),
                    learnerOption(learner_ic_user, learner_lbl_my_friends).onTap(() {
                      LearnerMyFriends().launch(context);
                    }),
                    learnerOption(learner_ic_achievements, learner_lbl_achievements).onTap(() {
                      LearnerAchievements().launch(context);
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 16),
                child: text(learner_lbl_settings, fontFamily: fontBold, textAllCaps: true, textColor: learner_textColorPrimary),
              ),
              8.height,
              Container(
                decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    learnerOption(learner_ic_key, learner_lbl_edit_login_details),
                    learnerOption(learner_ic_correct, learner_lbl_update_interests),
                    learnerOption(learner_ic_block, learner_lbl_blocked_users),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: boxDecoration(bgColor: appStore.isDarkModeOn ? black : white, radius: 8, showShadow: true),
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(10),
                                child: Image.asset('images/ic_theme.png', color: appColorPrimary),
                              ),
                              16.width,
                              text('DarkMode', textColor: learner_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
                            ],
                          ),
                          Switch(
                            value: appStore.isDarkModeOn,
                            activeColor: appColorPrimary,
                            onChanged: (s) {
                              appStore.toggleDarkMode(value: s);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget learnerAward(var icon, var bgColor) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icon,
      ),
    ),
  );
}

Widget learnerOption(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: boxDecoration(bgColor: appStore.isDarkModeOn ? black : white, radius: 8, showShadow: true),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(icon),
            ),
            16.width,
            text(heading, textColor: learner_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: learner_textColorSecondary,
        ),
      ],
    ),
  );
}
