/**
 * ExerciseController
 *
 * @description :: Server-side logic for managing exercises
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */
var create = require('sails/lib/hooks/blueprints/actions/create');
var update = require('sails/lib/hooks/blueprints/actions/update');

module.exports = {

    duration: function(req, res, next) {
	Exercise.findOne(req.param('id')).exec(function(err, exercise) {
	    if(err) return res.json(err);
	    exercise.duration = exercise.duration();
	    res.json(exercise);
	});
    },

    create: function(req, res) {
	sails.log.debug('>> CREATE <<');
	sails.log.debug(req.params.all());
	create(req, res);
    },

    update: function(req, res) {
	sails.log.debug('>> UPDATE <<');
	sails.log.debug(req.params.all());
	update(req, res);
    }
    
};

