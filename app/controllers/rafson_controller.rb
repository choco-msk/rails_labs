class RafsonController < ApplicationController
  attr_reader :result

  def input; end

  def view
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
    respond_to do |format|
      format.html
      format.json do
        render json:
                   {type: @result.class.to_s, value: @result}
      end
    end
  end
end
