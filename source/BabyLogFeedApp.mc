using Toybox.Application;
using Toybox.Application.Storage;

class BabyLogFeedApp extends Application.AppBase {

	var mCurrentFeeds;

    function initialize() {
        AppBase.initialize();
        mCurrentFeeds = new Feeds();
    }

    // onStart() is called on application start up
    function onStart(state) {     
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	var initialView = new EntryView(mCurrentFeeds);
        return [ initialView, new EntryDelegate(initialView, mCurrentFeeds) ];
    }

}