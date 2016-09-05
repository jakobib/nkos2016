---
title: |
  Classification of \
  Knowledge Organization Systems\
  with Wikidata
shorttitle: KOS classification with Wikidata
author:
    name: Jakob Voß
institute: Verbundzentrale des GBV (VZG), Göttingen, Germany
date: 2016-09-09 # 10:00-10:45
place: 15^th^ European NKOS Workshop, Hannover
...


## Overview

1. Typology of Knowledge Organization System
2. Wikidata Introduction
3. KOS classification in Wikidata
4. Challenges
5. Summary and Outlook

# 1 \newline Typology of \newline Knowledge Organization Systems

## Established KOS types

@Bratkova2014 compare eight typologies from literature, standards, and
KOS registries. All of them include:

* Classification schemes
* Ontologies
* Taxonomies
* Thesauri

## Other common KOS types

@Bratkova2014, @KOSTypes2015:

* Subject Heading Schemes
* Name Authority Lists
* Glossaries
* Gazetteers
* Dictionaries 
* Categorization Schemes
* Synonym Rings
* Semantic Networks
* Terminologies
* (Contolled/Structured) Vocabularies
* Schemas/Data Models
* Lists

## Taxonomy of KOS

@Souza2010 include a taxonomy:

![](souza-kos-types.png){width=90%}

## Summary and findings

*"we are far from having a consensus on KOS taxonomies and the related terminology"* [@Souza2010]

* Several division criteria exist [@Bratkova2014]:
    * **semantic strength**
    * organization unit
    * domain
    * knowledge representation
    * type of vocabulary
    * open/closed world
    * granularity
    * format
    * purpose

* Proposed typologies rarely populated with KOS instances (!)

## Exception: BARTOC terminology registry

The [Basel Register of Thesauri, Ontologies & Classifications](http://bartoc.org) (<http://bartoc.org>), around 1.900 KOS instances with their DCMI NKOS KOS Types [@Ledl2016]: 

---------------------- ---- ----------------------- ---
classification scheme   751 name authority list      56
thesaurus               630 dictionary               54
glossary                183 list                     22
ontology                131 gazetteer                 6
subject heading scheme   61 categorization scheme     5
taxonomy                 59 semantic network          5
terminology              58 synonym ring              1
---------------------- ---- ----------------------- ---

208 KOS instances are linked to Wikidata and back!

# 2 \newline Wikidata Introduction \newline with focus on KOS

## What is Wikidata?

* Much like Wikipedia but database instead of encyclopedia
    * Also run by Wikimedia Foundation
    * Same software (MediaWiki) + Wikibase extension
    * It's also a Wiki (versioned database)
    * Collaboratively edited and freely usable

![](wikidata.png){width=5cm}

## Wikidata's goals

*Structure the sum of all human knowledge!*

1. Centralize links between Wikipedia language editions
  
    ------- ------------------------------
    Q48473  = library classification (en)
            = Bibliotheksklassifikation (de)
            = classificazione bibliotecaria (it)
            = ...
    ------- ------------------------------

    $\Longrightarrow$ controlled vocabulary with definitions

2. Centralize Infoboxes
3. Provide an interface for rich queries

    $\Longrightarrow$ rich knowledge base or semantic network

## Wikidata bits and pieces

* **Items** (`Q...`) 
    * e.g. [Q48473](http://www.wikidata.org/entity/Q48473) "library classification"
    * can be created and edited by anyone

* **Properties** (`P...`)
    * e.g. [P25](http://www.wikidata.org/entity/P25) "mother"
    * e.g. [P1103](http://www.wikidata.org/entity/P1103) "number of railway station platform tracks"
    * creation after community consensus (kind-of)

* normal wiki pages (discussion, help...)

## Wikidata statements

* Simplified **statement**
    * item: [Q856638](http://www.wikidata.org/entity/Q856638) "library catalog"
    * property: [P279](http://www.wikidata.org/entity/P279) "subclass of"
    * value: [Q2352616](http://www.wikidata.org/entity/Q2352616) "catalog"

* Optional parts of a statement
    * **qualifiers** (e.g. valid from... until...)
    * **references** (e.g. as stated in ...)
    * **rank** (normal, preferred, deprectated, best)

## Infoboxes: Wikidata $\rightarrow$ Wikipedias

![Welsh Wikipedia](welsh-infobox.png){height=6.5cm} 

## Queries

Public SPARQL endpoint at <https://query.wikidata.org/>

    # get subclasses of "catalog"
    SELECT ?c WHERE { ?c wdt:P279 wd:Q2352616 }

More complex query included in the paper

## Wikidata and knowledge organization systems

* Wikidata **is a KOS** with notations, multilingual labels, 
  scope notes, definitions, and rich connections between concepts.

* Wikidata **contains mappings** to many other KOS, e.g.
    * e.g. [P227](http://www.wikidata.org/entity/P227) "GND identifier"
    * e.g. [P1036](http://www.wikidata.org/entity/P1036) "DDC notation"
    * ... (> 40% of all properties!)

# 3 \newline Managing a KOS typology in Wikidata

## Create yet another KOS taxonomy?

![[CC-BY-NC 2.5: Randall Munroe](https://xkcd.com/927/)](standards.png){width=100%}

## ...

* Wikidata is like a box of chocolates. You never know what you're gonna get."
* It has instances!
* It already has definitions, translations..
* It is out of control ;-)
* Wikidata is very ... chaotic
*

## Tools

* QuickStatements

# 4 \newline Challenges

## Open Issues

* Some classes are rather instances, e.g.

asteroid spectral type (Q1750705)

## KOS vs. KOS concepts

Example: 

* **class M planet** is an earth like planet in Star Trek. 
  Other planet classes (A, B, C ... Z) are also refered to
  in the fictional universe.

* Some Wikipedia editions have 

first try: have 

BTW: classifications are always artificial but not fictional

BTW: this is the most complete classification system of planets so far,
as astronomy has not developed a full system yet.

## Summary

* light multi-hierarchy
* x classes, y instances (caution)
* manually adjusted
* done how?
    * BARTOC
    * wdtaxonomy

## Overview

![](diff.png){witdh=100%}

---

![](merge.png){width=100%}

---

![](wdtaxonomy-encyclopedia.png){width=100%}

## Example of KOS concepts in Wikidata

* Köppen climate classification system 
  [Q124095](https://www.wikidata.org/wiki/Q124095)
* <part-of / has parts of the class>
* category in the Köppen climate classification system 
  [Q23702033](https://www.wikidata.org/wiki/Q23702033)
* <instance-of
* oceanic climate [Q182090](https://www.wikidata.org/wiki/Q182090)


* Library of Congress Classification:Class A -- General Works
  [Q6542579](https://www.wikidata.org/wiki/Q6542579)

## Example:

astronomy classification (`$ wdtaxonomy Q25696292`):

* asteroid spectral type
    * Tholen classification (1984)
    * SMASS classification (2002)

both overlap to large degree

classes have letters, e.g.

A-Type, B-Type, C-Type ... as Wikidata items instance-of the classification

## Problem

* It's made in every KOS typology but I just don't 
  understand the difference between

  * *classification scheme*
  * and *taxonomy*


# 4 \newline Summary and Outlook

## Outlook

* Contribution in Wikidata is welcome!

* WikiProjekt KOS: ...

* Add KOS type division criteria as facets 
  (qualifier or properties). *Domain* has
  already been added for some specialized KOS types
 
* ...

## Possible methods of improvement

* Check structural integrity (A subclass B subclass C: A not subclass C)
* Compare with category system of individual Wikipedias
*

## References

\scriptsize
