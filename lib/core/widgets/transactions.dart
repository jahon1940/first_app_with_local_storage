import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Transactions extends StatelessWidget {
  final String svg;
  final String title;
  final String subtitle;
  final String transactions;
  const Transactions({
    super.key,
    required this.svg,
    required this.title,
    required this.subtitle,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        // ignore: sort_child_properties_last
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(svg),
        ),
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.93),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        transactions,
        style: const TextStyle(
          color: Color(0xFF2C2C2C),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
