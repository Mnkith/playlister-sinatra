
class SongsController < ApplicationController
  use Rack::Flash
  get '/songs' do
    # binding.pry
    erb :'/songs/index'
  end

  
  get '/songs/new' do 
    erb :'/songs/new'
  end
  
  post '/songs' do 
    song = Song.create params[:song]
    # binding.pry
    
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist
    # song.genre_ids = params[:genres]
    # song.genres << Genre.find_or_create_by(name: params[])
    song.save
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{ song.slug }"
    
  end
  get '/songs/:slug' do
    @song = Song.find_by_slug params[:slug]
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end


  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # song.genre_ids = params[:genres]
    song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{song.slug}")
  end

  # get '/songs/:id' do 
  #   song = Song.find params[:id]
  #   redirect to '/'
end