#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

@pages = [
  'Catégorie:Conseiller national suisse de la 50e législature',
  'Catégorie:Conseiller national suisse de la 49e législature',
  'Catégorie:Conseiller national suisse de la 48e législature',
  'Catégorie:Conseiller national suisse de la 47e législature',
  'Catégorie:Conseiller national suisse de la 46e législature',
  'Catégorie:Conseiller national suisse de la 45e législature',
  'Catégorie:Conseiller national suisse de la 44e législature',
  'Catégorie:Conseiller national suisse de la 43e législature',
  'Catégorie:Conseiller national suisse de la 42e législature',
  'Catégorie:Conseiller national suisse de la 41e législature',
  'Catégorie:Conseiller national suisse de la 40e législature',
  'Catégorie:Conseiller national suisse de la 39e législature',
  'Catégorie:Conseiller national suisse de la 38e législature',
  'Catégorie:Conseiller national suisse de la 37e législature',
]

frwiki = @pages.map { |c| WikiData::Category.new(c, 'fr').wikidata_ids }.flatten.uniq

# has Property: "Swiss Parliament ID"
sparq = 'SELECT ?item WHERE { ?item wdt:P1307 ?id . }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: frwiki | ids, batch_size: 250)
