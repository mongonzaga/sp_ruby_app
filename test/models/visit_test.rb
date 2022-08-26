require "test_helper"

class VisitTest < ActiveSupport::TestCase

  def setup
    @webpage = Webpage.new(page_name: '/index')
    @server = Server.new(ip_address: '192.168.1.1')
  end

  test "valid visit" do
    page_visit = Visit.new(webpage: @webpage, server: @server)
    assert page_visit.valid?
  end

  test "invalid with incomplete fields" do
    page_visit = Visit.new
    refute page_visit.valid?

    page_visit = Visit.new(server: @server)
    refute page_visit.valid?

    page_visit = Visit.new(webpage: @webpage)
    refute page_visit.valid?
  end

end
