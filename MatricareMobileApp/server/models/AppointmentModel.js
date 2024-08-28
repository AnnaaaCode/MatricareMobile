const mongoose = require('mongoose');

const appointmentSchema = new mongoose.Schema({
  fullName: String,
  email: String,
  phoneNumber: String,
  appointmentType: String,
  appointmentMode: String,
  appointmentTime: Date
});

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
