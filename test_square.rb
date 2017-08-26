class Square
	def initialize
		if defined?(@@qnt)
			@@qnt += 1
		else
			@@qnt = 1
		end
	end

	def self.count
		@@qnt
	end
end

a = Square.new
puts Square.count
b = Square.new
puts Square.count
c = Square.new
puts Square.count
