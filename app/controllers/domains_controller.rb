class DomainsController < ApplicationController
  
  def index
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    @domains = dns.domains
    
  end
  
  def show
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    @records = dns.domain(params[:id]).records
  end
  
  
end