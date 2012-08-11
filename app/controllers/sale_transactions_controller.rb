class SaleTransactionsController < ApplicationController

  respond_to :json, only: :index

  def index
    @sale_transactions = SaleTransaction.summary(params[:summary])
    respond_with(@sale_transactions) do |format|
      format.html { render }
      format.json { render json: @sale_transactions}
    end
  end

  def destroy
    return_complete = SalesControl.return_transaction(params[:sale_id], params[:id])
    if return_complete
      flash[:success] = "La transaccion fue cancelada de  forma exitosa."
    else
      flash[:error] = "La transaccion no pudo ser devuelta."
    end
    redirect_to request.referrer
  end
end
