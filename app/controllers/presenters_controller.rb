class PresentersController < ApplicationController
    
    before_action :init
    
  def init
        @for_edit = false
        @workshop_id = -1
  end
  
  
  def new
      @presenter = Presenter.new
      @for_edit = params[:for_edit]
      @workshop_id = params[:workshop_id]
       
  end

  def create
      @presenter = Presenter.new(secure_params)
      if @presenter.save
         
          if params[:presenter][:for_edit] == "true"
              redirect_to edit_workshop_path(params[:presenter][:workshop_id])
          else
              redirect_to new_workshop_path
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
      params.require(:presenter).permit(:name,:position, :workshop_id, :for_edit)
  end
end
