const { Server } = require("socket.io");

module.exports = function(server) {
  const io = new Server(server, {
    cors: {
      origin: "*", // Update this with your client's URL
      methods: ["GET", "POST"]
    }
  });

  io.on('connection', async (socket) => {
    

    // Initialize socket events  
    // require('./sockets/chatSocket')(io, socket);

    socket.on('disconnect', async () => {
      console.log('User disconnected:', socket.id);
    });
  });

  return io;
};
