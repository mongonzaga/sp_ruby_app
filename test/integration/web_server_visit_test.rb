require "test_helper"
require 'rake'

class WebServerVisitTest < ActiveSupport::TestCase

  def setup
    @filename = 'test_webserver.log'
    @filepath = WebServerVisit::IMPORT_DIRECTORY + @filename
    file = File.new(@filepath, "w+")

    data = ['/home 192.168.1.1', '/home 192.168.1.1', '/home 192.168.1.1', '/home 192.168.1.2', '/home 192.168.1.3',
            '/index 192.168.1.1', '/index 192.168.1.1', '/index 192.168.1.2', '/index 192.168.1.2',
            '/about 192.168.1.1', '/about 192.168.1.2']

    data.each do |d|
      file.puts(d)
    end
    file.close
  end

  def teardown
    Webpage.destroy_all
    Server.destroy_all
    Visit.destroy_all
    File.delete(@filepath)
  end

  test "valid import" do
    response = WebServerVisit.import_webserver_file(@filename)
    assert_equal response.to_s, 'Import Success'
  end

  test "invalid import file" do
    response = WebServerVisit.import_webserver_file('')
    assert_equal response.to_s, 'Input file is required'

    response = WebServerVisit.import_webserver_file('file_not_existing.log')
    assert_equal response.to_s, 'Input file not found'
  end

  test "most_page_views" do
    response = WebServerVisit.import_webserver_file(@filename)
    assert_equal response.to_s, 'Import Success'
    response = WebServerVisit.most_page_views
    assert_equal response, {"/home"=>5, "/index"=>4, "/about"=>2}
  end

  test "most_unique_page_views" do
    response = WebServerVisit.import_webserver_file(@filename)
    assert_equal response.to_s, 'Import Success'
    response = WebServerVisit.most_unique_page_views
    assert_equal response, {"/home"=>3, "/index"=>2, "/about"=>2}
  end

end