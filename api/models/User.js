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

	score: {
	    type: 'integer',
	    required: true,
	    defaultsTo: 0
	},

	exercises: {
	    collection: 'exercise',
	    via: 'user'
	}
	
    }),
    
    beforeCreate: require('waterlock').models.user.beforeCreate,
    beforeUpdate: require('waterlock').models.user.beforeUpdate
};
