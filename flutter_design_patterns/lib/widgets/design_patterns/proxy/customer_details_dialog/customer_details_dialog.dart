import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/design_patterns/proxy/customer/customer.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer/customer_details.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/proxy.dart';
import 'package:flutter_design_patterns/themes.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/proxy/customer_details_dialog/customer_details_column.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class CustomerDetailsDialog extends StatefulWidget {
  const CustomerDetailsDialog({
    Key? key,
    required this.customer,
    required this.service,
  }) : super(key: key);

  final Customer customer;
  final ICustomerDetailsService service;

  @override
  _CustomerDetailsDialogState createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();
    widget.service
        .getCustomerDetails(widget.customer.id)
        .then((CustomerDetails customerDetails) => setState(() {
              widget.customer.details = customerDetails;
            }));
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: SizedBox(
        height: 200,
        child: widget.customer.details == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: lightBackgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(.65),
                  ),
                ),
              )
            : CustomerDetailsColumn(
                customerDetails: widget.customer.details!,
              ),
      ),
      actions: [
        Visibility(
          visible: widget.customer.details != null,
          child: PlatformButton(
            text: "Close",
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _closeDialog,
          ),
        )
      ],
    );
  }
}
