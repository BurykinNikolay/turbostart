import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/other/theme.dart' as theme;

import 'package:introduction_screen/introduction_screen.dart';

import 'onboarding_screen_bloc.dart';
import 'widgets/background_circules.dart';

class OnboardingScreenView extends StatefulWidget {
  @override
  _OnboardingScreenViewState createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  OnboardingScreenBloc get bloc => Provider.of<OnboardingScreenBloc>(context);

  final _parallaxController = ScrollController();
  Widget _buildSneakers(String assetName, Color backgroundColor) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                height: 170,
                width: 170,
              )
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/feature/onboarding/assets/$assetName.png',
                  width: 220.0,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBracelet(String assetName, Color backgroundColor) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              height: 170,
              width: 170,
            )
          ],
        ),
      ),
      Column(children: [
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 40),
            Image.asset(
              'lib/feature/onboarding/assets/$assetName.png',
              width: 220.0,
              height: 200,
            ),
          ],
        ),
      ]),
    ]);
  }

  Widget _buildGlove(String assetName, Color backgroundColor) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                height: 170,
                width: 170,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50),
                Image.asset(
                  'lib/feature/onboarding/assets/$assetName.png',
                  width: 220.0,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: theme.boldMainStyle,
      bodyTextStyle: theme.descriptionStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Material(
      color: theme.white,
      child: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/5k_logo.png', width: 140.0),
            SizedBox(height: 150),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 180,
                      child: BackgroundCircules(
                        contorller: _parallaxController,
                      ),
                    ),
                  ),
                  IntroductionScreen(
                    globalBackgroundColor: Colors.transparent,
                    pages: [
                      PageViewModel(
                        title: localization.moveAndAccumulateSteps,
                        body: "",
                        image: _buildSneakers('sneakers', theme.mainGreen),
                        decoration: pageDecoration,
                      ),
                      PageViewModel(
                        title: localization.allStepsAreSetOff,
                        body: "",
                        image: _buildBracelet('bracelet', theme.darkGreen),
                        decoration: pageDecoration,
                      ),
                      PageViewModel(
                        title: localization.teamVictoryYourVictory,
                        bodyWidget: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: localization.allStepsAreConvertedIntoRublesAndGoToACharityFund,
                            style: theme.descriptionStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: '\n' + localization.together,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        //  body: localization.allStepsAreConvertedIntoRublesAndGoToACharityFund,
                        image: _buildGlove('glove', theme.red),
                        decoration: pageDecoration,
                      ),
                    ],
                    onDone: () {
                      print("end");
                    },
                    showSkipButton: false,
                    showNextButton: false,
                    skipFlex: 0,
                    nextFlex: 0,
                    done: Container(),
                    dotsDecorator: const DotsDecorator(
                      size: Size(7.0, 7.0),
                      color: theme.mainGreen,
                      activeColor: theme.mainGreen,
                      activeSize: Size(19.0, 7.0),
                      spacing: EdgeInsets.only(left: 2.5, right: 2.5),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                    onChange: (int index) {
                      _parallaxController.animateTo(index * 100.0, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => print("bloc.end"),
              child: Container(
                color: Colors.transparent,
                child: Text(
                  localization.skip.toUpperCase(),
                  style: theme.normalGreyOpacity18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
