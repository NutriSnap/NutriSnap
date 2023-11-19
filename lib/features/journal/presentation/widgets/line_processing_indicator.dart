import 'package:flutter/material.dart';

class LineProcessingIndicator extends StatelessWidget {
  final double unprocessed; // In the range [0, 1]
  final double processed; // In the range [0, 1]
  final double ultraprocessed; // In the range [0, 1]

  const LineProcessingIndicator({
    Key? key,
    required this.unprocessed,
    required this.processed,
    required this.ultraprocessed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LineGaugePainter(unprocessed, processed, ultraprocessed),
      size: const Size(double.infinity, 30), // Full width, 50 height
    );
  }
}

class LineGaugePainter extends CustomPainter {
  final double unprocessed;
  final double processed;
  final double ultraprocessed;

  LineGaugePainter(this.unprocessed, this.processed, this.ultraprocessed);

  @override
  void paint(Canvas canvas, Size size) {
    const double width = 1.4;
    final double lineHeight = size.height / 2; // Height of the line gauge

    // Define the paints
    final unprocessedPaint = Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineHeight;

    final processedPaint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineHeight;

    final ultraprocessedPaint = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineHeight;

    // Calculate the lengths based on the proportions
    double unprocessedLength = width * unprocessed;
    double processedLength = width * processed;
    double ultraprocessedLength = width * ultraprocessed;

    // Draw the lines
    canvas.drawLine(Offset(0, lineHeight / 2),
        Offset(unprocessedLength, lineHeight / 2), unprocessedPaint);
    canvas.drawLine(
        Offset(unprocessedLength, lineHeight / 2),
        Offset(unprocessedLength + processedLength, lineHeight / 2),
        processedPaint);
    canvas.drawLine(
        Offset(unprocessedLength + processedLength, lineHeight / 2),
        Offset(unprocessedLength + processedLength + ultraprocessedLength,
            lineHeight / 2),
        ultraprocessedPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
