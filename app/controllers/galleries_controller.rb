class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  def new
    if current_user.nil?
      flash[:danger] = "You must be a member to create a gallery! Why not join?"
      redirect_to signup_path
    else
      @gallery = Gallery.new
    end
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create

    if current_user.nil?
      flash[:danger] = "You must be a member to make a gallery! Why not join?"
      redirect_to signup_path

    else
      @gallery = Gallery.new(gallery_params)
      # @gallery.keywords = Gallery.sentiment_analysis(@gallery.content)
      # find user using current user
      @user = current_user
      @user.galleries.push(@gallery)

      respond_to do |format|
        if @gallery.save
          format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
          format.json { render json: @gallery, status: :created }
        else
          format.html { render action: 'new' }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    end  
  end


  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  def fuzzy_search
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @gallery = Gallery.find(params[:id])
    end




	def gallery_params
		params.require(:gallery).permit(:keyword_search_term, :gallery_array)
	end
end
