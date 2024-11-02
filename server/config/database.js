const { Sequelize } = require("sequelize");
const path = require('path');

const dbPath = path.join(process.cwd(), 'database.sqlite');

const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: dbPath,  
    logging: false,
});


(async () => {
    try {
        await sequelize.authenticate();

        sequelize
        .sync({
            alter: true,
            force:false
        })
        .then(() => {
            console.log("Database synchronized");
        })
        .catch((err) => {
            console.error("Unable to synchronize the database:", err);
        });
        console.log('Connection to the SQLite database has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
})();

module.exports = sequelize;
