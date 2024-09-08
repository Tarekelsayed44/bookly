import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;
//بنستخدم الباكدج دي عشان اطبق مفهوم السينجلتون سيرفس عشان اعمل نسخة واحدة من الحاجة مش كل م اعوز استخدمها اعملها نسخة جديدة لا هي مرة واحدة وخلاص  زي الشيرد بيرفنسيس
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}