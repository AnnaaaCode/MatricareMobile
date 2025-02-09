const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  fullName: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  username: { type: String, required: true, unique: true},
  password: { type: String, required: true },
  userType: { type: String, required: true },
  phoneNumber: { type: String, required: true }
}, {timestamps:true}
);
 
const User = mongoose.model('User', userSchema);

module.exports = User;
