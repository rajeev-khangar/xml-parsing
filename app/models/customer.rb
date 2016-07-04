require 'nokogiri'
require 'savon'

class Customer


  def self.call_xml
    client = Savon.client( wsdl: 'http://testonlinepay.telecel.co.zw/ObopayExternalWS/ObopayExternalWebServiceV1?WSDL')
  end

  def self.make_xml_file
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml['soapenv'].Envelope( 'xmlns:soapenv' => "http://schemas.xmlsoap.org/soap/envelope/"){
        xml.Header {
          xml['obons'].header( 'xmlns:obons'=> "http://www.obopay.com/xml/ns/tpu/v1" ,'name'=> "UserName" ).value "230096"
          xml['obons'].header( 'xmlns:obons'=> "http://www.obopay.com/xml/ns/tpu/v1" ,'name'=> "Password" ).value "4iZCFN0k6y79w6JqJmR6JQ=="
          xml['obons'].header( 'xmlns:obons'=> "http://www.obopay.com/xml/ns/tpu/v1" ,'name'=> "PartnerId" ).value "OBOPAY"
          xml['obons'].header( 'xmlns:obons'=> "http://www.obopay.com/xml/ns/tpu/v1" ,'name'=> "iv" ).value "SRIB/3XfDztw0a1+iDruvQ=="
        }
        xml.Body{
          xml['ns3'].process( 'xmlns:ns3' =>"http://www.obopay.com/xml/oews/v1"){
            xml.request( 'xmlns:ns2' =>"java:com.obopay.ws.data", 'xmlns:xsi' => "http://www.w3.org/2001/XMLSchema-instance" ,'xsi:type' =>"ns2:ObopayWebServiceData" ){
              xml['s1'].GwalTraceId( 'xmlns:s1'=> "java:com.obopay.core.transferobject", 'xsi:nil' => "1" )
              xml['ns2'].ApiIdType "Req" 
              xml['ns2'].Tier1AgentId( 'xsi:nil' => "1" )
              xml['ns2'].Tier1AgentName( 'xsi:nil' => "1" )
              xml['ns2'].Tier2AgentId( 'xsi:nil' => "1" )
              xml['ns2'].Tier3AgentId "230092"
              xml['ns2'].Tier1AgentPassword( 'xsi:nil' => "1" )
              xml['ns2'].CustomerPhoneNumber "263732140755"
              xml['ns2'].NationalID( 'xsi:nil' => "1" )
              xml['ns2'].SenderFirstName( 'xsi:nil' => "1" )
              xml['ns2'].SenderLastName( 'xsi:nil' => "1" )
              xml['ns2'].TransactionType "500"
              xml['ns2'].InstrumentType "1"
              xml['ns2'].ProcessorCode "0026"
              xml['ns2'].CashInAmount( 'xsi:nil' => "1" )
              xml['ns2'].PaymentDetails1 "715475"
              xml['ns2'].PaymentDetails2( 'xsi:nil' => "1" )
              xml['ns2'].PaymentDetails3( 'xsi:nil' => "1" )
              xml['ns2'].PaymentDetails4( 'xsi:nil' => "1" )
              xml['ns2'].TxnAmount "5"
              xml['ns2'].Remark("xsi:nil" => "1")
              xml['ns2'].CurrencyType "USD"
              xml['ns2'].NetTxnAmount( 'xsi:nil' => "1" )
              xml['ns2'].FeeAmount "20"
              xml['ns2'].TaxAmount "10"
              xml['ns2'].Country( 'xsi:nil' => "1" )
              xml['ns2'].RequestId "rt56666"
              xml['ns2'].TerminalID"123"
              xml['ns2'].TxnStatus( 'xsi:nil' => "1" )
              xml['ns2'].ErrorCode( 'xsi:nil' => "1" )
              xml['ns2'].OpsTransactionId( 'xsi:nil' => "1" )
              xml['ns2'].TransactionDate( 'xsi:nil' => "1" )
              xml['ns2'].Reference1 "ONUS"
              xml['ns2'].Reference2 "CARDLESS"
              xml['ns2'].Reference3( 'xsi:nil' => "1" )
              xml['ns2'].Reference4( 'xsi:nil' => "1" )
              xml['ns2'].Reference5( 'xsi:nil' => "1" )
            }
          }
        }
      }
    end
    return builder.to_xml    
  end
  
  def self.customer_registration
    client = Savon.client( wsdl: 'http://liveonlinepay.telecel.co.zw/ObopayExternalWS/ObopayExternalWebServiceV1?WSDL')
    response = client.call(:process, :message => { userName: "PUNIT", password: "12345689"})
    response.body
  end
end