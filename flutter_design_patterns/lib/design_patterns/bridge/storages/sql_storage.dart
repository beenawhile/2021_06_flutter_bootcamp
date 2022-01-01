import 'package:flutter_design_patterns/design_patterns/bridge/entities/entity_base.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/i_storage.dart';

class SqlStorage implements IStorage {
  final Map<Type, List<EntityBase>> sqlStorage = {};

  @override
  List<T> fetchAll<T extends EntityBase>() {
    return sqlStorage.containsKey(T) ? sqlStorage[T]! as List<T> : [];
  }

  @override
  String getTitle() {
    return "SQL Storage";
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) {
      sqlStorage[T] = <T>[];
    }

    sqlStorage[T]!.add(entityBase);
  }
}
