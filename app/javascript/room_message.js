function color_change(){
  const pathName = location.pathname
  const roomName = document.querySelectorAll(".room");

  roomName.forEach( (room)=>{
    const changeColor = room.querySelector(".room-color")
    if(pathName == changeColor.pathname){
        changeColor.setAttribute("style", "background-color: rgba(255, 255, 255, 0.3);")
      };

  });
};

if (document.URL.match(/rooms, messages/)){
  setInterval(color_change, 700)
}
