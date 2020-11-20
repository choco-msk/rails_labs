# frozen_string_literal: true

class ArrayController < ApplicationController
  attr_reader :result

  def input; end

  def view
    num = params[:num].to_s.split
    num[num.find_index { |i| i.to_i.positive? && (i.to_i % 7 != 0) }] = num.max
    @result = num.join(' ')
  end
end
