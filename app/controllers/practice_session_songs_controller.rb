class PracticeSessionSongsController < ApplicationController
  before_action :practice_session, :practice_session_song, only: :show

  def create
    @practice_session_song = practice_session.practice_session_songs.build
    practice_session_song.save
    redirect_to practice_session_song_path(practice_session, @practice_session_song)
  end

  def show
  end

  private

  def practice_session
    @practice_session ||= PracticeSession.find(params[:practice_session_id])
  end

  def practice_session_song
    @practice_session_song ||= (
      params[:id] ? PracticeSessionSong.find(params[:id]) : practice_session.practice_session_songs.build
    )
  end
end
