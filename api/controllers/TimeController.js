/**
 * TimeController
 *
 * @description :: Server-side logic for managing times
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */
var moment = require('moment-timezone');

module.exports = {

    index: function(req, res, next) {

	var date = moment().tz("Asia/Singapore").format();
	var year = moment().format('YYYY');	
	var month= moment().format('MM');
	var day = moment().format('DD');
	var hour = moment().tz("Asia/Singapore").format('H');
	var min = moment().format('mm');
	var sec = moment().format('ss');
	
	return res.json({
	    date:date,
	    year:year,
	    month:month,
	    day:day,
	    hour:hour,
	    min:min,
	    sec:sec
	});
    }
    
};

