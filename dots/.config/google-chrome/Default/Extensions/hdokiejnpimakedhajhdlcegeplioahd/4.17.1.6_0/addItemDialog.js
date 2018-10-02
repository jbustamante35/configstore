var AddItemDialog=function(e){Dialog.call(this,e,{title:Strings.translateString("Add Item"),dynamicHeight:!1,closeButtonEnabled:!0,overlayDialog:!0,hideButtons:!0,additionalHeaderClasses:["icon"]})};AddItemDialog.prototype=Object.create(Dialog.prototype),AddItemDialog.prototype.constructor=AddItemDialog,AddItemDialog.prototype.addCard=function(e){var t=LPTools.createElement("div","col-3"),a=LPTools.createElement("button",e.classes?[].concat("addItemCard",e.classes):"addItemCard");return t.appendChild(a),e.icon&&a.appendChild(e.icon),a.appendChild(LPTools.createElement("span","addItemCardName",e.name)),e.parent.append(t),a},AddItemDialog.prototype.initialize=function(){Dialog.prototype.initialize.apply(this,arguments);var e=this,t=$("#addItemOptions"),a=$("#addItemCustomOptionsContainer").slideUp(),n=$("#addItemCustomOptions"),o=$("#addItemCustomOptionsLabel"),i={postSetup:function(){e.close()}};o.bind("click",function(){a.slideToggle(),o.toggleClass("open")});var s=bg.get("RecordTypeConfig");s.types.forEach(function(a){a.composite||e.addCard({parent:t,name:a.name,classes:a.id}).addEventListener("click",function(){if(bg.lpevent("m_add"),LPFeatures.allowOmarDrawer())window.location.hash="/drawers/(drawer:new-item/"+a.id+")";else switch(a.recordType){case s.TYPE.Password:dialogs.site.open(i);break;default:dialogs.note.open($.extend(i,{defaultData:{notetype:a.recordType,language:Note.prototype.isValidLanguage(navigator.language)?navigator.language:"en-US"}}))}})});var d=function(t){var a=e.addCard({parent:n,name:t.title,classes:"Custom"}),o=LPTools.createElement("button","customTemplateDeleteButton");return o.appendChild(LPTools.createElement("i","fa fa-trash")),a.appendChild(o),a.addEventListener("click",function(){dialogs.note.open($.extend(i,{defaultData:{notetype:"Custom_"+t.id}}))}),o.addEventListener("click",function(e){e.stopPropagation(),dialogs.confirmation.open({title:Strings.translateString("Confirm Deletion"),text:[Strings.translateString("Are you sure you want to delete %1?",t.title),Strings.translateString("Any notes you created using this template will not be deleted.")],nextButtonText:Strings.translateString("Continue"),backButtonText:Strings.translateString(Strings.Vault.CANCEL),handler:function(){LPRequest.makeRequest(LPProxy.deleteCustomNoteTemplate,{params:{id:t.id},success:function(){var e=a.parentElement;e.parentElement.removeChild(e)},requestSuccessOptions:{closeDialog:!1}})}})}),a};LPProxy.getCustomNoteTemplates().forEach(d),Topics.get(Topics.SECURENOTE_TEMPLATE_ADDED).subscribe(function(e){var t=d(e);setTimeout(function(){t.focus()},0)});var l=this.addCard({parent:n.parent(),name:Strings.translateString("New custom item type"),icon:LPTools.createElement("i","fa fa-plus")});$(l).addClass("customTemplateAddButton").bind("click",function(){dialogs.customNoteTemplate.open()})};
//# sourceMappingURL=sourcemaps/addItemDialog.js.map
