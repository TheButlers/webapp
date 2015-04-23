module.exports = {

    computeScore: function(user, numberOfSteps, cb) {
	User.findOne(user.id).populateAll().exec(function(err, user){
	    user.score = user.score+numberOfSteps;
	    console.log(user.score);
	    user.save(cb);
	});
    }

};
