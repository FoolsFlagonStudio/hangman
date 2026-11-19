require 'tty-prompt'
require 'yaml'

class SaveManager
  def initialize

    @dir_path = File.join(__dir__, '..', 'saves')

    @files = Dir.children(@dir_path).select do |entry|
      File.file?(File.join(@dir_path, entry))
    end
  end

  def load_save
    prompt = TTY::Prompt.new
    choice = prompt.select("Choose your save:", @files)
    return choice
  end

  def save_game(save_data)
    save_name = Time.now.strftime("%Y-%m-%d-%H-%M-%S") + ".yml"
    save_path = File.join(@dir_path, save_name)
    File.write(save_path, save_data.to_yaml)
  end
end