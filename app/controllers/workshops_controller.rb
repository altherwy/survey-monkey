class WorkshopsController < ApplicationController
    
    
    helper_method :sort_column, :sort_direction
    
  def new
      @workshop = Workshop.new
  end
  
  def create
      @workshop = Workshop.new(secure_params)
     
      var = params[:workshop][:current]
      if var == "true"
          
          @workshop.upcoming = "f"
      else
          @workshop.upcoming = "t"
      end
      if @workshop.save
          redirect_to workshops_admin_home_path
      else
          render action: 'new'
      end
  end 
  
  def show
    @workshop = Workshop.find(params[:id])
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end
  
  def update
      @workshop = Workshop.find(params[:id])
       var = params[:workshop][:current]
      if var == "true"
          
          @workshop.upcoming = "f"
      else
          @workshop.upcoming = "t"
      end
      if @workshop.update_attributes(secure_params)
        redirect_to workshops_admin_home_path
      else
        render 'edit'
      end
    end

  def destroy
      @workshop = Workshop.find(params[:id]).destroy
      
      redirect_to workshops_admin_home_path
  end
  
  def home
      session[:admin] = false
      Workshop.all
      move_to_past
      @upcoming_workshops = Workshop.where(upcoming: true).order(sort_column+ " " + sort_direction)
      @current_workshops = Workshop.where(current: true).order(sort_column+ " " + sort_direction)
      @past_workshops = Workshop.where(current: false, upcoming: false).order(sort_column+ " " + sort_direction)
  end
  
  def admin_home
      
      session[:admin] = true
      Workshop.all
      move_to_past
      @upcoming_workshops = Workshop.where(upcoming: true).order(sort_column+ " " + sort_direction)
      @current_workshops = Workshop.where(current: true).order(sort_column+ " " + sort_direction)
      @past_workshops = Workshop.where(current: false, upcoming: false).order(sort_column+ " " + sort_direction)
	
  end
  
  
  def show_single_record
      @workshop = Workshop.find(params[:id])
      @show_single_record_admin = params[:show_single_record_admin]
      
  end
  
  private
  
    
    
    def secure_params
        params.require(:workshop).permit(:title,:date,:goals,:skills, :current, :upcoming , {presenter_ids: []})
    end
     def sort_column
        Workshop.column_names.include?(params[:sort]) ? params[:sort] : "id"
     end
  
     def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
     def move_to_past
	@workshops = Workshop.all
	@workshops.each do |workshop|
		_date = workshop.date
		if _date < Date.today
		   workshop.upcoming = "f"
		   workshop.current = "f"
		   workshop.save
		end		
	end
     end
end
