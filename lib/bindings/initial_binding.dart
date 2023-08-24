import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    // await Get.putAsync<AppwriteService>(() => AppwriteService().init(),
    //     permanent: true);

    // Get.put(
    //     AuthController(
    //         authAPI: AuthAPI(account: appwriteService.account),
    //         userAPI: UserAPI(
    //             db: appwriteService.database,
    //             realtime: appwriteService.realtime)),
    //     permanent: true);
  }
}
