const express = require('express');
const authController = require('../controllers/authController');
const { validateRegister, validateLogin } = require('../utils/validation');

const authRouter = express.Router();

authRouter.post('/register', validateRegister, authController.register);
authRouter.post('/login', validateLogin, authController.login);

module.exports = authRouter;