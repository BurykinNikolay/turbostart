import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';
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
                        StreamBuilder<PedometerState>(
                          stream: bloc.pedometerStateStreamController.stream,
                          initialData: bloc.pedometerState,
                          builder: (context, snapshot) {
                            final pedometerState = snapshot.data;
                            return TurboTabBar(
                              backgroundColor: theme.lightGray,
                              foregroundColor: theme.mainGreen,
                              valueGetter: bloc.cupertinoTabBarValueGetter,
                              onTap: (int index) {
                                bloc.setPedometerType(index);
                              },
                              widgets: [
                                Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(localizations.iam, style: pedometerState.pedometerType == PedometerTypes.iam ? theme.boldWhite20 : theme.boldGray20),
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      localizations.macroregion,
                                      style: pedometerState.pedometerType == PedometerTypes.macroregion ? theme.boldWhite20 : theme.boldGray20,
                                    ),
                                  ),
                                )
                              ],
                              useSeparators: false,
                              borderRadius: const BorderRadius.all(const Radius.circular(18.0)),
                              duration: const Duration(milliseconds: 100),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 56.57),
                    StreamBuilder<StepsState>(
                      stream: bloc.stepsStateStreamController.stream,
                      initialData: bloc.stepsState,
                      builder: (context, snapshot) {
                        final stepsState = snapshot.data;
                        final cupertinoTabBarValue = bloc.cupertinoTabBarValueGetter();
                        return Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    children: [
                                      Text(localizations.today, style: theme.boldBlack25),
                                      SizedBox(height: 9),
                                      Text("${cupertinoTabBarValue == 0 ? stepsState?.stepsUserToday : stepsState?.stepsMacroregionToday}", style: theme.boldGreen40),
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
                                      Text("${cupertinoTabBarValue == 0 ? stepsState?.stepsUserAll : stepsState?.stepsMacroregionAll}", style: theme.boldGreen40),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50.6),
                            Text(cupertinoTabBarValue == 0 ? localizations.mySteps : localizations.stepsOfMacroregion, style: theme.boldBlack25),
                            SizedBox(height: 26.6),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    onTap: () {
                                      bloc.setTimePeriodType(TimePeriodTypes.week);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(localizations.week, style: bloc.timePeriodTypes == TimePeriodTypes.week ? theme.normalBlack18 : theme.normalGray18),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: GestureDetector(
                                      onTap: () {
                                        bloc.setTimePeriodType(TimePeriodTypes.month);
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(localizations.month, style: bloc.timePeriodTypes == TimePeriodTypes.month ? theme.normalBlack18 : theme.normalGray18),
                                        ),
                                      ),
                                    )),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    onTap: () {
                                      bloc.setTimePeriodType(TimePeriodTypes.allTime);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(localizations.allTime, style: bloc.timePeriodTypes == TimePeriodTypes.allTime ? theme.normalBlack18 : theme.normalGray18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 60),
                    Container(
                      height: 200 ,
                      child: ChartWidget(),
                    ),
                    SizedBox(height: 90),
                    LegendPlace(),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
