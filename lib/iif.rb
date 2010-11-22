require 'enumerator'

module Finance
	class IIF
		def initialize(filename)
			if block_given?
				File.open(filename) do |fh|
					@fh = fh
					yield self
				end
			else
				@fh = File.open(filename)
			end 
		end

		def each
			if block_given?
				yield null
			else
				return new Enumerable::Enumerator(self, :each)
			end
		end
	end
end
