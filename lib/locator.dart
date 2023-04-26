import 'package:forum_app/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();