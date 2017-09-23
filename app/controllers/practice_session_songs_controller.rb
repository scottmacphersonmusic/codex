class PracticeSessionSongsController < ApplicationController
  def create
    @practice_session = PracticeSession.find(params[:practice_session_id])
    @practice_session_song = @practice_session.practice_session_songs.build
    @practice_session_song.save
    redirect_to practice_session_song_path(@practice_session, @practice_session_song)
  end
end
