class DiceController < ApplicationController

  def show_main
    if params["goal"].nil?
      show_instructions
    else
      show_game
    end
  end

  def show_instructions
    render "dice"
  end

  def show_game
    dice = [1,2,3,4,5,6]
    dices = dice.product(dice)
    @dice_values = dices.sample(1)

    if params["goal"].to_i == 0
      @goal = @dice_values[0][0] + @dice_values[0][1]

      if @goal == 7 || @goal == 11
        @flag = 0
      elsif @goal == 2 || @goal == 3 || @goal == 12
        @flag = 1
      else
        @flag = 2
      end
    else
      @goal = params["goal"].to_i

      if @dice_values[0][0] + @dice_values[0][1] == 7
        @flag = 1
      elsif @dice_values[0][0] + @dice_values[0][1] == @goal
        @flag = 0
      else
        @flag = 2
      end
    end

    render "game"
  end

end
