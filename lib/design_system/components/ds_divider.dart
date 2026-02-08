import 'package:flutter/material.dart';

import '../theme/ds_theme_extension.dart';

typedef DSDividerIndent = double;

class DSDivider extends StatelessWidget {
  const DSDivider({
    super.key,
    this.thickness = 1,
    this.indent = 0,
    this.endIndent = 0,
  });

  final double thickness;
  final DSDividerIndent indent;
  final DSDividerIndent endIndent;

  @override
  Widget build(BuildContext context) {
    final tokens = context.dsTheme;

    return Divider(
      height: thickness,
      thickness: thickness,
      color: tokens.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
