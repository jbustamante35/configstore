var CompositeBackgroundOverlay=function(o){this.options=$.extend({id:"compositeBlurBackground",rootClass:"composite-overlay-root",backgroundOverlayContainerClass:"composite-background-overlay-container",parentElement:null},o),this.setup()};CompositeBackgroundOverlay.prototype=Object.create(BackgroundOverlay.prototype),CompositeBackgroundOverlay.prototype.constructor=CompositeBackgroundOverlay,function(o){CompositeBackgroundOverlay.prototype.setup=function(){if(this.options.parentElement){this.options.transparencyElement=o(LPTools.createElement("div",{id:this.options.id,class:this.options.rootClass},null)),this.options.parentElement.append(this.options.transparencyElement),this.options.backgroundOverlayContainer=this.backgroundOverlayContainer(),this.options.parentElement.append(this.options.transparencyElement),this.options.parentElement.append(this.options.backgroundOverlayContainer);var t={parentEl:this.options.backgroundOverlayContainer,classStyle:this.options.classStyle,shadeStyle:this.options.shadeStyle,text:this.options.text};this.options.backgroundOverlay=new BackgroundOverlay(t),this.hide()}},CompositeBackgroundOverlay.prototype.backgroundOverlayContainer=function(){return o(LPTools.createElement("div",{class:this.options.backgroundOverlayContainerClass},null))},CompositeBackgroundOverlay.prototype.show=function(o){this.options.transparencyElement&&(this.options.transparencyElement.show(),this.options.backgroundOverlayContainer.show(),this.options.backgroundOverlay.show(o))},CompositeBackgroundOverlay.prototype.hide=function(){this.options.transparencyElement&&(this.options.backgroundOverlay.hide(),this.options.backgroundOverlayContainer.hide(),this.options.transparencyElement.hide())}}(jQuery);
//# sourceMappingURL=sourcemaps/compositeBackgroundOverlay.js.map
