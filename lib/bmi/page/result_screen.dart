import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;


 Status getStatus() {
    if (result < 18.5) {
      return Status('Underweight', Colors.blue);
    } else if (result <= 24.9) {
      return Status('Healthy Weight', Colors.green);
    } else if (result <= 29.9) {
      return Status('Overweight', Colors.orange);
    } else {
      return Status('Obese', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    Status status = getStatus();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        
        title: const Text(
          'BMI RESULT',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.greencolor,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status.name,
              style: TextStyle(
                fontSize: 24,
                color: status.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'YOUR BMI RESULT',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              result.toStringAsFixed(2),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}

class Status {
  final String name;
  final Color color;

  Status(this.name, this.color);
}
