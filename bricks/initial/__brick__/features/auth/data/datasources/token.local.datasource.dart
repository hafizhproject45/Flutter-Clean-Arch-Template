import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class TokenLocalDatasource {
  Future<AuthEntity> getUserData();
}

class TokenLocalDatasourceImpl extends TokenLocalDatasource {
  @override
  Future<AuthEntity> getUserData() async {
    Box box = await getBox();

    if (box.containsKey(LOGIN_DATA_ID)) {
      return box.get(LOGIN_DATA_ID);
    } else {
      throw CacheException();
    }
  }

  Future<Box> getBox() async {
    return await Hive.openBox(LOGIN_DATA_BOX);
  }
}
