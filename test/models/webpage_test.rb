require "test_helper"

class WebpageTest < ActiveSupport::TestCase

  test "valid webpage" do
    webpage_1 = Webpage.new(page_name: '/index')
    assert webpage_1.valid?

    webpage_2 = Webpage.new(page_name: '/index/1')
    assert webpage_2.valid?
  end

  test "invalid without page name" do
    webpage = Webpage.new(page_name: '')
    refute webpage.valid?
  end

  test "invalid page name format" do
    webpage_1 = Webpage.new(page_name: 'index')
    refute webpage_1.valid?, "Invalid format"

    webpage_2 = Webpage.new(page_name: '/index/1/')
    refute webpage_2.valid?, "Invalid format"
  end

end
