#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

@pages = [
  'Catégorie:Conseiller national suisse de la 49e législature',
  'Catégorie:Conseiller national suisse de la 48e législature',
  'Catégorie:Conseiller national suisse de la 47e législature',
  'Catégorie:Conseiller national suisse de la 46e législature',
  'Catégorie:Conseiller national suisse de la 45e législature',
  'Catégorie:Conseiller national suisse de la 44e législature',
  'Catégorie:Conseiller national suisse de la 43e législature',
  'Catégorie:Conseiller national suisse de la 42e législature',
  'Catégorie:Conseiller national suisse de la 41e législature',
]

@pages.map { |c| WikiData::Category.new(c, 'fr').wikidata_ids }.flatten.uniq.each do |id|
  data = WikiData::Fetcher.new(id: id).data('fr', 'de') or next
  # puts "%s %s" % [data[:id], data[:name]]
  ScraperWiki.save_sqlite([:id], data)
end
