class CodicesController < ApplicationController
  before_action :codex, only: [:show, :edit]

  def index
    @codices = Codex.all
    @instruments = Instrument.all
  end

  def new
    @codex = Codex.new
  end

  def create
    if codex.save
      redirect_to @codex, notice: 'Codex Saved'
    else
      flash.now[:error] = 'Codex Not Saved'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if codex.update_attributes(codex_params)
      redirect_to @codex, notice: 'Codex Saved'
    else
      flash.now[:error] = 'Codex Not Saved'
      render :edit
    end
  end

  def destroy
    codex.destroy
    redirect_to codices_path, notice: 'Codex Deleted'
  end

  private

  def codex_params
    params.require(:codex).permit(:name)
  end

  def codex
    @codex ||= params[:id] ? Codex.find(params[:id]) : Codex.new(codex_params)
  end
end
