namespace :webserver do
  desc "import webserver file"
  task import: :environment do
    filename = ENV['FILE']
    response = WebServerVisit.import_webserver_file(filename)
    p response
  end

  task most_page_views: :environment do
    response = WebServerVisit.most_page_views
    response.each do |page, views|
      p "#{page} #{views} visits"
    end
  end

  task most_unique_page_views: :environment do
    response = WebServerVisit.most_unique_page_views
    response.each do |page, views|
      p "#{page} #{views} unique views"
    end
  end

  task clear_database: :environment do
    Webpage.destroy_all
    Server.destroy_all
    Visit.destroy_all
  end

end
