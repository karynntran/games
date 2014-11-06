class HangmanGame < ActiveRecord::Base

  before_create :update_game_state, :zero_bad_guesses

### guesses ###

  def guess_word(word)
    if self.word == word
      puts "YOU WIN!"
    else
      self.bad_guesses += 1
    end
  end

  def guess_letter(letter)
    if self.word.include?(letter)
      exceptions = self.game_state.delete('_ ') + letter
      self.game_state = obfuscate(self.word, exceptions)
    else
      self.bad_guesses += 1
    end
    self.save
  end

### game state setup ###

  def obfuscate(word, exceptions="")
    word.gsub(/[^\s#{exceptions}]/, '?')
  end

  def update_game_state
    self.game_state = obfuscate(self.word)
  end

  def zero_bad_guesses
    self.bad_guesses = 0
  end

end
