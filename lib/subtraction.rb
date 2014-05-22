def subtractionGenerator(opts = {})
  num1 = rand(opts[:max].to_i)
  num2 = rand(num1)
  { :num1 => num1, :num2 => num2 }.to_json
end

def subtractionChecker(opts = {})
  if opts[:num1].to_i - opts[:num2].to_i == opts[:answer].to_i
    returnCorrect
  else
    returnIncorrect
  end
end

post '/subtraction.json' do
  subtractionGenerator(params)
end

post '/subtractionchecker.json' do
  subtractionChecker(params)
end