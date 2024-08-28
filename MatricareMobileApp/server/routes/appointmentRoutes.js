const express = require('express');
const router = express.Router();
const Appointment = require('../models/AppointmentModel');

router.post('/appointment', async (req, res) => {
  try {
    const appointment = new Appointment(req.body);
    await appointment.save();
    res.status(201).send(appointment);
  } catch (error) {
    console.error('Error saving appointment:', error);
    res.status(400).send(error);
  }
});

module.exports = router;
