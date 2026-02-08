import 'package:flutter/material.dart';

import '../theme/ds_theme_extension.dart';
import '../tokens/spacing_tokens.dart';

class DSTextField extends StatefulWidget {
  const DSTextField({
    super.key,
    required this.label,
    this.helperText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.semanticsLabel,
    this.enabled = true,
  });

  final String label;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? semanticsLabel;
  final bool enabled;

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  late final FocusNode _focusNode;

  bool get _hasError =>
      widget.errorText != null && widget.errorText!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.dsTheme;
    final Color labelColor = _hasError
        ? tokens.error
        : _focusNode.hasFocus
        ? tokens.focus
        : tokens.textSecondary;

    return Semantics(
      textField: true,
      enabled: widget.enabled,
      label: widget.semanticsLabel ?? widget.label,
      hint: widget.helperText,
      value: _hasError ? widget.errorText : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: labelColor),
          ),
          const SizedBox(height: DSSpacing.sm),
          TextField(
            focusNode: _focusNode,
            controller: widget.controller,
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            decoration: InputDecoration(
              hintText: widget.helperText,
              errorText: _hasError ? widget.errorText : null,
            ),
          ),
          if (widget.helperText != null && !_hasError) ...[
            const SizedBox(height: DSSpacing.xs),
            Text(
              widget.helperText!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: tokens.textSecondary),
            ),
          ],
        ],
      ),
    );
  }
}
