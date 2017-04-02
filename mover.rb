require "bundler/setup"
require "rubygems"

require 'fileutils'
require "listen"
require "pry-rails"

require_relative "file_type_handler"
PATH = '/Users/Dkhatri/Downloads'


def create_and_move_file(file, file_type)
  dir_name = PATH + '/' + file_type
  Dir.mkdir(dir_name) unless File.directory?(dir_name)
  FileUtils.mv(file, dir_name)
end


listener = Listen.to(PATH) do |modified, added, removed|
  added.each do |file|
    puts "added absolute path: #{file}"
    file_type = FileTypeHandler.new(file).type
    create_and_move_file(file,file_type) unless file_type == 'DOWNLOADING'
  end
  modified.each do |file|
    puts "modified absolute path: #{modified}"
    file_type = FileTypeHandler.new(file).type
    create_and_move_file(file,file_type) unless file_type == 'DOWNLOADING'
  end
  puts "removed absolute path: #{removed}"
end
listener.start # not blocking
sleep

def create_and_move_file(file, file_type)
  dir_name = PATH + file_type
  Dir.mkdir(dir_name) unless File.directory?(dir_name)
  FileUtils.mv(file, dir_name)
end
