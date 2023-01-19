// ignore_for_file: deprecated_member_use
import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/components.dart';
import 'package:technewz/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';
void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, Uri url) {
  showBottomSheet(
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch '+url.toString();
  }
}

//your bottom sheet widget class
//you can put your things here, like buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl;
  final Uri url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomSheetImage(imageurl: imageurl, title: title),
            Container(
                padding: EdgeInsets.all(10),
                child: modified_text(
                    text: description, color: Colors.white, font: 16,)),
            Container(
              padding: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Read Full Article',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchUrl(url);
                          },
                        style: GoogleFonts.lato(
                          color: Colors.blue.shade400,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
