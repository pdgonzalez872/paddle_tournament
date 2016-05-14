class DrawsController < ApplicationController
  def show
    @draw = Draw.find(params[:id])
  end

  def edit
    @draw = Draw.find(params[:id])
  end
end
