//http://partridgejiang.github.io/Kekule.js/documents/tutorial/content/molIO.html#loading-from-string-variable

(function ( $ ) {
 
    $.fn.rkekule = function(settings) {
        
        return this.each(function() {
        
		    try {

	        	if (settings.type == 'cml') {
	        	
	        		var data = ($(this).html()).replace(/&gt;/gi,'>').replace(/&lt;/gi,'<');
	        	
	        	} else if (settings.type == 'mol') {
	        	
	        		var data = ($(this).html()).replace(/\\n/g, '\n');
	        	
	        	} else {
	        	
	        		throw "format currently not supported by rkekule";
	        		
	        	}
	        	
	        	// console.log('inner data found:');
		    	// console.log(data);
		    	// console.log(settings);
	        	
	        	$(this).html('');
		    
		    	var chemViewer = new Kekule.ChemWidget.Viewer(document);
		    	
		    	var molecule = Kekule.IO.loadFormatData(data, settings.type);
		    	
		    	// TODO make this optional and generalize setting render options
		    	molecule.setRenderOption('useAtomSpecifiedColor', true);
		    	
		    	chemViewer.setDimension(settings.width, settings.height);
		    	chemViewer.setAutoSize(true);
				chemViewer.setRenderType(Kekule.Render.RendererType.R2D);
				
				// chemViewer.setEnableToolbar(true);
				
				chemViewer.appendToElem(this).setChemObj(molecule);
				
				// transparent background
				$(this).children().css( "background-color", "rgba(0,0,0,0)" );
				
			} catch(err) {
				
				console.log(err.message);
				
			}
        	
    	});
    };
 
}( jQuery ));



HTMLWidgets.widget({

    name: "rkekule",

    type: "output",

    factory: function(el, width, height) {

        // create initial object here?
        // var chemViewer = new Kekule.ChemWidget.Viewer(document);
        var chemViewer = new Kekule.ChemWidget.Viewer(el);

        return {
            renderValue: function(x) {
            
                // get smiles string
                var molData = x.data;
                var molecule = Kekule.IO.loadFormatData(molData, x.settings.type);

                // TODO additional settings here?
                
                // TODO make this optional and generalize setting render options
                molecule.setRenderOption('useAtomSpecifiedColor', true);
                
                chemViewer.setDimension(width, height); // TODO get from arguments
                if (x.settings.renderType == '2D') {
                	chemViewer.setRenderType(Kekule.Render.RendererType.R2D);
                } else {
                	chemViewer.setRenderType(Kekule.Render.RendererType.R3D);
                }
                // TODO: show toolbar only if settings allow it
                chemViewer.setEnableToolbar(true);
                chemViewer.setAutofit(true);

                // render molecule
                chemViewer.setChemObj(molecule);

            },

            resize: function(width, height) {

                // forward resize on to kekule here?

            },

            // make the mol object available
            // good practice wrt. extensibility
            s: chemViewer

        };
    }
});
