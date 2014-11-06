class HangmanGame < ActiveRecord::Base

  before_create :update_game_state, :zero_bad_guesses

  def guess_word(word)

    #word
    #game_state
    #bad_guessess
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

  def obfuscate(word, exceptions="")
    word.gsub(/[^\s#{exceptions}]/, '_')
  end

  def update_game_state
    self.game_state = obfuscate(self.word)
  end

  def zero_bad_guesses
    self.bad_guesses = 0
  end

end
