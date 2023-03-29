import 'package:flutter/material.dart' show BuildContext, ModalRoute;

extension GetArgument on BuildContext {
  Map? getArgument<List>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final args = modalRoute.settings.arguments;
      if (args != null && args is List) {
        return args as Map;
      }
    }
    return null;
  }
}
