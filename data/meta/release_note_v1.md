# Pre-Release v1.0.0 

Release of v1.0.0 of the Auden Musulin Papers SDE web app, based on [v1.0.0 of the amp-data repository](https://github.com/Auden-Musulin-Papers/amp-data).

## 1 Data

### 1.1 Schemas

In addition to the [AMP schema for modeling correspondence and photographs in TEI/XML](https://github.com/Auden-Musulin-Papers/amp-data/blob/dev/framework/auden-musulin/schema/schema.odd), a [dedicated schema](https://github.com/Auden-Musulin-Papers/amp-data/blob/dev/framework/auden-musulin/schema/schema-prose.odd) for marking up the container structure in prose documents (notably, Stella Musulin's memoirs of W. H. Auden) as well as a [schema for the project indexes](https://github.com/Auden-Musulin-Papers/amp-data/blob/dev/framework/auden-musulin/schema/schema-indexes.odd) have been created.

Both the correspondence and prose schemas now allow for encoding revision processes as evidenced by the documents (see [1.2](#12-revision-markup)).

The ODDs are available through the [amp-data GitHub repository](https://github.com/Auden-Musulin-Papers/amp-data/tree/dev/framework/auden-musulin/schema); RNG output files can be found [here](https://github.com/Auden-Musulin-Papers/amp-data/tree/dev/framework/auden-musulin/schema/out).

### 1.2 Revision Markup

For all correspondence and prose documents, including poetry that forms part of Auden's letters, deletions and additions have been marked up. As before, deleted writing is represented in the transcription via `<del>`; additions are now marked up through the TEI `<add>` element, carrying @place and @hand attributes to indicate the position of the added writing and the writing technology involved. Processes of substitution that involve single or multiple instance of both deletion and addition, are nested within `<subst>`.

### 1.3 Prose Container Structure

The TEI `<floatingText>` element is used to mark up any ["single text of any kind, whether unitary or composite, which interrupts the text containing it at any point and after which the surrounding text resumes"](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-floatingText.html), notably full texts by W. H. Auden quoted in Stella Musulin's memoirs.

### 1.4 Project Information

The updated editorial documentation is available through the web application's [documentation page](https://amp.acdh.oeaw.ac.at/editorial-declaration.html) as well as through [GitHub](https://github.com/Auden-Musulin-Papers/amp-data/blob/main/data/meta/editorial-declaration.xml).

Furthermore, the Auden Musulin Papers [project description](https://amp.acdh.oeaw.ac.at/description.html) and the project's [team page](https://amp.acdh.oeaw.ac.at/team.html) have been revised.

## 2 Web Application

### 2.1 XSLT

The XSLT pipeline has been updated with a view to representing the substantial changes in the ODDs.

### 2.2 Start Page

The [amp.acdh.oeaw.ac.at](https://amp.acdh.oeaw.ac.at) start page has been redesigned. A first row of three tiles offers easy access to different types of edition materials (`Auden Musulin Papers 1959-1973`, `Musulin as Memoirist 1976-1985`, `Photos`); a second row of tiles links to features and functionalities of the edition website (`Analytics`, `Full-Text Search`, `Auden through Computer Vision`). These same three sections can also be accessed through the new navigation-bar tab `Features`, which also includes a link to a `Timeline` that gives an overview, generated from the AMP data, of the edition documents and event entities in the period 1957-1985.

### 2.3 Analytics Page

The `Analytics` page features visualizations of AMP data. A line graph illustrates the number of letters exchanged between W. H. Auden and Stella Musulin per year in the period 1959-1973. Below, a network graph visualizes the interconnection between place, event, person, and organization entities to which the documents refer. A dropdown menu allows to narrow down these interrelations to either person-person or person-organization relations. By selecting a specific node in the network, detailed information on this node's relations with other nodes can be displayed.

The correspondence diagram has been created with [Highcharts](https://www.highcharts.com/). The network visualization relies on the Austrian Centre for Digital Humanities and Cultural Heritage's [`network-visualisation` library](https://github.com/acdh-oeaw/network-visualisation).

### 2.4 Document View

The detailed document view now includes options for enabling/disabling the display of `Revision` (deletions and additions) as well as of `Glyph` characters (non-standard composite symbols employed by Auden in his (type-)writing, such as umlaut vowels composed by means of superimposing double quotation marks over vowel characters). In the XML files, these characters are marked up through the `<g>` element, which is linked via @ref to a `<glyph>` description in the TEI header.

Underlines and typographic spaces are now displayed by default; their display does not need to be enabled.

### 2.5 Search

Facets for full-text search are now available through dropdown menus.

### 2.6 Feature Updates Summary

* event organizations linked #244
* place-detail pages show small leaflet map #245
* persons linked with PMB URIs #181
* underlines and spaces displayed by default #216
* analytics page with new network graph and updated correspondence data finalized #222 #238
* timeline with events mentioned and linked to the AMP documents created #229
* team page reworked with new images of team members #230
* new glyph representation enabled #224
* general document structure reworked to match new ODD schemas for correspondence and prose documents

### 2.6 Accessibility

Accessibility and HTML5-structure checks have been conducted.

## 3 Disclaimer

As the three-year [Auden Musulin Papers project](https://doi.org/10.55776/P33754) is now concluded, the Austrian Centre for Digital Humanities and Cultural Heritage does not guarantee future frontend bugfixes.









