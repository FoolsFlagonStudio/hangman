require_relative "word_list.rb"
require_relative "game.rb"
require_relative "save_manager"
require 'yaml'
class Menu
  def initialize
    puts "Would you like to start a new game or load an existing save? [n / l]"
    choice = gets.chomp
    if choice == "n"
      new_game()
    elsif choice == "l"
      load_game()
    else
      raise ArgumentError, "Please select a valid option: [n / l]"
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

  def load_game
    save_manager = SaveManager.new

    loaded_save = save_manager.load_save
    @dir_path = File.join(__dir__, '..', 'saves')

    full_path = File.join(@dir_path, loaded_save)
    save_data = YAML.load_file(full_path)
    game = Game.new(save_data)

    game.play

  end
end