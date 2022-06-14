class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.where(title: params[:query]) esta query trae la busqueda por palabra exacta.
      # query_sql = "title ILIKE :query OR synopsis ILIKE :query" # se guarda en una variable la bísqueda de SQL
      # query_sql = "\
      # movies.title @@ :query \
      # OR movies.synopsis @@ :query \
      # OR directors.first_name @@ :query \
      # OR directors.last_name @@ :query \
      # "
      # # con POSGRESQL se sustituye el ILIKE por @@ para poder realizar consultas de palábras múltiples.
      # @movies = Movie.joins(:director).where(query_sql, query: "%#{params[:query]}%") # esta query trae todas las películas que contienen
      # una parte de la búsqueda en el título. "I" es de insensitive. % funciona como comodín, puede tener adelante o atrás.
      # @movies = Movie.global_search(params[:query]) # metodo que jalamos del modelo
      # una vez que ejecutamos el PgSearch la línea de arriba no sirve más
      @results = PgSearch.multisearch(params[:query]) # nombre del método en el modelo Movies
    else
      @movies = Movie.all
    end
  end
end
