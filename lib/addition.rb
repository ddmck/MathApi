class Addition
  attr_accessor :num1, :num2, :answer

  def initialize(opts = {})
    total = set_total(opts[:max])
    self.num1 = opts[:num1] || rand(total)
    self.num2 = opts[:num2] || total - self.num1
    self.answer = opts[:answer]
  end

  def correct?
    self.num1.to_i + self.num2.to_i == self.answer.to_i
  end

  def set_total(value = 10)
    rand(value.to_i - 1) + 1
  end

  def to_h
    { num1: self.num1, num2: self.num2, answer: self.answer }
  end

  def to_json
    self.to_h.to_json
  end
end

post '/addition.json' do
  Addition.new(params).to_json
end

post '/additionchecker.json' do
  {correct: Addition.new(params).correct?}.to_json
end
