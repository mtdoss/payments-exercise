class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # NOTE: I'm commenting this out to make it easier to test the ability to
  # create payments with curl or something like Postman. Obviously in a real
  # app I wouldnt do that :)

  # protect_from_forgery with: :exception
end
