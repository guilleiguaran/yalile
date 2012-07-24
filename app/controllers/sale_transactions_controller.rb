class SaleTransactionsController < ApplicationController

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
