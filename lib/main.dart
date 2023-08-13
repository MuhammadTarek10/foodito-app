import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/language.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/config/utils/theme.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(OrderAdapter());
  await Hive.openBox(AppConstants.orders);
  await initApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetPathLocalization,
      child: Phoenix(child: const ProviderScope(child: App())),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    prefs.getLocale().then((locale) => {context.setLocale(locale)});
    InAppUpdate.checkForUpdate().then(
      (value) {
        if (value.updateAvailability == UpdateAvailability.updateAvailable) {
          InAppUpdate.startFlexibleUpdate().then((value) => null);
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.initialRoute,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
    );
  }
}
