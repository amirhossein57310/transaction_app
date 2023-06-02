import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar(this.label, this.spandingAmount, this.spendingPctOfTotal, {Key? key})
      : super(key: key);

  final String label;
  final double spandingAmount;
  final double spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: p1.maxHeight * 0.15,
              child: FittedBox(
                child: Text('\$${spandingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: p1.maxHeight * 0.05,
            ),
            Container(
              height: p1.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: p1.maxHeight * 0.05,
            ),
            SizedBox(
              height: p1.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
