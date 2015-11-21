/* 
	-----------------------------------------------------
	AHMB Code JS Framework
	-----------------------------------------------------
	Author   : 	Fariz Fadian
	Website  :	www.farizfadian.com
				www.ahmbcode.com
	-----------------------------------------------------
*/

function getNumber(number) {
	number = String(number);
	var len = number.split(".");
	for(i = 0; i < len.length; i++) {
		try { number = number.replace('Rp. ','').replace(',-','').replace('.','').replace(' ',''); }
		catch(e){}
		
		try {
			number = number.replace('.','').replace('.','').replace('.','').replace('.','').replace('.','').replace('(','').replace(')','').replace(' ','');
		}
		catch(e){}
	}
	return number;
}

function formatNumber(symbol,number,decimal_places)
{
	var symbol = String(symbol);
	var number = String(number);

	try { number = number.replace(symbol,'').replace(decimal_places,'').replace('.','').replace(' ',''); }
	catch(e){}
	
	try {
		number = number.replace('.','').replace('.','').replace('.','').replace('.','').replace('.','').replace('(','').replace(')','').replace(' ','');
	}
	catch(e){}
	
	var old_number = parseInt(number);
	
	var decimal_places = String(decimal_places);
	var format = String("");
	
	var number_length = parseInt(number.length);
	
	if(number_length == 1)
	{
		format = number;
	}
	
	else if(number_length == 2)
	{
		format = number;
	}
	
	else if(number_length == 3)
	{
		format = number;
	}
	
	else if(number_length == 4)
	{
		format = number.substr(0,1) + "." + number.substr(1,3);
	}
	
	else if(number_length == 5)
	{
		format = number.substr(0,2) + "." + number.substr(2,3);
	}
	
	else if(number_length == 6)
	{
		format = number.substr(0,3) + "." + number.substr(3,3);
	}
	
	else if(number_length == 7)
	{
		format = number.substr(0,1) + "." + number.substr(1,3) + "." + number.substr(4,3);
	}
	
	else if(number_length == 8)
	{
		format = number.substr(0,2) + "." + number.substr(2,3) + "." + number.substr(5,3);
	}
	
	else if(number_length == 9)
	{
		format = number.substr(0,3) + "." + number.substr(3,3) + "." + number.substr(6,3);
	}
	
	else if(number_length == 10)
	{
		format = number.substr(0,1) + "." + number.substr(1,3) + "." + number.substr(4,3) + "." + number.substr(7,3);
	}
	
	else if(number_length == 11)
	{
		format = number.substr(0,2) + "." + number.substr(2,3) + "." + number.substr(5,3) + "." + number.substr(8,3);
	}
	
	else if(number_length == 12)
	{
		format = number.substr(0,3) + "." + number.substr(3,3) + "." + number.substr(6,3) + "." + number.substr(9,3);
	}
	
	else if(number_length == 13)
	{
		format = number.substr(0,1) + "." + number.substr(1,3) + "." + number.substr(4,3) + "." + number.substr(7,3) + "." + number.substr(10,3);
	}
	
	else if(number_length == 14)
	{
		format = number.substr(0,2) + "." + number.substr(2,3) + "." + number.substr(5,3) + "." + number.substr(8,3) + "." + number.substr(11,3);
	}
	
	else if(number_length == 15)
	{
		format = number.substr(0,3) + "." + number.substr(3,3) + "." + number.substr(6,3) + "." + number.substr(9,3) + "." + number.substr(12,3);
	}
	
	else if(number_length == 16)
	{
		format = number.substr(0,1) + "." + number.substr(1,3) + "." + number.substr(4,3) + "." + number.substr(7,3) + "." + number.substr(10,3) + "." + number.substr(13,3);
	}
	
	else if(number_length == 17)
	{
		format = number.substr(0,2) + "." + number.substr(2,3) + "." + number.substr(5,3) + "." + number.substr(8,3) + "." + number.substr(11,3) + "." + number.substr(14,3);
	}
	
	else if(number_length == 18)
	{
		format = number.substr(0,3) + "." + number.substr(3,3) + "." + number.substr(6,3) + "." + number.substr(9,3) + "." + number.substr(12,3) + "." + number.substr(15,3);
	}
	
	else if(number_length == 19)
	{
		format = number.substr(0,1) + "." + number.substr(1,3) + "." + number.substr(4,3) + "." + number.substr(7,3) + "." + number.substr(10,3) + "." + number.substr(13,3) + "." + number.substr(16,3);
	}
	
	else if(number_length >= 20)
	{
		format = "NOT INDEX";
	}
	
	number_length = null;
	
	format = format.replace('-.','').replace('--','-');
	
	if(format != '')
	{
		if(old_number < 0)
		{
			return symbol + '-' + format.replace('-','') + decimal_places;
		}
		else {
			return symbol + format + decimal_places;
		}
	}
	else
	{
		return '';
	}
	
	symbol = null;
	format = null;
	number = null;
	decimal_places = null;
	number_length = null;
	old_number = null;
}