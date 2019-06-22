import 'package:get_it/get_it.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/utils/network_util.dart';

import 'data/message_provider.dart';
import 'data/message_repository.dart';

GetIt getIt = new GetIt();

void setupServiceLocator() {
  getIt.registerLazySingleton<AppProvider>(() => AppProvider());
  getIt.registerLazySingleton<NetworkUtil>(() => NetworkUtil());
  getIt.registerLazySingleton<MessageRepository>(() => MessageProvider());
}