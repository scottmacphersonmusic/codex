class PracticeSessionsController < ApplicationController
  def start
    @codex = Codex.find(params[:codex_id])
    @practice_session = @codex.practice_sessions.build
    if @practice_session.save
      @practice_session_song = @practice_session.practice_session_songs.create
      redirect_to @practice_session_song, notice: 'Slow Is Faster!'
    else
      flash[:error] = 'Could Not Start Practice Session'
      redirect_to @codex
    end
  end
end
