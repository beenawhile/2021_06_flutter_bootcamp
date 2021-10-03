import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import '../../template_method.dart';

class StudentsXmlBmiCalculator extends StudentsBmiCalculator {
  final XmlStudentsApi _api = XmlStudentsApi();

  @override
  @protected
  List<Student> getStudentsData() {
    final studentXml = _api.getStudentsXml();
    final xmlDocument = XmlDocument.parse(studentXml);
    final studentsList = <Student>[];

    for (final xmlElement in xmlDocument.findAllElements("student")) {
      final fullName = xmlElement.findElements('fullname').single.text;
      final age = int.parse(xmlElement.findElements('age').single.text);
      final height =
          double.parse(xmlElement.findElements('height').single.text);
      final weight = int.parse(xmlElement.findElements('weight').single.text);

      studentsList.add(Student(
        fullName: fullName,
        age: age,
        height: height,
        weight: weight,
      ));
    }

    return studentsList;
  }
}
