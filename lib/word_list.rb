class WordList
  def initialize()
    filepath = File.join(__dir__, '..', 'data', '10000-english-no-swears.txt')
    @word_list = File.readlines(filepath, chomp: true).select {|word| (5..12).cover?(word.length)}
  end

  def pick_word
    return @word_list.sample
  end
end