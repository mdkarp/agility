require 'test_helper'
require 'integration/integration_test_helper'

class LifecycleTest < ActionController::IntegrationTest
  include IntegrationTestHelper
  self.fixture_path += "basic/"
  fixtures :all

  test "lifecycles" do
    login_administrator
    click_link "Foos"
    click_link "New Foo"
    click_button "Create Foo"
    click_button "Trans1"
    uncheck "foo[v]"
    click_button "Trans1"
    assert_contain "v must be true"
    check "foo[v]"
    click_button "Trans1"
    click_button "Trans2"
  end

end
