const express = require('express');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel');
const router = express.Router();
const mongoose = require('mongoose');

router.post('/signup', async (req, res) => {
  console.log('Signup request received:', req.body);
  const { fullName, email, username, password, phoneNumber, userType } = req.body;

  if (!fullName || !email || !username || !password || !phoneNumber || !userType) {
    return res.status(400).json({ message: 'Please fill in all fields.' });
  }

  try {
    const existingUser = await User.findOne({ $or: [{ email }, { username }] });
    if (existingUser) {
      return res.status(400).json({ message: 'Email or Username already exists.' });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = new User({
      fullName,
      email,
      username,
      password: hashedPassword,
      phoneNumber,
      userType
    });

    await newUser.save();
    res.status(201).json({ message: 'User registered successfully' });
  } catch (error) {
    console.error('Signup error:', error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});



router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
      // Find user by username
      const user = await User.findOne({ username });

      if (!user) {
          return res.status(400).json({ message: 'Invalid username' });
      }

      // Check password
      const passwordMatch = await bcrypt.compare(password, user.password);
      if (!passwordMatch) {
          return res.status(400).json({ message: 'Invalid password' });
      }

      // Login successful
      res.status(200).json({ message: 'Login successful', username: user.username, email: user.email });
  } catch (error) {
      console.error('Login error:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
  }
});

router.patch('/updateprofile/:id', async (req, res) => {
  try {
    const { fullName, email, phoneNumber } = req.body; 

    // Find user by _id and update their profile
    const updatedUser = await User.findOneAndUpdate(
      { _id: req.params.id },
      { fullName, email, phoneNumber },
      { new: true, runValidators: true }
    );

    if (!updatedUser) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.status(200).json({ message: 'Profile updated successfully', updatedUser });
  } catch (error) {
    console.error('Profile update error:', error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});






module.exports = router;
