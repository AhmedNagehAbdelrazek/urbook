const { getAllUsers, getMe } = require("../Controllers/userController");
const protect = require('../middlewares/protect');

const verifyRole = require("../utils/verifyRole");
const router = require("express").Router();


// router.get("/",protect,verifyRole(['admin']), getAllUsers);
router.get("/", getAllUsers);
router.get("/me",protect, getMe);

module.exports = router;


