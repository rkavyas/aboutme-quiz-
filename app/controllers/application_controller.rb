require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/results' do
    #puts params
    points_array = params.values
    total = 0
    points_array.each do |point|
      total += point.to_i
  end
  #puts total
  
  result = calculate_result(total)
  
  if result == "YAAASSSS"
    return erb :bestfriends
    elsif result == "eh"
      return erb :okayfriends
    else
      return erb :notfriends
      
  end
  
end
end
  
