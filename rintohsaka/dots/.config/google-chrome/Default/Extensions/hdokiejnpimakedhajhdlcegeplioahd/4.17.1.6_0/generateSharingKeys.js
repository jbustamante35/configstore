var generateSharingKeysFromVault=function(){"use strict";function e(e){var n=new RSAKey;generate_key(n,function(n){!function(e,n){e||n("RSA generation failed.");g_local_key&&g_local_key&&base_url&&LPServer||n("Global dependencies missing.");var a=null!=document.getElementById("newvault"),r=encode_public_key(e),t=encode_private_key(e),o=rsa_encrypt_privatekey(t,g_local_key);o=o.toUpperCase();var l={};l.privatekeyenc=o,l.publickey=r,l.userkeyhexhash=SHA256(AES.bin2hex(g_local_key)),l.privatekeyenchexhash=SHA256(o),l.token=a?decodeURIComponent(g_token):g_token,l.from=a?"webvault":"vault",l.method=get_method(),"undefined"!=typeof lpversion&&(l.lpversion=lpversion);var i=a?base_url+"uploadrsakeys_website.php":base_url+"uploadrsakeys.php";LPServer.ajax({type:"POST",url:i,data:l,success:function(e,a){n(!1)},error:function(e,a){n(e)}})}(n,e)})}return function(n){e(n)}}();
//# sourceMappingURL=sourcemaps/generateSharingKeys.js.map
