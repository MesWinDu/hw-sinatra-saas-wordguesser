class WordGuesserGame
  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_reader :word, :guesses, :wrong_guesses

  def guess(letter)
    raise ArgumentError, 'Invalid input' unless letter.is_a?(String) && letter.match?(/[a-z]/i)

    letter.downcase!

    if @word.include?(letter)
      return false if @guesses.include?(letter)

      @guesses << letter
    else
      return false if @wrong_guesses.include?(letter)

      @wrong_guesses << letter
    end

    true
  end

  def word_with_guesses
    display = ''
    @word.each_char do |char|
      if @guesses.include?(char)
        display << char
      else
        display << '-'
      end
    end
    display
  end

  def check_win_or_lose
    return :win if @word.chars.all? { |char| @guesses.include?(char) }
    return :lose if @wrong_guesses.length >= 7

    :play
  end
end

