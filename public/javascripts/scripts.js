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
		dataTYPE: "json",
		success: function(data) {
			var new_game = data;
			displayGameState(new_game);
			gameId = data.id;
		}
	})
}

// ** generate mystery word ** //

function displayGameState(game){
	$('#mystery-word').empty();
	makeLetterDivs(game.game_state);
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
			div.innerHTML = mystery_word[i];
			$('#mystery-word').append(div);
			};
};

// ** guesses ** //
function updateGameState(game) {	
	displayGameState(game);
	displaySnowman();
};

//** snowman ** //

function displaySnowman() {
	debugger;
	$.ajax({
		url: "/hangman/snowman",
		method: "GET",
		dataTYPE: "html",
		success: function(data) {
			var $snowman = $('#snowman');
			$snowman.attr("src","data");
		}
	})
}
