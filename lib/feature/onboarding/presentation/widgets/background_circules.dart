import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;

class BackgroundCircules extends StatefulWidget {
  final ScrollController contorller;

  const BackgroundCircules({Key key, this.contorller}) : super(key: key);

  @override
  _BackgroundCirculesState createState() => _BackgroundCirculesState();
}

class _BackgroundCirculesState extends State<BackgroundCircules> {
  Widget _buildCircle() {
    return Container(
      height: 172,
      width: 172,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.0, color: theme.mainGreen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.contorller,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: index == 0 ? const EdgeInsets.only(left: 45, right: 30) : const EdgeInsets.symmetric(horizontal: 30),
          child: _buildCircle(),
        );
      },
    );
  }
}
