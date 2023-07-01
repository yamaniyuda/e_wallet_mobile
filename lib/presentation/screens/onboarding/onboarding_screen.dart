import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_wallet_mobile/config/route/route_controller.dart';
import 'package:e_wallet_mobile/presentation/screens/screen_entity.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:e_wallet_mobile/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget implements ScreenEntity {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  @override
  bool isGuard = false;

}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<Map<String, String>> _title = [
    {
      "title": "Grow Your \n Financial Today",
      "sub_title": "Our system is helping you to \n achieve a better goal"
    },
    {
      "title": "Build From \n Zero to Freedom",
      "sub_title": "We provide tips for you so that \n you can adapt easier"
    },
    {
      "title": "Start Together",
      "sub_title": "We will guide you to where \n you wanted it too"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset("assets/images/img_onboarding1.png", height: 331),
                Image.asset("assets/images/img_onboarding2.png", height: 331),
                Image.asset("assets/images/img_onboarding3.png", height: 331),
              ],
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
            ),
            const SizedBox(height: 80),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    _title[_currentIndex]["title"]!,
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    _title[_currentIndex]["sub_title"]!,
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: _currentIndex == 2 ? 50 : 38),
                  _currentIndex == 2
                      ? Column(
                    children: [
                      CustomFilledButton(
                        title: "Get Started",
                        onPress: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteCollection.homeScreen.name,
                            (route) => false
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 24,
                        child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteCollection.signInScreen.name);
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero
                          ),
                          child: Text(
                            "Sign In",
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                      : Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == 0
                                ? blueColor
                                : lightBackgroundColor
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == 1
                                ? blueColor
                                : lightBackgroundColor
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == 2
                                ? blueColor
                                : lightBackgroundColor
                        ),
                      ),
                      const Spacer(),
                      CustomFilledButton(
                        title: "Continue",
                        width: 150,
                        onPress: () {
                          _carouselController.nextPage();
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
