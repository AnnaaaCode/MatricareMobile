import 'dart:ui';
import 'package:client/User/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VirtualConsultation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VirtualConsultationScreen(),
    );
  }
}
class VirtualConsultationScreen extends StatefulWidget {
  @override
  _VirtualConsultationScreenState createState() => _VirtualConsultationScreenState();
}

class _VirtualConsultationScreenState extends State<VirtualConsultationScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool isCameraOn = false;
  bool isMicrophoneOn = false;
  bool isChatVisible = false; // Track the visibility of the chat overlay
  List<String> chatMessages = []; // List to hold chat messages
  final TextEditingController _messageController = TextEditingController(); // Controller for the message input field

  // Define the patient's name
  String patientName = "John Doe"; // Replace with actual patient name

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    
    // Use the front camera for doctor's point of view
    _cameraController = CameraController(
      _cameras[1], // Use the second camera (usually the front camera)
      ResolutionPreset.medium,
    );
    
    await _cameraController.initialize();
  }

  void toggleCamera() {
    setState(() {
      isCameraOn = !isCameraOn;
    });
  }

  void toggleMicrophone() {
    setState(() {
      isMicrophoneOn = !isMicrophoneOn;
    });
  }

  void toggleChat() {
    setState(() {
      isChatVisible = !isChatVisible; // Toggle chat visibility
    });
  }

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        // Add the patient's name along with the message
        chatMessages.add('$patientName: ${_messageController.text}');
        _messageController.clear(); // Clear the input field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              child: isCameraOn ? CameraPreview(_cameraController) : Container(),
            ),
          ),
          // Add doctor's point of view camera feed
          Positioned(
            top: 60.0,
            right: 30.0,
            width: 120.0,
            height: 160.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: isCameraOn ? CameraPreview(_cameraController) : Container(),
              ),
            ),
          ),
          // Chat overlay at the bottom half of the screen
          if (isChatVisible) ...[
            Positioned(
              bottom: 140, // Move the chat overlay up from the bottom
              left: 5,
              right: 5,
              height: MediaQuery.of(context).size.height / 2, // Cover half the screen
              child: Container(
              decoration: BoxDecoration(
        color: Color(0xFFF3E5F5), // Light violet color
       borderRadius: BorderRadius.circular(10.0),  // Rounded corners on top
      ), // Semi-transparent background
                child: Column(
                  children: [
                    // Chat header
                    Container(
                      padding: EdgeInsets.all(10.0),
                      color: Color(0xFF9a6cb4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chat',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: toggleChat,
                          ),
                        ],
                      ),
                    ),
                    // Chat messages area
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: chatMessages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(chatMessages[index]), // Display chat message
                          );
                        },
                      ),
                    ),
                    // Input field for sending messages
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController, // Use the controller for the input field
                              decoration: InputDecoration(
                                hintText: 'Type a message...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: sendMessage, // Call the sendMessage method
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          Stack(
  children: [
              Positioned(
            top: 50.0,
            left: 20.0,
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD1C4E9).withOpacity(0.6), // Light white background
                border: Border.all(color: Colors.white.withOpacity(0.8)), // Light white border
              ),
              child: Transform.translate(
                offset: Offset(5, 0), // Adjust this value to move the icon
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ),
          ),
          // Chat icon in the bottom right corner
    Positioned(
      bottom: 90.0,
      left: 100.0, // Adjust this value for the desired position
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCameraOn ? Color(0xFFD1C4E9) : Colors.white.withOpacity(0.6),
        ),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.video,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: toggleCamera,
        ),
      ),
    ),
    // End Call Button
    Positioned(
      bottom: 120.0,
      left: 170.0, // Adjust this value for the desired position
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.phone,
            color: Color.fromARGB(255, 254, 254, 254),
          ),
          onPressed: () {
            // Handle end call action
            Navigator.pop(context); // This will navigate back to the previous screen
          },
        ),
      ),
    ),
    // Microphone Button
    Positioned(
      bottom: 90.0,
      right: 90.0, // Adjust this value for the desired position
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isMicrophoneOn ? Color(0xFFD1C4E9) : Colors.white.withOpacity(0.6),
        ),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.microphone,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: toggleMicrophone,
        ),
      ),
    ),
  ],
),
          Positioned(
            bottom: 50.0, // Positioning above the bottom navigation
            right: 165.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF9a6cb4),
              ),
              child: IconButton(
                icon: Icon(Icons.chat, color: Colors.white),
                onPressed: toggleChat, // Toggle chat visibility
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _messageController.dispose(); // Dispose of the message controller
    super.dispose();
  }
}