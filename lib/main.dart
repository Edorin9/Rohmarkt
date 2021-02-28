import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/theme/theme.dart';
import 'global_dependencies.dart';
import 'routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Rohmarkt());
}

/// + Rohmarkt

class Rohmarkt extends GetMaterialApp {
  Rohmarkt()
      : super(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          initialBinding: GlobalDependencies(),
          initialRoute: Routes.market,
          getPages: Pages.routes,
        );
}
