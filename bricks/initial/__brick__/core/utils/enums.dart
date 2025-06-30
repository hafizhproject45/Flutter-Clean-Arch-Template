// ignore_for_file: constant_identifier_names

enum CrudOperation { getAll, getOne, create, update, delete }

extension CrudOperationX on CrudOperation {
  String get value {
    switch (this) {
      case CrudOperation.getAll:
        return 'GET_ALL';
      case CrudOperation.getOne:
        return 'GET_ONE';
      case CrudOperation.create:
        return 'CREATE';
      case CrudOperation.update:
        return 'UPDATE';
      case CrudOperation.delete:
        return 'DELETE';
    }
  }
}
