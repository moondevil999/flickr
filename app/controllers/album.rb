set :protection, except: :session_hijacking

get '/upload' do
  if session[:username]
    @album = Album.where(user_id:session[:user_id])
    erb :upload
  else
    redirect to '/login'
  end
end

post '/create/album' do
  Album.create(user_id:session[:user_id],name:params[:album_name])
  redirect to '/upload'
end

get '/album/:album_id' do
  @photos = Photo.where(album_id: params[:album_id])
  erb :photo
end