// module FileReader


//exports.readFileImpl = function readText(file, onSuccess, onFailure) {
//  if (file) {
//      var reader = new FileReader();
//      reader.readAsText(file, "UTF-8");
//      reader.onload = onSuccess
//      reader.onerror = onFailure
//      }
//}
//  NS_ERROR_DOM_BAD_URI: Access to restricted URI denied
exports.readFileBlocking = function getFileBlocking(filename) { 
  var xmlhttp = new XMLHttpRequest(); xmlhttp.responseType = "text";
  xmlhttp.responseType = "text"
  xmlhttp.open("GET", filename, true);
  xmlhttp.send();
  return xmlhttp.responseText
}


exports.readFileImpl = function readText(file, onSuccess, onFailure) {
    var xmlhttp = new XMLHttpRequest(); xmlhttp.responseType = "text";
    xmlhttp.responseType = "text"

    xmlhttp.onreadystatechange = function() {
        if (xhr.readyState==4 && xhr.status==200) onSuccess(xhr.responseText);
        else onFailure(xhr.responseText);
    
    };
    xmlhttp.open("GET", filename, true);
    xmlhttp.send();
}
