class WorkshopsController < ApplicationController
    
    
    helper_method :sort_column, :sort_direction
    
  def new
      @workshop = Workshop.new
      @presenter = Presenter.new
  end
  
  def create
      @workshop = Workshop.new(secure_params)
      if @workshop.save
          redirect_to workshops_admin_home_path
      else
          render action: 'new'
      end
  end

  def update
  end

  def delete
  end
  
  def home
      session[:admin] = false
      Workshop.all
      @upcoming_workshops = Workshop.where(upcoming: true).order(sort_column+ " " + sort_direction)
      @current_workshops = Workshop.where(current: true).order(sort_column+ " " + sort_direction)
      @past_workshops = Workshop.where(current: false, upcoming: false).order(sort_column+ " " + sort_direction)
  end
  
  def admin_home
      
      session[:admin] = true
      Workshop.all
  end
  
  
  def show_single_record
      @workshop = Workshop.find(params[:id])
  end
  
  private
  
    def secure_params
        params.require(:workshop).permit(:title,:date,:goals,:skills,:presenters_attributes => [:name,:position])
        
    end
     def sort_column
        Workshop.column_names.include?(params[:sort]) ? params[:sort] : "id"
     end
  
     def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
end
