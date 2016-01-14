#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

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

names = @pages.map { |c| WikiData::Category.new(c, 'fr').member_titles }.flatten.uniq
EveryPolitician::Wikidata.scrape_wikidata(names: { fr: names })
warn EveryPolitician::Wikidata.notify_rebuilder

