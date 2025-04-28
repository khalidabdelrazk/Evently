import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';

class PageViewBody extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const PageViewBody({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  TextStyle customStyle({int? fontSize, Color? color}) {
    return TextStyle(
      color: color ?? AppColors.primaryColor,
      fontSize: fontSize?.toDouble() ?? 22,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<ChangeLang>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.4, width: width, child: Image.asset(image)),
        SizedBox(height: height * 0.05),
        Text(title, style: customStyle()),
        SizedBox(height: height * 0.05),
        Expanded(
          child: Text(
            desc,
            style: customStyle(
              fontSize: 18,
              color: langProvider.isDark ? AppColors.darkWhite : AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
