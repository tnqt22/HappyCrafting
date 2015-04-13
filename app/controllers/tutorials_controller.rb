class TutorialsController < ApplicationController
    
  before_filter :authorize, only: [:new,:edit] 
  
  def index
    @tutorials = Tutorial.all
  end
  
  def new
    @tutorial = Tutorial.new
  end
  
  def create    
    @tutorial = Tutorial.new(params.require(:tutorial).permit(:user,:title,:description))        
  
    if @tutorial.save      
      render "success"    
    else      
      render "failure"    
    end  
  end
  
  def destroy    
    Tutorial.find(params[:id]).destroy        
    redirect_to tutorials_path , notice: "Tutorial destroyed!"  
  end
  
  def edit    
    @tutorial = Tutorial.find(params[:id])   
  end  

  def update    
    v = Tutorial.find(params[:id])        
    v.update(user: params[:user], title: params[:title], title: params[:description])  
  end
end
