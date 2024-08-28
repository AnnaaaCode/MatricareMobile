import 'dart:ui';
import 'package:client/User/features/ResourcesLib/PregnancyPreparation.dart';
import 'package:client/User/features/ResourcesLib/Trimester.dart';
import 'package:client/User/features/ResourcesLib/Wellness.dart';
import 'package:client/User/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ResourceLibrary());
}

class ResourceLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<String> facts = [
    'A fetus\'s fingerprints are formed by 16 weeks of pregnancy, and they will remain the same for the rest of their life.',
    'A baby\'s first breath is crucial, as it helps to remove meconium (fetal waste) from their lungs.',
    'Pregnant women have a heightened sense of smell due to hormonal changes, which can help them detect even subtle scents.',
    'A fetus\'s brain develops at an incredible rate during pregnancy, with over 1 million neurons forming every minute!',
    'Morning sickness is caused by the hormone human chorionic gonadotropin (hCG), which helps the body adapt to pregnancy.',
    'A baby\'s first cry is often a sign that their lungs are fully inflated and ready to start breathing on their own.',
    'A baby\'s first smile can happen as early as 6 weeks into gestation, although it might not be visible from the outside.',
    'The average birth weight of a full-term baby is around 7 pounds 11 ounces (3.4 kg).',
    'The average duration of labor is around 12 hours for a first-time mother, although this can vary greatly.',
    'The first cesarean section (C-section) was performed in 1500 BC by ancient Egyptians.',
    'Babies typically say their first words around 9-12 months old, although this can vary depending on language development.',
    'Newborns sleep around 16-20 hours a day, while toddlers can sleep up to 12 hours a day.',
    'PBabies start babbling around 6 months old, with most parents recognizing their baby\'s "words" by around 9 months.',
    'Skin-to-skin contact between parents and babies can help regulate heart rate and reduce stress.',
    'Oxytocin, often referred to as the "love hormone," is released during bonding activities like breastfeeding and cuddling.',
  ];

  int? selectedIndex;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            right: 50,
            child: Text(
              'MATERNAL LIBRARY',
              style: TextStyle(
                fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 70,
            child: Text(
              'PREGNANCY FUN FACTS',
              style: TextStyle(
               fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 70, // Adjusted left margin to prevent overflow
            right: 10, // Adjusted right margin to prevent overflow
            child: SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => updateSelectedIndex(index),
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 15, top: 13),
                      decoration: BoxDecoration(
                        color: Color(0xFFC98F8F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/facts/facts1.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.lightbulb,
                              size: 60,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          if (selectedIndex == index)
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: Color(0xFF9a6cb4).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  facts[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
           Positioned(
            top: 320, // Adjusted position
            left: 70,
            child: Text(
              'CHILDBIRTH FUN FACTS', // New text
              style: TextStyle(
                fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                     color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            top: 340,
            left: 70, // Adjusted left margin to prevent overflow
            right: 10, // Adjusted right margin to prevent overflow
            child: SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => updateSelectedIndex(index + 5),
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 15, top: 13),
                      decoration: BoxDecoration(
                        color: Color(0xFFC98F8F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/facts/facts2.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.lightbulb,
                              size: 60,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          if (selectedIndex == index + 5)
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                 color: Color(0xFF9a6cb4).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  facts[index + 5],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0)
,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            top: 550, // Adjusted position
            left: 70,
            child: Text(
              'PARENTING FUN FACTS', // New text
              style: TextStyle(
                 fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            top: 570,
            left: 70, // Adjusted left margin to prevent overflow
            right: 10, // Adjusted right margin to prevent overflow
            child: SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => updateSelectedIndex(index + 10),
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 15, top: 13),
                      decoration: BoxDecoration(
                        color: Color(0xFFC98F8F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/facts/facts3.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.lightbulb,
                              size: 60,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          if (selectedIndex == index + 10)
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: Color(0xFF9a6cb4).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  facts[index + 10], // Updated text
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              color: Color(0xFFC98F8F),
              width: 50, // Adjusted width to prevent overflow
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                       SizedBox(
  width: 50,
  height: 10,
  child: IconButton(
    padding: EdgeInsets.zero, // Remove default padding
    icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
    onPressed: () {
      // Replace the current screen with the HomePage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
  ),
),
                  SizedBox(height: 110), // Add space before Row
                  RotatedBox(
                    quarterTurns: -1, // Rotate text vertically
                    child: Row(
                      children: [
                        SizedBox(height: 70), // Adjust top margin
                        GestureDetector(
                           onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Trimesters()),
                          );
                        },
                          child: Text(
                            'Pregnancy Trimester',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        GestureDetector(
                           onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PregnancyPreparation()),
                          );
                          },
                          child: Text(
                            'Preparation',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                          GestureDetector(
                           onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Wellnesses()),
                          );
                          },
                          child: Text(
                            'Wellness',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          'Facts',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
