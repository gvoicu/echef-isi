class TablesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all

    respond_to do |format|
      format.html do
        if current_user.waiter?
          render "waiter_tables_index"
        elsif current_user.chef?
          render "chef_tables_index"
        else
          render "index"
        end
      end
      format.json { render json: @tables }
    end
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    @table = Table.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table }
    end
  end

  # GET /tables/new
  # GET /tables/new.json
  def new
    @table = Table.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table }
    end
  end

  # GET /tables/1/edit
  def edit
    @table = Table.find(params[:id])
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(params[:table])
    
    @table.qr_code = SecureRandom.hex(10)

    respond_to do |format|
      if @table.save
        format.html { redirect_to '/tables', notice: 'Table was successfully created.' }
        format.json { render json: @table, status: :created, location: @table }
      else
        format.html { render action: "new" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tables/1
  # PUT /tables/1.json
  def update
    @table = Table.find(params[:id])

    respond_to do |format|
      if @table.update_attributes(params[:table])
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end
  
  def change_qr
    table = Table.find(params[:table_id]).update_attributes(:qr_code => SecureRandom.hex(10))
    
    respond_to do |format|
      format.html {redirect_to '/tables'}
    end
  end
end
