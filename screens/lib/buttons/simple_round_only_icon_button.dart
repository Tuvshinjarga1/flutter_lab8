import 'package:flutter/material.dart';

class SimpleRoundOnlyIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Icon? icon;
  final Color? iconColor;
  final Alignment iconAlignment;
  final Function? onPressed;

  SimpleRoundOnlyIconButton({
    this.backgroundColor = Colors.redAccent,
    this.icon,
    this.iconColor,
    this.iconAlignment = Alignment.center,
    this.onPressed,
  });

  MainAxisAlignment getMainAxisAlignment() {
    if (this.iconAlignment == Alignment.center) {
      return MainAxisAlignment.center;
    } else if (this.iconAlignment == Alignment.centerLeft) {
      return MainAxisAlignment.start;
    } else if (this.iconAlignment == Alignment.centerRight) {
      return MainAxisAlignment.end;
    }
    return MainAxisAlignment.center;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    overlayColor: MaterialStateProperty.all(
                      this.backgroundColor,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      this.backgroundColor,
                    ),
                  ),
                  onPressed: () => onPressed!(),
                  child: Row(
                    mainAxisAlignment: getMainAxisAlignment(),
                    children: <Widget>[
                      iconAlignment == Alignment.center ||
                              iconAlignment == Alignment.centerLeft
                          ? Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          28.0,
                                        ),
                                      ),
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      backgroundColor,
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      backgroundColor,
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: Icon(
                                    icon!.icon,
                                    color: iconColor == null
                                        ? Colors.white
                                        : iconColor,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      iconAlignment == Alignment.centerRight ||
                              iconAlignment == Alignment.centerLeft
                          ? Expanded(
                              child: Container(),
                            )
                          : Container(),
                      iconAlignment == Alignment.centerRight
                          ? Transform.translate(
                              offset: Offset(10.0, 0.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          28.0,
                                        ),
                                      ),
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: Icon(
                                    icon!.icon,
                                    color: iconColor,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
