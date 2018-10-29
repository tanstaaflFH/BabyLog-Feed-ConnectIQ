using Toybox.WatchUi;

class EntryView extends WatchUi.View {

	var mCurrentFeeds;

    function initialize(currentFeeds) {
        View.initialize();
        mCurrentFeeds = currentFeeds;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));      
        //System.println("Layout loaded for FBLView");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	updateLabels();
    }

    // Update the view
    function onUpdate(dc) {
    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

	function updateLabels() {
	
		//! update last feed time label
		var labelString = "Last feed: " + mCurrentFeeds.getTimeString(9);
		View.findDrawableById("lblLastFeed").setText(labelString);		
		
		//! update last feed elapsed label
		View.findDrawableById("lblElapsedFeed").setText("Elapsed: " + mCurrentFeeds.getDurationString("now"));	
			
	}

}
