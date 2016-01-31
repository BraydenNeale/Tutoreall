desc "Remove searches older than a day"
task :remove_old_searches => :environment do
  Search.delete_all ["created_at < ?", 1.day.ago]
end