// JavaScript Document

function getYoutubeVideoID(youtube_VideoURL)
{
	var url = null;
	url = youtube_VideoURL;
	url = url.split("/");
	url = url[3];
	url = url.replace("watch?v=","");
	url = url.split("&");
	url = url[0];
	
	return url;
	
	url = null; youtube_VideoURL = null;
}

function showVideoYoutube(youtube_VideoURL,width,height,autoplay)
{
	if(youtube_VideoURL != "")
	{
		var url = null;
		url = getYoutubeVideoID(youtube_VideoURL);

		if(width == "") { width = parseInt(560); }
		if(height == "") { height = parseInt(315); }
		
		if(autoplay == "" || autoplay == false || autoplay == 0) { autoplay = ""; }
		else if(autoplay == true || autoplay == 1) { autoplay = "?autoplay=1"; }
		
		return "<iframe width='" + width + "' height='" + height + "' src='http://www.youtube.com/embed/" + url + autoplay + "' frameborder='0' allowfullscreen></iframe>";
		
		url = null; youtube_VideoURL = null; height = null; width = null; autoplay = null;	
	}
}