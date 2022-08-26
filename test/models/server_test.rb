require "test_helper"

class ServerTest < ActiveSupport::TestCase

  test "valid server" do
    server = Server.new(ip_address: '192.168.1.1')
    assert server.valid?
  end

  test "invalid without ip address" do
    server = Server.new(ip_address: '')
    refute server.valid?
  end

end
