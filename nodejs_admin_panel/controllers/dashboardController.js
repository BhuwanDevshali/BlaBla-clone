const User = require('../models/user');
const Constants = require('../utils/constants');
const Routes = require('../utils/routes');
const errorHandler = require('../utils/errorHandler');

const dashboardController = {
  // Controller methods for the dashboard

  // Example method
  getDashboard: async (req, res) => {
    try {
      // Get user data from the request
      const { userId } = req.user;

      // Find the user in the database
      const user = await User.findById(userId);

      // Check if the user exists
      if (!user) {
        return res.status(404).json({
          success: false,
          message: 'User not found',
        });
      }

      // Return the user's dashboard data
      return res.status(200).json({
        success: true,
        data: user.dashboard,
      });
    } catch (error) {
      // Handle any errors that occur
      errorHandler(res, error);
    }
  },

  // Add more controller methods here
};

module.exports = dashboardController;