import 'package:flutter/services.dart';

/// A input formatter that only allows characters matching a pattern..
final filteringTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_.-]*$'));
