library holdnload;

import 'dart:async';

import 'package:flutter/material.dart';

import '../../holdnload.dart';


class HoldAndLoad extends StatelessWidget {
  HoldAndLoad(
      {
        required this.child,
        required this.controller,
      required this.isShootingButtonAnimate,
      required this.style,
      required this.callBackShootingStart,
      required this.callBackShootingEnd,
      required this.listener
      });

  //  to check weather the widget has animated or not .

  bool isShootingButtonAnimate;

  // this custom ShootingController src.controller is being used to initialized or start showing the circle progress. .

  ShootingController controller;

  // this stream src.controller is being used to change the status of long press of button either start or end.

  final StreamController _shootingButtonController = StreamController<bool>();

  Style style;

  // fires when long press gets start

  Function callBackShootingStart;

  // fires when long press gets end

 final Function callBackShootingEnd;


 // fires whenever progress value update
 final Function listener;

 // Child Widget

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext c, BoxConstraints constraints) {
        return shootingButton(constraints);
      },
    );
  }

  Widget shootingButton(BoxConstraints constraints) {
    return StreamBuilder(
        stream: _shootingButtonController.stream,
        builder: (context, snapshot) {
          return GestureDetector(
            onLongPressStart: (val) {
              isShootingButtonAnimate = true;
              _shootingButtonController.sink.add(true);
              callBackShootingStart.call();

            },
            onLongPressEnd: (val) {
              isShootingButtonAnimate = false;
              controller = ShootingController(ShootingValue(false, false));
              _shootingButtonController.sink.add(true);
              callBackShootingEnd.call();

            },
            onLongPress: () {
              isShootingButtonAnimate = true;
              controller = ShootingController(ShootingValue(true, true));
              _shootingButtonController.sink.add(true);
            },
            child: SizedBox.fromSize(
              size: style.outerSize,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: AnimatedContainer(
                      duration: kThemeChangeDuration,
                      width: isShootingButtonAnimate
                          ? style.outerSize.width
                          : style.innerSize.width,
                      height: isShootingButtonAnimate
                          ? style.outerSize.height
                          : style.innerSize.height,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: style.outerColor, width: style.outerWidth),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: style.gradient != null
                            ? BoxDecoration(
                                gradient: style.gradient!,
                                shape: BoxShape.circle,
                              )
                            : BoxDecoration(
                                color: style.backgroundColor!,
                                shape: BoxShape.circle,
                              ),
                        child: Center(
                          child: child,
                        ),
                      ),
                    ),
                  ),
                  _initializeWrapper(
                    isInitialized: () {
                      return (controller.value.isShootingStart ?? false);
                    },
                    builder: (_, __) {

                      return CircularProgressBar(
                        outerRadius: style.outerSize.width,
                        ringsColor: style.progressColor,
                        ringsWidth: style.progressWidth,
                        progressValue: (){
                          listener.call();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _initializeWrapper({
    required Widget Function(ShootingValue, Widget?) builder,
    bool Function()? isInitialized,
    Widget? child,
  }) {

    return ValueListenableBuilder<ShootingValue>(
      valueListenable: controller,

      builder: (_, ShootingValue value, Widget? w) {
        return isInitialized?.call() ?? value.isInitialized
            ? builder(value, w)
            : const SizedBox.shrink();
      },
      child: child,
    );
  }
}
