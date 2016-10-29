class BaseController < ApplicationController
  before_action :ensure_login
end
