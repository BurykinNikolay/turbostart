import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/domain/models/app_tab.dart';
import 'package:turbostart/feature/pedometer/presentation/pedometer_screen.dart';
import 'package:turbostart/feature/profile/profile.dart';

import 'package:turbostart/other/theme.dart' as theme;

import 'components/tab_icon.dart';
import 'components/turbostart_tab_bar.dart';
import 'home_screen_bloc.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> with WidgetsBindingObserver {
  HomeScreenBloc get bloc => Provider.of<HomeScreenBloc>(context);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    bloc.responseStepsAndInfo();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  final List<Widget> _pagesList = [
    PedometerScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.mainGreen,
      body: Stack(
        children: [
          StreamBuilder<AppTab>(
            initialData: bloc.activeTab,
            stream: bloc.currentPageStream,
            builder: (context, snapshot) {
              return _pagesList[AppTab.toIndex(snapshot.data)];
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildTabBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return StreamBuilder<AppTab>(
      initialData: bloc.activeTab,
      stream: bloc.currentPageStream,
      builder: (context, snapshot) {
        final currentIndex = AppTab.toIndex(snapshot.data);
        return TurbostartTabBar(
          backgroundColor: theme.lightGray,
          currentIndex: currentIndex,
          items: _buildItems(currentIndex),
          onTap: (int index) {
            bloc.updateTab(
              AppTab.fromIndex(index),
            );
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _buildItems(int currentIndex) => AppTab.values
      .map(
        (tab) => BottomNavigationBarItem(
          icon: TabIcon(tab: tab, currentIndex: currentIndex),
        ),
      )
      .toList();
}
