class LoginsController < ApplicationController
  helper_method :current_user

  def show
#	connections
   	unless current_user.blank?
      profile = Profile.create_profile(current_user)
  	end
  end

  def create
    request_token = consumer.get_request_token(:oauth_callback => callback_login_url)
    Rails.cache.write(request_token.token, request_token.secret)
    redirect_to request_token.authorize_url
  end

  def callback
    request_token = OAuth::RequestToken.new(consumer, params[:oauth_token], Rails.cache.read(params[:oauth_token]))
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret
    redirect_to :action => :show
  end

  def logout
    reset_session
    redirect_to :action => :show
  end

  private
  CONSUMER_KEY = {
    :key => "GLOiGxmYXbsrPMniyIeNGyNgYpH3TahQSWllUUbDeHiR4MhbTThBed65vYh6Y0aA",
    :secret => "LD-X2PLn_yRuGXTiTaudCgqzll9TIXqeBnChkLRmrpyd5dvD2Xg0Q9j82WFZLcBM"
  }
  CONSUMER_OPTIONS = { :site => 'https://api.linkedin.com',
                     :authorize_path => '/uas/oauth/authorize',
                     :request_token_path => '/uas/oauth/requestToken',
                     :access_token_path => '/uas/oauth/accessToken' }

  def consumer
    @consumer ||= OAuth::Consumer.new( CONSUMER_KEY[:key], CONSUMER_KEY[:secret], CONSUMER_OPTIONS)
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth::AccessToken.new(consumer, session[:access_token], session[:access_token_secret])
    end
  end

  #Not using as of now
  #will be used to get all profile connections
  def connections
    if access_token
	
      @contactsr ||= JSON.parse(access_token.get('http://api.linkedin.com/uas/oauth/invalidateTokey))', 'x-li-format' => 'json').body)
    end
   #raise @contacts.inspect
    @contacts
  end

  def current_user
    if access_token
      @current_user ||= JSON.parse(access_token.get('http://api.linkedin.com/v1/people/~:(id,first-name,last-name,industry,headline,location,positions:(start-date,is-current,id,title,company,summary))', 'x-li-format' => 'json').body)
    end
    @current_user
  end

end
