require_relative "word_list.rb"
require_relative "save_manager.rb"

class Game

  def initialize(game_data)
    @guesses_remaining = game_data[:guesses_remaining]
    @word_to_solve = game_data[:word_to_solve]
    @player_solution = "_ " * game_data[:word_to_solve].length
    @guessed_letters = game_data[:guessed_letters]
    @in_progress = true
  end

  def make_guess
    @current_guess = gets.chomp
  end

  def parse_guess
    @guessed_letters << @current_guess
    if !@word_to_solve.include?(@current_guess)
      @guesses_remaining -= 1
    end
   indices = @word_to_solve.each_char.with_index.filter_map { |char, i| i if char == @current_guess}
   indices.each do |index|
      @player_solution[index] = @current_guess
   end
  end

  def print_guessed_letters
    puts @guessed_letters
  end

  def won?
    if !@player_solution.include?("_")
      return true

    end
  end

  def lost?
    if @guesses_remaining == 0
      return true
    end
  end

  def take_turn
    puts "What would you like to do?\n[1] Make a guess\n[2] View your guessed letters\n[3] Save and quit"
    choice = gets.chomp
    if choice == "1"
      puts "You have #{@guesses_remaining} guesses remaining: #{@player_solution}"
      make_guess()
      parse_guess()
      puts @player_solution
    elsif choice == "2"
      print_guessed_letters()
    else
      save_data = hash()
      save_manager = SaveManager.new
      save_manager.save_game(save_data)
    end
  end

  def play 
    while @in_progress
      take_turn()
      if won?()
        puts "Congrats you win!"
        @in_progress = false
      end
      if lost?()
        puts "Sorry! You lose"
        @in_progress = false
      end
    end
  end

  def hash
    return {
      word_to_solve: @word_to_solve,
      guesses_remaining: @guesses_remaining,
      guessed_letters: @guessed_letters
    }
  end
end