import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;


class TurboBottomSheet extends StatefulWidget {
  TurboBottomSheet({@required this.body, this.needHeader = true});
  final Widget body;
  final bool needHeader;
  @override
  _TurboBottomSheetState createState() => _TurboBottomSheetState();
}

class _TurboBottomSheetState extends State<TurboBottomSheet> {
  Widget get body => widget.body;

  @override
  Widget build(BuildContext context) {
    final header = Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 0.0),
        child: SizedBox(
          width: 80.0,
          height: 5.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.white,
              borderRadius: const BorderRadius.all(
                const Radius.circular(
                  4.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(37.0),
        topRight: const Radius.circular(37.0),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: theme.mainGreen,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 0,
                child: Image.asset(
                  'assets/background.png',
                  width: 171.0,
                  height: 495,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[if (widget.needHeader) header, body],
              ),
            ],
          )),
    );
  }
}
