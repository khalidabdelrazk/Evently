import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  Text customText({required String text, Color? color,int ? fontSize,FontWeight? fontWeight}){
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.white,
        fontSize: fontSize?.toDouble() ?? 14,
        fontWeight: fontWeight?? FontWeight.w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: !langProvider.isDark ? AppColors.primaryColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(text: AppLocalizations.of(context)!.welcome),
            customText(text: AppLocalizations.of(context)!.john,fontSize: 24,fontWeight: FontWeight.w700),
            // Text(AppLocalizations.of(context)!.john),
          ],

        ),
        toolbarHeight: height*0.08,
      ),
      body: Column(
        children: [
          Container(
            height: height*0.1,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(22))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      customText(text: AppLocalizations.of(context)!.cairo,fontWeight: FontWeight.w700),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
