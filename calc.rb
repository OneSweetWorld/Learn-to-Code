


=begin
number = 99
while number >= 1
	puts number.to_s + " bottles of beer on the wall, " + number.to_s + " bottles of beer!"
		number = number - 1
	puts "Take one down, pass it around, " + number.to_s + " bottles of beer on the wall!"
end
=end


=begin
puts 'Type as many words as you want, please.'
words = []
word = 'word'

while word != ''
	word = gets.chomp
	words = words.push word
end

puts words.sort
=end

def roman number
	
m_length = 0
d_length = 0
c_length = 0
l_length = 0
x_length = 0
v_length = 0
i_length = 0

if number >= 1000
	m_length = number/1000
	number = number%1000
end
if number >= 500
	d_length = number/500
	number = number%500
end
if number >= 100
	c_length = number/100
	number = number%100
end
if number >= 50
	l_length = number/50
	number = number%50
end
if number >= 10
	x_length = number/10
	number = number%10
end
if number >= 5
	v_length = number/5
	number = number%5
end
if number < 5
	i_length = number/1
	number = number%10
end

puts 'M'*m_length + 'D'*d_length + 'C'*c_length + 'L'*l_length + "X"*x_length + "V"*v_length + "I"*i_length

end

roman 1984

