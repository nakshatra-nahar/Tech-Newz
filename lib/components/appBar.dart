import 'package:flutter/material.dart';
import 'package:technewz/utils/colors.dart';
import '../utils/text.dart';
class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            bold_text(text: 'Tech', font: 20, color: Colors.teal),
            bold_text(color: Colors.white, font: 20, text: 'News',)
          ],
        ),
      ),
    );
  }
}
