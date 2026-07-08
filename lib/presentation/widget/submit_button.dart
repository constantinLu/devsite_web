import 'package:flutter/material.dart';

import 'retro_button.dart';

/// A [RetroButton] that disables itself (and shows "SENDING...") while its async
/// [onSubmit] is in flight, so the form can't be submitted twice.
class SubmitButton extends StatefulWidget {
  final String label;
  final String busyLabel;
  final Future<void> Function() onSubmit;

  const SubmitButton({
    super.key,
    required this.label,
    required this.onSubmit,
    this.busyLabel = "SENDING...",
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _submitting = false;

  Future<void> _handlePressed() async {
    if (_submitting) return;
    setState(() => _submitting = true);
    try {
      await widget.onSubmit();
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RetroButton(
      label: _submitting ? widget.busyLabel : widget.label,
      enabled: !_submitting,
      onPressed: _handlePressed,
    );
  }
}
