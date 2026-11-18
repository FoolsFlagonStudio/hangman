Class SaveManager
  def initialize

    dir_path = File.join(__dir__, '..', 'saves')

    files = Dir.children(dir_path).select do |entry|
      File.file?(File.join(dir_path, entry))
    end
  end
end