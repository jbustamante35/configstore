var Policies=function(){return{logNameEnabled:function(){return g_loglogins&&4==(4&g_loglogins)},logUserNameEnabled:function(){return g_loglogins&&8==(8&g_loglogins)},logUrlEnabled:function(){return g_loglogins&&2==(2&g_loglogins)},getSaveSiteToPersonal:function(){return e("savesitestopersonal")},getAccountSelectionBasedOnEmail:function(o){o&&o("1"===e("accountselectionbasedonemail"));return"1"===e("accountselectionbasedonemail")},showSecureNotes:function(){return void 0===g_prefoverrides.show_notes||!!Number(g_prefoverrides.show_notes)}};function e(e){var o,n=g_prefoverrides;switch(e){case"showcredmon":o=bg.get("g_showcredmon");break;default:o=n&&n[e]}return"boolean"==typeof o&&(o=o?"1":"0"),o}}();
//# sourceMappingURL=sourcemaps/policies.js.map
