class RafsonController < ApplicationController
  attr_reader :result

  def input; end

  def view
    num = params[:num]
    if (num.to_s[/^\d+$/]) && (num.to_f.positive?)
      if (res = Result.find_by_value(num))
        @result = ActiveSupport::JSON.decode(res.result)
      else
        @result = find_square(num.to_f)
        res = Result.create value: num, result: ActiveSupport::JSON.encode(@result)
        res.save()
      end
    else
      @result = "Error"
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                   { type_result: @result.class.to_s, value_result: @result }
      end
    end

  end

  def find_square(num)
    eps = 0.001
    num_new = num
    res = []
    until ((num_new**2 - num.to_f)/num.to_f) < eps do
      num_new = 0.5*(num_new + num.to_f/num_new)
      res << num_new
    end
    return res
  end

  def results
    result = Result.all.map { |el| { value: el.value, result: ActiveSupport::JSON.decode(el.result) } }
    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

end