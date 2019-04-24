// Set up a dummy function so we don't pollute the global namespace
(function () {
  "use strict";

  var insertfish = function(fish) {
    var list = document.getElementById("fishList");

    // Copy HTML returned by XSLT directly into DOM.
    list.innerHTML = fish.getElementById("rootOfList").innerHTML;
  };


  var loadfish = function () {
    var ajax = new XMLHttpRequest();
    console.log("Click!");

    // Replace URL below with the URL for your server.
    ajax.open("GET", 'http://localhost:3000/fish.xml');
  //  ajax.open("GET", 'https://limitless-citadel-39085.herokuapp.com/fishs.xml');
    ajax.onreadystatechange = function () {
      console.log("Ajax state: " + ajax.readyState);
      if (ajax.readyState === 4 && ajax.status === 200) {
        console.log("Complete AJAX object:");
        console.log(ajax);

        insertfish(ajax.responseXML);
      } else if (ajax.readyState === 4 && ajax.status !== 200) {
        console.log("There was a problem.  Status returned was " + ajax.status);
      }
    };

    ajax.onerror = function () {
      console.log("There was an error!");
    };

    // Notice that send is asynchronous.  This method does not block,
    // instead, the code in onreadystatechange above runs when the call
    // is complete.
    ajax.send();
  };

// Don't apply the event listeners until the document has loaded.
  document.addEventListener("readystatechange", function () {
    console.log("Ready:  " + document.readyState);
    if (document.readyState === "interactive") {
      var loadButton = document.getElementById("loadButton");
      loadButton.addEventListener("click", loadfish);
    }
  });
})();
