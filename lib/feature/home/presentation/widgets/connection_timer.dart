import 'package:flutter/material.dart';

/// A widget that displays the connection time.
final class ConnectionTimer extends StatelessWidget {
  /// Creates a [ConnectionTimer] widget.
  const ConnectionTimer({required this.duration, super.key});

  /// The duration of the connection time.
  final Duration duration;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Connecting Time',
          style: TextStyle(color: Color(0xFF666666), fontSize: 14),
        ),
        Text(
          _formatDuration(duration),
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
