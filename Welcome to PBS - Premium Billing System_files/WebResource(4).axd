
// Initializes format information.
// Needs to be called before any other function.
function I1WebGlobalization_Init(
	// Currency
	_currencyDecimalDigits, 
	_currencyDecimalSeparator, 
	_currencyGroupSeparator,
	_currencyGroupSizes,
	_currencyNegativePattern,
	_currencyPositivePattern,
	_currencySymbol,
	// Percent
	_percentDecimalDigits, 
	_percentDecimalSeparator, 
	_percentGroupSeparator,
	_percentGroupSizes,
	_percentNegativePattern,
	_percentPositivePattern,
	_percentSymbol,
	// Number
	_numberDecimalDigits, 
	_numberDecimalSeparator, 
	_numberGroupSeparator,
	_numberGroupSizes, 
	_numberNegativePattern,
	// Date/time
	_amDesignator,
	_dateSeparator,
	_fullDateTimePattern,
	_longDatePattern,
	_longTimePattern,
	_monthDayPattern,
	_pmDesignator,
	_rfc1123Pattern,
	_shortDatePattern,
	_shortTimePattern,
	_sortableDateTimePattern,
	_timeSeparator,
	_universalSortableDateTimePattern,
	_yearMonthPattern,
	_nativeCalendarName,
	_abbreviatedDayNames,
	_shortestDayNames,
	_dayNames,
	_abbreviatedMonthNames,
	_monthNames,
	_abbreviatedMonthGenitiveNames,
	_monthGenitiveNames,
	_timeZoneOffset,
	_abbreviatedDayInvariantNames,
	_shortestDayInvariantNames,
	_dayInvariantNames,
	_abbreviatedMonthInvariantNames,
	_monthInvariantNames,
	_abbreviatedMonthGenitiveInvariantNames,
	_monthGenitiveInvariantNames
	)
{
	I1WebGlobalization_FormatInfo = new Object();
	
	I1WebGlobalization_FormatInfo.currencyDecimalDigits = _currencyDecimalDigits; 
	I1WebGlobalization_FormatInfo.currencyDecimalSeparator = _currencyDecimalSeparator; 
	I1WebGlobalization_FormatInfo.currencyGroupSeparator = _currencyGroupSeparator;
	I1WebGlobalization_FormatInfo.currencyGroupSizes = _currencyGroupSizes;
	I1WebGlobalization_FormatInfo.currencyNegativePattern = _currencyNegativePattern;
	I1WebGlobalization_FormatInfo.currencyPositivePattern = _currencyPositivePattern;
	I1WebGlobalization_FormatInfo.currencySymbol = _currencySymbol;
	
	I1WebGlobalization_FormatInfo.percentDecimalDigits = _percentDecimalDigits; 
	I1WebGlobalization_FormatInfo.percentDecimalSeparator = _percentDecimalSeparator; 
	I1WebGlobalization_FormatInfo.percentGroupSeparator = _percentGroupSeparator;
	I1WebGlobalization_FormatInfo.percentGroupSizes = _percentGroupSizes;
	I1WebGlobalization_FormatInfo.percentNegativePattern = _percentNegativePattern;
	I1WebGlobalization_FormatInfo.percentPositivePattern = _percentPositivePattern;
	I1WebGlobalization_FormatInfo.percentSymbol = _percentSymbol;
	
	I1WebGlobalization_FormatInfo.numberDecimalDigits = _numberDecimalDigits; 
	I1WebGlobalization_FormatInfo.numberDecimalSeparator = _numberDecimalSeparator; 
	I1WebGlobalization_FormatInfo.numberGroupSeparator = _numberGroupSeparator;
	I1WebGlobalization_FormatInfo.numberGroupSizes = _numberGroupSizes;
	I1WebGlobalization_FormatInfo.numberNegativePattern = _numberNegativePattern;
	
	I1WebGlobalization_FormatInfo.amDesignator = _amDesignator;
	I1WebGlobalization_FormatInfo.dateSeparator = _dateSeparator;
	I1WebGlobalization_FormatInfo.fullDateTimePattern = _fullDateTimePattern;
	I1WebGlobalization_FormatInfo.longDatePattern = _longDatePattern;
	I1WebGlobalization_FormatInfo.longTimePattern = _longTimePattern;
	I1WebGlobalization_FormatInfo.monthDayPattern = _monthDayPattern;
	I1WebGlobalization_FormatInfo.pmDesignator = _pmDesignator;
	I1WebGlobalization_FormatInfo.rfc1123Pattern = _rfc1123Pattern;
	I1WebGlobalization_FormatInfo.shortDatePattern = _shortDatePattern;
	I1WebGlobalization_FormatInfo.sortableDateTimePattern = _sortableDateTimePattern;
	I1WebGlobalization_FormatInfo.timeSeparator = _timeSeparator;
	I1WebGlobalization_FormatInfo.universalSortableDateTimePattern = _universalSortableDateTimePattern;
	I1WebGlobalization_FormatInfo.yearMonthPattern = _yearMonthPattern;
	I1WebGlobalization_FormatInfo.abbreviatedDayNames = _abbreviatedDayNames;
	I1WebGlobalization_FormatInfo.shortestDayNames = _shortestDayNames;
	I1WebGlobalization_FormatInfo.dayNames = _dayNames;
	I1WebGlobalization_FormatInfo.abbreviatedMonthNames = _abbreviatedMonthNames;
	I1WebGlobalization_FormatInfo.monthNames = _monthNames;
	I1WebGlobalization_FormatInfo.nativeCalendarName = _nativeCalendarName;
	I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveNames = _abbreviatedMonthGenitiveNames;
	I1WebGlobalization_FormatInfo.monthGenitiveNames = _monthGenitiveNames;
	I1WebGlobalization_FormatInfo.shortTimePattern = _shortTimePattern;
	I1WebGlobalization_FormatInfo.timeZoneOffset = _timeZoneOffset;
	I1WebGlobalization_FormatInfo.abbreviatedDayInvariantNames = _abbreviatedDayInvariantNames;
	I1WebGlobalization_FormatInfo.shortestDayInvariantNames = _shortestDayInvariantNames;
	I1WebGlobalization_FormatInfo.dayInvariantNames = _dayInvariantNames;
	I1WebGlobalization_FormatInfo.abbreviatedMonthInvariantNames = _abbreviatedMonthInvariantNames;
	I1WebGlobalization_FormatInfo.monthInvariantNames = _monthInvariantNames;
	I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveInvariantNames = _abbreviatedMonthGenitiveInvariantNames;
	I1WebGlobalization_FormatInfo.monthGenitiveInvariantNames = _monthGenitiveInvariantNames;
}

function I1WebGlobalization_FormatNumber(num, actualFormat, defaultStr, preventRounding)
{
	if (isNaN(num) == true || typeof(num) != 'number') return defaultStr;
	
	var formatRx = /^([cpng])(\d+)?$/i;
	
	if (!formatRx.exec(actualFormat)) return defaultStr;
	
	var formatChar = RegExp.$1.toLowerCase();
	var explicitDecimalDigits = null;
	
	if (RegExp.$2 != '')
	{
		explicitDecimalDigits = parseInt(RegExp.$2);
	}

	var decimalDigits;
	var decimalSeparator;
	var groupSeparator;
	var groupSizes;
	
	// Determine format
	switch (formatChar)
	{
		case 'c':
			decimalDigits = I1WebGlobalization_FormatInfo.currencyDecimalDigits;
			decimalSeparator = I1WebGlobalization_FormatInfo.currencyDecimalSeparator;
			groupSeparator = I1WebGlobalization_FormatInfo.currencyGroupSeparator;
			groupSizes = I1WebGlobalization_FormatInfo.currencyGroupSizes;
			break;
		case 'n':
			decimalDigits = I1WebGlobalization_FormatInfo.numberDecimalDigits;
			decimalSeparator = I1WebGlobalization_FormatInfo.numberDecimalSeparator;
			groupSeparator = I1WebGlobalization_FormatInfo.numberGroupSeparator;
			groupSizes = I1WebGlobalization_FormatInfo.numberGroupSizes;
			break;
		case 'g':
			decimalDigits = I1WebGlobalization_FormatInfo.numberDecimalDigits;
			decimalSeparator = I1WebGlobalization_FormatInfo.numberDecimalSeparator;
			groupSeparator = I1WebGlobalization_FormatInfo.numberGroupSeparator;
			groupSizes = I1WebGlobalization_FormatInfo.numberGroupSizes;
			break;
		case 'p':
			decimalDigits = I1WebGlobalization_FormatInfo.percentDecimalDigits;
			decimalSeparator = I1WebGlobalization_FormatInfo.percentDecimalSeparator;
			groupSeparator = I1WebGlobalization_FormatInfo.percentGroupSeparator;
			groupSizes = I1WebGlobalization_FormatInfo.percentGroupSizes;
			break;
	}	
	
	if (explicitDecimalDigits != null)
	{
		decimalDigits = explicitDecimalDigits;
	}
	
	var isNegative = (num < 0) ? true : false;
	var absNum = Math.abs(num);
	
	var decimalLeft = Math.floor(absNum);
	var decimalRight;

	if (preventRounding == true || (formatChar == 'g' && explicitDecimalDigits == false))
	{
		// For general format, unless the decimal digits are explicitly
		// specified in the format string, do not round.
		// The same applies if preventRounding is true.

		// This is to prevent floating point rounding errors.
		var correctPrecision = (absNum == decimalLeft) ? 0 : (num.toString().length - num.toString().lastIndexOf('.') - 1);
		
		decimalRight = (absNum - decimalLeft).toFixed(correctPrecision).toString().replace(/^0?\./g, '');
	}
	else
	{
		// Otherwise, round.
		if (decimalDigits == 0)
		{
			decimalRight = 0;
		}
		else
		{
			decimalRight = (absNum - decimalLeft).toFixed(decimalDigits);
		}
	}
	
	var leftStr = decimalLeft.toString();
	var rightStr = decimalRight == 0 ? '' : decimalRight.toString().replace(/^0?\./, '');
	
	if (formatChar == 'g' && explicitDecimalDigits == null)
	{
		// For general format, unless the decimal digits are explicitly
		// specified in the format string, eliminate all extra zeros.
		// The same applies if preventRounding is true.
		rightStr = rightStr.replace(/0+$/g, '');
	}
	else
	{
		// Pad after decimal point.
		while (rightStr.length < decimalDigits)
		{
			rightStr = rightStr + '0';
		}
	}
	
	// Group
	if (formatChar != 'g' && groupSeparator != '' && groupSizes.length > 0)
	{
		var i = 0;
		var sourceStr = leftStr;
		var leftStr = '';
		
		while (true)
		{
			var groupSize = groupSizes[i];
			
			if (groupSize == 0 || sourceStr.length <= groupSize)
			{
				leftStr = sourceStr + leftStr;
				break;
			}
			else
			{
				leftStr = groupSeparator + sourceStr.substr(sourceStr.length - groupSize, groupSize) + leftStr;
				sourceStr = sourceStr.substr(0, sourceStr.length - groupSize);
			}
			
			if (i < (groupSizes.length - 1))
			{
				i++;
			}
		}
	}
	
	// Decimal point
	var absStr;
	
	if (rightStr != '')
	{
		absStr = leftStr + decimalSeparator + rightStr;
	}
	else
	{
		absStr = leftStr;
	}
	
	switch (formatChar)
	{
		case 'c':
			return I1WebGlobalization_DecorateCurrency(absStr, isNegative, 
				isNegative ? I1WebGlobalization_FormatInfo.currencyNegativePattern : I1WebGlobalization_FormatInfo.currencyPositivePattern,
				I1WebGlobalization_FormatInfo.currencySymbol);
		case 'n':
			return I1WebGlobalization_DecorateNumber(absStr, isNegative, 
				isNegative ? I1WebGlobalization_FormatInfo.numberNegativePattern : 0);
		case 'g':
			return I1WebGlobalization_DecorateNumber(absStr, isNegative, isNegative ? 1 : 0);
		case 'p':
			return I1WebGlobalization_DecoratePercent(absStr, isNegative, 
				isNegative ? I1WebGlobalization_FormatInfo.percentNegativePattern : I1WebGlobalization_FormatInfo.percentPositivePattern,
				I1WebGlobalization_FormatInfo.percentSymbol);
	}	
	
	return defaultStr;
}

// Decorates the output of I1WebGlobalization_FormatAbsNumber()
// into a currency string.
function I1WebGlobalization_DecorateCurrency(formattedNum, isNegative, pattern, symbol)
{
	if (isNegative)
	{
		switch (pattern)
		{
			case 0: // ($n)
				return '(' + symbol + formattedNum + ')';
			case 1: // -$n
				return '-' + symbol + formattedNum;
			case 2: // $-n
				return symbol + '-' + formattedNum;
			case 3: // $n-
				return symbol + formattedNum + '-';
			case 4: // (n$)
				return '(' + formattedNum + symbol + ')';
			case 5: // -n$
				return '-' + formattedNum + symbol;
			case 6: // n-$
				return formattedNum + '-' + symbol;
			case 7: // n$-
				return formattedNum + symbol + '-';
			case 8: // -n $
				return '-' + formattedNum + ' ' + symbol;
			case 9: // -$ n
				return '-' + symbol + ' ' + formattedNum;
			case 10: // n $-
				return formattedNum + ' ' + symbol + '-';
			case 11: // $ n-
				return symbol + ' ' + formattedNum + '-';
			case 12: // $ -n
				return symbol + ' -' + formattedNum;
			case 13: // n- $
				return formattedNum + '- ' + symbol;
			case 14: // ($ n)
				return '(' + symbol + ' ' + formattedNum + ')';
			case 15: // (n $)
				return '(' + formattedNum + ' ' + symbol + ')';
		}
	}
	else // Positive
	{
		switch (pattern)
		{
			case 0: // $n
				return symbol + formattedNum;
			case 1: // n$
				return formattedNum + symbol;
			case 2: // $ n
				return symbol + ' ' + formattedNum;
			case 3: // n $
				return formattedNum + ' ' + symbol;
		}	
	}
	
	// undefined is deliberately returned
	// in case the pattern is not recognized.
}

// Decorates the output of I1WebGlobalization_FormatAbsNumber()
// into a percent string.
function I1WebGlobalization_DecoratePercent(formattedNum, isNegative, pattern, symbol)
{
	if (isNegative)
	{
		switch (pattern)
		{
			case 0: // -n %
				return '-' + formattedNum + ' ' + symbol;
			case 1: // -n%
				return '-' + formattedNum + symbol;
			case 2: // -%n
				return '-' + symbol + formattedNum;
		}
	}
	else // Positive
	{
		switch (pattern)
		{
			case 0: // n %
				return formattedNum + ' ' + symbol;
			case 1: // n%
				return formattedNum + symbol;
			case 2: // %n
				return symbol + formattedNum;
		}
	}
	
	// undefined is deliberately returned
	// in case the pattern is not recognized.
}

// Decorates the output of I1WebGlobalization_FormatAbsNumber()
// into a decimal number string.
function I1WebGlobalization_DecorateNumber(formattedNum, isNegative, pattern)
{
	if (isNegative)
	{
		switch (pattern)
		{
			case 0: // (n)
				return '(' + formattedNum + ')';
			case 1: // -n
				return '-' + formattedNum;
			case 2: // - n
				return '- ' + formattedNum;
			case 3: // n-
				return formattedNum + '-';
			case 4: // n -
				return formattedNum + ' -';
		}
	}
	else
	{
		return formattedNum;
	}

	// undefined is deliberately returned
	// in case the pattern is not recognized.
}

// Currently, we only handle the Gregorian calendar.
function I1WebGlobalization_FormatDateTime(dateTime, format, parseAsInvariant)
{
	var actualDateTime = null;
	
	if (typeof(dateTime) == 'string')
	{
		actualDateTime = I1WebGlobalization_ParseDateTime(dateTime, parseAsInvariant);
	}
	else if (typeof(dateTime) != 'undefined' && dateTime != null && dateTime.getDate)
	{
		actualDateTime = dateTime;
	}
	
	if (actualDateTime == null)
	{
		return null; // Not a valid date/time to format.
	}
	
	var year = actualDateTime.getFullYear();
	var month = actualDateTime.getMonth();
	var date = actualDateTime.getDate();
	var hours = actualDateTime.getHours();
	var minutes = actualDateTime.getMinutes();
	var seconds = actualDateTime.getSeconds();
	var milliSeconds = actualDateTime.getMilliseconds();
	var day = actualDateTime.getDay();
	var actualFormat;
	var _abbreviatedDayNames = I1WebGlobalization_FormatInfo.abbreviatedDayNames;
	var _shortestDayNames = I1WebGlobalization_FormatInfo.shortestDayNames;
	var _dayNames = I1WebGlobalization_FormatInfo.dayNames;
	var _abbreviatedMonthNames = I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveNames;
	var _monthNames = I1WebGlobalization_FormatInfo.monthGenitiveNames;
	var _abbreviatedMonthGenitiveNames = I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveNames;
	var _monthGenitiveNames = I1WebGlobalization_FormatInfo.monthGenitiveNames;

	// Standard Patterns
	switch (format)
	{
		case 'd':
			actualFormat = I1WebGlobalization_FormatInfo.shortDatePattern;
			break;
		case 'D':
			actualFormat = I1WebGlobalization_FormatInfo.longDatePattern;
			break;
		case 'f':
			actualFormat = I1WebGlobalization_FormatInfo.longDatePattern + ' ' + I1WebGlobalization_FormatInfo.shortTimePattern;
			break;
		case 'F':
			actualFormat = I1WebGlobalization_FormatInfo.fullDateTimePattern;
			break;
		case 'g':
			actualFormat = I1WebGlobalization_FormatInfo.shortDatePattern + ' ' + I1WebGlobalization_FormatInfo.shortTimePattern;
			break;
		case 'G':
			actualFormat = I1WebGlobalization_FormatInfo.shortDatePattern + ' ' + I1WebGlobalization_FormatInfo.longTimePattern;
			break;
		case 'm':
			actualFormat = I1WebGlobalization_FormatInfo.monthDayPattern;
			break;
		case 'M':
			actualFormat = I1WebGlobalization_FormatInfo.monthDayPattern;
			break;
		case 'r':
			actualFormat = I1WebGlobalization_FormatInfo.rfc1123Pattern;
			_abbreviatedDayNames = I1WebGlobalization_FormatInfo.abbreviatedDayInvariantNames;
			_shortestDayNames = I1WebGlobalization_FormatInfo.shortestDayInvariantNames;
			_dayNames = I1WebGlobalization_FormatInfo.dayInvariantNames;
			_abbreviatedMonthNames = I1WebGlobalization_FormatInfo.abbreviatedMonthInvariantNames;
			_monthNames = I1WebGlobalization_FormatInfo.monthInvariantNames;
			_abbreviatedMonthGenitiveNames = I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveInvariantNames;
			_monthGenitiveNames = I1WebGlobalization_FormatInfo.monthGenitiveInvariantNames;
			break;
		case 'R':
			actualFormat = I1WebGlobalization_FormatInfo.rfc1123Pattern;
			_abbreviatedDayNames = I1WebGlobalization_FormatInfo.abbreviatedDayInvariantNames;
			_shortestDayNames = I1WebGlobalization_FormatInfo.shortestDayInvariantNames;
			_dayNames = I1WebGlobalization_FormatInfo.dayInvariantNames;
			_abbreviatedMonthNames = I1WebGlobalization_FormatInfo.abbreviatedMonthInvariantNames;
			_monthNames = I1WebGlobalization_FormatInfo.monthInvariantNames;
			_abbreviatedMonthGenitiveNames = I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveInvariantNames;
			_monthGenitiveNames = I1WebGlobalization_FormatInfo.monthGenitiveInvariantNames;
			break;
		case 's':
			actualFormat = I1WebGlobalization_FormatInfo.sortableDateTimePattern;
			break;
		case 't':
			actualFormat = I1WebGlobalization_FormatInfo.shortTimePattern;
			break;
		case 'T':
			actualFormat = I1WebGlobalization_FormatInfo.longTimePattern;
			break;
		case 'u':
			actualFormat = I1WebGlobalization_FormatInfo.universalSortableDateTimePattern;
			break;
		case 'U':
			actualFormat = I1WebGlobalization_FormatInfo.fullDateTimePattern;
			year = actualDateTime.getUTCFullYear();
			month = actualDateTime.getUTCMonth();
			date = actualDateTime.getUTCDate();
			day = actualDateTime.getUTCDay();
			hours = actualDateTime.getUTCHours();
			minutes = actualDateTime.getUTCMinutes();
			seconds = actualDateTime.getUTCSeconds();
			milliSeconds = actualDateTime.getUTCMilliseconds();
			break;
		case 'y':
			actualFormat = I1WebGlobalization_FormatInfo.yearMonthPattern;
			break;
		case 'Y':
			actualFormat = I1WebGlobalization_FormatInfo.yearMonthPattern;
			break;
		default:
			actualFormat = format;
			break;
	}	
	
	var ampm = hours >= 0 && hours < 12 ? I1WebGlobalization_FormatInfo.amDesignator : I1WebGlobalization_FormatInfo.pmDesignator;
	
	// Specific Patterns
	var output = actualFormat;
	var replacementResult;

	// Date/day
	replacementResult = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?d\b/g, I1WebGlobalization_PadNumber(date, 1));	
	hasDates = replacementResult[1] > 0;
	output = replacementResult[0];
	replacementResult = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bdd\b/g, I1WebGlobalization_PadNumber(date, 2));	
	hasDates = replacementResult[1] > 0;
	output = replacementResult[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bddd\b/g, _abbreviatedDayNames[day])[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bdddd\b/g, _dayNames[day])[0];	

	// Month
	var hasDates = false;
	var formatComponents = I1WebGlobalization_GetDateTimeFormatComponents(actualFormat);
	for (var i = 0; i < formatComponents.length; i++)
	{
		if (formatComponents[i] == 'date')
		{
			hasDates = true;
			break;
		}
	}
	if (hasDates == false)
	{
		// The genitive case only applies when the date is expressed.
		// If the date is not expressed--use nominative.
		_abbreviatedMonthNames = I1WebGlobalization_FormatInfo.abbreviatedMonthNames;
		_monthNames = I1WebGlobalization_FormatInfo.monthNames;
	}
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?M\b/g, I1WebGlobalization_PadNumber(month + 1, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bMM\b/g, I1WebGlobalization_PadNumber(month + 1, 2))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bMMM\b/g, _abbreviatedMonthNames[month])[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bMMMM\b/g, _monthNames[month])[0];	

	// Year
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?y\b/g, I1WebGlobalization_PadNumber(year, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\byy\b/g, I1WebGlobalization_PadNumber(year, 2))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\byyyy\b/g, I1WebGlobalization_PadNumber(year, 4))[0];	
	
	// Era (gg) - currently ignored
	
	// 12-Hour
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?h\b/g, I1WebGlobalization_PadNumber(hours <= 12 ? hours : Math.abs(hours - 12), 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bhh\b/g, I1WebGlobalization_PadNumber(hours <= 12 ? hours : Math.abs(hours - 12), 2))[0];	
	
	// 24-Hour
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?H\b/g, I1WebGlobalization_PadNumber(hours, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bHH\b/g, I1WebGlobalization_PadNumber(hours, 2))[0];	
	
	// Minute
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?m\b/g, I1WebGlobalization_PadNumber(minutes, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bmm\b/g, I1WebGlobalization_PadNumber(minutes, 2))[0];	
	
	// Second
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?s\b/g, I1WebGlobalization_PadNumber(seconds, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bss\b/g, I1WebGlobalization_PadNumber(seconds, 2))[0];	
	
	// MS - Truncated and padded
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?f\b/g, I1WebGlobalization_TruncAndPad(seconds, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bff\b/g, I1WebGlobalization_TruncAndPad(seconds, 2))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bfff\b/g, I1WebGlobalization_TruncAndPad(seconds, 3))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bffff\b/g, I1WebGlobalization_TruncAndPad(seconds, 4))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bfffff\b/g, I1WebGlobalization_TruncAndPad(seconds, 5))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bffffff\b/g, I1WebGlobalization_TruncAndPad(seconds, 6))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bfffffff\b/g, I1WebGlobalization_TruncAndPad(seconds, 7))[0];
	
	// MS - Truncated but not padded
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?F\b/g, I1WebGlobalization_TruncOnly(seconds, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFF\b/g, I1WebGlobalization_TruncOnly(seconds, 2))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFFF\b/g, I1WebGlobalization_TruncOnly(seconds, 3))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFFFF\b/g, I1WebGlobalization_TruncOnly(seconds, 4))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFFFFF\b/g, I1WebGlobalization_TruncOnly(seconds, 5))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFFFFFF\b/g, I1WebGlobalization_TruncOnly(seconds, 6))[0];
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\bFFFFFFF\b/g, I1WebGlobalization_TruncOnly(seconds, 7))[0];
	
	// AM/PM
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\b%?t\b/g, ampm.substr(0, 1))[0];	
	output = I1WebGlobalization_ReplaceInDateTimeFormat(output, /\btt\b/g, ampm)[0];
	
	// zz and zzzz ignored.
	
	// Strip out the quotes which encapsulate literals in the formatting string.
	output = output.replace(/'/g, '');

	return new Array(output, actualDateTime);
}

function I1WebGlobalization_ParseDateTime(dateTimeStr, parseAsInvariant)
{
	if (parseAsInvariant)
	{
		return new Date(Date.parse(dateTimeStr));
	}
	
	var recognizedPatterns = [
		I1WebGlobalization_FormatInfo.fullDateTimePattern, 
		I1WebGlobalization_FormatInfo.sortableDateTimePattern,
		I1WebGlobalization_FormatInfo.universalSortableDateTimePattern,
		I1WebGlobalization_FormatInfo.shortDatePattern + ' ' + I1WebGlobalization_FormatInfo.shortTimePattern,
		I1WebGlobalization_FormatInfo.shortDatePattern + ' ' + I1WebGlobalization_FormatInfo.longTimePattern,
		I1WebGlobalization_FormatInfo.longDatePattern + ' ' + I1WebGlobalization_FormatInfo.shortTimePattern,
		I1WebGlobalization_FormatInfo.longDatePattern, 
		I1WebGlobalization_FormatInfo.longTimePattern,
		I1WebGlobalization_FormatInfo.monthDayPattern,
		I1WebGlobalization_FormatInfo.yearMonthPattern,
		I1WebGlobalization_FormatInfo.shortDatePattern,
		I1WebGlobalization_FormatInfo.shortTimePattern,
		I1WebGlobalization_FormatInfo.rfc1123Pattern
	];
	
	for (var i = 0; i < recognizedPatterns.length; i++)
	{
		var components = I1WebGlobalization_GetDateTimeFormatComponents(recognizedPatterns[i]);
		var rx = new RegExp(components.rx, "g");
		
		if ((found = rx.exec(dateTimeStr)) != null)
		{
			if ((found.length - 1) == components.length)
			{
				var now = new Date();
				var date = now.getDate().toString();
				var month = (now.getMonth() + 1).toString();
				var year = now.getFullYear().toString();
				var hour = '0';
				var minute = '0';
				var second = '0';
				var ms = '0';
				var ampm = null;
				
				for (var j = 1; j <= found.length; j++)
				{
					switch (components[j - 1])
					{
						case 'date':
							date = found[j];
							break;
						case 'month':
							month = found[j];
							break;
						case 'monthName':
							month = I1WebGlobalization_GetMonthFromName(found[j]).toString();
							break;
						case 'year':
							year = found[j];
							break;
						case 'hour':	
							hour = found[j];
							break;
						case 'minute':
							minute = found[j];
							break;
						case 'second':
							second = found[j];
							break;
						case 'ms':
							ms = found[j];
							break;
						case 'ampm':
							ampm = I1WebGlobalization_GetAmpmFromLocalizedVersion(found[j]);
							break;
					}
				}
				
				// 2-digit year solution: if the number is <30, then assume this century,
				// if the numebr is >=30, then assume last century.
				// This duplicates .NET's behavior. [tchow 04/13/2006]
				var yearInt = parseInt(year.replace(/^0+/g, ''));
				if (yearInt < 30)
				{
					year = (Math.floor(new Date().getFullYear() / 100) * 100) + yearInt;
				}
				else if (yearInt <= 99)
				{
					year = ((Math.floor(new Date().getFullYear() / 100) - 1) * 100) + yearInt;
				}

                // Case 7970
	            if (!I1WebGlobalization_IsValidDate(date, month, year)) {
	                return null;  // Not valid date.
				} 
				var invariantDateStr = month + '/' + date + '/' + year + ' ' + hour + ':' + minute + ':' + second;
			
				if (ampm)
				{
					invariantDateStr += ' ' + ampm;
				}
				
				return new Date(Date.parse(invariantDateStr));
			}
		}
	}
	
	return null; // Not valid date.
}

function I1WebGlobalization_GetMonthFromName(monthName)
{
	var lowerCase = monthName.toLowerCase();
	var _monthNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.monthNames);
	var _abbreviatedMonthNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.abbreviatedMonthNames);
	var _monthGenitiveNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.monthGenitiveNames);
	var _abbreviatedMonthGenitiveNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveNames);
	var _monthInvariantNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.monthInvariantNames);
	var _abbreviatedMonthInvariantNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.abbreviatedMonthInvariantNames);
	var _monthGenitiveInvariantNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.monthGenitiveInvariantNames);
	var _abbreviatedMonthGenitiveInvariantNames = I1WebGlobalization_GetLowerCaseArray(I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveInvariantNames);
	
	for (var i = 0; i < _monthNames.length; i++)
	{
		if (_monthNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _abbreviatedMonthNames.length; i++)
	{
		if (_abbreviatedMonthNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _monthGenitiveNames.length; i++)
	{
		if (_monthGenitiveNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _abbreviatedMonthGenitiveNames.length; i++)
	{
		if (_abbreviatedMonthGenitiveNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	
	for (var i = 0; i < _monthInvariantNames.length; i++)
	{
		if (_monthInvariantNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _abbreviatedMonthInvariantNames.length; i++)
	{
		if (_abbreviatedMonthInvariantNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _monthGenitiveInvariantNames.length; i++)
	{
		if (_monthGenitiveInvariantNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
	for (var i = 0; i < _abbreviatedMonthGenitiveInvariantNames.length; i++)
	{
		if (_abbreviatedMonthGenitiveInvariantNames[i] == lowerCase)
		{
			return i + 1;
		}
	}
}

function I1WebGlobalization_GetAmpmFromLocalizedVersion(localizedAmpm)
{
	var lower = localizedAmpm.toLowerCase();
	
	if (lower == I1WebGlobalization_FormatInfo.amDesignator.toLowerCase()
		|| lower == I1WebGlobalization_FormatInfo.amDesignator.toLowerCase().substr(0, 1))
	{
		return "am";	
	}
	else if (lower == I1WebGlobalization_FormatInfo.pmDesignator.toLowerCase()
		|| lower == I1WebGlobalization_FormatInfo.pmDesignator.toLowerCase().substr(0, 1))
	{
		return "pm";	
	}
}

function I1WebGlobalization_GetLowerCaseArray(strArray)
{
	var array = new Array();
	
	for (var i = 0; i < strArray.length; i++)
	{
		array.push(strArray[i].toLowerCase());
	}
	
	return array;
}

function I1WebGlobalization_GetDateTimeFormatComponents(format)
{
	var formatComponents = new Array();
	var rx = /\b(%?d|d{2,4}|%?M|M{2,4}|%?y|yy|yyyy|%?h|hh|%?H|HH|%?m|mm|%?s|ss|%?f|f{2,7}|%?F|F{2,7}%t|tt)\b/g;
	var leftOffIndex = 0;
	var rxBuilder = '^\\s*';

	while ((found = rx.exec(format)) != null)
	{
		var match = RegExp.lastMatch;
		var index = found.index;

		if (leftOffIndex < index)
		{
			var betweenPatterns = format.slice(leftOffIndex, index).replace(/'/g, '');
			rxBuilder += I1WebGlobalization_EscapeForRx(betweenPatterns);
		}

		if (I1WebGlobalization_IsInQuote(format, index) == false)
		{
			var valueType;
			var rxComponent;
			
			if (/^%?d{1,2}$/.test(match) == true)
			{
				valueType = 'date';
				rxComponent = '(\\d{1,2})';
			}
			else if (/^dddd?$/.test(match) == true)
			{
				valueType = 'dayName';
				rxComponent = I1WebGlobalization_ConcatArrayForRx(
					I1WebGlobalization_FormatInfo.dayNames, 
					I1WebGlobalization_FormatInfo.abbreviatedDayNames, 
					I1WebGlobalization_FormatInfo.shortestDayNames,
					I1WebGlobalization_FormatInfo.dayInvariantNames, 
					I1WebGlobalization_FormatInfo.abbreviatedDayInvariantNames, 
					I1WebGlobalization_FormatInfo.shortestDayInvariantNames);
			}
			else if (/^%?M{1,2}$/.test(match) == true)
			{
				valueType = 'month';
				rxComponent = '(\\d{1,2})';
			}
			else if (/^MMMM?$/.test(match) == true)
			{
				valueType = 'monthName';
				rxComponent = I1WebGlobalization_ConcatArrayForRx(I1WebGlobalization_FormatInfo.monthNames, 
					I1WebGlobalization_FormatInfo.abbreviatedMonthNames, 
					I1WebGlobalization_FormatInfo.monthGenitiveNames, 
					I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveNames,
					I1WebGlobalization_FormatInfo.monthInvariantNames, 
					I1WebGlobalization_FormatInfo.abbreviatedMonthInvariantNames, 
					I1WebGlobalization_FormatInfo.monthGenitiveInvariantNames, 
					I1WebGlobalization_FormatInfo.abbreviatedMonthGenitiveInvariantNames);
			}
			else if (/^%?y{1,4}$/.test(match) == true)
			{
				valueType = 'year';
				rxComponent = '(\\d{1,4})';
			}
			else if (/^%?h{1,2}/i.test(match) == true)
			{
				valueType = 'hour';
				rxComponent = '(\\d{1,2})';
			}
			else if (/^%?m{1,2}$/.test(match) == true)
			{
				valueType = 'minute';
				rxComponent = '(\\d{1,2})';
			}
			else if (/^%?s{1,2}$/.test(match) == true)
			{
				valueType = 'second';
				rxComponent = '(\\d{1,2})';
			}
			else if (/^%?s{1,7}$/.test(match) == true)
			{
				valueType = 'ms';
				rxComponent = '(\\d{1,7})';
			}
			else if (/^%?t{1,2}$/.test(match) == true)
			{
				valueType = 'ampm';
				rxComponent = I1WebGlobalization_ConcatArrayForRx([I1WebGlobalization_FormatInfo.amDesignator, I1WebGlobalization_FormatInfo.pmDesignator, I1WebGlobalization_FormatInfo.amDesignator.substr(0, 1), I1WebGlobalization_FormatInfo.pmDesignator.substr(0, 1)]);
			}
			
			formatComponents.push(valueType);
		}

		rxBuilder += rxComponent;
		leftOffIndex = index + match.length;
	}

	if (leftOffIndex < format.length)
	{
		var betweenPatterns = format.slice(leftOffIndex, format.length).replace(/'/g, '');
		rxBuilder += I1WebGlobalization_EscapeForRx(betweenPatterns);
	}
	
	rxBuilder += "\\s*$";
	formatComponents.rx = rxBuilder;
	
	return formatComponents;
}

function I1WebGlobalization_EscapeForRx(literal)
{
	return literal.replace(/([\\\{\}\(\)\[\]\^\$\?\*\.])/g, '\\$1').replace(/\s+/, '\\s+').replace(/\n/, '\\n').replace(/\r/, '\\r');
}

function I1WebGlobalization_ConcatArrayForRx(arrayOfLiterals1, arrayOfLiterals2, arrayOfLiterals3, arrayOfLiterals4, 
	arrayOfLiterals5, arrayOfLiterals6, arrayOfLiterals7, arrayOfLiterals8)
{
	var str = '(';
	var arrayArray = [arrayOfLiterals1, arrayOfLiterals2, arrayOfLiterals3, arrayOfLiterals4,
		arrayOfLiterals5, arrayOfLiterals6, arrayOfLiterals7, arrayOfLiterals8];
	
	for (var j = 0; j < arrayArray.length; j++)
	{
		var array = arrayArray[j];
		
		if (typeof(array) == 'undefined') continue;

		for (var i = 0; i < array.length; i++)
		{
			if (array[i] == '') continue;
			
			if (str != '(')
			{
				str += "|";
			}
			str += I1WebGlobalization_EscapeForRx(array[i]);
		}
	}
	
	str += ")";
	
	return str;
}

function I1WebGlobalization_PadNumber(number, minDigits)
{
	var str = number.toString();
	var missingDigits = minDigits - str.length;
	
	for (var i = 0; i < missingDigits; i++)
	{
		str = '0' + str;
	}
	
	return str;
}

function I1WebGlobalization_TruncAndPad(number, numDigits)
{
	var str = I1WebGlobalization_TruncOnly(number, numDigits);
	
	if (str.length < numDigits)
	{
		var missingDigits = numDigits - str.length;
		
		for (var i = 0; i < missingDigits; i++)
		{
			str = str + '0';
		}
	}
	
	return str;
}

function I1WebGlobalization_IsInQuote(str, charIndex)
{
	var quoteCount = 0;
	var substrVal = str.substr(0, charIndex);
	var rx = /'/g;
	
	while (rx.exec(substrVal) != null)
	{
		quoteCount++;
	}
	
	if (quoteCount % 2 != 0)
	{
		// Odd number of quotation marks--in quote.
		return true;
	}
	else
	{
		return false;
	}
}
 
// The regular expression here must have the global (g) flag turned on.
// Returns a 2-element array: the resulting string, and the the number of 
// replacements made.
function I1WebGlobalization_ReplaceInDateTimeFormat(format, rx, replacement)
{
	var str = '';
	var prevIndex;
	var count = 0;
	
	while ((found = rx.exec(format)) != null)
	{
		var lastMatchVar = RegExp.lastMatch;
		// Must not replace anything in quote.
		if (I1WebGlobalization_IsInQuote(format, found.index) == false)
		{
			// Not in quote, replace
			str += format.slice(prevIndex, found.index) + replacement;
			prevIndex = found.index + lastMatchVar.length;
			count++;
		}
	}
	
	str = str + format.slice(prevIndex);
	
	return [str, count];
}

function I1WebGlobalization_TruncOnly(number, numDigits)
{
	var str = number.toString();
	
	if (str.length > numDigits)
	{
		str = str.substr(0, numDigits);
	}
	
	// Strip out trailing zeros.
	str = str.replace(/0+$/g, '');
	
	return str;
}

/// Case 7970
/// Based on  
/// JavaScript Date Validation
/// By Ed Nutting,  29 Nov 2012 
/// www.codeproject.com
function I1WebGlobalization_IsValidDate(Day, Month, Year) {
    var OK = true;
   
    try {
            if (OK = (Month <= 12 && Month >= 1)) 
            {
                var LeapYear = (((Year % 4) == 0) && ((Year % 100) != 0) || ((Year % 400) == 0));

                if (OK = Day > 0) 
                {
                    if (Month == 2) 
                    {
                        OK = LeapYear ? Day <= 29 : Day <= 28;
                    }
                    else 
                    {

                        if ((Month == 4) || (Month == 6) || (Month == 9) || (Month == 11)) 
                        {
                            OK = Day <= 30;
                        }
                        else 
                        {
                            OK = Day <= 31;
                        }
                    }
                }
            }
        
        
        return OK;
    }
    catch (e) {
        return false;
    }

}