set :protection, except: :session_hijacking

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:login_username], params[:login_password])
    puts @user
    session[:username] = @user.username
    session[:user_id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end

end

post '/acc' do
  @user = User.create(params[:user])
  Album.create(name:'default album',user_id:@user.id)
  session[:username] = @user.username
  session[:user_id] = @user.id
  redirect to '/'
end

get '/logout' do
  session[:username] = nil
  session[:user_id] = nil
  redirect to '/'
end