require 'colorize'

@p1_lives = 3
@p2_lives = 3
@p1_score = 0
@p2_score = 0
num = Random.new
@num1 = 0
@num2 = 0
player = 'Player 1'
run_game = true

def correct_answer?(answer)
  correct = @num1 + @num2
  correct == answer
end

def get_score?(result, player)
  result ? player += 5 : player -= 5
end

def lose_lives?(result, player)
  result ? player : player -= 1
end

def win?
  if @p1_score > @p2_score
    return "Player 1 win."
  elsif @p1_score < @p2_score
    return "Player 2 win."
  else
    return "Player 1 and Player 2 are even."
  end
end


puts "Game Start!"

while run_game
  
  @num1 = num.rand(1..20)
  @num2 = num.rand(1..20)

  puts "#{player}: What does #{@num1} plus #{@num2} equal?"
  answer = gets.chomp.to_i
  result = correct_answer?(answer)

  if player == 'Player 1'
    @p1_score = get_score?(result, @p1_score)
    @p1_lives = lose_lives?(result, @p1_lives)
  else
    @p2_score = get_score?(result, @p2_score)
    @p2_lives = lose_lives?(result, @p2_lives)
  end
  puts "P1 score: #{@p1_score}".blue
  puts "P2 score: #{@p2_score}".green

  if @p1_lives == 0 || @p2_lives == 0
    who = win?
    puts "-------------------------------"
    puts "Congrats!! #{who}".red
    puts "Player 1 score: #{@p1_score}".blue
    puts "Player 2 score: #{@p2_score}".green
    puts "-------------------------------"
    run_game = false
  end

  player == 'Player 1' ? player = 'Player 2' : player = 'Player 1'

end
