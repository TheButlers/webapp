/**
 * User
 *
 * @module      :: Model
 * @description :: This is the base user model
 * @docs        :: http://waterlock.ninja/documentation
 */

module.exports = {

    tableName: 'user_waterlock',
    
    attributes: require('waterlock').models.user.attributes({
	
	fullname: {
	    type: 'string',
	    required: true
	},

	age: {
	    type: 'integer'
	},

	fitnessCorner: {
	    type: 'string'
	},
	
	score: {
	    type: 'integer',
	    required: true,
	    defaultsTo: 0
	},

	ponderedScore: {
	    type: 'integer',
	    defaultsTo: 0
	},
	
	exercises: {
	    collection: 'exercise',
	    via: 'user'
	},

	medals: {
	    collection: 'medal',
	    via: 'winners'
	},

	rfidTag: {
	    type: 'string'
	},

	friends: {
	    collection: 'friend'
	},

	pic: {
	    type: 'string',
	},

	phone: {
	    type: 'string'
	}
	
    }),

    afterCreate: function(values, next) {
	Friend.create({id:values.id, user: values.id}).exec(function(err) {
	    if(err) sails.log.error(err);
	    next(err);
	});
    },
    
    beforeCreate: require('waterlock').models.user.beforeCreate,
    beforeUpdate: require('waterlock').models.user.beforeUpdate


};
