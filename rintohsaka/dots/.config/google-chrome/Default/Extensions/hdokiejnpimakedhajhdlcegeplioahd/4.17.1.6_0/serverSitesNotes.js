LPServer.sitesAndNotes={saveCustomNoteTemplate:function(e){LPServer.lmiapi.jsonRequest({url:"lmiapi/note-templates",data:e.params,success:function(t){e.success(LPServer.ext.translate("Custom Note Template: %1 created.",t.title),t)},userSupplied:e})},deleteCustomNoteTemplate:function(e){var t=g_note_templates.filter(function(t){return t.id===e.params.id});t&&t.length>0&&LPServer.lmiapi.jsonRequest({url:"lmiapi/note-templates/"+e.params.id+"/delete",success:function(s){e.success(LPServer.ext.translate("Custom Note Template: %1 deleted.",t[0].title),s)},userSupplied:e})}},LPServer.transact={sendReminder:function(e){LPServer.lmiapi.jsonRequest({url:"lmiapi/transact/cross-device-reminder",data:e.params,userSupplied:e})}};
//# sourceMappingURL=sourcemaps/serverSitesNotes.js.map
