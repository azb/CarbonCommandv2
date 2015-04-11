//Get your HEX colours at http://www.colorpicker.com
var colourBackground = "#3796E3";					//This is your base colour
var colourText = shadeColor('#3796E3',70);			//This is calculated from your base colour (but can be a custom HEX)
var colourLoadingBack = shadeColor('#3796E3',-10);	//This is calculated from your base colour (but can be a custom HEX)
var colourLoadingFront = shadeColor('#3796E3',70);	//This is calculated from your base colour (but can be a custom HEX)

//Create an image to be drawn
var loadingBarImage = new Image();
loadingBarImage.src = 'https://dl.dropboxusercontent.com/u/36336652/LoadingBars/JCHTML5_LoadingBarImage.png';
loadingBarImage.width = 91;
loadingBarImage.height = 135;
loadingBarImage.x_offset = -(loadingBarImage.width/2);
loadingBarImage.y_offset = -(loadingBarImage.height/2);

// Your Own Custom Loading Bar (Copy code from the loading bars below)
function jchtml5_custom_loading_bar(_graphics, _width, _height, _total, _current, _loadingscreen){
	_width = window.innerWidth;
	_height = window.innerHeight;
	_canvas = document.getElementById("canvas");

	//Add your own stuff here
}

// Full screen Loading Bar (WebGL OFF)
function jchtml5_fullscreen_loading_bar(_graphics, _width, _height, _total, _current, _loadingscreen){
	_width = window.innerWidth;
	_height = window.innerHeight;
	_canvas = document.getElementById("canvas");

	if (_canvas.width !== _width || _canvas.height !== _height)
	{
		// Set the canvas size
		_canvas.width = _width;
		_canvas.height = _height;

		// Fill entire screen with colour
		_graphics.fillStyle = colourBackground;
		_graphics.fillRect(0, 0, _width, _height);
	}

	_graphics = _canvas.getContext("2d");

	// Fill entire screen with colour
	_graphics.fillStyle = colourBackground;
	_graphics.fillRect(0, 0, _width, _height);

/*
	//Draw the loading text
	_graphics.fillStyle = colourText;
	_graphics.font = "20px Arial";
	_graphics.textAlign="center";
	_graphics.fillText("Loading",_width / 2,(_height / 2) - 30);
*/	

	// Calculate loading bar position and size
	var barW = Math.round(_width / 4);
	var barH = Math.max(Math.round(_height / 40), 4);
	var barX = Math.round((_width - barW) / 2);
	var barY = Math.round((_height - barH) / 1.75);

	// Draw the loading bar (full)
	_graphics.fillStyle = colourLoadingBack;
	_graphics.fillRect(barX, barY, barW, barH);

	// Work out the completion status
	var fillW = Math.round((barW / _total) * _current);

	//Make the loading bar smooth
	if (loading_bar_smoother < fillW){
		loading_bar_smoother += 1;
	}

	// Draw the loading bar (current) if something has loaded
	if (_current !== 0){
		_graphics.fillStyle = colourLoadingFront;
		_graphics.fillRect(barX, barY, loading_bar_smoother, barH);
	}

	//Draw the image onto the loding bar
	_graphics.drawImage(loadingBarImage,_width/2+loadingBarImage.x_offset,_height/2.5+loadingBarImage.y_offset);
}

// Loading Bar (WebGL ON)
function jchtml5_webgl_loading_bar(_graphics, _width, _height, _total, _current, _loadingscreen){
	_canvas = document.getElementById("canvas");
	_width = _canvas.width;
	_height = _canvas.height;

	// Fill canvas with colour
	_graphics.fillStyle = colourBackground;
	_graphics.fillRect(0, 0, _width, _height);

	if (_current == 0){
		_graphics.font = "20px Arial";
		_graphics.fillStyle = colourText;
		_graphics.textAlign ="center";
		_graphics.fillText("Loading",_width / 2,(_height / 2) - 30);
	}

	// Calculate loading bar position and size
	var barW = Math.round(_width / 4);
	var barH = Math.max(Math.round(_height / 40), 4);
	var barX = Math.round((_width - barW) / 2);
	var barY = Math.round((_height - barH) / 2);

	// Draw the loading bar (full)
	_graphics.fillStyle = colourLoadingBack;
	_graphics.fillRect(barX, barY, barW, barH);

	// Work out the completion status
	var fillW = Math.round((barW / _total) * _current);

	if (loading_bar_smoother < fillW){
		loading_bar_smoother += 1;
	}

	// Draw the loading bar (current) if something has loaded
	if (_current !== 0){
		_graphics.fillStyle = colourLoadingFront;
		_graphics.fillRect(barX, barY, loading_bar_smoother, barH);
		
		_graphics.font = "20px Arial";
		_graphics.textAlign="center";
		_graphics.fillText("Loading",_width / 2,(_height / 2) - 30);
	}
}

function shadeColor(color, percent) {  
    var num = parseInt(color.slice(1),16), amt = Math.round(2.55 * percent), R = (num >> 16) + amt, G = (num >> 8 & 0x00FF) + amt, B = (num & 0x0000FF) + amt;
    return "#" + (0x1000000 + (R<255?R<1?0:R:255)*0x10000 + (G<255?G<1?0:G:255)*0x100 + (B<255?B<1?0:B:255)).toString(16).slice(1);
}