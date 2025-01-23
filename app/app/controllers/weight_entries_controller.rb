class WeightEntriesController < ApplicationController
  before_action :set_weight_entry, only:[:show, :destroy]

  def index
    @weight_entries = WeightEntry.order(date: :desc)
  end 

  def new
    @weight_entry = WeightEntry.new
  end

  def create
    @weight_entry = WeightEntry.new(weight_entry_params)

    if @weight_entry.save
      redirect_to weight_entries_path, notice: 'Votre suivi de poids à été ajouté avec succés'
    else 
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def destroy
    @weight_entry.destroy
    redirect_to weight_entries_path, notice: 'L\'objet à bien été supprimé'
  end
  
  private 
    def weight_entry_params
      params.require(:weight_entry).permit(:weight, :date)
    end

    def set_weight_entry
      @weight_entry = WeightEntry.find(params[:id])        
    end
end
