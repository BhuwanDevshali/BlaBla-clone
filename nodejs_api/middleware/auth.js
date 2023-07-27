const jwt = require('jsonwebtoken');
const { errorHandler } = require('../utils/errorHandler');
const { User } = require('../models/user');

const authMiddleware = async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ')[1];
    if (!token) {
      return errorHandler(res, 'Authorization token not found', 401);
    }

    const decodedToken = jwt.verify(token, process.env.JWT_SECRET);
    if (!decodedToken) {
      return errorHandler(res, 'Invalid token', 401);
    }

    const user = await User.findById(decodedToken.userId);
    if (!user) {
      return errorHandler(res, 'User not found', 404);
    }

    req.user = user;
    next();
  } catch (error) {
    return errorHandler(res, 'Authentication failed', 401);
  }
};

module.exports = { authMiddleware };