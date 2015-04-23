var sms = require('./Sms');


module.exports = {

    computeScore: function(user, cb) {
	User.findOne(user).populateAll().exec(function(err, user) {
	    // compute score
	    user.score = _.reduce(_.pluck(user.exercises, 'numberOfSteps'), function(total, n) {
		return total + n;
	    });

	    // age-based weighted score
	    if (user.age >= 65) {
		user.ponderedScore = parseInt(user.score*(2+(user.age-65)/5));
	    } else {
		user.ponderedScore = user.score;
	    }
	    user.save(cb);
	});
    },

    notifyFriend: function(user, cb) {
	User.findOne(user).populate('friends').exec(function(err, user) {
	    if(err) return cb(err);
	    async.map(user.friends, function(friend, cb) {
		Friend.findOne(friend.id).populate('user').exec(cb);
	    }, function(err, friends) {
		async.map(friends, function(friend, cb) {
		    User.findOne(friend.user.id).exec(cb);
		}, function(err, friends) {
		    friends = _.reject(friends, {phone: null});
		    if(friends.length > 0) {
			var phone = friends[0].phone;
			var message = friends[0].fullname+" arrived at the fitness corner. Let's join him?";
			sms.send(message, phone);
		    }
		    cb();
		});
	    });
	});
    }

};
