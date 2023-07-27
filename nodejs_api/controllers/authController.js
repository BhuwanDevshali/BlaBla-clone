const User = require('../models/user');
const Constants = require('../utils/constants');
const errorHandler = require('../utils/errorHandler');

const authController = {
  register: async (req, res) => {
    try {
      const { name, email, password } = req.body;

      // Check if user already exists
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ error: Constants.USER_ALREADY_EXISTS });
      }

      // Create new user
      const newUser = new User({ name, email, password });
      await newUser.save();

      res.status(201).json({ message: Constants.USER_REGISTERED });
    } catch (error) {
      errorHandler(res, error);
    }
  },

  login: async (req, res) => {
    try {
      const { email, password } = req.body;

      // Check if user exists
      const user = await User.findOne({ email });
      if (!user) {
        return res.status(404).json({ error: Constants.USER_NOT_FOUND });
      }

      // Check if password is correct
      const isPasswordValid = await user.comparePassword(password);
      if (!isPasswordValid) {
        return res.status(401).json({ error: Constants.INVALID_PASSWORD });
      }

      // Generate JWT token
      const token = user.generateAuthToken();

      res.status(200).json({ token });
    } catch (error) {
      errorHandler(res, error);
    }
  }
};

module.exports = authController;