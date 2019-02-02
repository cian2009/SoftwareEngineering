class HangpersonGame

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :word_with_guesses 
  attr_accessor :check_win_or_lose
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = ''
    word.each_char do |i|
      @word_with_guesses << '-'
    end
    @check_win_or_lose = :play
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

  def guess(letter)
    letter.downcase!
    if word.include? letter
      unless guesses.include? letter
        guesses << letter
        for i in 0..word.length
          if word[i] == letter
            word_with_guesses[i] = letter
            @check_win_or_lose = :win if !word_with_guesses.include? '-'
          end
        end
        return true
      end
    else

    end
  end

end
