import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/feature/profile/presentation/widgets/network_avatar.dart';
import 'package:turbostart/feature/profile/presentation/widgets/participants_place.dart';
import 'package:turbostart/l10n/localizations.dart';

import 'package:turbostart/other/theme.dart' as theme;
import 'package:turbostart/other/turbostart_icons.dart';

import 'profile_screen_bloc.dart';

class ProfileScreenView extends StatefulWidget {
  @override
  _ProfileScreenViewState createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  ProfileScreenBloc get bloc => Provider.of<ProfileScreenBloc>(context);
  AppLocalizations get localizations => AppLocalizations.of(context);

  final testAvatars = [
    'https://d2ph5fj80uercy.cloudfront.net/06/cat4.jpg',
    'https://d2ph5fj80uercy.cloudfront.net/05/cat2384.jpg',
    'https://d2ph5fj80uercy.cloudfront.net/05/cat2338.jpg',
    'https://d2ph5fj80uercy.cloudfront.net/04/cat4428.jpg',
    'https://d2ph5fj80uercy.cloudfront.net/04/cat2122.jpg',
    'https://d2ph5fj80uercy.cloudfront.net/04/cat722.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.white,
        appBar: AppBar(
          title: Text(
            localizations.profile,
            style: theme.boldBlack22,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: bloc.logout,
                child: Icon(
                  TurbostartIcons.logout,
                  color: theme.red,
                ),
              ),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  StreamBuilder<UserInfo>(
                    stream: bloc.userInfoStreamController.stream,
                    initialData: bloc.userInfo,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final userInfo = snapshot.data;
                      return Column(
                        children: [
                          SizedBox(height: 30.23),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NetworkAvatar(
                                radius: 90,
                                url: userInfo.img,
                              ),
                            ],
                          ),
                          SizedBox(height: 29.52),
                          Text(userInfo.name, style: theme.boldRed22),
                          SizedBox(height: 72.46),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Column(
                                  children: [
                                    Text(localizations.rating, style: theme.boldBlack25),
                                    SizedBox(height: 9),
                                    Text(userInfo.rating.toString() + " " + localizations.place, style: theme.boldGreen20),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Column(
                                  children: [
                                    Text(localizations.macroregion, style: theme.boldBlack25),
                                    SizedBox(height: 9),
                                    Text(userInfo.macroregionName, style: theme.boldGreen20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 60.0),
                          Text(localizations.myMacroregion, style: theme.boldBlack25),
                          SizedBox(height: 17.35),
                          ParticipantsPlace(participantsAvatarLinks: testAvatars),
                          SizedBox(height: 11.68),
                          Text(userInfo.place.toString() + " " + localizations.placeInGeneralSetOff, style: theme.boldGreen20),
                          SizedBox(height: 100.00),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
