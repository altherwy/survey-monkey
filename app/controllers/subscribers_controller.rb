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
  
  def edit_all
      @subscribers = Subscriber.includes(:workshops).where(workshops: { id: params[:id] })
  end
  
  def update_all
          
      
      params[:subscriber].keys.each do |id|
          @subscriber = Subscriber.find(id.to_i)
          @subscriber.update_attributes(edit_secure_params(id))
      end
      
      redirect_to workshops_admin_home_path
  end
  
  private
  
  def secure_params
        params.require(:subscriber).permit(:title,:name,:position,:email,:phone,:department_id, :work_id, {workshop_ids: []})
  end
  
  def edit_secure_params(id)
     params[:subscriber][id].permit(:attend)
  end
end
