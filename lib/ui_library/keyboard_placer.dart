import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class KeyboardPlacer extends StatefulWidget {
  KeyboardPlacer({this.needBottomSafeArea = false});
  final bool needBottomSafeArea;
  @override
  _KeyboardPlacerState createState() => _KeyboardPlacerState();
}

class _KeyboardPlacerState extends State<KeyboardPlacer> {
  bool _keysboardIsVisible = false;
  bool get needBottomSafeArea => widget.needBottomSafeArea;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
      _keysboardIsVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      height: _keysboardIsVisible ? data.viewInsets.bottom : (0.0 + (needBottomSafeArea ? data.padding.bottom : 0.0)),
    );
  }
}
