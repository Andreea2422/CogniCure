class StaticPagesController < ApplicationController
  def home
    @home_page = true
  end

  def help
  end

  def about
  end

  def contact
  end

  def update_content
    # Update the content of the div as needed
    @template = params[:template]
    respond_to do |format|
      format.html {render "update_content.js.erb"}
    end
  end

end
