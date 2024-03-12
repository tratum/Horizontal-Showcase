library horizontal_showcase;
import 'package:flutter/material.dart';

class HorizontalShowcase {
  static Future<void> build({
    required BuildContext context,
    required List<Widget> menuItems,
    Color backgroundColor = const Color(0XFFFFFFFF),
    double width = 230,
    double height = 50,
    double xOffset = -150,
    double yOffset = -150,
    double? elevation,
    Color? shadowColor = Colors.transparent,
    Clip clipBehaviour = Clip.none ,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
    Curve popupAnimation = Curves.decelerate,
    Duration animationDuration = const Duration(milliseconds: 1000),
  }) {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    final RenderBox cardBox = context.findRenderObject() as RenderBox;
    final Offset cardCenter =
        cardBox.localToGlobal(cardBox.size.center(Offset.zero));

    return showMenu(
      context: context,
      shape: shape,
      color: backgroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: Colors.transparent,
      elevation: elevation,
      clipBehavior: clipBehaviour,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset(
            cardCenter.dx + xOffset, // Adjust the x position
            cardCenter.dy + yOffset,
          ),
          Offset(
            cardCenter.dx + xOffset, // Adjust the x position
            cardCenter.dy + yOffset,
          ),
        ),
        Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width + 50,
            overlay.paintBounds.size.height),
      ),
      popUpAnimationStyle: AnimationStyle(curve: popupAnimation,duration: animationDuration),
      items: [
        PopupMenuItem<int>(
          value: 1,
          enabled: true,
          child: SizedBox(
            height: height,
            width: width, // To change the width of the PopUp Menu make changes here
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                children: menuItems,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
