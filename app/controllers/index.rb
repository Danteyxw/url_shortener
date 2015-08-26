get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/shorten' do
  url = params[:url]
  if (new_url = Url.new(original: url)).valid?
    new_url.short = new_url.shorten
    new_url.save
    "Your shortened URL: localhost::9393/#{new_url.short}"
  else
    "Invalid URL"
  end
end

get '/:short' do
  short = params[:short]
  url = Url.find_by(short: short)
  url.click_count = url.click_count.to_i + 1
  url.save
  original = url.original
  redirect "#{original}"
end