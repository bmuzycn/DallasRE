//
//  SearchResult.swift
//  DallasRE
//
//  Created by Yu Zhang on 8/11/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
/*The API result set:
PARAMETER    DESCRIPTION
zpid    The Zillow Property ID. Other API calls use this ZPID to identify properties, and to retrieve property-specific data.
Links    URLs to specific Zillow pages for this property:
    Home details page
Chart data page
Map this home page
Similar sales page
Full address    The complete address for the property:
    Street address
ZIP code
City
State
Latitude
Longitude
Zestimate data    Zestimate related data:
Zestimate (in $)
Last updated date
30-day change (in $)
Valuation range (high) (in $)
Valuation range (low) (in $)
Percentile Value
Rent Zestimate data    Rent Zestimate related data:
Rent Zestimate (in $)
Last updated
30-day change (in $)
Valuation range (high) (in $)
Valuation range (low) (in $)
Local real estate    Real estate data for neighborhood, city, and State
    Zillow Home Value Index
    Zillow Home Value Index 1-Yr change
    Link to Region overview Page
    Link to For Sale by Owner homes page
    Link to for sale homes page
Limit-warning    If this field is set to "true", it means you are approaching your call limit. It appears under the 'message' element in the API result set:
<message>
&nbsp; <text>Request successfully processed</text>
&nbsp; <code>0</code>
&nbsp; <limit-warning>true</limit-warning>
</message>
This output field will not be returned if it is false.
 <SearchResults:searchresults xsi:schemaLocation="http://www.zillow.com/static/xsd/SearchResults.xsd /vstatic/ae1bf8a790b67ef2e902d2bc04046f02/static/xsd/SearchResults.xsd">
 <request>
 <address>2114 Bigelow Ave</address>
 <citystatezip>Seattle, WA</citystatezip>
 </request>
 <message>
 <text>Request successfully processed</text>
 <code>0</code>
 </message>
 <response>
 <results>
 <result>
 <zpid>48749425</zpid>
 <links>
 <homedetails>
 http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/
 </homedetails>
 <graphsanddata>
 http://www.zillow.com/homedetails/charts/48749425_zpid,1year_chartDuration/?cbt=7522682882544325802%7E9%7EY2EzX18jtvYTCel5PgJtPY1pmDDLxGDZXzsfRy49lJvCnZ4bh7Fi9w**
 </graphsanddata>
 <mapthishome>http://www.zillow.com/homes/map/48749425_zpid/</mapthishome>
 <comparables>http://www.zillow.com/homes/comps/48749425_zpid/</comparables>
 </links>
 <address>
 <street>2114 Bigelow Ave N</street>
 <zipcode>98109</zipcode>
 <city>Seattle</city>
 <state>WA</state>
 <latitude>47.63793</latitude>
 <longitude>-122.347936</longitude>
 </address>
 <zestimate>
 <amount currency="USD">1219500</amount>
 <last-updated>11/03/2009</last-updated>
 <oneWeekChange deprecated="true"/>
 <valueChange duration="30" currency="USD">-41500</valueChange>
 <valuationRange>
 <low currency="USD">1024380</low>
 <high currency="USD">1378035</high>
 </valuationRange>
 <percentile>0</percentile>
 </zestimate>
 <localRealEstate>
 <region id="271856" type="neighborhood" name="East Queen Anne">
 <zindexValue>525,397</zindexValue>
 <zindexOneYearChange>-0.144</zindexOneYearChange>
 <links>
 <overview>
 http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/
 </overview>
 <forSaleByOwner>
 http://www.zillow.com/homes/fsbo/East-Queen-Anne-Seattle-WA/
 </forSaleByOwner>
 <forSale>
 http://www.zillow.com/east-queen-anne-seattle-wa/
 </forSale>
 </links>
 </region>
 <region id="16037" type="city" name="Seattle">
 <zindexValue>381,764</zindexValue>
 <zindexOneYearChange>-0.074</zindexOneYearChange>
 <links>
 <overview>
 http://www.zillow.com/local-info/WA-Seattle/r_16037/
 </overview>
 <forSaleByOwner>http://www.zillow.com/homes/fsbo/Seattle-WA/</forSaleByOwner>
 <forSale>http://www.zillow.com/seattle-wa/</forSale>
 </links>
 </region>
 <region id="59" type="state" name="Washington">
 <zindexValue>263,278</zindexValue>
 <zindexOneYearChange>-0.066</zindexOneYearChange>
 <links>
 <overview>
 http://www.zillow.com/local-info/WA-home-value/r_59/
 </overview>
 <forSaleByOwner>http://www.zillow.com/homes/fsbo/WA/</forSaleByOwner>
 <forSale>http://www.zillow.com/wa/</forSale>
 </links>
 </region>
 </localRealEstate>
 </result>
 </results>
 </response>
 </SearchResults:searchresults>
*/

import Foundation

struct SearchResult {
    var message: Message
    var zipid: String
    var links: String
    var address: Address
    var zestimate: Zestimate
    var localRealEstate: LocalRealEstate
}

struct Message {
    var text: String
    var code: Int
    var limit: Bool
}

struct Address {
    var street: String
    var zipCode: Int
    var city: String
    var state: String
    var latitude: Double
    var longitude: Double
}

struct Zestimate {
    var amount: Int
    var lastUpdated: String
    var valueChange: Int
    var valuationRange: [String: Int]
}

struct LocalRealEstate {
    var regionID: Int
    var name: String
    var zindexValue: Int
    var zindexOneYearChange: Double
}


