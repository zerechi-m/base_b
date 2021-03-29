function tab() {
  const tab1 = document.getElementById("tab1")
  const tab2 = document.getElementById("tab2")
  const tab1Cont = document.getElementById("tab1-cont")
  const tab2Cont = document.getElementById("tab2-cont")
  const tabHeight = document.getElementById("messages-height")

  tab2.addEventListener("click", ()=>{
    tabHeight.setAttribute("style", "height: calc( 90vh - 270px)")

    tab1.classList.remove("active");
    tab1Cont.classList.remove("tab-active");
    tab1Cont.classList.add("tab-none")

    tab2.classList.add("active");
    tab2Cont.classList.remove("tab-none");
    tab2Cont.classList.add("tab-active");
  });

  tab1.addEventListener("click", ()=>{
    tabHeight.removeAttribute("style")
    tab2.classList.remove("active");
    tab2Cont.classList.remove("tab-active");
    tab2Cont.classList.add("tab-none")
    tab1.classList.add("active");
    tab1Cont.classList.remove("tab-none");
    tab1Cont.classList.add("tab-active");
  });
};

if (document.URL.match(/messages/) ){
  setInterval(tab, 1000);
};