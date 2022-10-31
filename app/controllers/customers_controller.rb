class CustomersController < ApplicationController

  def show
    # require 'pry'; binding.pry
    @customer = Customer.find(params[:id])
    # require 'pry'; binding.pry
    # @customer_items = CustomerItems.find_by(items_id: params[:items_id], customer_id: params[:id])
  end
end