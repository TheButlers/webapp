/**
 * Machine.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */

module.exports = {

    attributes: {

	type: {
	    type: 'string',
	    required: true
	},

	fitnessCorner: {
	    type: 'string'
	},

	dateInstalled: {
	    type: 'date'
	},

	exercises: {
	    collection: 'exercise',
	    via: 'machine'
	}
	
    }

};

