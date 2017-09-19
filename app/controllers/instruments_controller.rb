class InstrumentsController < ApplicationController
  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to @instrument, notice: 'Instrument Saved'
    else
      flash.now[:error] = 'Instrument Not Saved'
      render :new
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :key)
  end
end
