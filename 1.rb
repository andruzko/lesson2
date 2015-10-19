class Ball

  def shake
    require 'colorize'
    answers =
      ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes — definitely', 'You may rely on it',
       'As I see it, yes', 'Most likely' 'Outlook good', 'Signs point to yes', 'Yes', 'Reply hazy, try again',
       'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again',
       'Don’t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful']
    randIndex = rand(20)
    case randIndex
    when 0..4
      puts answers[randIndex].blue
    when 5..9
      puts answers[randIndex].green
    when 10..14
      puts answers[randIndex].yellow
    when 15..19
      puts answers[randIndex].red
    end
    answers[randIndex]
  end

end
magicBall = Ball.new
magicBall.shake
