/**
 * SmsController
 *
 * @description :: Server-side logic for managing sms
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */
var sms = require('../services/Sms');

module.exports = {

    send: function(req, res) {
	var message = req.param('message');
	var phoneNumber = req.param('phoneNumber');
	console.log(phoneNumber+' '+message);
	if(message && phoneNumber) {
	    //sms.send(message, phoneNumber);
	    res.json({success: 'SMS sent!'});
	} else {
	    res.json({error: 'Wrong parameters!'});
	}
    }
    
};

