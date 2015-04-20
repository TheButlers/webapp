/**
 * Exercise.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */
var moment = require('moment');


module.exports = {

    attributes: {

	machine: {
	    model: 'machine',
	    required: true
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
	}

    }

};

