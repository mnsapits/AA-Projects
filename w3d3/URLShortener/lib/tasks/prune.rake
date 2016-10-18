namespace :prune do
  desc "Removes urls over a day old"
  task prune_old_urls: :environment do
    puts "Pruning old urls..."
    ShortenedUrl.prune(1440)
  end
end
