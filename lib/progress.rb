class Progress
	attr_accessor :count, :max

	def initialize(max = 100)
    @count = 0
		@max = max
	end

	def increment!(count = 1)
		self.count += count

		print "\r" # clear
    print to_s
	end

	def to_s
		self.count = max if count > max
		ratio = [count.to_f / max, 1.0].min

		text = ""
		text << "[%i/%i] %3.2f%%" % [count, max, ratio * 100]
	end

	def print(str)
    $stderr.write str
  end
end