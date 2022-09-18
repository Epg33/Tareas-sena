const change = document.getElementById("change");
const main = document.getElementById("main");


change.addEventListener("click", () => {
  const color = document.getElementById("color").value;
  document.getElementById("background").style.background = `${color}`;
});

let radius_less = 0;
let radius_more = 0;

const disminuir = () => {
  if (document.getElementsByTagName("main").style.borderRadius != "0") {
    radius_less -= 1;
    document.querySelector(
      ".main-content"
    ).style.borderRadius = `${radius_less}px;`;
  }
};

const aumentar = () => {
  radius_more += 1;
  console.log(radius_more);
  main.style.borderRadius = `${radius_more}px;`;
  document.getElementById("background").style.borderRadius = `${radius_more}px;`;
};
