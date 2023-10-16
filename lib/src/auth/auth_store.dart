import 'dart:convert';

import 'package:bitsgap/src/pages/auth/widgets/toast.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:mobx/mobx.dart';

import 'package:bitsgap/src/services/storage.dart';

part 'auth_store.g.dart';

/// A typedef for login credentials that takes in a [name] and [pass].
typedef LoginCreds = ({String name, String pass});

/// A typedef for registration credentials that takes in a [name], [pass], and [mail].
typedef RegCreds = ({String name, String pass, String mail});

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @action
  Future<void> init() async => _token = Storage.restoreToken();

  @observable
  String? _token;

  @computed
  bool get isLoggedIn => _token != null;

  /// Logs in the user with the given credentials.
  /// Throws an exception if the credentials are incorrect.
  @action
  Future<void> login(LoginCreds creds) async {
    final md5 = generateMd5(creds.name + creds.pass);
    final hash = Storage.checkPassHash(creds.name);
    if (hash == md5) {
      _token = 'token';
      await Storage.saveToken(_token!);
    } else {
      final exception = Exception('Wrong credentials');
      Toast.error(title: 'Something wrong', text: exception.toString());
      throw exception;
    }
  }

  /// Registers a new user with the given credentials.
  /// Throws an exception if any of the required fields are empty.
  @action
  Future<void> register(RegCreds creds) async {
    if (creds.mail.isEmpty || creds.name.isEmpty || creds.pass.isEmpty) {
      final exception = Exception('All fields are required');
      Toast.error(title: 'Something wrong', text: exception.toString());
      throw exception;
    }

    final md5 = generateMd5(creds.name + creds.pass);
    await Storage.fakeRegister(creds.name, md5);

    _token = md5;
  }

  @action
  Future<void> loggout() async {
    _token = null;
    await Storage.saveToken(null);
  }

  String generateMd5(String input) {
    return crypto.md5.convert(utf8.encode(input)).toString();
  }
}
