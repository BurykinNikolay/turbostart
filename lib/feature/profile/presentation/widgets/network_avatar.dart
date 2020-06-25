import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;

class NetworkAvatar extends StatelessWidget {
  final double radius;
  final String url;

  const NetworkAvatar({Key key, this.radius, this.url = 'https://d2ph5fj80uercy.cloudfront.net/05/cat183.jpg'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), border: Border.all(width: 1.0, color: theme.white)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(url,
            loadingBuilder: (ctx, widget, event) => event == null
                ? widget
                : CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(theme.red),
                  ),
            fit: BoxFit.cover),
      ),
    );
  }
}
