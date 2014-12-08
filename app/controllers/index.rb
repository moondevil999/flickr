set :protection, except: :session_hijacking

get '/' do
  # Look in app/views/index.erb
  @photo = Photo.all
  erb :index
end

get '/users/:user_id/albums' do
  @albums = Album.where(user_id:params[:user_id])
  erb :album
end