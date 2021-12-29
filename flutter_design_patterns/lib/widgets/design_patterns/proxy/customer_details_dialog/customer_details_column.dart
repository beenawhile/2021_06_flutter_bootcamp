import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/proxy/customer/customer_details.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/proxy/customer_details_dialog/customer_info_group.dart';

class CustomerDetailsColumn extends StatelessWidget {
  const CustomerDetailsColumn({
    Key? key,
    required this.customerDetails,
  }) : super(key: key);

  final CustomerDetails customerDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomerInfoGroup(label: "E-mail", text: customerDetails.email),
        const SizedBox(height: LayoutConstants.spaceL),
        CustomerInfoGroup(label: "Position", text: customerDetails.position),
        const SizedBox(height: LayoutConstants.spaceL),
        CustomerInfoGroup(label: "Hobby", text: customerDetails.hobby),
      ],
    );
  }
}
