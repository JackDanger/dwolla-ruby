require 'test/unit'
require 'mocha/test_unit'
require 'dwolla'

class DwollaTest < Test::Unit::TestCase
  def setup() 
    Dwolla.token = nil  
  end

  def test_no_authorization_if_oauthToken_false() 
    params = {}
    headers = {}
    Dwolla.extract_authorization(params, headers, false)
    assert_nil headers[:authorization]
  end

  def test_remove_token_from_params_if_oauthToken_false() 
    params = { :oauth_token => 'test'}
    headers = {}

    Dwolla.extract_authorization(params, headers, false)
    assert_nil params[:oauth_token]
    assert_nil headers[:authorization]
  end

  def test_add_app_credentials_to_params_if_oauthToken_false()
    params = {}
    headers = {}
    Dwolla.api_key = 'api key'
    Dwolla.api_secret = 'api secret'
    Dwolla.extract_authorization(params, headers, false)
    assert_nil headers[:authorization]
    assert_equal params[:client_id], 'api key'
    assert_equal params[:client_secret], 'api secret'  
  end

  def test_default_to_global_token()
    params = {}
    headers = {}
    token = 'test'
    Dwolla.token = token
    Dwolla.extract_authorization(params, headers)
    assert_equal headers[:authorization], "Bearer #{token}"
  end

  def test_pull_from_params()
    token = 'test'
    params = { :oauth_token => token }
    headers = {}
    Dwolla.extract_authorization(params, headers)
    assert_equal headers[:authorization], "Bearer #{token}"
    assert_nil params[:oauth_token]
  end

  def test_use_provided_token()
    token = 'test'
    params = {}
    headers = {}
    Dwolla.extract_authorization(params, headers, token)
    assert_equal headers[:authorization], "Bearer #{token}"
  end
end