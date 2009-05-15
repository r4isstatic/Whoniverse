require 'active_rdf'

ontologies = YAML.load_file(File.join(RAILS_ROOT, 'config', 'ontologies.yml'))

$adapter = ConnectionPool.add_data_source(:type => :redland, :location => 'test')
if $adapter.size==0
  ontologies.each do |ontology|
    $adapter.load(ontology[:uri], ontology[:format])
  end
  $adapter.save
end  

ontologies.each do |ontology|
  Namespace.register(ontology[:namespace], ontology[:uri].gsub('.owl', '#')) unless ontology[:namespace].nil?
end
ObjectManager.construct_classes
