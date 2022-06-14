class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model
  multisearchable against: %i[title synopsis]
  # pg_search_scope :global_search, # nombre del método en el controlador
  #   against: %i[title synopsis], # en qué columnas queremos buscar
  #   associated_against: { # permite realizar búsquedas por asociaciones en otras tablas
  #     director: %i[first_name last_name]
  #   },
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
