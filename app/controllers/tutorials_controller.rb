class TutorialsController < ApplicationController
    
  #before_filter :authorize, only: [:new,:edit] 
  before_action :authorize, only: [:new, :edit, :update, :destroy] 
  #before_action :correct_user, only: [:edit, :update, :destroy]
  
  #show searched tutorials (get)
  def index
    @search = Tutorial.search do
      fulltext params[:search]
    end
    @tutorials = @search.results
  end
  
  #add tutorial (get)
  def new
    @tutorial = Tutorial.new
  end

  #add tutorial (post)
  def create
    user = User.find_by(id: session[:user_id])
    user.tutorials.create(params.require(:tutorial).permit(:title,:description))
    redirect_to tutorials_path , notice: "Tutorial added!"
  end
  
  #delete tutorial
  def destroy    
    Tutorial.find(params[:id]).destroy        
    redirect_to tutorials_path , notice: "Tutorial destroyed!"  
  end

  #edit tutorial (get)
  def edit    
    @tutorial = Tutorial.find(params[:id]) 
  end  

  #update tutorial (post)
  def update 
    tutorial = Tutorial.find(params[:id])
    tutorial.update(title: params[:title], description: params[:description])
    redirect_to tutorials_path, notice: "Tutorial updated"
  end
  
  #show tutorial (get)
  def show_user_tutorials
    if session[:user_id]
      @user_tutorials = User.find(session[:user_id]).tutorials
    else
      render new_session_path
    end
  end

  private
    def tutorial_params
      params.require(:tutorial).permit(:title, :description)
    end

end
