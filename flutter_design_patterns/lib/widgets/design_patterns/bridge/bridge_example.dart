import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/customer.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/order.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repositories/customers_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repositories/i_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repositories/orders_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/flie_storage.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/i_storage.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storages/sql_storage.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/bridge/storage_selection.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

import 'data_tables/customers_data_table.dart';
import 'data_tables/orders_customer_table.dart';

class BridgeExample extends StatefulWidget {
  const BridgeExample();

  @override
  _BridgeExampleState createState() => _BridgeExampleState();
}

class _BridgeExampleState extends State<BridgeExample> {
  final List<IStorage> _storages = [SqlStorage(), FileStorage()];

  late IRepository _customersRepository;
  late IRepository _ordersRepository;

  late List<Customer> _customers;
  late List<Order> _orders;

  int _selectedCustomerStorageIndex = 0;
  int _selectedOrderStorageIndex = 0;

  void _onSelectedCustomerStorageIndexChanged(int? index) {
    setState(() {
      _selectedCustomerStorageIndex = index!;
      _customersRepository = CustomersRepository(_storages[index]);
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _onSelectedOrderStorageIndexChanged(int? index) {
    setState(() {
      _selectedOrderStorageIndex = index!;
      _ordersRepository = OrdersRepository(_storages[index]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _addCustomer() {
    _customersRepository.save(Customer());

    setState(() {
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() {
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  @override
  void initState() {
    super.initState();

    _customersRepository =
        CustomersRepository(_storages[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll() as List<Customer>;

    _ordersRepository = OrdersRepository(_storages[_selectedOrderStorageIndex]);
    _orders = _ordersRepository.getAll() as List<Order>;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Select customers storage:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedCustomerStorageIndex,
              onChanged: _onSelectedCustomerStorageIndexChanged,
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _addCustomer,
              text: 'Add',
            ),
            if (_customers.isNotEmpty)
              CustomersDatatable(customers: _customers)
            else
              Text(
                '0 customers found',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            const Divider(),
            Row(
              children: <Widget>[
                Text(
                  'Select orders storage:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedOrderStorageIndex,
              onChanged: _onSelectedOrderStorageIndexChanged,
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _addOrder,
              text: 'Add',
            ),
            if (_orders.isNotEmpty)
              OrdersDatatable(orders: _orders)
            else
              Text(
                '0 orders found',
                style: Theme.of(context).textTheme.subtitle2,
              ),
          ],
        ),
      ),
    );
  }
}
