class PresentersController < ApplicationController
  def new
      @presenter = Presenter.new
      
  end

  def create
      @presenter = Presenter.new(secure_params)
      if @presenter.save
          
          respond_to do |format|
              format.js { render "workshops/new"}
          end
      else
          render action: 'new'
      end
  end
  def update
  end

  def delete
  end
  
  private
  def secure_params
      params.require(:presenter).permit(:name,:position)
  end
end
