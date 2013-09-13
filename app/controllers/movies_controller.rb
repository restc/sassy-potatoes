class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # :order filtered :movies by the param :sort from index.html.haml
    # Second iteration, filter by selected ratings on the index view, then order them by the selected params
    # @movies = Movie.find_all_by_rating(params[:ratings].present? : params[:ratings] ? session[:ratings])
    @movies = Movie.where(:rating => params[:ratings].keys) if params[:ratings].present?
    # {:& params[:ratings].present? : params[:ratings] ? session[:ratings] }
      # else
      #   params[:ratings] = session[:ratings].keys

    @all_ratings = Movie.get_ratings
    @selected_ratings = params[:ratings].present? ? params[:ratings] : []

      # Movie.find_all_by_rating(@ratings, :order => params[:sort])
    # @movies = case params[:sort] 
    # when "title" then
    #   Movie.order("title" ASC)
    #   if @selected.empty? then
    #     Movie.order("title" ASC)
    #   else
    #     Movie.order(:ratings => @selected_ratings).order("title" ASC)
    # when "release_date" then
    #   Movie.order("release_date" ASC)
    #   if @selected.empty? then
    #     Movie.order("release_date" ASC)
    #   else
    #     Movie.order(:ratings => @selected_ratings).order("release_date" ASC)
    # else
    #   Movie.all
    #   if @selected_ratings.empty? then
    #     Movie.all
    #   else
    #     Movie.where(:rating => @selected_ratings)
    #   end
    # end
    # @hilite = params[:sort]

    # @all_ratings = Movies.get_ratings

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end


end
