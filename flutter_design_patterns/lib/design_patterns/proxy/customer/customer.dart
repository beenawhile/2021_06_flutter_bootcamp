import 'package:faker/faker.dart';

import 'customer_details.dart';

class Customer {
  late String id;
  late String name;
  CustomerDetails? details;

  Customer() {
    id = faker.guid.guid();
    name = faker.person.name();
  }
}
