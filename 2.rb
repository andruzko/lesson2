# encoding: UTF-8

class Pet
	
	require 'colorize'	

  def initialize name, speciesСreatures
		epithet = ['миле', 'грайливе', 'веселе', 'непосидюче', 'гавкуче', 'шкрябуче', 'гучне']    
		@name = name
    @speciesСreatures = speciesСreatures
    @mood = 10  # настрій
    @well-fed = 6 # ситий
    @loveLevel = 1       # увага
		@asleep = false      #СОНЛИВІСТЬ 
		@mobility = 10       # рухливість
		@appreciation = false  #вдячність
		@angry = false       #злість
		@fresh = 2        # чистий
		@stomack = 0				 # шлунок
		puts ("В тебе з\'явився друг - #{epithet[rand(6)]}" + ' звірятко ' + ' - ' + @name + @speciesСreatures).green
  end

  def feed
		puts 'Чим ви будете годувати'
		food = gets.chomp
		puts 'Ви нагодували ' + @name + '(а) ' + food + 'ою'
    @well-fed = 10
    passageOfTime
  end

  def sleep
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' Мило підсоплює..'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' Прокидається.'
    end
		@mobility -= 2
  end

  def walk
    puts 'Ви вийшли з' + @name + '(ом) порухатись та зробити його справи'
		@mobility = 10
		@stomack = 0
		passageOfTime
  end

  def love
    puts ('Ви сюсюкаєтесь з ' + @name + '(ом), він крутить хвостом.').green
		@lovelevel = 5
		@appreciation = true
		@mood += 1
		passageOfTime
  end

	def clean_up
		puts 'Хтось поводить себе не гарно, ' + @name + '!, не будемо показувати пальцем хто'
		passageOfTime
		@fresh = 2
		@mood += 1 
	end
	
	def ignore
		2.times do
			passageOfTime
			@lolevel -=1		
		end
	end

private
	
	def hungry?
    @well-fed <= 2
  end
  
  def stomackEche?
    @stomack >= 8
  end
	
	def attantion?
		@lovelevel <=2
	end

	def passageOfTime # проходит некоторое время
    if @well-fed > 0
      @well-fed -=  1
      @stomack += 1
    else  #  Наш дракон страдает от голода!
      if @asleep
        @asleep = false
        puts 'Стривожено прокидається!'
      end
      puts (@name + 'господар я голодний! я тебе з\'їв!').red
      exit
    end
    
		if @lovelevel <= 0
			puts name + ('втік від Вас до більш люблячого господаря').red
			exit
		elsif @fresh == 0
			puts name + ('сконав у власних нечистотах від інфекцій..').red
			exit
    end

		if @stomack >= 10
      @stomack = 0
			@fresh = false
			@appreciation = false
			@mood -= 1
			@@mobility -= 1
      puts ('Халепа! ' + @name + ' наробив си...').red
    end
    
    if hungry?
      if @asleep
        @asleep 
        puts 'Він стривожено прокидається!'
      end
      puts ('Шлунок ' + @name + '(а) торохкотить').red
    end
    
    if stomackEche?
      if @asleep
        @asleep == false
        puts 'Він стривожено прокидається!'
      end
      puts (@name + ' скочить, шукаючи горщик...').red
    end
		
		if attantion?
			puts 'у ' + @name + ' сумні очі, йому чогось не вистачає..'
 		end

		if @appreciation and @mood > 5
			puts (@name + ' ЩАСЛИВИЙ!!!').green
		elsif @appreciation
			puts (@name + ' вдячний').green
		elsif @mobility > 5
			puts (@name + ' здоровий!').green
		end
  end

end

name = ""
speciesСreatures = ""

while (name == "" or speciesСreatures == "")
	print 'Введіть ім\'я домашнього улюбленця: '
	name_ = gets.chomp
	print 'Оберіть тварину: '
	speciesСreatures_ = gets.chomp
end

pet = Pet.new name, speciesСreatures

