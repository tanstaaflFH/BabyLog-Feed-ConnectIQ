using Toybox.Application.Storage;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Utils;

class Feeds {

	var mTimeArray = new[10];
	var mDurationArray = new[10];

	function initialize() {
		//System.println("New feed class created: " + mTimeArray);
		loadTimes();
	}

	function addFeed(feedTime) {
	
		//! add a new entry to the time array, deleting the oldest
		mTimeArray.add(feedTime);
		//System.println("Added new feed time to class: " + feedTime + " - new array: " + mTimeArray);
		mTimeArray = mTimeArray.slice(1,null);
		//System.println("Updated feed class: " + mTimeArray);
		
		//! calculate the new deltas between the times, deleting the oldest entry
		if ( mTimeArray[8] != null ) {
			mDurationArray.add(feedTime.subtract(mTimeArray[8]));
			mDurationArray = mDurationArray.slice(1,null);
			//System.println("Updated deltas class: " + mDurationArray);
		}
		
		saveTimes();
		
	}
	
	function getItem(index) {
		return mTimeArray[index];
	}
	
	function getDuration(index) {
		return mDurationArray[index];
	}
	
	function getFeeds() {
		return mTimeArray;
	}
	
	function getTimeString(index) {
		
		var timeString;
		
		if (index<0) {
			return "--";
		}
				
		if (mTimeArray[index] == null) {
			timeString = "--";
		} else {
			var momNowGreg = Gregorian.info(mTimeArray[index], Time.FORMAT_SHORT);
			timeString = Lang.format(
			    "$1$:$2$",
			    [
			        momNowGreg.hour.format("%02d"),
			        momNowGreg.min.format("%02d")
			    ]
			);
		}
		
		return timeString;

	}
	
	function getDurationString(index) {
	
		var durationRaw;
		var durationString;

		if (index instanceof Lang.String) {
			if (mTimeArray[mTimeArray.size()-1] == null) {
				durationRaw = null;
			} else {
				durationRaw = Math.floor(Time.now().subtract(mTimeArray[mTimeArray.size()-1]).value());
			}
		} else {
			if (index<0) {
				return "--";
			}
			if (mDurationArray[index] == null) {
				durationRaw = null;
			} else {
				durationRaw = mDurationArray[index].value();
			}
		}			
		
		if (durationRaw == null) {
			durationString = "--";
		} else {
			//System.println("Elapsed time in seconds: " + durationRaw);
			var hours = Utils.hours(durationRaw);
			var minutes = Utils.minutes(durationRaw);
			//System.println("Calculated elapsed time: " + hours + ":" + minutes);
			durationString = Lang.format(
				"$1$:$2$",
				[
					hours.format("%02d"),
					minutes.format("%02d")
				]
			);		
		}
	
		return durationString;
			
	}

	hidden function saveTimes() {
	
		var saveTimeArray = new[10];

		for( var i = 0; i < mTimeArray.size(); i++ ) {
			if (mTimeArray[i] != null) {
				saveTimeArray[i] = mTimeArray[i].value();
			}
		}

		Storage.setValue("TimeArray", saveTimeArray);

		var saveDurationArray = new[10];

		for( var i = 0; i < mDurationArray.size(); i++ ) {
			if (mDurationArray[i] != null) {
				saveDurationArray[i] = mDurationArray[i].value();
			}
		}

		Storage.setValue("DurationArray", saveDurationArray);
		
	}
	
	hidden function loadTimes() {
		
		try {
		
			var loadTimeArray = Storage.getValue("TimeArray");
			
			for( var i = 0; i < mTimeArray.size(); i++ ) {
				if (loadTimeArray[i] != null) {
					mTimeArray[i] = new Time.Moment(loadTimeArray[i]);
				}
			}
			
		} catch (ex) {
		
			System.println("Could not load TimeArray from Storage: " + ex);
			
		}
			
		try {
		
			var loadDurationArray = Storage.getValue("DurationArray");
			
			for( var i = 0; i < mDurationArray.size(); i++ ) {
				if (loadDurationArray[i] != null) {
					mDurationArray[i] = new Time.Duration(loadDurationArray[i]);
					//System.println("loaded duration " +i+ ": " + mDurationArray[i].value());
				}
			}
		
		} catch (ex) {
		
			System.println("Could not load DurationArray from Storage: " + ex);
			
		}
		
	}

}