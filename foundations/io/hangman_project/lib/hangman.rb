class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        indices << i
      end
    end

    if indices.count == 0
      return []
    end

    indices
  end

  def fill_indices(char, arr)
    arr.map do |ele|
      guess_word[ele] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end
    
    @attempted_chars << char

    matched_indices = get_matching_indices(char)

    if matched_indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, matched_indices)
    end

    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @secret_word == @guess_word.join('')
      puts 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end