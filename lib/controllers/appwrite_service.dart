// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart';
// import 'package:get/get.dart';

// import '../config/app_constants.dart';
// import '../config/appwrite_constants.dart';

// class AppwriteService extends GetxService {
//   static AppwriteService to = Get.find();
//   late Client _client;
//   late Account _account;
//   late Databases _database;
//   late Storage _storage;
//   late Realtime _realtime;

//   Client get client => _client;
//   Account get account => _account;
//   Databases get database => _database;
//   Storage get storage => _storage;
//   Realtime get realtime => _realtime;

//   Future<AppwriteService> init() async {
//     log.d('AppWrite Initilized');
//     await initializeAppwrite();
//     return this;
//   }

//   Future<User?> currentUserAccount() async {
//     try {
//       return await _account.get();
//     } on AppwriteException {
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<void> initializeAppwrite() async {
//     _client = Client();
//     _client
//         .setEndpoint(AppwriteConstants.endPoint)
//         .setProject(AppwriteConstants.projectId)
//         .setSelfSigned(status: true);

//     _account = Account(_client);
//     _database = Databases(_client);
//     _storage = Storage(_client);
//     _realtime = Realtime(_client);
//   }
// }
