class SongsController < ApplicationController
  def create
    @codex = Codex.find(params[:codex_id])
    @song = @codex.songs.build(song_params)
    if @song.save
      @song.codex_songs.create(codex: @codex, song: @song)
      redirect_to @codex, notice: "'#{@song.title}' Added To #{@codex.name}"
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :key)
  end
end
