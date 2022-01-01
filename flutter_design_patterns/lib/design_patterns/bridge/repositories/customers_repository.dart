import 'package:flutter_design_patterns/design_patterns/bridge/entities/customer.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/entity_base.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repositories/i_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/i_storage.dart';

class CustomersRepository implements IRepository {
  final IStorage storage;

  const CustomersRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Customer>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }
}
