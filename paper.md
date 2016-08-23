---
title: Classification of Knowledge Organization Systems with Wikidata
author:
    name: Jakob Voß
    affiliation: Verbundzentrale des GBV (VZG), Göttingen, Germany
    email: jakob.voss@gbv.de
abstract: # at least 70 (current 64)
    This paper presents a crowd-sourced classification of knowledge organization
    systems based on open knowledge base Wikidata. The focus is less on the 
    current result
    in its rather preliminary form but on the environment and process of 
	categorization in Wikidata and the extraction of KOS from the collaborative
    database. Benefits and disadvantages are summarized and discussed for
    application to knowledge organization of other subject areas with Wikidata.
keywords:
    - Knowledge Organization Systems
	- Wikidata
...

# Classification of Knowledge Organization Systems

Since introduction of the term knowledge organization system (KOS), several
attempts have been made to classify KOSs by types such as glossaries, thesauri,
classifications, and ontologies [@Hodge2000; @Gilchrist2003; @Souza2010;
@Bratkova2014; @Pieterse2014]. The set of KOS types and each of their extent
varies depending on both domain or context of application (for instance
different academic fields) and criteria of classification (for instance
classification by purpose or structure).  In many cases, KOS types are arranged
according to the degree of controls, ranging from simple term lists to complex
ontologies.

The most elaborated classification of KOS types in the field of knowledge
organization is the the NKOS KOS Types Vocabulary [@KOSTypes2015]. It was
developed by the DCMI NKOS Task Group with definitions mainly based on the KOS
Taxonomy by @Zeng2000 and on ISO 25964 [@ISO25964].  The KOS types vocabulary
differentiates between 14 types of KOS (categorization scheme, classification
scheme, dictionary, gazetteer, glossary, list, name authority list, ontology,
semantic network, subject heading scheme, synonym ring, taxonomy, terminology,
and thesaurus). One of the rare applications of these KOS types is their use in
the Basel Register of Thesauri, Ontologies & Classifications
(BARTOC)^[<http://bartoc.org/>] where more then 1.800 KOSs have been classified
so far [@Ledl2016].

# Wikidata

Wikidata^[<https://www.wikidata.org/>] is the most recent project of the
Wikimedia Foundation. In short, it is a collaboratively edited, free knowledge
database that can be read and edited by both humans and machines.  A good
overview is given by two of Wikidata's main creators @Vrandecic2014. The
primary goals of the project are: 

1. Centralize links between Wikipedia language editions and other Wikimedia
   project sites. For instance all Wikipedia articles about "encyclopedia" 
   (in any language) are linked to one Wikidata *item* with identifier `Q5292`.
   These so called *sitelinks* and other data about the concept known as
   "encyclopedia" can be looked up at <https://www.wikidata.org/wiki/Q5292>.^[In
   RDF this URL corresponds to the URI <http://www.wikidata.org/entity/Q5292>.]

2. Centralize Infoboxes. More and more manually edited infoboxes (tables with 
   basic, factual information about a topic) are 
   being extended to use Wikidata as their database backend, so the displayed 
   information will be the same in all Wikipedia editions.

3. Provide an interface for rich queries. The content of Wikidata can be queried
   via a public SPARQL interface at <https://query.wikidata.org/> (see 
   figure \ref{fig:sparql} for an example). Query results
   are planned to be integrated into Wikipedia and other projects
   as lists, tables, maps and other forms.

The data model of Wikidata is neither relational nor based on RDF (although
mappings to RDF exists) but it reflects the strategy of Wikidata to store
*statements* instead of facts. Each statement should be sourced by *references*
and contradicting statements are not forbidden on purpose. Statements can
further be controlled by *qualifiers*, such as domain and date of validity,
eventually supporting *n*-ary relations between Wikidata items. The Wikidata
ontology consists of Wikidata properties, which are defined by community
consensus. For instance [`P571`](<https://www.wikidata.org/wiki/Property:P571)
identifies the property "inception" to state the date when something was
created or founded. Labels and scope notes can be edited independently from
statements with support of synonyms and homonyms.

# Knowledge Organization Systems in Wikidata

To a large degree, Wikidata contains mappings to other KOSs: links between
Wikidata items to VIAF and Geonames are among the most used Wikidata properties
with around 100.000 Wikidata
each^[<https://www.wikidata.org/wiki/Wikidata:Database_reports/List_of_properties>]
and at least 1051 of 2490 Wikidata properties^[Measured at
<https://www.wikidata.org/wiki/Special:ListProperties>, 2016-05-24] refer to
external identifier systems of other databases.^[See also @Voss2014 for a
German introduction to authority data in Wikidata.]  With uniquely identified
records about virtually anything, Wikidata can also be seen as a KOS in its own
right, so it is included in BARTOC.^[<http://bartoc.org/en/node/1940>] For the
scope of this study, Wikidata items about KOS types and KOS instances are of
special interest.  KOS instances are Wikidata items linked to KOS type items
with property "instance of"
([`P31`](https://www.wikidata.org/wiki/Property:P31))". For instance the Dewey
Decimal Classification ([`Q48460`](https://www.wikidata.org/wiki/Q48460)) is an
instance of both a "library classification"
([`Q48473`](https://www.wikidata.org/wiki/Q48473)) and a "universal
classification scheme"
([`Q24243801`](https://www.wikidata.org/wiki/Q24243801)).  Both are connected
to the item "classification scheme"
([`Q5962346`](https://www.wikidata.org/wiki/Q5962346)) with property "subclass
of" ([`P279`](https://www.wikidata.org/wiki/Property:P279)).

Despite their obvious use for knowledge representation and classification, the
subclass and instance properties have no special role in Wikidata. Instead they
can freely be used to connect any Wikidata items, only constrained by human
intervention of other editors and, hopefully, community consensus in common
sense. The lack of stricter rules on use of subclass and instance properties in
Wikidata has led to criticism among researchers that try to use it as a formal
ontology [@Brasileiro2016; @Spitz2016]. Nevertheless, Wikidata can successfully
be queried for a hierarchical list of transitive subclasses of "knowledge
organization system" ([`Q6423319`](https://www.wikidata.org/wiki/Q6423319))
and additional numbers for each class (figure \ref{fig:sparql}).

\begin{figure}
\begin{verbatim}
SELECT ?item ?itemLabel ?broader ?parents ?size ?sites {
  {  
    # number of additional superclasses
    SELECT ?item (count(distinct ?parent)-1 as ?parents) {
      ?item wdt:P279* wd:Q6423319
      OPTIONAL { ?item wdt:P279 ?parent }
    } GROUP BY ?item    
  } { 
    # number of instances
    SELECT ?item (count(distinct ?element) as ?size) {
     ?item wdt:P279* wd:Q6423319
     OPTIONAL { ?element wdt:P31 ?item }
    } GROUP BY ?item      
  } { 
    # number of sitelinks
    SELECT ?item (count(distinct ?site) as ?sites) {
      ?item wdt:P279* wd:Q6423319
      OPTIONAL { ?site schema:about ?item }
    } GROUP BY ?item    
  }
  OPTIONAL { ?item wdt:P279 ?broader }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
\end{verbatim}
\caption{SPARQL query to extract KOS classification data from Wikidata}
\label{fig:sparql}
\end{figure}

<!-- 
# number of instances
SELECT (COUNT(distinct ?kos) AS ?count) {
  ?kos wdt:P31/wdt:P279* wd:Q6423319
} 
-->

\begin{normalsize}
\twocolumn[

\section{A KOS classification extracted from Wikidata} 

The following classification of KOS types was extracted from Wikidata via
SPARQL (figure \ref{fig:sparql}). The command line tool `wdtaxonomy', created especially to
extract and display taxonomies, proved to be hugely useful for
analysis \cite{wdtaxonomy}.  The outcome, at the time of its creation at August
23rd 2016, contains 189 Wikidata items of KOS types, grouped in a
multi-hierarchy. Classes within one level are sorted by their Wikidata
identifier, reflecting the relative time when they were added to the database.
Items with multiple superclasses within the KOS type hierarchy are shown in
italics at the their second occurrence, for instance a `\textit{plant
taxonomy}' is both a `biological classification' and a `taxonomy'.
Superclasses from other parts of Wikidata are indicated with upwards pointing
arrows ($\uparrow$), for instance `datamodel' is also subclass of `model' and
`data set'.  The numbers right to each class label indicate the current number
of instances in Wikidata (if there are any), and after a small plus sign the
number of Wikipedia articles or other Wikimedia projects sites linked with the
entry (sitelinks). For instance three Wikidata items are marked as instance of
`semantic network` and twenty Wikipedia editions include an article about
semantic networks ($3{\raisebox{.4\height}{\scalebox{.6}{+}}}20$). 

\vspace{6mm}]
\begin{scriptsize}
\input{classification}
% TODO: add some statistics
\end{scriptsize}
\onecolumn
\end{normalsize}

# Discussion

The classification of KOS types extracted from Wikidata is detailed but
obviously sketchy in its current form. The system was even more incomplete
before large parts of it had been edited by the author, mainly to adjust or
add missing English labels and items without any instance or subclass
statement. A couple of items were also moved or merged after notification and
discussion with the Wikidata community.^[The question about 'taxonomy' vs.
'biological classification' could not be resolved.] Instead of criticizing
usage limitations of Wikidata class hierarchies such as @Spitz2016, or
suggesting methods to better spot classification inconsistencies such as
@Brasileiro2016, peculiarities of knowledge organization systems based on
Wikidata shall be highlighted in the following.

First of all, classes and instances are more or less given by existence or
non-existence of Wikidata items with sitelinks: only 14 of 189 classes in the
classification above don't have at least one corresponding Wikipedia article.
To some degree new Wikidata items can also be added without sitelink, but this
is controversial at least for abstract concepts which have no obvious unique
identification.^[See <https://www.wikidata.org/wiki/Wikidata:Notability>] KOS
types therefore usually require some Wikipedia article before inclusion.  The
strong connection to Wikipedia also forbids removal, reinterpretation or
merging of concepts that don't easily fit into a classification, unless one
engages in editing Wikipedias. Anyway, KOS derived from Wikidata are build by a
bottom-up approach from general encyclopedic concepts.  As scope and definition
of a Wikidata item vary between Wikipedia language editions, the concepts are
fuzzy to some degree. For instance at the moment there are two items for
classification as process and classification as result but only one item for
both metamodelling and metamodel.^["classifying"
([`Q13582682`](http://www.wikidata.org/entity/Q13582682)),
"classification" ([`Q5962346`](http://www.wikidata.org/entity/Q5962346)),
and "metamodel" ([`Q1925081`](http://www.wikidata.org/entity/Q1925081))
] One should not try to solve all of
these cases in structured data, as @Graham2012 warned about application of
Wikidata: "We just need to ensure that we aren't seduced into codifying,
categorizing, and structuring in cases when we should be describing the
inherent messiness of a situation." It has already been shown that the category
system of Wikipedia is more a thesaurus than a classification [@Voss2006]. KOS
extraction from Wikidata may also result in less strict hierarchies without
strong formal logic.  Participation in Wikidata differs from collaborative
ontology engineering [@MullerBirn2015]. Although the database is often referred
to as knowledge base, its practical purpose in many ways is more knowledge
organization than knowledge representation.

The number of sitelinks can be used as indicator how established or widely
known a concept is. The number of instances more depends on which
KOS instances are relevant for inclusion in Wikimedia projects and
have been classified in Wikidata at all.  Despite this bias, instances are very
helpful to judge the application of a concept for classification.  Both new
Wikidata instances and new sitelinks are added to KOS types virtually every
day.  The benefit of this dynamic growth is better coverage of multiple views
and domains, so most KOS extracted from Wikidata include aspects of a universal
classification and less suffer from opinionated knowledge organization.  The
downside of this crowd-sourcing is lack of a final consensus. Therefore
extraction of KOS from Wikidata is an iterative process that requires
continuing review and contribution to Wikidata (figure \ref{fig:process}).

\begin{figure}
\centering
\begin{tikzpicture}[->]
\node (wikidata) {\textbf{Wikidata}};
\node[left=of wikidata] (wikipedia) {Wikipedias};
\node[right=of wikidata] (kos) {\textbf{KOS}};
\node[right=of kos] (analysis) {analysis};
\path (wikidata) edge[bend left=20] node[anchor=south] {extraction} (kos)
      (kos) edge (analysis)
      (analysis) edge[bend left=20] node[anchor=north] {modification} (wikidata);
\path (wikidata) edge[loop below] node[anchor=north] {discussion} (wikidata);
\path (wikipedia) edge[loop below] node[anchor=north] {discussion} (wikipedia);
\path (wikidata) edge[<->] (wikipedia);
\end{tikzpicture}
\caption{Iterative process of KOS extraction from Wikidata}
\label{fig:process}
\end{figure}

# Summary and outlook

This paper introduced the extraction of knowledge organization systems from
Wikidata exemplified by a classification of KOS types.  With 181 classes the
result is probably the most detailled classification of KOS types so far.
Before further evaluation and cleanup, however, it can only serve as starting
point.

The strong grounding in Wikipedia is both benefit and challenge. The system is
more build bottom-up from instances instead of top-down from theoretical
properties like existing classifications and typologies.  Further improvement
of the particular classification requires involvement of both the Wikidata
community and domain experts in knowledge organization. For instance one could
express different characteristic of division as Wikidata qualifiers.^[This has
already been started for domain-specific subtypes of classification schemes.]
It is also not sure yet whether the hierarchical structures extracted from
Wikidata can better be expressed by other types of KOS such as multi-level
models [@Brasileiro2016] or thesauri [@Voss2006].

Further work on the KOS classification includes alignment with the NKOS KOS
Types Vocabulary [@KOSTypes2015]. KOS instances have been classified in both
Wikidata and BARTOC [@Ledl2016], connected via Wikidata property "BARTOC ID"
([`P2689`](https://www.wikidata.org/wiki/Property:P2689)).  More elaborated
KOS extraction should also incorporate Wikidata qualifiers.  Existing tools
such as SQID Wikidata Browser^[<http://tools.wmflabs.org/sqid/>] could further
be extended to better support management of KOSs extracted from Wikidata.

