import 'package:logger/logger.dart';

/// Provides access to a singleton [Logger] instance.
final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    colors: false,
    lineLength: 80,
    noBoxingByDefault: true,
    printEmojis: false,
  ),
);
