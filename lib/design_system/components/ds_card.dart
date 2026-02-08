import 'package:flutter/material.dart';

import '../theme/ds_theme_extension.dart';
import '../tokens/spacing_tokens.dart';

enum DSCardVariant { filled, outlined }

class DSCard extends StatelessWidget {
  const DSCard({
    super.key,
    required this.child,
    this.variant = DSCardVariant.filled,
    this.padding,
    this.onTap,
    this.semanticsLabel,
  });

  final Widget child;
  final DSCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tokens = context.dsTheme;
    final BorderSide? border = variant == DSCardVariant.outlined
        ? BorderSide(color: tokens.border)
        : null;

    final Widget content = Container(
      padding: padding ?? const EdgeInsets.all(DSSpacing.lg),
      decoration: BoxDecoration(
        color: variant == DSCardVariant.filled
            ? tokens.surface
            : Colors.transparent,
        borderRadius: BorderRadius.circular(tokens.radiusLg),
        border: border == null ? null : Border.fromBorderSide(border),
      ),
      child: child,
    );

    if (onTap == null) {
      return Semantics(container: true, label: semanticsLabel, child: content);
    }

    return Semantics(
      container: true,
      button: true,
      label: semanticsLabel,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(tokens.radiusLg),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(tokens.radiusLg),
          child: content,
        ),
      ),
    );
  }
}
