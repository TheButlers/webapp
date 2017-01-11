/**
 * Medal.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */

module.exports = {

    autoPK: false,
	
    attributes: {

	img: {
	    type: 'string',
	    required: true,
	    primaryKey: true
	},

	description: {
	    type: 'string',
	    required: true
	},
	
	winners: {
	    collection: 'user',
	    via: 'medals'
	}
	
    }

};

