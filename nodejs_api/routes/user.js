const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const authMiddleware = require('../middleware/auth');

// Get all users
router.get('/', authMiddleware, userController.getAllUsers);

// Get user by ID
router.get('/:id', authMiddleware, userController.getUserById);

// Create a new user
router.post('/', userController.createUser);

// Update user by ID
router.put('/:id', authMiddleware, userController.updateUserById);

// Delete user by ID
router.delete('/:id', authMiddleware, userController.deleteUserById);

module.exports = router;