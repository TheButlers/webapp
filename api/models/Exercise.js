/**
 * Exercise.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */
var moment = require('moment');
var userService = require('../services/User');


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

    afterUpdate: function(values, next) {
	if(values.numberOfSteps !== 0) {
	    userService.computeScore(values.user, function(err) {
		if(err) return sails.log.error(err);
		next(err);
	    });
	} else {
	    next();
	}
    },

    afterCreate: function(values, next) {
	userService.notifyFriend(values.user, function(err) {
	    if(err) return sails.log.error(err);
	    next(err);
	});
    }
    
};

