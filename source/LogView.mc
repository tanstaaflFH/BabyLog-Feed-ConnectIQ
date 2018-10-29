using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Utils;

class LogView extends WatchUi.View {

	var mCurrentFeeds;

    function initialize(currentFeeds) {
        View.initialize();
        mCurrentFeeds = currentFeeds;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.LogLayout(dc));      
        updateLogLabels(9);
        //System.println("Layout loaded for FBLView");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	
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

	function updateLogLabels(startingPoint) {
		
		for (var i=0;i<5;i++) {
		
			var currentTimeLabel = View.findDrawableById("lblFeedLogTime"+i);
			var currentDurationLabel = View.findDrawableById("lblFeedLogDuration"+i);
			var labelTimeString = Lang.format(
				"$1$. at: $2$",
				[	
					10-startingPoint+i,
					mCurrentFeeds.getTimeString(startingPoint-i)
				]
			);
			var labelDurationString = Lang.format(
				"Since last: $1$",
				[
					mCurrentFeeds.getDurationString(startingPoint-i)
				]
			);			
			//System.println("Date Log label: "+labelString);
			if ((10-startingPoint+i) == 11) {
				labelTimeString = "";
				labelDurationString = "";
			}
            currentTimeLabel.setText(labelTimeString);
            currentDurationLabel.setText(labelDurationString);

		}
		
		WatchUi.requestUpdate();
	
	}

}
