import 'package:flutter/material.dart';

import '../../../common/theme/text_themes.dart';
import '../../../common/utilities/dimensions.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    required this.label,
    required this.detail,
  });

  final String label;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: gBottomInset16,
      child: Row(
        children: [
          Text(
            '$label: ',
            style: _textTheme.bodyText2,
          ),
          Text(
            detail ?? 'N/A',
            style: _textTheme.bodyText2?.copyWith(fontWeight: gBoldFontWeight),
          ),
        ],
      ),
    );
  }
}
