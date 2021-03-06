class SongsController < ApplicationController
  before_action :codex, only: [:new, :show, :edit]
  before_action :song, only: [:show, :edit]

  def new
    @song = codex.songs.build
  end

  def create
    if song.save
      song.codex_songs.create(codex: codex, song: song)
      redirect_to codex, notice: "'#{song.title}' Saved To #{codex.name}"
    else
      flash.now[:error] = 'Song Not Saved'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if song.update_attributes(song_params)
      redirect_to codex, notice: 'Song Saved'
    else
      flash.now[:error] = 'Song Not Saved'
      render :edit
    end
  end

  def destroy
    song.destroy
    redirect_to codex, notice: "'#{song.title}' Deleted"
  end

  private

  def song_params
    params.require(:song).permit(:title, :key)
  end

  def codex
    @codex ||= Codex.find(params[:codex_id])
  end

  def song
    @song ||= (
      params[:id] ? Song.find(params[:id]) : codex.songs.build(song_params)
    )
  end
end
