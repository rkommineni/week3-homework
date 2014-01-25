class DiceController < ApplicationController

  def show_main
    if params["value1"].nil? || params["value2"].nil? || params["goal"].nil?
      show_instructions
    else
      if params["goal"].to_i == 0
        @initial = 1
        @dice_values = [params["value1"].to_i, params["value2"].to_i, params["value1"].to_i + params["value2"].to_i]
      else
        @initial = 0
        @dice_values = [params["value1"].to_i, params["value2"].to_i, params["goal"].to_i]
      end
      show_game
    end
  end

  def show_instructions
    render "dice"
  end

  def show_game
    render "game"
  end

end
