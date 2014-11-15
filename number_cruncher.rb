require 'sinatra'
require 'json'

class Fixnum

	def factors

		(1..Math.sqrt(self)).map{ |n| [n,self/n] if self/n*n == self }.compact.flatten.sort
	end

	def prime?
		self.factors.size == 2 ? true : false
	end

end

get '/:number' do
	content_type :json
	number = params[:number].to_i
	{number: number, factors: number.factors, odd: number.odd?, even: number.even?, prime: number.prime?}.to_json
end