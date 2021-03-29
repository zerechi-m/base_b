const memberSelect = (e)=>{
  let nodes = document.querySelectorAll(".position-select-form");
  Array.prototype.forEach.call(nodes, function(n){
    n.addEventListener("change", function(){
      Array.prototype.forEach.call(nodes, function(n){
        Array.prototype.forEach.call(n.querySelectorAll("option:disabled"),function(n){
          n.disabled=false;
        });
      });
      Array.prototype.map.call(nodes, function(n){
        return n.selectedIndex;
      }).filter(function(idx){
        return idx>0;
      }).forEach(function(idx){
        Array.prototype.forEach.call(nodes, function(n){
          if(n.selectedIndex !== idx) n.querySelectorAll("option")[idx].disabled=true;
        });
      });
    });
  });
};



if(document.URL.match(/[orders]/)){
  window.addEventListener("DOMContentLoaded", memberSelect);
}
