import 'package:flutter_design_patterns/design_patterns/bridge/entities/entity_base.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/json_helper.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/i_storage.dart';

class FileStorage implements IStorage {
  Map<Type, List<String>> fileStorage = Map<Type, List<String>>();

  @override
  List<T> fetchAll<T extends EntityBase>() {
    if (fileStorage.containsKey(T)) {
      final files = fileStorage[T]!;

      return files.map<T>((f) => JsonHelper.deserialiseObject<T>(f)).toList();
    }

    return [];
  }

  @override
  String getTitle() {
    return "File Storage";
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!fileStorage.containsKey(T)) {
      fileStorage[T] = [];
    }

    fileStorage[T]!.add(JsonHelper.serialiseObject(entityBase));
  }
}
