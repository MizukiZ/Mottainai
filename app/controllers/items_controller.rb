class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :profile_validation, except: [:index]

  # kaminari
  PER = 6
  # GET /items
  # GET /items.json
  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(PER)


    # search system here

    # words
    if params[:words]
      words = params[:words]
      @items = Item.where("title iLIKE ?", "%#{words}%").order(created_at: :desc).page(params[:page]).per(PER)

    end

    # area
    if params[:area]
      area = params[:area]
      @items = Item.where("area iLIKE ?", "%#{area}%").order(created_at: :desc).page(params[:page]).per(PER)

    end

    # free
    if params[:free] == "1"
      @items = Item.where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # category
    if params[:category] && params[:category] != ""
      category = params[:category].to_i
      @items = Item.where(category_id: category ).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words and category
    if params[:words] && params[:category] && params[:category] != ""
      words = params[:words]
      category = params[:category].to_i
      @items = Item.where("title iLIKE ?", "%#{words}%").where(category_id: category ).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words and area
    if params[:words] && params[:area]
      words = params[:words]
      area = params[:area]
      @items = Item.where("title iLIKE ?", "%#{words}%").where("area iLIKE ?", "%#{area}%").order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words and free
    if params[:words] && params[:free] == "1"
      words = params[:words]
      @items = Item.where("title iLIKE ?", "%#{words}%").where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # area and free
    if params[:area] && params[:free] == "1"
      area = params[:area]
      @items = Item.where("area iLIKE ?", "%#{area}%").where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # area and category
    if params[:area] && params[:category] && params[:category] != ""
      area = params[:area]
      category = params[:category].to_i
      @items = Item.where("area iLIKE ?", "%#{area}%").where(category_id: category ).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # category and free
    if params[:category] && params[:category] != "" && params[:free] == "1"
      category = params[:category].to_i
      @items = Item.where(category_id: category ).where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words,area and category
    if params[:words] && params[:area] && params[:category] && params[:category] != ""
      words = params[:words]
      area = params[:area]
      category = params[:category].to_i
      @items = Item.where("title iLIKE ?", "%#{words}%").where("area iLIKE ?", "%#{area}%").where(category_id: category ).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words, category and free
    if params[:words] && params[:category] && params[:category] != "" && params[:free] == "1"
      words = params[:words]
      category = params[:category].to_i
      @items = Item.where("title iLIKE ?", "%#{words}%").where(category_id: category ).where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end

    # words, area, category and free
    if params[:words] && params[:area] && params[:category] && params[:category] != "" && params[:free] == "1"
      words = params[:words]
      area = params[:area]
      category = params[:category].to_i
      @items = Item.where("title iLIKE ?", "%#{words}%").where("area iLIKE ?", "%#{area}%").where(category_id: category ).where(chargeable:false).order(created_at: :desc).page(params[:page]).per(PER)

    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  @currency_convert = false
    # currency conversation
    if params[:conversion] == 'y'
      @currency_convert = true
    elsif params[:conversion] == 'n'
        @currency_convert = false
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    authorize @item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.area = current_user.profile.city
    @item.cost = item_params[:cost].to_f * 100  #convert to cent
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    authorize @item

    respond_to do |format|
      if @item.update(item_params)
       @item.update(cost: item_params[:cost].to_f * 100) #convert to cent
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    authorize @item

    @item.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:title, :description, :chargeable, :category_id, :image, :cost)
  end

  def profile_validation
    if !current_user.has_profile?
      redirect_to new_profile_path
      flash[:notice] = "Please enter your details to continue"
    end
  end
end
