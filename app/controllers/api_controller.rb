class ApiController < ActionController::Base
  include RESTFramework::BaseControllerMixin
  
  self.paginator_class = RESTFramework::PageNumberPaginator
  class_attribute(:page_size, default: 30)
end
