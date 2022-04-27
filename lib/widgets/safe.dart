import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Safe extends StatelessWidget {
  const Safe({
    Widget? child,
    Key? key,
  })  : _child = child,
        super(key: key);

  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _child ?? SizedBox.shrink();
    }

    final shouldPad = !Platform.isAndroid || !Platform.isIOS;
    var child = _child ?? SizedBox.shrink();

    if (shouldPad) {
      child = Material(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: child,
            ),
          ),
        ),
      );
    }

    return child;
  }
}
