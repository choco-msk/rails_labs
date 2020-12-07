class RafsonController < ApplicationController
  attr_reader :result

  def input; end

  def view
    if params[:num]
    eps = 0.001
    if params[:num].to_s[/^\d+$/]
        num = params[:num].to_f
        num_new = num
        @result = []
        until ((num_new**2 - num)/num) < eps do
          num_new = 0.5*(num_new + num/num_new)
          @result << num_new
        end
    else
      @result = "Error"
    end
  end
  end
end
