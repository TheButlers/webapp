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
	    async.map(results.user.friends, function(friend, cb) {
		Friend.findOne(friend.id).populate('user').exec(cb);
	    }, function(err, friends) {
		async.map(friends, function(friend, cb) {
		    User.findOne(friend.user.id).populate('auth').exec(cb);
		}, function(err, friends) {
		    res.view('account', {
			user: results.user,
			medals: results.medals,
			friends: friends
		    });
		});
	    });
	});
    },

    winMedal: function(req, res) {
	User.findOne(req.param('id')).exec(function(err, user) {
	    user.medals.add(req.param('medal'));
	    user.save(function(err, user) {
		if(err) return res.json(err);
		res.json(user);
	    });
	});
    },

    addFriend: function(req, res) {
	async.series([
	    function(cb) {
		User.findOne(req.param('user1')).populateAll().exec(function(err, user) {
		    if(err) return cb(err);
		    user.friends.add(req.param('user2'));
		    user.save(cb);
		});
	    },
	    function(cb) {
		User.findOne(req.param('user2')).populateAll().exec(function(err, user) {
		    if(err) return cb(err);
		    user.friends.add(req.param('user1'));
		    user.save(cb);
		});
	    }
	], function(err) {
	    if(err) return res.json(err);
	    res.json({success: 'friend added!'});
	});
    },
    
    rfidAuth: function(req, res) {
	User.findOne({rfidTag: req.param('rfid')}).populate('auth').exec(function(err, user) {
	    if(err) return res.json(err);
	    res.json({
		id: user.id,
		username: user.auth.username
	    });
	});
    }

});
