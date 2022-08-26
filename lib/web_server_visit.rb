class WebServerVisit

  IMPORT_DIRECTORY = "#{Rails.root}/public/import/"

  def self.import_webserver_file(filename)

    begin

      raise 'Input file is required' unless filename.present?
      file_path = IMPORT_DIRECTORY + filename
      raise 'Input file not found' unless File.exist?(file_path)

      File.open(file_path).readlines.each do |line|

        page_name, ip_address = line.split

        Rails.logger.debug( "page_name: #{page_name}, ip_address: #{ip_address}" )

        webpage = Webpage.find_or_create_by(page_name: page_name)
        server = Server.find_or_create_by(ip_address: ip_address)

        if webpage && server
          page_visit = Visit.new(webpage: webpage, server: server)
          page_visit.save
        end

      end

      return 'Import Success'

    rescue => exception
      Rails.logger.debug(exception.backtrace)
      return exception
    end

  end

  def self.most_page_views
     Webpage.joins(:visits).group('page_name').order('COUNT(visits.id) DESC').count
  end

  def self.most_unique_page_views
    Webpage.joins(:visits).group('page_name').select('DISTINCT(server_id)').order('COUNT(visits.id) DESC').count
  end

end