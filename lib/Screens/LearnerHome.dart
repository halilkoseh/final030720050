import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learner_prokit/model/LearnerModels.dart';
import 'package:learner_prokit/utils/AppWidget.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerDataGenerator.dart';
import 'package:learner_prokit/utils/LearnerStrings.dart';
import 'package:nb_utils/nb_utils.dart';

  class LearnerHome extends StatefulWidget {
     @override
_LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
late List<LearnerFeaturedModel> mList1 = [];
late List<LearnerCategoryModel> mList2 = [];

 @override
 void initState() {
  super.initState();
  loadData();
 }

 void loadData() async {
  mList1 = await LearnerGetFeatured();
  mList2 = await learnerGetCategories();
  setState(() {});
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(learner_lbl_featured, style: boldTextStyle()),
                  Text(learner_lbl_see_all, style: boldTextStyle(color: learner_colorPrimary)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return LearnerFeatured(mList1[index], index);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: text(learner_lbl_categories, fontFamily: fontBold, fontSize: textSizeNormal),
            ),
            16.height,
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LearnerCategory(mList2[index], index);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class LearnerFeatured extends StatelessWidget {
  final LearnerFeaturedModel model;

  LearnerFeatured(this.model, int pos);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: boldTextStyle()),
                4.height,
                Text(model.price, style: primaryTextStyle(color: learner_textColorSecondary)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LearnerCategory extends StatelessWidget {
  final LearnerCategoryModel model;

  LearnerCategory(this.model, int pos);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecoration(bgColor: context.cardColor, radius: 12),
                child: Image.asset(
                  model.img,
                  height: context.width() * 0.17,
                  width: context.width(),
                ),
              ),
              8.height,
              Text(model.name, style: boldTextStyle()),
            ],
          ),
        ),
      ],
    );
  }
}
