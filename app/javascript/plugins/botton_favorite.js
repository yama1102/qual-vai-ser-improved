const btnEvents = () => {
  const btn = document.querySelector(".botton-topfavorite");
  if(btn) {
    btn.addEventListener("click", (event) => {
      btn.classList.toggle("botton-warning");
      if (document.querySelector(".botton-warning")) {
        btn.innerText = "evento favoritado";
      } else {
        btn.innerText = "favoritar evento";
      }
    })
  }
}


export { btnEvents };
