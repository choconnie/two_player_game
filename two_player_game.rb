require 'colorize'

class Player
  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def get_score?(result)
    puts result
    result ? @score += 5 : @score -= 5
  end

  def lose_lives?(result)
    result ? @lives : @lives -= 1
  end

end


def correct_answer?(answer)
  correct = @num1 + @num2
  correct == answer
end

def win?(p1_score, p2_score)
  if p1_score > p2_score
    return "Player 1 win."
  elsif p1_score < p2_score
    return "Player 2 win."
  else
    return "Player 1 and Player 2 are even."
  end
end



person = []
p1 = Player.new('Player 1')
p2 = Player.new('Player 2')
person[0] = [p1.name, p1.lives, p1.score ,p1]
person[1] = [p2.name, p2.lives, p2.score ,p2]

num = Random.new
@num1 = 0
@num2 = 0
whos_turn = 0
run_game = true

puts "-------------"
puts " Game Start!".red
puts "-------------"

while run_game
  @num1 = num.rand(1..20)
  @num2 = num.rand(1..20)

  p = person[whos_turn]
  puts "#{p[0]}: What does #{@num1} plus #{@num2} equal?"
  answer = gets.chomp.to_i
  
  result = correct_answer?(answer)
  p[2] = p[3].get_score?(result)
  p[1] = p[3].lose_lives?(result)
  puts "#{p[0]}: #{p[1]} lives left.".yellow
  puts "P1 score: #{person[0][2]}".blue
  puts "P2 score: #{person[1][2]}".green

  if p[1] == 0
    who = win?(p1.score, p2.score)
    puts "-------------------------------"
    puts "Congrats!! #{who}".red
    puts "Player 1 score: #{p1.score}".blue
    puts "Player 2 score: #{p2.score}".green
    puts "-------------------------------"
    run_game = false
  end

  whos_turn == 0 ? whos_turn = 1 : whos_turn = 0
end
