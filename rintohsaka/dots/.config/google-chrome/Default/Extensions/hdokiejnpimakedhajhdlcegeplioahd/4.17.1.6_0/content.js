var g_url_prefix="",g_lplanguage="";function dom_window_created(e){try{if(e.target.defaultView.frameElement){var t=e.target.defaultView.frameElement.getAttribute("lpsrc");if(t)if(t.indexOf("lpblankiframe.local")>0)e.target.defaultView.frameElement.setAttribute("lpsrc",""),e.target.location.href=g_url_prefix+"popupfilltab.html?lplanguage="+encodeURIComponent(g_lplanguage);else if(t.indexOf("lpblankiframeoverlay.local")>0){var n=t.indexOf("?");-1!=n&&(e.target.defaultView.frameElement.setAttribute("lpsrc",""),e.target.location.href=g_url_prefix+"overlay.html"+t.substring(n)+"&lplanguage="+encodeURIComponent(g_lplanguage))}else if(0===t.indexOf("contentScriptDialog.html")){e.target.defaultView.frameElement.setAttribute("lpsrc","");var r=t.indexOf("?");e.target.location.href=g_url_prefix+"contentScriptDialog.html"+(r>0?t.substring(r):"")}else if(0===t.indexOf("betterContentScriptPopup.html")){e.target.defaultView.frameElement.setAttribute("lpsrc","");r=t.indexOf("?");e.target.location.href=g_url_prefix+"betterContentScriptPopup.html"+(r>0?t.substring(r):"")}else if(0===t.indexOf("contentScriptPopup.html")){e.target.defaultView.frameElement.setAttribute("lpsrc","");r=t.indexOf("?");e.target.location.href=g_url_prefix+"contentScriptPopup.html"+(r>0?t.substring(r):"")}}}catch(e){}}function lpcontentcontainer(){this.receiveMessage=function(e){switch(e.json.messagename){case"set_url_prefix":g_url_prefix=e.json.url_prefix,g_lplanguage=e.json.lplanguage}}}function alert(e){content.alert(e)}addEventListener("DOMWindowCreated",dom_window_created,!1),lpcontent=new lpcontentcontainer,addMessageListener("lastpass:contentevent",lpcontent),sendAsyncMessage("lastpass:lpevent",{messagename:"frame_script_loaded"});
//# sourceMappingURL=sourcemaps/content.js.map
