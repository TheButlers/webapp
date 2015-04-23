/**
 * Exercise.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */
var moment = require('moment');
var userServices = require('../services/userServices');


module.exports = {

    attributes: {

	machine: {
	    model: 'machine',
	    required: true
	},

	user: {
	    model: 'user',
	    // require: true <- this is for later!
	},

	startTime: {
	    type: 'datetime',
	    required: true
	},

	stopTime: {
	    type: 'datetime'
	},

	numberOfSteps: {
	    type: 'integer',
	    required: true,
	    defaultsTo: 0
	},

	duration: function() {
	    var start = moment(this.startTime);
	    var stop = (this.stopTime) ? moment(this.stopTime) : moment();
	    return stop.diff(start, 'seconds');
	},

    },

    afterCreate: function(values, next) {
	if(values.numberOfSteps!==0) {
	    userServices.computeScore(values.id, values.numberOfSteps, function(err) {
		if(err) return err;
		next();
	    });
	} else {
	    next();
	}
	
    }
    
};

