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
    @instrument = Instrument.find(params[:id])
    if @instrument.update_attributes(instrument_params)
      redirect_to @instrument, notice: 'Instrument Saved'
    else
      flash.now[:error] = 'Instrument Not Saved'
      render :edit
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_url, notice: 'Instrument Deleted'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :key)
  end
end
