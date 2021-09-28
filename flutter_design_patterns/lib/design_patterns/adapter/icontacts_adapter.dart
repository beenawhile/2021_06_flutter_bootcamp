import 'package:flutter_design_patterns/design_patterns/adapter/contact.dart';

// ITarget class
abstract class IContactsAdapter {
  List<Contact> getContacts();
}
