class CodicesController < ApplicationController
  def create
    @codex = Codex.new(codex_params)
    if @codex.save
      redirect_to @codex, notice: 'Codex Added'
    end
  end

  private

  def codex_params
    params.require(:codex).permit(:name)
  end
end
