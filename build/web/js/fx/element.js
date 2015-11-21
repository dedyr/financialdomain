// Require JQuery

function setSpeechElement(more_elementsId,status)
{
	var status;
	if(status == null) { status = true; }
	
	var index = more_elementsId;
	index = index.split(",");
	for(i = 0; i < parseInt(index.length); i++)
	{
		if(index[i] != null)
		{
			if(status == true || status == 1)
			{
				$("#" + index[i]).attr("speech","speech");
				$("#" + index[i]).attr("x-webkit-speech","x-webkit-speech");
			}
			else
			{
				$("#" + index[i]).removeAttr("speech");
				$("#" + index[i]).removeAttr("x-webkit-speech");
			}
		}
	}
	data = null; i = null; index = null; status = null;
}

function setReadOnlyElement(more_elementsId,status)
{
	var status;
	if(status == null) { status = true; }
	
	var index = more_elementsId;
	index = index.split(",");
	for(i = 0; i < parseInt(index.length); i++)
	{
		if(index[i] != null)
		{
			if(status == true || status == 1)
			{
				$("#" + index[i]).attr("readonly","readonly");
			}
			else
			{
				$("#" + index[i]).removeAttr("readonly");
			}
		}
	}
	
	data = null; i = null; index = null; status = null;
}