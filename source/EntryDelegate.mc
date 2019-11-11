using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;

class EntryDelegate extends WatchUi.BehaviorDelegate {

	var mCurrentFeeds;
	var mParentView;

    function initialize(view, refFeeds) {
        
        //! Initialize extended class
        BehaviorDelegate.initialize();
        
        //! Initialize module variables
        mCurrentFeeds = refFeeds;
        mParentView = view;
        
    }

	function onAddFeed() {
		
		//!	get current time and update feed class
		mCurrentFeeds.addFeed(Time.now());
		//! System.println("New feed list: " + mCurrentFeeds.getFeeds());
		
		//! update labels
		mParentView.updateLabels();
			
	}
	      
    function onNextPage() {
		//! System.println("Behaviour: onNextPage");
		return pushMenu(WatchUi.SLIDE_IMMEDIATE);
    }
       
    function onSelect() {
		//! System.println("Behaviour: onSelect");
		return onAddFeed();
    }
    
    function pushMenu(slideDir) {
        var view = new LogView(mCurrentFeeds);
        var delegate = new LogDelegate(view);
        WatchUi.pushView(view, delegate, slideDir);
        return true;
    }
	 
}
