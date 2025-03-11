import 'package:get_it/get_it.dart';

import '../../features/Auth/Data/repos/AuthRepoImp.dart';
import '../../features/Auth/Data/repos/authRepo.dart';
import '../Services/AuthService.dart';
import '../Services/FireBaseAuthService.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(FireBaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(authService: getIt<AuthService>()));
  }
 