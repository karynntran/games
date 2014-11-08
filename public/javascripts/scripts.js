console.log(":)");

//  ** Global ** //

var $canvas = $('.melting-snowman');
var context;
var mystery_word; 



//  ** Hangman ** //


function startGame(){

	$.ajax({
		url: "/hangman/start_game",
		method: "GET",
		dataType: "json",
		success: function(data) {
			var new_game = data;
			displayGameState(new_game);
			gameId = data.id;
			displaySnowman;
			displayResults;
		}
	})
}

function clearGame(){
	$('#mystery-word').empty();
	$('#game-status').empty();
	$("#guessInput").empty();
	$('#snowman').attr("src", "/images/snowman0.jpg");
}


// ** generate mystery word ** //

function displayGameState(game){
	$('#mystery-word').empty();
	makeLetterDivs(game.game_state);
	console.log("display");
}

function makeLetterDivs(mystery_word){

	for (var i=0; i < mystery_word.length; i++) {
			var div = document.createElement("div");
			div.style.width = "50px";
			div.style.height = "50px";
			div.style.border = "solid 1px black";
			div.style.background = "white";
			div.style.padding = "10px";
			div.style.margin = "10px";
			div.style.color = "darkblue";
			div.style.size = "20px";
			div.innerHTML = mystery_word[i];
			$('#mystery-word').append(div);
			};
		console.log("letter divs");	
};

// ** guesses ** //
function updateGameState(game) {	
	displayGameState(game);
	displaySnowman();
	displayResults();
	console.log("update game state");
};

//** snowman ** //

function displaySnowman(game) {
	$.ajax({
		url: "/hangman/snowman",
		method: "GET",
		dataType: "json",
		success: function(data) {
			var $snowman = $('#snowman');
			$snowman.attr("src", data.image);
		}
	});
}

function displayResults(game) {
	$.ajax({
		url: "/hangman/win-or-lose",
		method: "GET",
		dataType: "json",
		success: function(data) {
			$('#game-status').text(data.result);
			if (data.end_game === true){
				setInterval(function(){
					victorySnowflakes(10);
				}, 100);
			}
  	}
	});
}



//win!//

function victorySnowflakes(numSnowflakes) {
  for (var i = 0; i < numSnowflakes; i++) {
    var snowFlake = $('<h1 class="snowflake">&hearts;</h1>');
    $('.melting-snowman').append(snowFlake);

    var blue = Math.floor(Math.random() * 255);
    var newColor = blue;
    snowFlake.css({color: newColor})

    snowFlake.animate({
      top: Math.floor(Math.random() * 200) - 50 + '%',
      left: Math.floor(Math.random() * 200) - 50 + '%',
      opacity: 0
    }, 2000, 'linear');
  }
}







//  ** DOCUMENT READY Function ** //
$(function(){
	gameId = undefined; // startGame defines this
	$('.start-game').on("click", function(e){
    e.preventDefault(); // return false;    
    clearGame();
    startGame();
  });

  $('.guess-letter').on('click', function(e) {
  	e.preventDefault();
  	var letter = $(this).data('letter');  
  	$.ajax({
  		url: '/hangman/letter-guess',
  		method: 'PATCH',
  		dataType: 'json',
  		data: {
  			guess: letter,
  			gameId: gameId
  		},
  		success: updateGameState
  			// console.log("happy")
  	});
  });

  $('.guess-word').on('click', function(e)
  	{
  	e.preventDefault();
  	var word = $("#guessInput").val();
  	$.ajax({
  		url: '/hangman/word-guess',
  		method: 'PATCH',
  		dataType: 'json',
  		data: {
  			guess: word,
  			gameId: gameId	
  		},
  		success: updateGameState

 	 });
  });
});
