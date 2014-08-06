class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    require 'open-uri'
    event = Struct.new :name , :link , :date

    @products = Product.all

    var = "http://money.usnews.com/funds/mutual-funds/rankings/long-term-bond"

    page = Nokogiri::HTML(open(var))
    @variable2 =  page.css('div.fund-description').map do |extract|
    @variable4 =  extract.at_css("h2 a").text.strip



    require 'semantic_logger'
    require 'mongo'

    client   = Mongo::MongoClient.new
    database = client['production']

    mongodb_appender = SemanticLogger::Appender::MongoDB.new(
        db:              database,
        collection_size: 1024**3, # 1.gigabyte
        application:     'my_application'
    )
    SemanticLogger.add_appender(mongodb_appender)

    logger = SemanticLogger['Example']

# Log some messages
      logger.info 'This message is written to mongo as a document'




        end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
