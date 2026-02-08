import 'package:flutter/material.dart';

import '../theme/ds_theme_extension.dart';

enum DSBadgeVariant { neutral, success, warning, error, info }

class DSBadge extends StatelessWidget {
  const DSBadge({
    super.key,
    required this.label,
    this.variant = DSBadgeVariant.neutral,
    this.semanticsLabel,
  });

  final String label;
  final DSBadgeVariant variant;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tokens = context.dsTheme;
    final _BadgeColors colors = _colorsFor(tokens);

    return Semantics(
      label: semanticsLabel ?? label,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(tokens.radiusPill),
        ),
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: colors.foreground),
        ),
      ),
    );
  }

  _BadgeColors _colorsFor(DSTheme tokens) {
    switch (variant) {
      case DSBadgeVariant.neutral:
        return _BadgeColors(tokens.surface, tokens.textSecondary);
      case DSBadgeVariant.success:
        return _BadgeColors(tokens.success, tokens.onBrand);
      case DSBadgeVariant.warning:
        return _BadgeColors(tokens.warning, tokens.onBrand);
      case DSBadgeVariant.error:
        return _BadgeColors(tokens.error, tokens.onBrand);
      case DSBadgeVariant.info:
        return _BadgeColors(tokens.info, tokens.onBrand);
    }
  }
}

class _BadgeColors {
  const _BadgeColors(this.background, this.foreground);

  final Color background;
  final Color foreground;
}
