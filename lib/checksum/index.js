/* More Details: https://developer.paytm.com/docs/checksum/#node */

var PaytmChecksum = require("../../checksum/PaytmChecksum");

var paytmParams = {};

/* Generate Checksum via Array */

/* initialize an array */
paytmParams["MID"] = "XVNIki66916401398815";
paytmParams["ORDERID"] = "2565";

/**
* Generate checksum by parameters we have
* Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
var paytmChecksum = PaytmChecksum.generateSignature(paytmParams, "n1CIsHE5hcmzNhMW");
paytmChecksum.then(function(result){
	console.log("generateSignature Returns: " + result);
	var verifyChecksum =  PaytmChecksum.verifySignature(paytmParams, "n1CIsHE5hcmzNhMW",result);
	console.log("verifySignature Returns: " + verifyChecksum);
}).catch(function(error){
	console.log(error);
});

/* Generate Checksum via String */

/* initialize JSON String */ 
body = "{\"mid\":\"XVNIki66916401398815\",\"orderId\":\"2565\"}"

/**
* Generate checksum by parameters we have
* Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
var paytmChecksum = PaytmChecksum.generateSignature(body, "n1CIsHE5hcmzNhMW");
paytmChecksum.then(function(result){
	console.log("generateSignature Returns: " + result);
	var verifyChecksum =  PaytmChecksum.verifySignature(body, "n1CIsHE5hcmzNhMW",result);
	console.log("verifySignature Returns: " + verifyChecksum);
}).catch(function(error){
	console.log(error);
});