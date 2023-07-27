const jwt = require('jsonwebtoken');
const { errorHandler } = require('../utils/errorHandler');
const { User } = require('../models/user');
const { Constants } = require('../utils/constants');

const authMiddleware = async (req, res, next) => {
  try {
    const token = req.header('Authorization').replace('Bearer ', '');
    const decoded = jwt.verify(token, Constants.JWT_SECRET);
    const user = await User.findOne({ _id: decoded._id, 'tokens.token': token });

    if (!user) {
      throw new Error();
    }

    req.token = token;
    req.user = user;
    next();
  } catch (error) {
    errorHandler(res, error);
  }
};

module.exports = { authMiddleware };