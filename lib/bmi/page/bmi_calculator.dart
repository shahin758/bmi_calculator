import 'package:bmi_calculator/bmi/page/result_screen.dart';
import 'package:bmi_calculator/bmi/widgets/countercard.dart';
import 'package:bmi_calculator/bmi/widgets/gender_card.dart';
import 'package:bmi_calculator/bmi/widgets/hieght_card.dart';
import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int age = 22;
  int weight = 60;
  int hieght = 170;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greycolor,
      appBar: AppBar(
        backgroundColor: AppColors.greencolor,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            genderMethod(),
            hightselection(),
            weightAndAge(),

            ElevatedButton(
              // calculate button
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                double result = weight / (hieght * hieght / 10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderMethod() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          GenderCard(
            isSelected: isMale, //true
            icon: Icons.male,
            text: 'Male',
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            isSelected: !isMale, //false
            icon: Icons.female,
            text: 'Female',
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  HeightCard hightselection() {
    return HeightCard(
      hieght: hieght,
      onChanged: (value) {
        setState(() {
          hieght = value.toInt();
        });
      },
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          CounterCard(
            text: 'Weight',
            count: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 0) {
                //check the weight first
                setState(() {
                  weight--;
                });
              }
            },
          ),
          CounterCard(
            text: 'Age',
            count: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 19) {
                //check the age first
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
