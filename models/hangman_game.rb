class HangmanGame < ActiveRecord::Base

  before_create :update_game_state, :zero_bad_guesses

### guesses ###


  #check if letter guess is included in word - if it is, remove a space and add the guessed letter, then run obfuscate method
  #otherwise, add to bad_guesses counter

  def guess_letter(letter)
    if self.word.include?(letter)
      exceptions = self.game_state.delete('_ ') + letter
      self.game_state = obfuscate(self.word, exceptions)
    else
      self.bad_guesses += 1
    end
    self.save
  end

  #guessed word must match mystery word

  def guess_word(word)
    word == self.word ? self.game_state = word
                      : self.bad_guesses += 1
    self.save
  end

  def snowman
    "/images/snowman"+"#{self.bad_guesses}"+".jpg"
  end

  #game status - tries - win or lose

  def win_or_lose
    tries_left = (4 - self.bad_guesses)

      if self.game_state == self.word
        "YOU WIN"
      elsif tries_left > 0 && tries_left < 4
        "Tries Left: #{tries_left}"
      else tries_left == 0
        "Oh no, the snowman melted!"
      end

  end



### game state setup ###

  #takes in a word and list of correct letters. Anything with non-character or part of the execptions array to be replaced with ?
  def obfuscate(word, exceptions="")
    word.gsub(/[^\s#{exceptions}]/, '?')
  end

  #need to update game_state with latest version of word
  def update_game_state
    self.game_state = obfuscate(self.word)
  end

  def zero_bad_guesses
    self.bad_guesses = 0
  end

end
