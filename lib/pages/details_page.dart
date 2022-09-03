// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokemon/widgets/feature_title_text.dart';
import 'package:pokemon/widgets/feature_value_text.dart';
import 'package:pokemon/widgets/my_title.dart';
import 'package:pokemon/widgets/power_badge.dart';

class DetailsPage extends StatelessWidget {
  final Map? data;
  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ad0b0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTitle(
                            text: "${data!["name"]}",
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              for (String item in data!["type"])
                                PowerBadge(text: "$item")
                            ],
                          ),
                          Container(
                            height: 200.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34.0),
                          topRight: Radius.circular(34.0)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(top: 60.0),
                            height: double.infinity,
                            child: Column(
                              children: const [
                                FeatureTitleText(text: "Height"),
                                FeatureTitleText(text: "Weight"),
                                FeatureTitleText(text: "Candy"),
                                FeatureTitleText(text: "Egg")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(top: 60.0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FeatureValueText(text: "${data!["height"]}"),
                                FeatureValueText(text: "${data!["weight"]}"),
                                FeatureValueText(text: "${data!["candy"]}"),
                                FeatureValueText(text: "${data!["egg"]}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 160.0,
              child: Container(
                width: 200.0,
                height: 200.0,
                child: Hero(
                  tag: "Pokecard-${data!["name"]}",
                  child: Image.network(
                    "${data!["img"]}",
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
