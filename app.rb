require 'sinatra'
require 'sinatra/reloader'

# Square Calculator
get '/square/new' do
  erb :square_form
end

post '/square/new' do
  number = params['user_number'].to_f
  square = number * number
  redirect "/square/results?number=#{number}&square=#{square}"
end

get '/square/results' do
  @number = params['number'].to_f
  @square = params['square'].to_f
  erb :square_results
end

# Square Root Calculator
get '/square_root/new' do
  erb :square_root_form
end

post '/square_root/new' do
  number = params['user_number'].to_f
  square_root = Math.sqrt(number)
  redirect "/square_root/results?number=#{number}&square_root=#{square_root}"
end

get '/square_root/results' do
  @number = params['number'].to_f
  @square_root = params['square_root'].to_f
  erb :square_root_results
end

# Payment Calculator
get '/payment/new' do
  erb :payment_form
end

post '/payment/results' do
  apr = params['user_apr'].to_f
  years = params['user_years'].to_i
  principal = params['user_pv'].to_f

  monthly_interest_rate = apr / 100 / 12
  total_payments = years * 12
  monthly_payment = principal * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** -total_payments))
  @monthly_payment = format("%.2f", monthly_payment)
  redirect "/payment/results?user_apr=#{apr}&user_years=#{years}&user_pv=#{principal}&monthly_payment=#{monthly_payment}"
end

get '/payment/results' do
  @apr = params['user_apr'].to_f
  @years = params['user_years'].to_i
  @principal = params['user_pv'].to_f
  @monthly_payment = params['monthly_payment'].to_f

  erb :payment_results
end




# Random Number Generator
get '/random/new' do
  erb :random_form
end

post '/random/results' do
  min = params['user_min'].to_f
  max = params['user_max'].to_f
  random_number = rand(min..max)
  redirect "/random/results?user_min=#{min}&user_max=#{max}&random_number=#{random_number}"
end

get '/random/results' do
  @min = params['user_min'].to_f
  @max = params['user_max'].to_f
  @random_number = params['random_number'].to_f
  erb :random_results
end
