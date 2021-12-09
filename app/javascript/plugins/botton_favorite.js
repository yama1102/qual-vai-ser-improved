const btnEvents = () => {
  const btn = document.querySelector(".botton-topfavorite");
  if(btn) {
    btn.addEventListener("click", (event) => {
      btn.classList.toggle("botton-warning");
      if (document.querySelector(".botton-warning")) {
        btn.innerText = "Evento favoritado";
      } else {
        btn.innerText = "Favoritar evento";
      }
    })
  }
}


export { btnEvents };
