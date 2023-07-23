import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeparatorDotLineWidget extends StatelessWidget {
  const SeparatorDotLineWidget(
      {Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final boxHeight = constraints.constrainHeight();
        print('boxHeight');
        print(boxHeight);
        print('boxWidth');
        print(boxWidth);
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}