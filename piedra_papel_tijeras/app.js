const pc = ['rock', 'paper', 'scissors', 'rock', 'paper', 'scissors', 'rock', 'paper', 'scissors', 'rock', 'paper', 'scissors', 'rock', 'paper', 'scissors', 'rock', 'paper', 'scissors']
let playerWins = 0;
let pcWins = 0;

document.getElementById('marker-pc').textContent = pcWins;
document.getElementById('marker-user').textContent = playerWins;

const jugar = (e) => {
    const player = e.value;
    const pc_play = pc[Math.round(Math.random()*17)];
    settingImages(player, pc_play);
    evaluate_play(player, pc_play);
}

const evaluate_play = (player, pc_play) => {
   if (player == 'rock') {
    pc_play == "rock" ? alert("empate") : pc_play == "paper"? pcWins+=1 : pc_play == "scissors"? playerWins+=1 : null;
    document.getElementById('marker-pc').textContent = pcWins;
    document.getElementById('marker-user').textContent = playerWins;
   }
   else if (player == "scissors"){
    pc_play == "rock" ? pcWins+=1 : pc_play=="scissors"? alert("empate") : pc_play == "paper" ? playerWins+=1 : null;
    document.getElementById('marker-pc').textContent = pcWins;
    document.getElementById('marker-user').textContent = playerWins;
   }
   else{
    pc_play == "rock" ? playerWins+=1 : pc_play == "scissors" ? pcWins+=1 : pc_play == "paper" ? alert("empate") : null;
    document.getElementById('marker-pc').textContent = pcWins;
    document.getElementById('marker-user').textContent = playerWins;
   }
}

const settingImages = async (player, pc_play) => {
    document.getElementById('play-pc').src = `./images/${pc_play}.png`
    document.getElementById('play-user').src= `./images/${player}.png`
}