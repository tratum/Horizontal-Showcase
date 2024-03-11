library horizontal_showcase;
import 'package:flutter/material.dart';

class HorizontalShowcase {
  Future<void> build({
    required BuildContext context,
    required Color backgroundColor,
    required List<Widget> menuItems,
    double menuWidth = 230,
    double xOffset = -150,
    double yOffset = -150,
    double? elevation,
    Color? shadowColor,
    Clip clipBehaviour = Clip.none ,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
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
      items: [
        PopupMenuItem<int>(
          value: 1,
          child: Center(
            child: SizedBox(
              width: menuWidth, // To change the width of the PopUp Menu make changes here
              child: Padding(
                padding: padding,
                child: Row(
                  children: menuItems,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
