get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/shorten' do
  url = params[:url]
end

get '/:short' do
end