class SongsController < ApplicationController
before_action :song_select, only: [:edit, :show, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))

      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    Song.destroy(params[:id])
    redirect_to songs_path
  end

  private

  def song_select
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end