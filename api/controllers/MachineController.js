/**
 * MachineController
 *
 * @description :: Server-side logic for managing machines
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */
var SMS = require('../services/SMS');

module.exports = {

    send: function(req, res, next) {
	var message = 'message';
	var HP = 'HP';
	SMS.send(message, HP, function(err) {
	    if(err) return (err);
	    res.redirect('/');
	});
    }
};

