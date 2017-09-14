class CodicesController < ApplicationController
  def create
    @codex = Codex.new(codex_params)
    if @codex.save
      redirect_to @codex, notice: 'Codex Saved'
    else
      flash[:error] = 'Codex Not Saved'
      render :new
    end
  end

  def update
    @codex = Codex.find(params[:id])
    if @codex.update_attributes(codex_params)
      redirect_to @codex, notice: 'Codex Saved'
    end
  end

  private

  def codex_params
    params.require(:codex).permit(:name)
  end
end
