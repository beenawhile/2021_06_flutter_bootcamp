import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/order.dart';

class OrdersDatatable extends StatelessWidget {
  final List<Order> orders;

  const OrdersDatatable({
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: LayoutConstants.spaceM,
        horizontalMargin: LayoutConstants.marginM,
        headingRowHeight: LayoutConstants.spaceXL,
        dataRowHeight: LayoutConstants.spaceXL,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Dishes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            numeric: true,
          ),
        ],
        rows: <DataRow>[
          for (var order in orders)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(order.dishes.join(', '))),
                DataCell(Text(order.total.toStringAsFixed(2))),
              ],
            ),
        ],
      ),
    );
  }
}
