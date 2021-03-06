class WaysController < ApplicationController
  before_action :set_way, only: [:show, :edit, :update, :destroy]

  # GET /ways
  # GET /ways.json
  def index
    @ways = Way.all
  end

  # GET /ways/1
  # GET /ways/1.json
  def show    
  end

  # GET /ways/new
  def new
    @way = Way.new
  end

  # GET /ways/1/edit
  def edit
  end

  # POST /ways
  # POST /ways.json
  def create
    @way = Way.new(way_params)

    respond_to do |format|
      if @way.save
        format.html { redirect_to @way, notice: 'Way was successfully created.' }
        format.json { render :show, status: :created, location: @way }
      else
        format.html { render :new }
        format.json { render json: @way.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ways/1
  # PATCH/PUT /ways/1.json
  def update
    respond_to do |format|
      if @way.update(way_params)
        format.html { redirect_to @way, notice: 'Way was successfully updated.' }
        format.json { render :show, status: :ok, location: @way }
      else
        format.html { render :edit }
        format.json { render json: @way.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ways/1
  # DELETE /ways/1.json
  def destroy
    @way.destroy
    respond_to do |format|
      format.html { redirect_to ways_url, notice: 'Way was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def run_ways        
    # way = Way.new
    # way.default_fill
    # edges_in = Edge.initial_edges
    vertex_in = Vertex.start_vertex
    initial_distance = 0
    initial_time = 0
    partial_vertices = ''
    partial_edges = ''
    # map_ways(way, edges_in)
    map_ways(vertex_in, partial_vertices, partial_edges, initial_distance, initial_time)
    redirect_to ways_url, notice: 'Way was successfully mapped.'
  end

  # def reset_ways
  #   Way.delete_all
  #   redirect_to ways_url, notice: 'Way was successfully cleaned.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_way
      @way = Way.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def way_params
      params.require(:way).permit(:vertices_list, :edges_list, :total_distance, :total_time)
    end    
end
