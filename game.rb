require 'bundler'
Bundler.require

module Game
  class RPS_App < Sinatra::Application

    get '/' do
      erb :index
    end

    get '/throw/:type' do
      @computer_move = ["rock", "paper", "scissors"].sample
      @player_move = params[:type]
      win_array = [ ["rock", "scissors"], ["paper", "rock"], ["scissors", "paper"]]
      @outcome = "You won!" if win_array.include? [@player_move, @computer_move]
      @outcome = "You lost..." if win_array.include? [@computer_move, @player_move]
      @outcome = "Draw." if params[:type] == @computer_move
      erb :outcome
    end

  end
end

