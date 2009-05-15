class InstancesController < ApplicationController
  
  def index
    @class = load_class
    @instances = Query.new.distinct(:s).where(:s, RDF::type, @class).execute(:flatten)
    @instances ||= []
  end
  
  def new
    @class = load_class
    @instance = @class.new
  end
  
  def create
    @class = load_class
    
    @instance = RDFS::Resource.new("http://www.r4isstatic.com/linkedata/whoninverse/#{Time.now.to_i}")
    @instance.rdf::type = @class
    params[:instance].each do |p,value| 
      n, p = p.split('::')
      property = Namespace.lookup(n, p)
      $adapter.add(@instance, property, value)
    end
    @instance.save
    
    redirect_to class_instances_path('ome:Expression')
  end
  
end
