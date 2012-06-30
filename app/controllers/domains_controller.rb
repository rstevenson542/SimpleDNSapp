class DomainsController < ApplicationController
  
  before_filter :dns_client
  
  def dns_client
    @dns = CloudDns::Client.new(:username => '#', :api_key => '#')
  end
  
  def index
    @domains = @dns.domains
  end
  
  def show
    @records = @dns.domain(params[:id]).records
  end
  
  def edit
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