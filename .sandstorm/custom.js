define(['base/js/namespace'], function(Jupyter){
  // Prevent notebooks from opening in a new window.
  Jupyter._target = '_self';

  var css = document.createElement("style");
  css.type = "text/css";
  css.innerHTML = "#new-terminal { display: none; }";
  document.head.appendChild(css);
});
