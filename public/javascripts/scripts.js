console.log(":)");

//  ** Global ** //

var word; 
var context;

//  ** Hangman ** //

function startGame(){
	generateWord();
	//want to start a new game of hangman (maybe add values to database to set game state?)
}

function generateWord(){
	// debugger;
	$.ajax({
		url: "/hangman/words",
		method: "GET",
		dataType: "json",
		success: function(data) {
			word = data;
			makeLetterDivs(word);
		}
	});
}

function makeLetterDivs(word){
	for (var i=0; i < word.length; i++) {
			var div = document.createElement("div");
			div.style.width = "50px";
			div.style.height = "50px";
			div.style.border = "solid 1px black";
			div.style.background = "lightgray";
			div.style.padding = "10px";
			div.style.margin = "10px";
			// div.innerHTML = word[i];
			$('#random-word').append(div);
			};
};



//  ** Onload Function ** //
$(function(){
	$('.start-game').on("click", function(e){
    e.preventDefault(); // return false;
    startGame();
  });
});