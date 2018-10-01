var FamiliesInvitationDialog=function(i){Dialog.call(this,i,{additionalHeaderClasses:[],dynamicHeight:!0,buttonsInsideContent:!0,title:Strings.translateString("Welcome to the family!"),closeButtonEnabled:!0,hidePreviousDialogs:!0})};FamiliesInvitationDialog.prototype=Object.create(Dialog.prototype),FamiliesInvitationDialog.prototype.constructor=FamiliesInvitationDialog,FamiliesInvitationDialog.prototype.initialize=function(i){var t,n,o=this;Topics.get(Topics.REFRESH_DATA).subscribe(function(){LPProxy.isFamilyUser()&&(o.close(),LPPlatform.openTour())}),Dialog.prototype.initialize.apply(this,arguments),t=this,(n=o.data.invitations)?$("#families-invitation-email").text(n[0].inviter):t.close(!0),i.find("#families-invitation-spinner").hide(),i.find("#dialogCloseButton").bind("click",function(){t.close(!0)}),i.find("#families-invitation-dismiss").bind("click",function(){t.dismissInvitation()}),i.find("#families-invitation-join").bind("click",function(){t.acceptInvitation()}),i.find("#families-invitation-learn-more").bind("click",function(){})},FamiliesInvitationDialog.prototype.acceptInvitation=function(){var i=this,t=this.data.invitations[0];LPRequest.makeRequest(LPProxy.acceptInvitation,{params:{invitationId:t.id},error:function(){i.close()}})},FamiliesInvitationDialog.prototype.dismissInvitation=function(){var i=this.data.invitations,t=this;t.showInProcessOverlay(),LPProxy.dismissInvitation({success:function(){t.hideInProcessOverlay(),i.shift(),t.data.invitations=i,i.length>0?$("#families-invitation-email").text(i[0].inviter):t.close(!0)},error:function(){t.hideInProcessOverlay(),t.close(!0)},params:{invitationId:i[0].id}})},FamiliesInvitationDialog.prototype.showInProcessOverlay=function(){$("#families-invitation-spinner").show(),$("#families-invitation-text").hide(),$("#families-invitation-icon").hide(),$("#families-invitation-join").prop("disabled",!0),$("#families-invitation-dismiss").prop("disabled",!0)},FamiliesInvitationDialog.prototype.hideInProcessOverlay=function(){$("#families-invitation-spinner").hide(),$("#families-invitation-text").show(),$("#families-invitation-icon").show(),$("#families-invitation-join").prop("disabled",!1),$("#families-invitation-dismiss").prop("disabled",!1)},FamiliesInvitationDialog.prototype.close=function(i){this.data.callback(!1),i&&Dialog.prototype.close.apply(this,arguments)};
//# sourceMappingURL=sourcemaps/familiesInvitationDialog.js.map
