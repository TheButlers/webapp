/**
 * ExerciseController
 *
 * @description :: Server-side logic for managing exercises
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

    duration: function(req, res, next) {
	Exercise.findOne(req.param('id')).exec(function(err, exercise) {
	    if(err) return res.json(err);
	    exercise.duration = exercise.duration();
	    res.json(exercise);
	});
    }
    
};

