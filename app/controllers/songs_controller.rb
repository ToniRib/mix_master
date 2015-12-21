class SongsController < ApplicationController
  def index
    if params[:artist_id].nil?
      @songs = Song.all
    else
      @songs = Song.all.where(artist_id: params[:artist_id])
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    render :edit
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
