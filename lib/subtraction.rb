class Subtraction
  attr_accessor :num1, :num2, :answer

  def initialize(opts = {})
    self.num1 = opts[:num1] || set_num1(opts[:max])
    self.num2 = opts[:num2] || set_num2(self.num1)
    self.answer = opts[:answer]
  end

  def correct?
    self.num1.to_i - self.num2.to_i == self.answer.to_i
  end

  def set_num1(value = 10)
    rand(value.to_i - 1) + 1
  end

  def set_num2(num1)
    if num1 == 0
      0
    else
      rand(num1)
    end
  end

  def to_h
    { num1: self.num1, num2: self.num2, answer: self.answer }
  end

  def to_json
    self.to_h.to_json
  end
end

post '/subtraction.json' do
  Subtraction.new(params).to_json
end

post '/subtractionchecker.json' do
  {correct: Subtraction.new(params).correct?}.to_json
end