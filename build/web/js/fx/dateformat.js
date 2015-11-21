// JavaScript Document
var d = new Date();

function getLongDays(lang)
{
	var lang;	
		
	if(lang == "en")
	{
		var weekday=new Array(7);
		weekday[0]="Sunday";
		weekday[1]="Monday";
		weekday[2]="Tuesday";
		weekday[3]="Wednesday";
		weekday[4]="Thursday";
		weekday[5]="Friday";
		weekday[6]="Saturday";
	}
	else if(lang == "id")
	{
		var weekday=new Array(7);
		weekday[0]="Minggu";
		weekday[1]="Senin";
		weekday[2]="Selasa";
		weekday[3]="Rabu";
		weekday[4]="Kamis";
		weekday[5]="Jumat";
		weekday[6]="Sabtu";
	}
	
	return weekday[d.getDay()];
}

function getNowDates()
{
	var nd = d.getDate();
	if(nd < 10)
	{
		nd = "0" + nd;
	}
	return nd;
}

function getNowMonths()
{
	var nm = d.getMonth();
	nm = parseInt(nm + 1);
	if(nm < 10)
	{
		nm = "0" + nm;
	}
	return nm;
}

function getLongMonths(lang)
{
	var lang;
	var lm = d.getMonth();
	
	if(lang == "en")
	{
		var month = new Array(12);
		month[0]="January";
		month[1]="February";
		month[2]="March";
		month[3]="April";
		month[4]="May";
		month[5]="June";
		month[6]="July";
		month[7]="August";
		month[8]="September";
		month[9]="October";
		month[10]="November";
		month[11]="December";
	}
	else if(lang == "id")
	{
		var month = new Array(12);
		month[0]="Januari";
		month[1]="Februari";
		month[2]="Maret";
		month[3]="April";
		month[4]="Mei";
		month[5]="Juni";
		month[6]="Juli";
		month[7]="Agustus";
		month[8]="September";
		month[9]="Oktober";
		month[10]="November";
		month[11]="Desember";
	}
	
	return month[lm];
}

function getShortMonths(lang)
{
	var lang;
	var sm = getLongMonths(lang);
	sm = sm.substr(0,3);
	return sm;
}

function getNowYears()
{
	var y = d.getFullYear();
	return y;
}

function getNowHours()
{
	var h = d.getHours();
	if(h < 10)
	{
		h = "0" + h;
	}
	return h;
}

function getNowMinutes()
{
	var m = d.getMinutes();
	if(m < 10)
	{
		m = "0" + m;
	}
	return m;
}

function getNowSeconds()
{
	var s = d.getSeconds();
	if(s < 10)
	{
		s = "0" + s;
	}
	return s;
}

function getNowMeridiems()
{
	var m = getNowHours();
	if(m > 1 && m < 12)
	{
		m = "AM";
	}
	else
	{
		m = "PM";
	}
	return m;
}

function showNowTime(lang)
{
	var lang;
	var t = getLongDays(lang) + ", " + getNowDates() + " " + getLongMonths(lang) + " " + getNowYears() + " - " + getNowHours() + ":" + getNowMinutes() + ":" + getNowSeconds() + " " + getNowMeridiems();
	
	return t;
}

function showCalculateTime()
{
	var ct = getNowYears() + "" + getNowMonths() + "" + getNowDates() + "" + getNowHours() + "" + getNowMinutes() + "" + getNowSeconds() + "";
	return ct;
}