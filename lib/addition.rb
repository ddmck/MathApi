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