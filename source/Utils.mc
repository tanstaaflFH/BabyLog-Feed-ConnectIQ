using Toybox.Math;

module Utils {

	function hours(seconds) {
	
		var temp = seconds % 86400;
		var hours = Math.floor(temp / 3600);
		return hours;		
	
	}
	
	function minutes(seconds) {
	
		var temp = seconds % 3600;
		var minutes = Math.floor(temp / 60);
		return minutes;
		
	}
	
	function seconds(seconds) {
	
		var temp = seconds % 60;
		var returnSeconds = Math.floor(temp);
		return returnSeconds;
	
	}

}