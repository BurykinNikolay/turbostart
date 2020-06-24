import 'package:flutter/material.dart';

const Duration _kBottomSheetDuration = const Duration(milliseconds: 200);

class BottomSheetRoute<T> extends PopupRoute<T> {
  BottomSheetRoute(
      {this.builder,
      this.theme,
      this.barrierLabel,
      this.barrierColor,
      RouteSettings settings,
      this.resizeToAvoidBottomInset,
      this.dismissOnTap,
      this.callbackAfterClose,
      this.topPadding = 0})
      : super(settings: settings);

  final WidgetBuilder builder;
  final ThemeData theme;
  final bool resizeToAvoidBottomInset;
  final bool dismissOnTap;
  final VoidCallback callbackAfterClose;
  final double topPadding;

  @override
  Duration get transitionDuration => _kBottomSheetDuration;

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;
  @override
  final Color barrierColor;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = BottomSheet.createAnimationController(navigator.overlay);
    _animationController.addStatusListener((listener) {
      switch (listener) {
        case AnimationStatus.dismissed:
          break;
        default:
      }
    });
    return _animationController;
  }

  void closeBottomSheetListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
        callbackAfterClose();
        break;
      default:
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (callbackAfterClose != null) callbackAfterClose();
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _BottomSheet<T>(route: this),
    );
    if (theme != null) bottomSheet = Theme(data: theme, child: bottomSheet);
    return bottomSheet;
  }
}

class _BottomSheet<T> extends StatefulWidget {
  const _BottomSheet({Key key, this.route}) : super(key: key);

  final BottomSheetRoute<T> route;

  @override
  _BottomSheetState<T> createState() => _BottomSheetState<T>();
}

class _BottomSheetState<T> extends State<_BottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.route.animation,
        builder: (BuildContext context, Widget child) {
          double bottomInset = 0;
          return ClipRRect(
              child: CustomSingleChildLayout(
                  delegate: _ModalBottomSheetLayout(widget.route.animation.value, bottomInset, MediaQuery.of(context).size.height - widget.route.topPadding),
                  child: BottomSheet(animationController: widget.route._animationController, onClosing: () => Navigator.pop(context), builder: widget.route.builder)));
        });
  }
}

class _ModalBottomSheetLayout extends SingleChildLayoutDelegate {
  _ModalBottomSheetLayout(this.progress, this.bottomInset, this.height);

  final double progress;
  final double bottomInset;
  final double height;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(minWidth: constraints.maxWidth, maxWidth: constraints.maxWidth, minHeight: 0.0, maxHeight: height);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - bottomInset - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_ModalBottomSheetLayout oldDelegate) {
    return progress != oldDelegate.progress || bottomInset != oldDelegate.bottomInset;
  }
}
