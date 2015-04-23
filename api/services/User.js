module.exports = {

    computeScore: function(user, cb) {
	User.findOne(user.id).populateAll().exec(function(err, user){
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
    }

};
