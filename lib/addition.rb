class Addition
  attr_accessor :num1, :num2, :answer

  def initialize(opts = {})
    total = setTotal(opts[:max])
    self.num1 = opts[:num1] || rand(total)
    self.num2 = opts[:num2] || total - self.num1
    self.answer = opts[:answer]
  end

  def correct?
    if self.num1.to_i + self.num2.to_i == self.answer.to_i
      true
    else
      false
    end
  end

  def setTotal(value = 10)
    total = rand(value.to_i - 1) + 1
  end

  def to_h
    { num1: self.num1, num2: self.num2, answer: self.answer }
  end

  def to_json
    self.to_h.to_json
  end
end

def additionGenerator(opts = {})
  total = rand(opts[:max].to_i)
  num1 = rand(total)
  num2 = total - num1
  { :num1 => num1, :num2 => num2 }.to_json
end

def additionChecker(opts = {})
  if params[:num1].to_i + params[:num2].to_i == params[:answer].to_i
    returnCorrect
  else
    returnIncorrect
  end
end

post '/addition.json' do
  additionGenerator(params)
end

post '/additionchecker.json' do
  additionChecker(params)
end

post '/additionnew.json' do
  Addition.new(params).to_json
end

post '/additioncheckernew.json' do
  {correct: Addition.new(params).correct?}.to_json
end
