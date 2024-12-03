const Sequelize = require("sequelize");
const sequelize = require("../config/database");

const User = require("./user");

module.exports = {
  sequelize,
  Sequelize,
  User,
};

