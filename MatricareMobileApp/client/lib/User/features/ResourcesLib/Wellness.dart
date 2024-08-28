import 'package:client/User/features/ResourceLibrary.dart';
import 'package:client/User/features/ResourcesLib/PregnancyPreparation.dart';
import 'package:client/User/features/ResourcesLib/Trimester.dart';
import 'package:client/User/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(Wellness());
}

class Wellness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wellnesses(),
    );
  }
}

class Wellnesses extends StatefulWidget {
  @override
  _WellnessState createState() => _WellnessState();
}

class _WellnessState extends State<Wellnesses> {
  final List<String> facts = [
    'Video1',
    'Video2',
    'Video3',
    'Video4',
    'Video5',
    'Video6',
    'Video7',
    'Video8',
    'Video9',
    'Video10',
    'Video11',
    'Video12',
    'Video13',
    'Video14',
    'Video15',
  ];

  final List<String> videoPaths = [
    'assetsvideos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
    'assets/videos/video6.mp4',
    'assets/videos/video7.mp4',
    'assets/videos/video8.mp4',
    'assets/videos/video9.mp4',
    'assets/videos/video10.mp4',
    'assets/videos/video11.mp4',
    'assets/videos/video12.mp4',
    'assets/videos/video13.mp4',
    'assets/videos/video14.mp4',
    'assets/videos/video15.mp4',
  ];

  int? selectedIndex;
  VideoPlayerController? _controller;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? null : index;
    });
    if (selectedIndex != null) {
      _playVideo(selectedIndex!);
    }
  }

  void _playVideo(int index) {
    if (_controller != null) {
      _controller!.dispose();
    }
    _controller = VideoPlayerController.asset(videoPaths[index])
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.25,
            child: Image.asset(
              'images/pic2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 35,
            right: 50,
            child: Text(
              'WELLNESS AND CARE',
              style: TextStyle(
              fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 70,
            right: 20,
            child: SingleChildScrollView(
              child: Text(
                'Wellness for Moms involves exercises and practices to support physical and mental well-being during and after pregnancy. It includes prenatal exercises, mindfulness techniques, and nutrition guidance to promote a healthy pregnancy and postpartum recovery.',
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Positioned(
            top: 175,
            left: 70,
            child: Text(
              'EXERCISES FOR MOMS',
              style: TextStyle(
                 fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 70,
            right: 10,
            child: SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => updateSelectedIndex(index),
                      child: Container(
                        width: 160,
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
                                  image: AssetImage('assets/videos/Video${index + 1}.mp4'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.video_library_rounded,
                                size: 60,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            if (selectedIndex == index)
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    facts[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
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
          ),
          Positioned(
            top: 380,
            left: 70,
            child: Text(
              'YOGA\'S FOR MOMS',
              style: TextStyle(
                fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 395,
            left: 70,
            right: 10,
            child: SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => updateSelectedIndex(index + 5),
                      child: Container(
                        width: 160,
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
                                  image: AssetImage('assets/videos/topic${index + 6}.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.video_library_rounded,
                                size: 60,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            if (selectedIndex == index + 5)
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    videoPaths[index + 5],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
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
          ),
          Positioned(
            top: 590,
            left: 70,
            child: Text(
              'CALM VISUALIZATION FOR MOMS',
              style: TextStyle(
                 fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: 605,
            left: 70,
            right: 10,
            child: SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => updateSelectedIndex(index + 10),
                      child: Container(
                        width: 160,
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
                                  image: AssetImage('images/topic${index + 11}.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.video_library_rounded,
                                size: 60,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            if (selectedIndex == index + 10)
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    facts[index + 10],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
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
          ),
          if (selectedIndex != null && _controller != null)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              left: 70,
              right: 10,
              child: Container(
                height: 200,
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
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
                        GestureDetector(
                           onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResourceLibrary()),
                          );
                          },
                          child: Text(
                            'Facts',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
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
