class ApplicationController < ActionController::Base
    include SessionsHelper
    include FeedsHelper
    include StaticPagesHelper
    protect_from_forgery with: :exception
end
