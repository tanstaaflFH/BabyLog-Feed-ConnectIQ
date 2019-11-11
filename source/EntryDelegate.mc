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
		System.println("New feed list: " + mCurrentFeeds.getFeeds());
		
		//! update labels
		mParentView.updateLabels();
			
	}
	
    function onBack() {
		System.println("Behaviour: onBack");
    }

    function onMenu() {
		System.println("Behaviour: onMenu");
    }

    function onNextMode() {
		System.println("Behaviour: onNextMode");
    }
        
    function onNextPage() {
		System.println("Behaviour: onNextPage");
		return pushMenu(WatchUi.SLIDE_IMMEDIATE);
    }

    function onPreviousMode() {
		System.println("Behaviour: onPreviousMode");
		return false;
    }
        
    function onPreviousPage() {
		System.println("Behaviour: onPreviousPage");
		return true;
    }
        
    function onSelect() {
		System.println("Behaviour: onSelect");
		return onAddFeed();
    }
    
    function pushMenu(slideDir) {
        var view = new LogView(mCurrentFeeds);
        var delegate = new LogDelegate(view);
        WatchUi.pushView(view, delegate, slideDir);
        return true;
    }
	 
}
