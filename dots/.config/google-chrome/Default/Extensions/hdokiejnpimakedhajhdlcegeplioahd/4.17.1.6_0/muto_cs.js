var g_did_setupInputObserver=!1;function setupInputObserver(e){if(null==e&&(e=document),do_experimental_popupfill&&(o=e,!("undefined"!=typeof g_isfirefox&&g_isfirefox?o&&o.g_did_setupInputObserver:g_did_setupInputObserver))){var r="undefined"!=typeof window&&window?window:e.defaultView,t=null;if("undefined"!=typeof WebKitMutationObserver)t=new WebKitMutationObserver(function(e){setTimeout(function(){mutationObserverCallBack(e)},0)});else if("undefined"!=typeof MutationObserver);else{if(void 0===r.MutationObserver)return;if(e&&e.location&&e.location.href.indexOf(".xul"))return;t=new r.MutationObserver(function(e){setTimeout(function(){mutationObserverCallBack(e)},0)})}null!=t&&(t.observe(e,{childList:!0,subtree:!0}),function(e){if("undefined"!=typeof g_isfirefox&&g_isfirefox){if(!e)return!1;e.g_did_setupInputObserver=!0}else g_did_setupInputObserver=!0}(e))}var o}var g_did_muto=!1,g_pending_recheck=!1,g_pending_eval=!1;function mutationObserverCallBack(e){LPCTR("mutationObserver");var r=!1;if(e.forEach(function(e){var t;if(g_isfirefox&&LP.getBrowser(),0==r)for(t=0;t<e.addedNodes.length;t++){if(1===(o=e.addedNodes[t]).nodeType&&("INPUT"==o.tagName||o.getElementsByTagName("INPUT").length>0||"SCRIPT"==o.tagName&&""!=o.src&&""===o.innerHTML)){r=!0;break}}if(0==r)for(t=0;t<e.removedNodes.length;t++){var o;if(1===(o=e.removedNodes[t]).nodeType&&("INPUT"==o.tagName||o.getElementsByTagName("INPUT").length>0)){r=!0;break}}}),r)if(g_did_muto=!0,g_isfirefox){for(var t=LP.getBrowser().contentWindow;null!=t.top&&t.top!=t;)t=t.top;var o=t.document,n=lpGetBrowserForDocument(o);verbose_log("mutation observer triggers checkShouldRecheck"),LP.checkShouldRecheck(n)}else{var i=LP_get_last_url_history(document);i.href!=get_doc_location_href(document)&&verbose_log("href changed from "+i.href+" to "+get_doc_location_href(document)),verbose_log("mutation observer triggers recheck, href = "+i.href+" hash = "+i.href_hash),g_pending_recheck||checkShouldRecheck({fromclick:!1,frommuto:!0,href:i.href,href_hash:i.href_hash})}}
//# sourceMappingURL=sourcemaps/muto_cs.js.map
