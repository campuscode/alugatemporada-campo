class ProposalsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @proposal = Proposal.new
  end

  def create
    proposal_params = params.require(:proposal).permit(
      :name, :email, :phone, :rent_purpose, :total_guest,
      :start_date, :end_date, :pet, :smoker, :total_amount,
      :details, :property_id
    )

    @property = Property.find(params[:property_id])
    @proposal = Proposal.new(proposal_params)
    @proposal.property = @property

    if @proposal.save
      flash[:notice] = 'Sua proposta foi enviada com sucesso!'
      redirect_to property_path(@property)
    else
      flash[:errors] = 'Não foi possível envia sua proposta!'
      render :new
    end
  end

  def index
    @proposals = Proposal.where(property_id: params[:property_id])
  end
end
