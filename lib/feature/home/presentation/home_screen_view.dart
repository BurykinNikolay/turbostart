import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/domain/models/app_tab.dart';
import 'package:turbostart/feature/profile/profile.dart';

import 'package:turbostart/other/theme.dart' as theme;

import 'components/tab_icon.dart';
import 'components/turbostart_tab_bar.dart';
import 'home_screen_bloc.dart';

class HomeScreenView extends StatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenBloc get bloc => Provider.of<HomeScreenBloc>(context);

  final List<Widget> _pagesList = [
    Center(
      child: Text(
        "Page in Progress",
        style: theme.boldWhite36,
      ),
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildTabBar(),
      body: StreamBuilder<AppTab>(
        initialData: bloc.activeTab,
        stream: bloc.currentPageStream,
        builder: (context, snapshot) {
          return _pagesList[AppTab.toIndex(snapshot.data)];
        },
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
