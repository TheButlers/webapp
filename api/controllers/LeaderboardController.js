/**
 * LeaderboardController
 *
 * @description :: Server-side logic for managing leaderboards
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

    index: function(req, res, next) {
	User.find().populate('auth').sort('score DESC').limit(10).exec(function(err, users) {
	    if(err) return res.serverError(err);
	    res.view('leaderboard', {
		layout: 'layout-leaderboard',
		users: users
	    });
	});
    },

    refresh: function(req, res) {
	User.find().populate('auth').sort('score DESC').limit(10).exec(function(err, users) {
	    if(err) return res.json(err);
	    res.json(users);
	});
    }
    
};

