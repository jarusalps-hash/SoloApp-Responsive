var I1FocusedElementOverriden = false; // If true, the hidden field has been manually set.
// This script is used by JsHelper.EnableInactivityTimeout()

var I1TimeoutId = null;			  //	Stores the return value of window.setTimeout()
var I1TimeoutSubinterval = 1;	  //	Timeout intervals that are too long 
								  //	are divided into minute-segments of this size   
var I1TimeoutRemaining = 0;		  //	If the timeout interval is divided
								  //	into multiple segments, this is the
								  //	total time remaining in minutes.
var I1TimeoutFunction = null;	  //	The code that gets executed upon timeout.

var unloadBlocker = null;
var disableUnloadBlockerForNextUnload = false;
var modalDialogNotifierScreen = null;

var I1WebGlobalization_FormatInfo;

