// JavaScript POP UP

/* 
   HOW TO USE ::::::::::
   
   Example:
   <a href="http://www.ahmbcode.com/" onclick="openPopup(this.href,'data1','400','300','center','center'); return false;">Open Website</a>
*/

function openPopup(url,name,width,height,move_to_x,move_to_y)
{
	if(name == "") { name = "popup"; }
	if(width == "") { width = parseInt(550); } else { width = parseInt(width); }
	if(height == "") { height = parseInt(400); } else { height = parseInt(height); }
	if(move_to_x == "" || move_to_x == "center") { move_to_x = parseInt(parseInt(parseInt(window.innerWidth) - parseInt(parseInt(window.innerWidth + width) / parseInt(2)))); } else { move_to_x = parseInt(move_to_x); }
	if(move_to_y == "" || move_to_y == "center") { move_to_y = parseInt(parseInt(parseInt(window.outerHeight) - parseInt(parseInt(window.outerHeight + height) / parseInt(2)))); } else { move_to_y = parseInt(move_to_y); }

    mywindow = window.open(url,"mywindow" + name, "location=1,status=1,scrollbars=1,width=" + parseInt(width) + ",height=" + parseInt(height) + "");
    mywindow.moveTo(parseInt(move_to_x),parseInt(move_to_y));
	
	url = ''; name = ''; width = ''; height = ''; move_to_x = ''; move_to_y = '';
	return false;
}

function shareFB(url,uniqueId)
{
	openPopup(url,'shareFB_','700','500','center','center');
	return false;
	url = '';
}

function shareTW(url,uniqueId)
{
	openPopup(unescape(url),'shareTW_' + uniqueId,'700','500','center','center');
	return false;
	url = '';
}

function shareGP(url,uniqueId)
{
	openPopup(unescape(url),'shareGP' + uniqueId,'700','500','center','center');
	return false;
	url = ''; uniqueId = '';
}