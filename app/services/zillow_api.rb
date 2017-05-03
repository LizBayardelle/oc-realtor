class ZillowApi
  include HTTParty
  base_uri 'http://www.zillow.com/webservice'

  def zestimate(zpid = nil)
    raise ArgumentError, "The zpid option is required" unless zpid

    response = self.class.get('/GetZestimate.htm', query_params(zpid: zpid) )
    OpenStruct.new zest_data(response)
  end

  def deep_search_results(citystatezip: nil, address: nil)
    raise ArgumentError, "The citystatezip option is required" unless citystatezip
    raise ArgumentError, "The address option is required" unless address

    res = self.class.get('/GetDeepSearchResults.htm', query_params({citystatezip: citystatezip, address: address}))
    OpenStruct.new deep_search_data(res)
  end

  def updated_property_details(zpid = nil)
    raise ArgumentError, "The zpid option is required" unless zpid

    res = self.class.get('/GetUpdatedPropertyDetails.htm', query_params(zpid: zpid))
    OpenStruct.new property_details_data(res)
  end

  private
  def query_params(options = {})
    # this should go into an environment variable
    zws_id = "X1-ZWz1frh4ucm4nf_8l13j"

    params = {'zws-id': zws_id}.merge(options)
    {query: params}
  end

  def zest_data(zillow_res)
    # handle api errors first
    message = zillow_res['zestimate']['message']
    return {error: message['text']} unless message['code'].to_s == '0'

    # add as more properties as needed here.
    {
      price:      zillow_res['zestimate']['response']['zestimate']['amount']['__content__'],
      price_high: zillow_res['zestimate']['response']['zestimate']['valuationRange']['high']['__content__'],
      price_low:  zillow_res['zestimate']['response']['zestimate']['valuationRange']['low']['__content__'],
      links:      zillow_res['zestimate']['response']['links']
    }
  end

  def deep_search_data(zillow_res)
    # handle api errors first
    message = zillow_res['searchresults']['message']
    return {error: message['text']} unless message['code'].to_s == '0'

    # results sometimes comes in as an array here.
    result = zillow_res['searchresults']['response']['results']['result']
    result = result.first if result.is_a? Array

    # add as more properties as needed here.
    {
      links:                result['links'],
      finished_square_feet: result['finishedSqFt'],
      latitude:             result['address']['latitude'],
      longitude:            result['address']['longitude'],
      bathrooms:            result['bathrooms'],
      bedrooms:             result['bedrooms'],
    }
  end

  def property_details_data(zillow_res)
    # handle api errors first
    message = zillow_res['updatedPropertyDetails']['message']
    return {error: message['text']} unless message['code'].to_s == '0'

    # add as more properties as needed here.
    {
      images: zillow_res['updatedPropertyDetails']['response']['images']['image']['url']
    }
  end
end