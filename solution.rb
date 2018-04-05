require 'sinatra'
require 'make_todo'


class Tarea
 @list = {}

 attr_accessor :name

 def initialize(name)
   @name = name
 end
end



get '/' do
  @list = Tarea.all()
  erb(:list)
end


post ('/') do
  name = params["name"]
  tarea = Tarea.new(name)
  tarea.save()
  @list = Tarea.all()
  erb(:list)
end
