class HangmanGame < ActiveRecord::Base

  before_create :update_game_state, :zero_bad_guesses

### guesses ###

  def guess_word(word)
    if self.word == word
      puts "YOU WIN!"
    else
      self.bad_guesses += 1
    end
    self.save
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

  def snowman
    case self.bad_guesses
      when 0
        "<img id='snowman-1' src='/public/images/snowman1.jpg' />"
      when 1
        "<img id='snowman-2' src='/public/images/snowman2.jpg' />"
      when 2
        "<img id='snowman-3' src='/public/images/snowman3.jpg' />"
      when 3
        "<img id='snowman-4' src='/public/images/snowman4.jpg' />"
      when 4
        "<img id='snowman-5' src='/public/images/snowman5.jpg' />"
      else
        "You lost!"
    end
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
