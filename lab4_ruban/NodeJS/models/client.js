const mongoose = require('mongoose');

var Client = mongoose.model('Client', {
    name: { type: String },
    surname: { type: String },
    email: { type: String },
    phone: { type: String }
});

module.exports = { Client };