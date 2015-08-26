get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/shorten' do
  url = params[:url]
  new_url = Url.new(original: url)
  new_url.short = new_url.shorten
  new_url.save
end

get '/:short' do
end