const User = require('../models/user');
const Constants = require('../utils/constants');
const Routes = require('../utils/routes');
const errorHandler = require('../utils/errorHandler');

const authController = {
  register: async (req, res) => {
    try {
      const { name, email, password } = req.body;

      // Check if user already exists
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ message: 'User already exists' });
      }

      // Create new user
      const newUser = new User({ name, email, password });
      await newUser.save();

      res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
      errorHandler.handleError(error, res);
    }
  },

  login: async (req, res) => {
    try {
      const { email, password } = req.body;

      // Check if user exists
      const user = await User.findOne({ email });
      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }

      // Check if password is correct
      const isPasswordValid = await user.comparePassword(password);
      if (!isPasswordValid) {
        return res.status(401).json({ message: 'Invalid password' });
      }

      // Generate JWT token
      const token = AuthService.generateToken(user);

      res.status(200).json({ token });
    } catch (error) {
      errorHandler.handleError(error, res);
    }
  },

  getUserProfile: async (req, res) => {
    try {
      const userId = req.user.id;

      // Get user profile
      const user = await User.findById(userId).select('-password');
      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }

      res.status(200).json(user);
    } catch (error) {
      errorHandler.handleError(error, res);
    }
  }
};

module.exports = authController;