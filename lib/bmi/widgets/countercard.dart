import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.text,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });
  final String text;
  final int count;
  final Function() onAdd;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greencolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor,
                  ),
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, color: AppColors.white),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.backgroundColor,
                  ),
                  onPressed: onAdd,
                  icon: Icon(Icons.add, color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
