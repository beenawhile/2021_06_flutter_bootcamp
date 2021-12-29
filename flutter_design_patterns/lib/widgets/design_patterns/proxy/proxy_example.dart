import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer/customer.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/proxy.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/proxy/customer_details_dialog/customer_details_dialog.dart';

class ProxyExample extends StatefulWidget {
  const ProxyExample({Key? key}) : super(key: key);

  @override
  _ProxyExampleState createState() => _ProxyExampleState();
}

class _ProxyExampleState extends State<ProxyExample> {
  final ICustomerDetailsService _customerDetailsServiceProxy =
      CustomerDetailsServiceProxy(CustomerDetailsService());
  final List<Customer> _customerList = List.generate(
    10,
    (_) => Customer(),
  );

  void _showCustomerDetails(Customer customer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return CustomerDetailsDialog(
          customer: customer,
          service: _customerDetailsServiceProxy,
        );
      },
    );
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
          children: [
            Text(
              "Press on the tile to see more information about the customer",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            for (final customer in _customerList)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      customer.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: const Icon(Icons.info_outline),
                  title: Text(customer.name),
                  onTap: () => _showCustomerDetails(customer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
