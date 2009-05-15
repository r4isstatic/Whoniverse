class ClassesController < ApplicationController
  
  def index
    @classes = OWL::Class.find_all
  end
  
  def show
    @class = load_class
  end
end
