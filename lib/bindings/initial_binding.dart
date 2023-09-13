import 'package:get/get.dart';
import 'package:science_go/apis/auth_api.dart';
import 'package:science_go/controllers/appwrite_service.dart';
import 'package:science_go/controllers/auth_controller.dart';

import '../config/controllers.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync<AppwriteService>(() => AppwriteService().init(),
        permanent: true);

    Get.put(AuthController(authAPI: AuthAPI(account: appwriteService.account)),
        permanent: true);
  }
}
