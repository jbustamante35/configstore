var MigrationPopupDialog=function(o){Dialog.call(this,o,{submitDialog:!1,confirmOnClose:!1,hideButtons:!0,hideHeader:!0,additionalClasses:"migrationPopupDialog"})};MigrationPopupDialog.prototype=Object.create(Dialog.prototype),MigrationPopupDialog.prototype.constructor=MigrationPopupDialog,MigrationPopupDialog.prototype.initialize=function(o){var i;Dialog.prototype.initialize.apply(this,arguments),i=this,document.getElementById("openVault").onclick=function(){window.open(i.data.url+"vault.html"),i.close()},document.getElementById("closePopup").onclick=function(){i.close()},bg.sendLpImprove("migration::formfill::tour::notification")};
//# sourceMappingURL=sourcemaps/migrationPopup.js.map
