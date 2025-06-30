class WeightsController < ApplicationController
  def new; end

  def judge
    input1 = params[:day1]
    input2 = params[:day2]

    unless valid_number?(input1) && valid_number?(input2)
      @result = "数値を入力してください"
      return
    end

    @day1 = input1.to_f
    @day2 = input2.to_f
    @difference = (@day2 - @day1).round(1)

    if @day2 < @day1
      @result = '良い感じです！'
      @image = 'thin_golira.png'
    elsif @day2 > @day1
      @result = '見直しましょう...'
      @image = 'fat_golira.png'
    else
      @result = '変化はないです'
      @image = 'nothing_change_gorila.png'
    end
  end


  private

  def valid_number?(str)
    return false if str.nil? || str.strip.empty?

    float_value = Float(str) rescue nil
    return false if float_value.nil? || float_value < 0

    true
  end
end