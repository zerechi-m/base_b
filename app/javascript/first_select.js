const firstSelect = (e)=>{
  const firstBatting = document.getElementById("first-batting");
  const firstFielding = document.getElementById("first-batting");
  let select = document.querySelectorAll(".select-form");

  Array.prototype.forEach.call(select, function(n){
    n,addEventListener("change", ()=>{
      Array.prototype.forEach.call(select, function(n){
        Array.prototype.forEach.call(n.querySelectorAll("option:disabled"), function(n){
          n.disable = false;
        })
      })
      Array.prototype.map.call(select, function(n){
        return n.selectedIndex;
      }).filter(function(idx){
        return idx > 0;
      }).forEach(function(idx){
        Array.prototype.forEach.call(select, function(n){
          if(n.selectedIndex !== idx ) n.querySelectorAll("option")[idx].disabled = true;
        })
      })
    })
  })
  
}


if(document.URL.match(/[results]/)){
  window.addEventListener("DOMContentLoaded", firstSelect);
}