#!/bin/env ruby
# encoding: utf-8

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
  'Catégorie:Conseiller national suisse de la 40e législature',
  'Catégorie:Conseiller national suisse de la 39e législature',
  'Catégorie:Conseiller national suisse de la 38e législature',
  'Catégorie:Conseiller national suisse de la 37e législature',
]

fr_names = @pages.map { |c| WikiData::Category.new(c, 'fr').member_titles }.flatten.uniq


de_names = {}
de_names[50] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/50._Legislaturperiode_der_Schweizer_Bundesversammlung',
  xpath: '//table[.//th[.="Name"]]//td[1]//a[not(@class="new")]/@title',
)

de_names[49] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/49._Legislaturperiode_der_Schweizer_Bundesversammlung',
  xpath: '//table[.//th[.="Name"]]//td[1]//a[not(@class="new")]/@title',
)

de_names[48] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/48._Legislaturperiode_der_Schweizer_Bundesversammlung',
  xpath: '//table[.//th[.="Name"]]//td[1]//a[not(@class="new")]/@title',
)

de_names[47] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/47._Legislaturperiode_der_Schweizer_Bundesversammlung',
  xpath: '//table[.//th[.="Name"]]//td[1]//a[not(@class="new")]/@title',
)

de_names[45] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/Schweizer_Parlamentswahlen_1995/Resultate_Nationalratswahlen',
  xpath: '//table[.//th[.="Stimmen"]]//td[position() = last()]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { fr: fr_names, de: de_names.values.flatten.uniq })

