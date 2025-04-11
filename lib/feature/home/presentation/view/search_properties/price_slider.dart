part of 'search_property_view.dart';

class PriceSlider extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final int? value;

  const PriceSlider({super.key, required this.onChanged, this.value = 5000});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: "Price(\$500 - \$10000)".tr(),
          color: AppColor.black232323,
        ),
        yHeight(45.h),
        SfSliderTheme(
          data: SfSliderThemeData(
            tooltipBackgroundColor: AppColor.black000000,
            tooltipTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: SfSlider(
            min: 500,
            max: 10000,
            value: value,
            interval: 500,

            shouldAlwaysShowTooltip: true,
            // labelPlacement: LabelPlacement.onTicks,
            // showLabels: true,
            tooltipShape: CustomTooltipShape(),
            enableTooltip: true,
            showTicks: false,

            activeColor: Colors.orange,
            inactiveColor: Colors.grey.shade300,
            thumbIcon: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: AppColor.whiteFFFFFF, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            onChanged: (value) => onChanged(value.round()),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "\$500"),
              AppText(text: "\$10000"),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTooltipShape extends SfTooltipShape {
  @override
  void paint(PaintingContext context, Offset thumbCenter, Offset offset,
      TextPainter textPainter,
      {required RenderBox parentBox,
      required SfSliderThemeData sliderThemeData,
      required Paint paint,
      required Animation<double> animation,
      required Rect trackRect}) {
    final double padding = 12; // Padding inside the tooltip
    final double pointerSize = 6; // Triangle height

    // Calculate dynamic width based on text size
    textPainter.layout();
    final double textWidth = textPainter.width;
    final double textHeight = textPainter.height;
    final double tooltipWidth = textWidth + padding * 2;
    final double tooltipHeight = textHeight + padding;

    // Tooltip position
    final double tooltipX = thumbCenter.dx - (tooltipWidth / 2);
    final double tooltipY = thumbCenter.dy - 55;

    final RRect tooltipRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(tooltipX, tooltipY, tooltipWidth, tooltipHeight),
      Radius.circular(8),
    );

    // Create a triangle (pointer)
    Path trianglePath = Path();
    trianglePath.moveTo(thumbCenter.dx - pointerSize, tooltipY + tooltipHeight);
    trianglePath.lineTo(thumbCenter.dx + pointerSize, tooltipY + tooltipHeight);
    trianglePath.lineTo(thumbCenter.dx, tooltipY + tooltipHeight + pointerSize);
    trianglePath.close();

    // Draw tooltip background
    context.canvas.drawRRect(tooltipRect, paint);
    context.canvas.drawPath(trianglePath, paint);

    // Center text in tooltip
    final double textX = tooltipX + (tooltipWidth - textWidth) / 2;
    final double textY = tooltipY + (tooltipHeight - textHeight) / 2;
    textPainter.paint(context.canvas, Offset(textX, textY));
  }
}
