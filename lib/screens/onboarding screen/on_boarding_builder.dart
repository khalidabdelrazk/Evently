import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:evently/screens/onboarding%20screen/widgets/page_view_body.dart';
import 'package:flutter/material.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/providers/change_lang.dart';

class OnBoardingBuilder extends StatefulWidget {
  const OnBoardingBuilder({super.key});

  @override
  State<OnBoardingBuilder> createState() => _OnBoardingBuilderState();
}

class _OnBoardingBuilderState extends State<OnBoardingBuilder> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _next() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
    }
  }

  void _back() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Widget customIconButton(IconData icon, void Function() onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360),
        border: Border.all(color: AppColors.primaryColor, width: 2),
        // shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.primaryColor,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<ChangeLang>(context);
    double height = MediaQuery.of(context).size.height;
    final List<Map<String, String>> pages = [
      {
        "image": "assets/img/pageview1.png", // Replace with your asset path
        "title": AppLocalizations.of(context)!.find_event,
        "desc": AppLocalizations.of(context)!.dive,
      },
      {
        "image": "assets/img/pageview2.png",
        "title": AppLocalizations.of(context)!.effortless,
        "desc": AppLocalizations.of(context)!.take,
      },
      {
        "image": "assets/img/pageview3.png",
        "title": AppLocalizations.of(context)!.connect,
        "desc": AppLocalizations.of(context)!.make,
      },
    ];

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/evently_title.png',
          fit: BoxFit.fitHeight,
          height: height * 0.1,
        ),
        centerTitle: true,
        toolbarHeight: height * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return PageViewBody(
                    image: pages[index]["image"]!,
                    title: pages[index]["title"]!,
                    desc: pages[index]["desc"]!,
                  );
                },
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage != 0
                      ? customIconButton(
                        langProvider.isEnglish
                            ? Icons.arrow_back_ios
                            : Icons.arrow_forward_ios,
                        _back,
                      )
                      : SizedBox(width: width * 0.12),
                  Row(
                    children: List.generate(pages.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                          width: _currentPage == index ? 15 : 5,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Make it rounded
                            color: Colors.green,
                          ),
                        ),
                      );
                    }),
                  ),
                  customIconButton(
                    !langProvider.isEnglish
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    _next,
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
