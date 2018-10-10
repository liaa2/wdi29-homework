class RpsController < ApplicationController

  def pick

  end #end of pick

  def rps_result
    @random = ['rock','scissors','paper'].sample
    puts @random
    @pick = params[:rps_result]
    puts @pick

    def win (player,computer)
      if (player=='paper' && computer=='rock')|| (player=='rock' && computer=="scissors") || (player=="scissors" && computer =="paper") || player==computer
        @winner = "Player"
      else
        @winner ="Computer"
      end #end of if/else
    end #end of def win
    win(@pick, @random)
  end  #end of rsp_result


end  #end of class
