import 'package:flutter_design_patterns/design_patterns/adapter/adapter.dart';
import 'package:xml/xml.dart';

// xml adapter
class XmlContactsAdapter implements IContactsAdapter {
  final _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    final contactsXml = _api.getContactsXml();
    return _parseContactsXml(contactsXml);
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);

    final contactsList = <Contact>[];

    for (final xmlElement in xmlDocument.findAllElements("contact")) {
      final fullName = xmlElement.findElements("fullname").single.text;
      final email = xmlElement.findElements("email").single.text;
      final favouriteString = xmlElement.findElements("favourite").single.text;
      final favourite = favouriteString.toLowerCase() == "true";

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favorite: favourite,
      ));
    }

    return contactsList;
  }
}
