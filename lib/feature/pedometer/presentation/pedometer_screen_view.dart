import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/feature/pedometer/presentation/widgets/chart_widget.dart';
import 'package:turbostart/feature/pedometer/presentation/widgets/turbo_tab_bar.dart';
import 'package:turbostart/l10n/localizations.dart';

import 'package:turbostart/other/theme.dart' as theme;

import 'pedometer_screen_bloc.dart';
import 'widgets/legend_place.dart';

class PedometerScreenView extends StatefulWidget {
  @override
  _PedometerScreenViewState createState() => _PedometerScreenViewState();
}

class _PedometerScreenViewState extends State<PedometerScreenView> {
  PedometerScreenBloc get bloc => Provider.of<PedometerScreenBloc>(context);

  AppLocalizations get localizations => AppLocalizations.of(context);

  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.white,
        appBar: AppBar(
          title: Text(
            localizations.pedometer,
            style: theme.boldBlack22,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TurboTabBar(
                          backgroundColor: theme.lightGray,
                          foregroundColor: theme.mainGreen,
                          valueGetter: cupertinoTabBarValueGetter,
                          onTap: (int index) {
                            setState(() {
                              cupertinoTabBarValue = index;
                            });
                          },
                          widgets: [
                            Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(localizations.iam, style: cupertinoTabBarValue == 0 ? theme.boldWhite20 : theme.boldGray20),
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  localizations.macroregion,
                                  style: cupertinoTabBarValue == 1 ? theme.boldWhite20 : theme.boldGray20,
                                ),
                              ),
                            )
                          ],
                          useSeparators: false,
                          borderRadius: const BorderRadius.all(const Radius.circular(18.0)),
                          duration: const Duration(milliseconds: 100),
                        )
                      ],
                    ),
                    SizedBox(height: 56.57),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              Text(localizations.today, style: theme.boldBlack25),
                              SizedBox(height: 9),
                              Text("420", style: theme.boldGreen40),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              Text(localizations.total, style: theme.boldBlack25),
                              SizedBox(height: 9),
                              Text("420000", style: theme.boldGreen40),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.6),
                    Text(localizations.mySteps, style: theme.boldBlack25),
                    SizedBox(height: 26.6),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(localizations.week, style: theme.normalBlack18),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(localizations.month, style: theme.normalGray18),
                                ),
                              ),
                            )),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(localizations.allTime, style: theme.normalGray18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ChartWidget(),
                    LegendPlace(),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
