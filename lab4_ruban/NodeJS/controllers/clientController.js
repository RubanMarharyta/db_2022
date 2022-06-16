const express = require('express');
var router = express.Router();
var ObjectId = require('mongoose').Types.ObjectId;

var { Client } = require('../models/client');
router.get('/', (req, res) => {
    Client.find((err, docs) => {
        if (!err) { res.send(docs); } else { console.log('Error in Reatriving Client : ' + JSON.stringify(err, undefined, 2)); }
    });
});

router.get('/client/:id', (req, res) => {
    if (!ObjectId.isValid(req.params.id))
        return res.status(400).send(`No record with given id : ${req.params.id}`);

    Client.findById(req.params.id, (err, doc) => {
        if (!err) { res.send(doc); } else { console.log('Error in Reatriving Client : ' + JSON.stringify(err, undefined, 2)); }
    });
});

router.post('/add-client', (req, res) => {
    var client = new Client({
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email,
        phone: req.body.phone,
    });
    client.save((err, doc) => {
        if (!err) { res.send(doc); } else { console.log('Error in Client Save: ' + JSON.stringify(err, undefined, 2)); }
    });
});

router.put('/update-client/:id', (req, res) => {
    if (!ObjectId.isValid(req.params.id))
        return res.status(400).send(`No record with given id : ${req.params.id}`);

    var client = {
        name: req.body.name,
        surname: req.body.surname,
        email: req.body.email,
        phone: req.body.phone,
    };
    Client.findByIdAndUpdate(req.params.id, { $set: client }, { new: true }, (err, doc) => {
        if (!err) { res.send(doc); } else { console.log('Error in Client Updating: ' + JSON.stringify(err, undefined, 2)); }
    });
});

router.delete('/del-client/:id', (req, res) => {
    if (!ObjectId.isValid(req.params.id))
        return res.status(400).send(`No record with given id : ${req.params.id}`);

    Client.findByIdAndRemove(req.params.id, (err, doc) => {
        if (!err) { res.send(doc); } else { console.log('Error in Client Deleting: ' + JSON.stringify(err, undefined, 2)); }
    });
});

module.exports = router;