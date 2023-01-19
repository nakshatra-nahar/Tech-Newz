import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewz/components/bottomsheet.dart';
import 'package:technewz/components/components.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/text.dart';

class newsBox extends StatelessWidget {
  final String imageurl, title, time, description;
  final Uri url;
  const newsBox(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            width: w,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Row(
              children: [
                CachedNetworkImage(
                  color: Colors.black,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modified_text(
                          text: title, font: 16, color: AppColors.white),
                      SizedBox(height: 10),
                      modified_text(
                          text: time, font: 10, color: AppColors.white)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget()
      ],
    );
  }
}
