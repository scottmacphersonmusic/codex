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

  def update
    if instrument.update_attributes(instrument_params)
      redirect_to instrument, notice: 'Instrument Saved'
    else
      flash.now[:error] = 'Instrument Not Saved'
      render :edit
    end
  end

  def destroy
    instrument.destroy
    redirect_to instruments_url, notice: 'Instrument Deleted'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :key)
  end

  def instrument
    @instrument = Instrument.find(params[:id])
  end
end
