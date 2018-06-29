class Rulete

	def self.play(rulete_choice)
		random = rand(1..10)
		if random == rulete_choice
			puts 'YOU WIN!!' 
		else
			puts 'YOU LOSE :(' 
		end
		puts "ruleta:#{random} vs Chosen Number:#{rulete_choice}"
	end
end

Rulete.play(5)