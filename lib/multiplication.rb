def multiplicationGenerator(opts = {})
  num1 = opts[:num1] || rand(opts[:max] || rand(10)
  num2 = opts[:num2] || rand(10)
  { :num1 => num1, :num2 => num2 }.to_json
end

def multiplicationChecker(opts = {})
  if params[:num1].to_i * params[:num2].to_i == params[:answer].to_i
    returnCorrect
  else
    returnIncorrect
  end
end

post '/multiplication.json' do
  multiplicationGenerator(params)
end

post 'multiplicationchecker.json' do
  multiplicationChecker(params)
end