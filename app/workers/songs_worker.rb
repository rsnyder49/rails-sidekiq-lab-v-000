class SongsWorker
 	require 'csv'
 	include Sidekiq::Worker
 
  def perform(file)
 		CSV.foreach(file, headers: true) do |song|
 			Artist.find_or_create_by(name: song[1]).songs.find_or_create_by(title: song[0])
 	  end
 	end
 	
 end