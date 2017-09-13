class SubscribersController < ApplicationController
  def new
      @subscriber = Subscriber.new
      @departments = Department.all
      
      
      
  end
  
  def create
      @subscriber = Subscriber.new(secure_params)
      @workshop = Workshop.find(@subscriber.work_id)
      @subscriber.workshops << @workshop
      if @subscriber.save        
          flash[:notice] = "You have registered"
          redirect_to root_path
      else
          render action: "new"
      end
  end
  
  
  private
  
  def secure_params
        params.require(:subscriber).permit(:title,:name,:position,:email,:phone,:department_id, :work_id, {workshop_ids: []})
        
        
    end
end
