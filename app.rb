# Require system libs (also gems)
require 'json'

# Require lib-files (not gems)
require './lib/tsp'




TSP_DIR = File.join(
    File.expand_path('..', __FILE__),
    'tsp-files')




get '/' do
  @tsp_files = tsp_file_list
  haml :index
end


get '/tsp/:file_name' do
  file = read_tsp_file( params[:file_name] )
  data = TSP.parse( file )

  content_type 'application/json'

  data.keys.map { |k|
    [data[k][:x], data[k][:y]]
  }.to_json
end





# Get the list of available TSP files.
def tsp_file_list
  files = []
  Dir[File.join(TSP_DIR, '*.tsp')].each do |file|
    files << File.basename(file, '.tsp')
  end
  files
end


# Read a particular TSP file into memory
def read_tsp_file( file_name )
  file_path = File.join( TSP_DIR, "#{file_name}.tsp" )
  File.open( file_path ).read
end
