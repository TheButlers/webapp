module.exports = {

    computeScore: function(user, numberOfSteps, cb) {
	User.findOne(user.id).populateAll().exec(function(err, user){
	    user.score = user.score+numberOfSteps;
	    user.save(cb);
	});
    }

};
