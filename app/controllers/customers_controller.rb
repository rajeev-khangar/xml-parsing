class CustomersController < ActionController::Base
  
  def registration
    Customer.customer_registration
    response.sendind_file= Customer.make_xml_file
    #Customer.make_xml_file
  end

end