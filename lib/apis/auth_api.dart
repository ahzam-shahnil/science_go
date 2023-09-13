import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';

import '../config/app_constants.dart';
import '../core/failure.dart';
import '../core/type_defs.dart';
import '../core/utils.dart';

abstract class IAuthAPI {
  //* To sign up with Email, Pass
  FutureEither<model.User> signUpEmail({
    required String email,
    required String password,
    String? name,
  });

  //* TO get account prefs
  FutureEither<model.Preferences> getPreferences();
  //* TO get account prefs
  FutureEither<model.User> updatePreferences({
    required String bio,
  });
  //* TO login with email, password
  FutureEither<model.Session> login({
    required String email,
    required String password,
  });

  //* For Getting the current user. Returns null if no one logged in
  Future<model.User?> currentUserAccount();

  //* For Logging out from account
  FutureEitherVoid logout();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  Future<model.User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<model.User> signUpEmail(
      {required String email, required String password, String? name}) async {
    if (email.isEmpty || password.isEmpty) {
      return left(
        Failure('Please fill all fields.', StackTrace.current),
      );
    }
    try {
      final account = await _account.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: name ?? getNameFromEmail(email));

      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<model.Session> login({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return left(
          Failure('Please fill all fields.', StackTrace.current),
        );
      }
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );

      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEitherVoid logout() async {
    try {
      await _account.deleteSession(
        sessionId: 'current',
      );
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<model.Preferences> getPreferences() async {
    try {
      final prefs = await _account.getPrefs();
      return right(prefs);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<model.User> updatePreferences({required String bio}) async {
    try {
      final user = await _account.updatePrefs(prefs: {'bio': bio});
      return right(user);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
