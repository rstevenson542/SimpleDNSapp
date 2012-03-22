class DomainsController < ApplicationController
  # 
  # before_filter :initialize_client
  #  
  #  def initialize_client
  #    dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
  #  end
  
  before_filter :dns_client
  
  def dns_client
    @dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
  end
  
  def index
    # @dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    @domains = @dns.domains
  end
  
  def show
    # @dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    @records = @dns.domain(params[:id]).records
  end
  
  def edit
    # @dns = CloudDns::Client.new(:username => 'abhiandrob', :api_key => 'b106bad3a9946857304ec861d180645b')
    @domain = @dns.domain(params[:id])
  end
  
  def update
    @domain = @dns.domain(3194041)
    @domain.name = params[:name]
    @domain.save
    
    logger.debug "Domain name saved from client: #{@dns.domain(3194041).name}"
    redirect_to domains_url, :notice => "The domain name was updated to #{@domain.name}"
  end
  
  def destroy
    @domain = @dns.domain(params[:id])
    @domain.delete
    
    redirect_to domains_url, :notice => "The domain - #{@domain.name} - was deleted from the records"
  end
  
end