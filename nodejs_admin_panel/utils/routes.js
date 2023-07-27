const express = require('express');
const authRouter = require('./auth');
const dashboardRouter = require('./dashboard');

const router = express.Router();

router.use('/auth', authRouter);
router.use('/dashboard', dashboardRouter);

module.exports = router;