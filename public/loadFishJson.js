
//this is self invoking function.It invokes itself. No necessary to call at all

(function ()	{

	"use strict";

	var insertFish = function(fishes)
	{
		var list = document.getElementById("fishList");
		list.getElementsByClassName("noneMarker")[0].hidden = true;
		fishes.forEach(function(fish){
			var newLI=document.createElement("li");
			var newText=document.createTextNode("Genus :"+fish.genus);
			newLI.appendChild(newText);
			list.appendChild(newLI);
			
		});
	};


	var loadFish=function()
	{
		var ajax=new XMLHttpRequest();
		console.log("Click!");
		ajax.open("GET", 'http://localhost:3000/fish.json');
		ajax.onreadystatechange=function()
		{
			console.log("Ajax state:"+ajax.readyState);
			if(ajax.readyState===4 && ajax.status===200)
			{
				console.log("Complete AJAX object");
				console.log(ajax);
				var fishes = JSON.parse(ajax.responseText);
				console.log("Parsed JSON");
				console.log(fishes);
				insertFish(fishes)

			}

			else if (ajax.readyState==4 && ajax.status!==200)
			{
				console.log("There was a problem. Status returned was"+ajax.status);
			}
			};

			ajax.send();
		};

		document.addEventListener("readystatechange",function(){
			console.log("Ready:"+document.readyState);
			if(document.readyState==="interactive")
			{
				var loadButton=document.getElementById("loadButton");
				loadButton.addEventListener("click",loadFish);

			}



		});



})();