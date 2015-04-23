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
	var year = parseInt(moment().format('YYYY'));
	var month= parseInt(moment().format('MM'));
	var day = parseInt(moment().format('DD'));
	var hour = parseInt(moment().tz("Asia/Singapore").format('H'));
	var min = parseInt(moment().format('mm'));
	var sec = parseInt(moment().format('ss'));
	
	return res.json({
	    date:date,
	    year:year,
	    month:month,
	    day:day,
	    hour:hour,
	    minute:min,
	    seconde:sec
	});
    }
    
};

