/**
 * UserController.js 
 * 
 * @module      :: Controller
 * @description :: Provides the base user
 *                 actions used to make waterlock work.
 *                 
 * @docs        :: http://waterlock.ninja/documentation
 */

module.exports = require('waterlock').actions.user({

    account: function(req, res){
	async.parallel({
	    user: function(cb) {
		User.findOne(req.session.user.id).populateAll().exec(cb);
	    },
	    medals: function(cb) {
		Medal.find().populate('winners').exec(cb);
	    }
	}, function(err, results) {
	    if(err) return res.serverError(err);
	    _.each(results.medals, function(medal) {
		medal.obtained = _.contains(_.pluck(medal.winners, 'id'), results.user.id);
	    });
	    res.view('account', {
		user: results.user,
		medals: results.medals
	    });
	});
    },

    winMedal: function(req, res) {
	User.findOne(req.param('id')).exec(function(err, user) {
	    user.medals.add(req.param('medal'));
	    user.save(function(err, user) {
		if(err) res.json(err);
		res.json(user);
	    });
	});
    }

});
