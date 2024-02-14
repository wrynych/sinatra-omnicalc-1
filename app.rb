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

post '/payment/new' do
  principal = params['principal'].to_f
  apr = params['apr'].to_f
  years = params['years'].to_i

  monthly_interest_rate = apr / 100 / 12
  total_payments = years * 12
  monthly_payment = principal * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** -total_payments))

  @monthly_payment = sprintf("$%.2f", monthly_payment).gsub(/(\d)(?=(\d{3})+(?!\d))/, "\\1,")
  @apr_percentage = sprintf("%.4f%%", apr)

  erb :payment_results
end



# Random Number Generator
get '/random/new' do
  erb :random_form
end

post '/random/new' do
  min = params['min'].to_i
  max = params['max'].to_i
  redirect "/random/results?min=#{min}&max=#{max}"
end

get '/random/results' do
  @min = params['min'].to_i
  @max = params['max'].to_i
  @random_number = rand(@min..@max)
  erb :random_results
end
