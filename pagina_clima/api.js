let laTemperatura=0
let ciudad =''
let humedad=0
let descripcion=''
let velocidadViento=0
let elClima= ''
let laCiudad=''

const clima =()=>{
  ciudad=document.getElementById('ciudad').value.toLowerCase()
  fetch(`https://api.openweathermap.org/data/2.5/weather?q=${ciudad}&appid=db39f52d74cf53d87dcfed725fcd5257`)
  .then(response=> response.json()) .then(res=> {console.log(res);
  laTemperatura=Math.round(res.main.temp- 273.15 )
  humedad=res.main.humidity
  descripcion=res.weather[0].description
  velocidadViento=res.wind.speed
  laCiudad=res.name
  document.getElementById("div1").innerHTML=`la temperatura es de: ${laTemperatura} grados <br> la humedad es de: ${humedad} g/m<sup>3</sup> <br> La velocidad del viento es de: ${velocidadViento} m/s <br> Descripcion: ${descripcion} <br> Ciudad: ${laCiudad}`
  })
  document.getElementById("div1").animate([
    {transform: 'translateY(100px)'},
    {transform: 'translateY(0px)'}
  ],{
    duration: 1000,
    iterations: 1
  });
}