class PracticeSessionsController < ApplicationController
  def create
    if practice_session.save
      @practice_session_song = practice_session.practice_session_songs.create
      redirect_to @practice_session_song, notice: 'Slow Is Faster!'
    else
      flash[:error] = 'Could Not Start Practice Session'
      redirect_to codex
    end
  end

  def update
    practice_session.update_attributes(done: true)
    redirect_to codex, notice: 'Progress, Not Perfection'
  end

  private

  def codex
    @codex ||= Codex.find(params[:codex_id])
  end

  def practice_session
    @practice_session ||= (
      params[:id] ? PracticeSession.find(params[:id]): codex.practice_sessions.build
    )
  end
end
