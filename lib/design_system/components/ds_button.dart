import 'package:flutter/material.dart';

import '../theme/ds_theme_extension.dart';

enum DSButtonVariant { primary, secondary }

class DSButton extends StatefulWidget {
  const DSButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = DSButtonVariant.primary,
    this.isLoading = false,
    this.semanticsLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final DSButtonVariant variant;
  final bool isLoading;
  final String? semanticsLabel;

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final tokens = context.dsTheme;
    final bool isEnabled = widget.onPressed != null && !widget.isLoading;

    final Color backgroundColor = _backgroundColor(tokens, isEnabled);
    final Color foregroundColor = _foregroundColor(tokens, isEnabled);
    final BorderSide? border = _border(tokens, isEnabled);

    return Semantics(
      button: true,
      enabled: isEnabled,
      label: widget.semanticsLabel ?? widget.label,
      child: AnimatedScale(
        scale: _pressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(tokens.radiusPill),
            border: border == null ? null : Border.fromBorderSide(border),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(tokens.radiusPill),
              onTap: isEnabled ? widget.onPressed : null,
              onHighlightChanged: (value) {
                if (!isEnabled) {
                  return;
                }
                setState(() {
                  _pressed = value;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Center(
                  child: widget.isLoading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              foregroundColor,
                            ),
                          ),
                        )
                      : Text(
                          widget.label,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: foregroundColor),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(DSTheme tokens, bool isEnabled) {
    if (!isEnabled) {
      return tokens.disabled;
    }

    switch (widget.variant) {
      case DSButtonVariant.primary:
        return tokens.brandPrimary;
      case DSButtonVariant.secondary:
        return Colors.transparent;
    }
  }

  Color _foregroundColor(DSTheme tokens, bool isEnabled) {
    if (!isEnabled) {
      return tokens.onDisabled;
    }

    switch (widget.variant) {
      case DSButtonVariant.primary:
        return tokens.onBrand;
      case DSButtonVariant.secondary:
        return tokens.brandPrimary;
    }
  }

  BorderSide? _border(DSTheme tokens, bool isEnabled) {
    if (widget.variant == DSButtonVariant.secondary) {
      return BorderSide(
        color: isEnabled ? tokens.brandPrimary : tokens.disabled,
      );
    }

    return null;
  }
}
