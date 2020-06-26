import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TurboTabBar extends StatefulWidget {
  final Color backgroundColor;

  final Color foregroundColor;

  final List<Widget> widgets;

  final Function valueGetter;

  final Function(int) onTap;

  final bool useSeparators;

  final double horizontalPadding;

  final double verticalPadding;

  final BorderRadius borderRadius;

  final Duration duration;

  final bool expand;

  const TurboTabBar({
    this.backgroundColor,
    this.foregroundColor,
    this.widgets,
    this.valueGetter,
    this.onTap,
    Key key,
    this.useSeparators = false,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    this.borderRadius = const BorderRadius.all(const Radius.circular(10.0)),
    this.duration = const Duration(milliseconds: 250),
    this.expand = false,
  }) : super(key: key);

  @override
  _TurboTabBarState createState() {
    return _TurboTabBarState();
  }
}

class _TurboTabBarState extends State<TurboTabBar> {
  List<GlobalKey> _globalKeys;
  bool _showSelf;
  double _maxWidth;
  double _maxHeight;

  void onPostFrameCallback(Duration duration) {
    if (!_showSelf) {
      setState(() {
        _maxWidth = 0;
        _maxHeight = 0;
        for (int i = 0; i < _globalKeys.length; i++) {
          RenderBox _renderBox = _globalKeys[i].currentContext.findRenderObject();
          if (_renderBox.size.width > _maxWidth) {
            _maxWidth = _renderBox.size.width;
          }
          if (_renderBox.size.height > _maxHeight) {
            _maxHeight = _renderBox.size.height;
          }
        }
        _maxWidth += widget.horizontalPadding * 2.0;
        _maxHeight += widget.verticalPadding * 2.0;
        _showSelf = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _globalKeys = <GlobalKey>[];
    for (int i = 0; i < widget.widgets.length; i++) {
      _globalKeys.add(GlobalKey());
    }
    if (widget.expand) {
      _globalKeys.add(GlobalKey());
    }
    _showSelf = false;
    WidgetsBinding.instance.addPostFrameCallback(onPostFrameCallback);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Alignment _getAlignment() {
    return Alignment(-1.0 + widget.valueGetter() / (widget.widgets.length - 1) * 2, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    if (!_showSelf) {
      return Stack(
        children: List<Widget>.generate(_globalKeys.length, (int index) {
          if (index < widget.widgets.length) {
            return Container(
              key: _globalKeys[index],
              child: widget.widgets[index],
            );
          } else {
            return Container(
              key: _globalKeys[index],
              constraints: widget.expand ? BoxConstraints.expand(height: 1) : null,
            );
          }
        }),
      );
    } else {
      return Container(
        height: widget.expand ? null : _maxHeight,
        width: widget.expand ? null : (_maxWidth + widget.horizontalPadding * 2.0) * widget.widgets.length,
        constraints: widget.expand ? BoxConstraints.expand(height: _maxHeight) : null,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            AnimatedAlign(
              alignment: _getAlignment(),
              duration: widget.duration,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: widget.expand ? null : _maxHeight,
                  width: widget.expand ? null : _maxWidth + widget.horizontalPadding * 2.0,
                  constraints: widget.expand ? BoxConstraints.expand(width: _maxWidth / widget.widgets.length - widget.horizontalPadding * 2.0) : null,
                  decoration: BoxDecoration(
                    color: widget.foregroundColor,
                    borderRadius: widget.borderRadius,
                  ),
                ),
              ),
            ),
            if (widget.useSeparators)
              Row(
                children: List<Widget>.generate(widget.widgets.length * 2 - 1, (int index) {
                  if (index % 2 == 0) {
                    int _trueIndex = (index / 2.0).floor();
                    return Expanded(
                      child: GestureDetector(
                        child: widget.widgets[_trueIndex],
                        onTap: () {
                          widget.onTap(_trueIndex);
                        },
                      ),
                    );
                  } else {
                    return Container(
                      height: _maxHeight / 2.0,
                      width: 1.0,
                      color: widget.foregroundColor,
                    );
                  }
                }),
              ),
            if (!widget.useSeparators)
              Row(
                children: List<Widget>.generate(widget.widgets.length, (int index) {
                  return Expanded(
                    child: GestureDetector(
                      child: widget.widgets[index],
                      onTap: () {
                        widget.onTap(index);
                      },
                    ),
                  );
                }),
              ),
          ],
        ),
      );
    }
  }
}
