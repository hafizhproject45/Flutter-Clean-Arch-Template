import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name}}/features/auth/data/models/auth.model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class AuthLocalDatasource {
  /// Check login
  Future<bool> checkLogin();

  /// For fetch token
  Future<AuthModel> getLoginData();

  /// For saving token and user id
  Future<void> saveLoginData(AuthModel login);

  /// For logout
  Future<void> deleteLoginData();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  @override
  Future<bool> checkLogin() async {
    try {
      Box cacheBox = await getCacheBox();

      if (cacheBox.containsKey(LOGIN_DATA_ID)) {
        return true;
      } else {
        CacheException.logout();
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> getLoginData() async {
    Box cacheBox = await getCacheBox();

    if (cacheBox.containsKey(LOGIN_DATA_ID)) {
      return cacheBox.get(LOGIN_DATA_ID);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveLoginData(AuthModel login) async {
    Box cacheBox = await getCacheBox();

    cacheBox.put(LOGIN_DATA_ID, login).onError((error, stackTrace) {
      throw CacheException();
    });
  }

  @override
  Future<bool> deleteLoginData() async {
    Box cacheBox = await getCacheBox();

    return cacheBox
        .delete(LOGIN_DATA_ID)
        .then((value) => true)
        .onError((error, stackTrace) => throw CacheException());
  }

  Future<Box> getCacheBox() async {
    return await Hive.openBox(LOGIN_DATA_BOX);
  }
}
