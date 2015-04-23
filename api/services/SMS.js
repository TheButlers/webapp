var sinchClient = require('sinch-rtc');
var sinchAuth = require('sinch-auth');
var sinchSms = require('sinch-messaging');
var auth = sinchAuth("be045308-4acc-4423-b45f-aa899d43e4b6","+joqXtcJU0uuJrDW6VmrOQ==");

module.exports = {

    send: function(message, HP, cb) {
	sinchSms.sendMessage("+6581193783", "Hello world!");
	cb();
    }
};
