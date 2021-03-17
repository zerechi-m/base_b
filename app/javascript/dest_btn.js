function destroyBtn(){
  const destBTN = document.getElementById("call-btn")
  const displayDest = document.querySelectorAll(".room");
  const sideBar = document.querySelector(".side-bar")
  let i = 0;

    destBTN.addEventListener("click", ()=>{

      if( i == 0 ){
        displayDest.forEach( (dest)=>{
          let btn = dest.querySelector(".d-button")
            btn.removeAttribute("style");
            destBTN.innerHTML = "削除の終了";
            destBTN.setAttribute("style", "background-color: green;")
            sideBar.setAttribute("style", "width: 370px;")
        })
        i = i + 1;
      }else if( i == 1){
        displayDest.forEach( (dest)=>{
          btn = dest.querySelector(".d-button")
          destBTN.innerHTML = "トークルームの削除";
          btn.setAttribute("style", "display: none;")
          destBTN.removeAttribute("style");
          sideBar.removeAttribute("style")
        });
        i -= 1;
      };
  });
};

if (document.URL.match(/rooms/) || document.URL.match(/rooms,messages/)){
  setInterval( destroyBtn , 1000);
}