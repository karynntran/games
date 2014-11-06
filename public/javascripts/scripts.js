console.log(":)");

//  ** Global ** //

var word; 
var context;

//  ** Hangman ** //

function startGame(){
	generateWord();
	//want to start a new game of hangman (maybe add values to database to set game state?)
}

// ** generate secret word ** //

function generateWord(){
	// debugger;
	$.ajax({
		url: "/hangman/words",
		method: "GET",
		dataType: "json",
		success: function(data) {
			mystery_word = data;
			makeLetterDivs(mystery_word);
		}
	});
}

function makeLetterDivs(mystery_word){
	for (var i=0; i < mystery_word.length; i++) {
			var div = document.createElement("div");
			div.style.width = "50px";
			div.style.height = "50px";
			div.style.border = "solid 1px black";
			div.style.background = "lightgray";
			div.style.padding = "10px";
			div.style.margin = "10px";
			// div.innerHTML = mystery_word[i];
			$('#mystery-word').append(div);
			};
};

// ** letter guess ** //



// ** word guess ** //




//  ** Onload Function ** //
$(function(){
	$('.start-game').on("click", function(e){
    e.preventDefault(); // return false;
    startGame();
  });
});