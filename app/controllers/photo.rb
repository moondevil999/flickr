set :protection, except: :session_hijacking

post '/upload/photo' do
  album = Album.find_by_name(params[:album])
  puts params[:album]
  puts album
  p = Photo.new(album_id:album.id)
  p.imagefile = params[:filename]
  p.save!
  redirect to '/'
end

