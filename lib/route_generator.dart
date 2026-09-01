import 'package:flutter/material.dart';
import 'cljd-out/minii-focus/routes.dart' as routes;

Route<dynamic>? appOnGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => routes.page_for(settings.name, settings.arguments),
  );
}
