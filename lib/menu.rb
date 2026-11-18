require_relative "word_list.rb"
require_relative "game.rb"
require_relative "save_manager"

class Menu
  def initialize
    puts "Would you like to start a new game or load an existing save? [n / l]"
    choice = gets.chomp
    if choice == "n"
      new_game()
    end
  end

  def new_game
    game_data = {
      word_to_solve: WordList.new.pick_word,
      guesses_remaining: 6,
      guessed_letters: []
    }

    game = Game.new(game_data)
    game.play
  end

  # def load_game

  # end
end