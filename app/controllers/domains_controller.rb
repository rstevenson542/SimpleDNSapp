class DomainsController < ApplicationController
  # 
  # before_filter :initialize_client
  #  
  #  def initialize_client
  #    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
  #  end
  
  def index
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    
    @domains = dns.domains
  end
  
  def show
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    
    @records = dns.domain(params[:id]).records
  end
  
  def edit
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    
    @domain = dns.domain(params[:id])
  end
  
  def update
    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    domain = dns.domain(params[:id])
    domain.name = params[:name]
    domain.save
    redirect_to root_url, :notice => "You\'re domain has been successfully changed to #{params[:name]}"

  end
end