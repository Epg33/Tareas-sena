const change = document.getElementById('change');

change.addEventListener('click', ()=>{
    const color = document.getElementById('color').value;
    document.getElementById('background').style.background= `${color}`;
});