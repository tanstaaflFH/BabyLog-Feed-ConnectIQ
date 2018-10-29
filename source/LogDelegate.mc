using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;

class LogDelegate extends WatchUi.BehaviorDelegate {

	var mLogStartPoint = 9;
	var mParentView = null;

    function initialize(view) {
        
        //! Initialize extended class
        BehaviorDelegate.initialize();
        mParentView = view;
        
        //! Initialize module variables
        
    }
    
    function onNextPage() {
    	scrollDown();
    }
    
    function onPreviousPage() {
     	scrollUp();
    } 
	 
	hidden function scrollDown() {

		mLogStartPoint--;
		if (mLogStartPoint<3) {
			mLogStartPoint = 3;
		}
		
		//System.println("Scrolled down. Starting Point: " + mLogStartPoint);	
		mParentView.updateLogLabels(mLogStartPoint);
		
	}
	
	hidden function scrollUp() {

		mLogStartPoint++;
		if (mLogStartPoint>9) {
			mLogStartPoint = 9;
		}
		
		//System.println("Scrolled up. Starting Point: " + mLogStartPoint);	
		mParentView.updateLogLabels(mLogStartPoint);
		
	}
		
}
