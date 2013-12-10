require 'bundler'
Bundler.require

module Game
  class RPS_App < Sinatra::Application

    get '/throw/:type' do |type|
      @computer_move = ["rock", "paper", "scissors"].sample
      win_array = [ ["rock", "scissors"], ["paper", "rock"], ["scissors", "paper"]]
      @outcome = "You won!" if win_array.include? [type, @computer_move]
      @outcome = "You lost!" if win_array.include? [@computer_move, type]
      @outcome = "Draw." if type == @computer_move
      erb :index
    end

  end
end

