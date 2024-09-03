import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillersoft/components/custom_button.dart';
import 'package:pillersoft/screens/login/login_screen.dart';
import 'package:pillersoft/utilities/assets_paths/assets_paths.dart';
import 'package:pillersoft/utilities/core/kpadding.dart';
import 'package:pillersoft/utilities/gap/gap.dart';
import 'package:pillersoft/utilities/theme/ktext_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/animated_dot.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int activePage = 0;

  final List<Map<String, dynamic>> introData = [
    {
      'title': 'Klinic - ',
      'title2': 'No\nappointments or\nvideo calls required.',
      'title3':
          'Start a visit quickly and discreetly, whenever\nworks best for you and get a treatment',
    },
    {
      'title': 'Kareer & Events',
      'title2': '',
      'title3':
          'While you train, we bring you the relevant jobs and events to cater employment',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: KPadding.horizontal16,
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                ImagePath.logo,
                height: 80.h,
              ),
              Gap.height(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: AnimatedDot(isActive: activePage == index),
                  ),
                ),
              ),
              Gap.height(25),
              CarouselSlider.builder(
                  itemCount: introData.length,
                  options: CarouselOptions(
                    height: 250.h,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    enlargeFactor: 1,
                    padEnds: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activePage = index;
                      });
                    },
                  ),
                  itemBuilder: (context, itemIndex, pageIndex) {
                    return Column(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: introData[itemIndex]['title'],
                              style: KText.r28Bold),
                          TextSpan(
                              text: introData[itemIndex]['title2'],
                              style: KText.r24)
                        ])),
                        Gap.height(25),
                        Text(
                          introData[itemIndex]['title3'],
                          style: KText.r16,
                          textAlign: TextAlign.center,
                        )
                      ],
                    );
                  }),
              Gap.height(25),
              CustomButton(
                onTap: () {
                  Get.to(() => LoginScreen(),
                      transition: Transition.rightToLeft);
                },
                title: 'Get Started',
              ),
              Gap.height(25),
            ],
          ),
        ),
      ),
    );
  }
}
