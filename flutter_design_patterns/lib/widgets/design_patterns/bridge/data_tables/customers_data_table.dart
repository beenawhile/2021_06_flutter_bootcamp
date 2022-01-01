import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/customer.dart';

class CustomersDatatable extends StatelessWidget {
  const CustomersDatatable({
    Key? key,
    required this.customers,
  }) : super(key: key);

  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: LayoutConstants.spaceM,
        horizontalMargin: LayoutConstants.marginXL,
        headingRowHeight: LayoutConstants.spaceXL,
        dataRowHeight: LayoutConstants.spaceXL,
        columns: const [
          DataColumn(
            label: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              "E-mail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
        ],
        rows: [
          for (final customer in customers)
            DataRow(
              cells: [
                DataCell(Text(customer.name)),
                DataCell(Text(customer.email)),
              ],
            )
        ],
      ),
    );
  }
}
