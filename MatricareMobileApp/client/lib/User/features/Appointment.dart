import 'package:client/User/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Appointment());
}

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppointmentPage(),
    );
  }
}

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;
  String? _appointmentType;
  String? _selectedBranch;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  List<Map<String, String>> _appointments = [];
  Map<DateTime, List<String>> _bookedSlots = {};

  final Map<String, Map<String, List<String>>> _branchTimeSlots = {
    'St. Mary Chiles (Sampaloc, Manila)': {
      'Monday': [
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '11:30 AM',
        '12:00 PM',
        '12:30 PM',
        '01:00 PM',
        '01:30 PM',
        '02:00 PM',
        '02:30 PM',
      ],
      'Saturday': [
        '02:00 PM',
        '02:30 PM',
        '03:00 PM',
        '03:30 PM',
        '04:00 PM',
        '04:30 PM',
      ],
    },
    'Grace Medical Center (Bulacan)': {
      'Tuesday': [
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '11:30 AM',
      ],
      'Friday': [
        '03:00 PM',
        '03:30 PM',
        '04:00 PM',
        '04:30 PM',
      ],
      'Sunday': [
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '11:30 AM',
      ],
    },
    'Family Care Tungko (Bulacan)': {
      'Friday': [
        '01:00 PM',
        '01:30 PM',
        '02:00 PM',
        '02:30 PM',
      ],
      'Saturday': [
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '11:30 AM',
      ],
    },
  };

List<String> _getAllTimeSlots() {
  String day = _selectedDate.weekday == DateTime.monday
      ? 'Monday'
      : _selectedDate.weekday == DateTime.tuesday
          ? 'Tuesday'
          : _selectedDate.weekday == DateTime.friday
              ? 'Friday'
              : _selectedDate.weekday == DateTime.saturday
                  ? 'Saturday'
                  : _selectedDate.weekday == DateTime.sunday
                      ? 'Sunday'
                      : '';

  if (day.isEmpty || _selectedBranch == null) return [];

  List<String> allSlots = _branchTimeSlots[_selectedBranch!]?[day] ?? [];
  return allSlots; // Return all slots, including booked ones
}

  void _onTimeSlotChanged(String? newValue) {
    if (newValue != null) {
      bool isBooked = (_bookedSlots[_selectedDate] ?? []).contains(newValue);
      if (isBooked) {
        _showSlotBookedDialog();
      } else {
        setState(() {
          _selectedTimeSlot = newValue;
        });
      }
    }
  }

  void _showBranchInfoDialog() {
  String infoMessage = '''

Doctor's Availability: 

St. Mary Chiles Hospital (Sampaloc, Manila Branch):
Monday: 9am to 3pm
Saturday: 2pm to 5pm

Grace Medical Center (Bulacan Hospital Branch):
Tuesday: 9am to 12nn
Friday: 3pm to 5pm
Sunday: 9am to 12nn

Family Care Tungko (Bulacan Clinic Branch):
Friday: 1pm to 3pm
Saturday: 9am to 12nn

Please note: This schedule might change depending on the doctor's availability.
''';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Branch Information'),
        content: Text(infoMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _selectAppointmentType(String type) {
    setState(() {
      _appointmentType = type; // Update the selected appointment type
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         
          Positioned(
            top: 50.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ),
          Positioned(
            top: 50.0,
            left: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Schedule an Appointment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.info_outline, color: Colors.black.withOpacity(0.8)),
                  onPressed: _showBranchInfoDialog,
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 350, // Adjust height as needed
                      child: CalendarDatePicker(
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onDateChanged: (date) {
                          setState(() {
                            _selectedDate = date;
                             _showBranchSelectionDialog();
                          });
                        },
                      ),
                    ),
                  ),
              
        SizedBox(height: 20.0), // Spacing after buttons
        Text(
          'Select Time Slot:',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Wrap(
            spacing: 10.0, // Horizontal spacing between buttons
            runSpacing: 10.0, // Vertical spacing between rows
            children: _getAllTimeSlots().map((slot) {
              bool isBooked = (_bookedSlots[_selectedDate] ?? []).contains(slot);
              bool isSelected = _selectedTimeSlot == slot;
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 190) / 2, // Width calculation for two columns
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isBooked ? Colors.red : (isSelected ? Colors.green : Colors.grey),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  ),
                  onPressed: () {
                    if (!isBooked) {
                      _onTimeSlotChanged(slot);
                    } else {
                      _showSlotBookedDialog();
                    }
                  },
                  child: Text(
                    slot,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
               SizedBox(height: 20.0),
                  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Appointment Type:',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Wrap(
            spacing: 10.0, // Horizontal spacing between buttons
            children: <String>[
              'Follow-Up',
              'Check-Up',
              'Monthly Check-Up',
            ].map((type) {
              bool isSelected = _appointmentType == type; // Check if the button is selected
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.green : Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                ),
                onPressed: () {
                  _selectAppointmentType(type); // Select appointment type on button press
                },
                child: Text(
                  type,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
                  SizedBox(height: 20.0),
                _buildTextField(
                  _fullNameController,
                  'Full Name',
                ),
                SizedBox(height: 20.0),
                _buildTextField(
                  _emailController,
                  'Email',
                ),
                SizedBox(height: 20.0),
                _buildTextField(
                  _phoneController,
                  'Phone Number',
                ),
                SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedDate != null &&
                          _selectedBranch != null &&
                          _selectedTimeSlot != null &&
                          _appointmentType != null &&
                          _fullNameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty) {
                        setState(() {
                          _appointments.add({
                            'date': _selectedDate.toLocal().toString(),
                            'branch': _selectedBranch!,
                            'timeSlot': _selectedTimeSlot!,
                            'type': _appointmentType!,
                            'name': _fullNameController.text,
                            'email': _emailController.text,
                            'phone': _phoneController.text,
                          });
                          _bookedSlots[_selectedDate] =
                              (_bookedSlots[_selectedDate] ?? [])
                                ..add(_selectedTimeSlot!);
                          _selectedTimeSlot = null;
                          _selectedBranch = null;
                          _appointmentType = null;
                          _fullNameController.clear();
                          _emailController.clear();
                          _phoneController.clear();
                        });
                      } else {
                        // Handle validation error
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Please fill all the fields.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Book Appointment'),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Upcoming Appointments:',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  ..._appointments.map((appointment) {
                    return ListTile(
                      title: Text('${appointment['branch']} - ${appointment['type']}'),
                      subtitle: Text('${appointment['date']} at ${appointment['timeSlot']} (${appointment['mode']})'),
                      trailing: Icon(Icons.check_circle, color: Colors.green),
                    );
                  }).toList(),
                ],
              ),
  ],
            ),
          ),
          ),
        ],
      ),
    );
  }

Widget _buildTextField(TextEditingController controller, String labelText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}

  void _showSlotBookedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Slot Already Booked'),
          content: Text('The selected time slot is already booked. Please choose another time slot.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

void _showBranchSelectionDialog() {
  // Determine the selected day
  String day = _selectedDate.weekday == DateTime.monday
      ? 'Monday'
      : _selectedDate.weekday == DateTime.tuesday
          ? 'Tuesday'
          : _selectedDate.weekday == DateTime.friday
              ? 'Friday'
              : _selectedDate.weekday == DateTime.saturday
                  ? 'Saturday'
                  : _selectedDate.weekday == DateTime.sunday
                      ? 'Sunday'
                      : '';

  // Check available branches for the selected day
  List<String> availableBranches = _branchTimeSlots.entries
      .where((entry) => entry.value.containsKey(day))
      .map((entry) => entry.key)
      .toList();

  // Show dialog with blurred background if no branches are available
 showDialog(
  context: context,
  builder: (BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blurred background
      child: AlertDialog(
        backgroundColor: Colors.white, // Set white background for the dialog
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select a Branch',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              if (availableBranches.isEmpty) ...[
                Text(
                  'No branches available on this day.',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                // Display available branches as a list
                Column(
                  children: availableBranches.map((branch) {
                    return ListTile(
                      title: Text(branch),
                      onTap: () {
                        setState(() {
                          _selectedBranch = branch;
                          Navigator.of(context).pop();
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  },
);
}
}