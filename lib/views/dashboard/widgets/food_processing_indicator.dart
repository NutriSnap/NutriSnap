import 'package:flutter/material.dart';

class FoodProcessingIndicator extends StatelessWidget {
  final double unprocessed; // In the range [0, 1]
  final double processed; // In the range [0, 1]
  final double ultraprocessed; // In the range [0, 1]

  const FoodProcessingIndicator({
    Key? key,
    required this.unprocessed,
    required this.processed,
    required this.ultraprocessed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 300, // Or specify the desired size
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pie chart visualization
          CustomPaint(
            painter: _DonutChartPainter(unprocessed, processed, ultraprocessed),
            size: const Size(250, 250), // Adjust for the desired circle size
          ),
          // Text inside the circle
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(unprocessed * 100).toInt()}% Unprocessed',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text('${(processed * 100).toInt()}% Processed',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text('${(ultraprocessed * 100).toInt()}% Ultraprocessed',
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final double unprocessed;
  final double processed;
  final double ultraprocessed;

  _DonutChartPainter(this.unprocessed, this.processed, this.ultraprocessed);

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = 0;
    final rect = const Offset(0, 0) & size;

    final unprocessedPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40.0; // Adjust for the desired "thickness" of the donut

    final processedPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40.0; // Adjust for the desired "thickness" of the donut

    final ultraprocessedPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40.0; // Adjust for the desired "thickness" of the donut

    // Draw unprocessed segment
    canvas.drawArc(
        rect, startAngle, 2 * 3.14159 * unprocessed, false, unprocessedPaint);
    startAngle += 2 * 3.14159 * unprocessed;

    // Draw processed segment
    canvas.drawArc(
        rect, startAngle, 2 * 3.14159 * processed, false, processedPaint);
    startAngle += 2 * 3.14159 * processed;

    // Draw ultraprocessed segment
    canvas.drawArc(rect, startAngle, 2 * 3.14159 * ultraprocessed, false,
        ultraprocessedPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
