class ChatController < ApplicationController
  def index
    isNotUser()
  end
end
