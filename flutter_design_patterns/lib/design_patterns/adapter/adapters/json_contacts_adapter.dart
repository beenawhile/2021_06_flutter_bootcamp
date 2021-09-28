import 'dart:convert';

import '../adapter.dart';

// json adapter
class JsonContactsAdapter implements IContactsAdapter {
  final _api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    final contactsJson = _api.getContactsJson();
    return _parseContactsJson(contactsJson);
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap["contacts"] as List;
    final contactsList = contactsJsonList.map((json) {
      final contactJson = json as Map<String, dynamic>;

      return Contact(
        fullName: contactJson["fullName"] as String,
        email: contactJson["email"] as String,
        favorite: contactJson["favourite"] as bool,
      );
    }).toList();

    return contactsList;
  }
}
