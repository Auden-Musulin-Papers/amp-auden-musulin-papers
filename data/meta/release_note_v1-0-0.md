# Pre-Release v1.0.0 

Release of v1.0.0 of the Auden Musulin Papers SDE web app, based on [v1.0.0 of the amp-data repository](https://github.com/Auden-Musulin-Papers/amp-data).

## 1 Data

### 1.1 ODD

The AMP schema has been updated to support the markup of container structure in prose documents (notably, Stella Musulin's memoirs of W. H. Auden) as well as of revision processes as evidenced by both prose and correspondence documents.

The ODD is available through the [amp-data GitHub repository](https://github.com/Auden-Musulin-Papers/amp-data/).

### 1.2 Revision Markup

For all correspondence and prose documents, including poetry that forms part of Auden's letters, deletions and additions have been marked up. As before, deleted writing is represented in the transcription via `<del>`; additions are now marked up through the TEI `<add>` element, carrying @place and @hand attributes to indicate the position of the added writing and the writing technology involved. Processes of substitution that involve single or multiple instance of both deletion and addition, are nested within `<subst>`.

***floatingText*** ????

### 1.3 Project Information

The updated editorial documentation is available through the web application's [documentation page](https://amp.acdh.oeaw.ac.at/editorial-declaration.html) as well as through [GitHub](https://github.com/Auden-Musulin-Papers/amp-data/blob/main/data/meta/editorial-declaration.xml).

Furthermore, the Auden Musulin Papers [project description](https://amp.acdh.oeaw.ac.at/description.html) and the project's [team page](https://amp.acdh.oeaw.ac.at/team.html) have been revised.

## 2 Web Application

### 2.1 Start Page

The [amp.acdh.oeaw.ac.at](https://amp.acdh.oeaw.ac.at) start page has been redesigned. A first row of three tiles offers easy access to different types of edition materials (`Auden Musulin Papers 1959-1973`, `Musulin as Memoirist 1976-1985`, `Photos`); a second row of tiles links to features and functionalities of the edition website (`Analytics`, `Full-Text Search`, `Auden through Computer Vision`). These same three sections can also be accessed through the new navigation-bar tab `Features`, which also includes a link to a `Timeline` that gives an overview, generated from the AMP data, of the edition documents and event entities in the period 1957-1985.

### 2.2 Analytics Page

The `Analytics` page features visualizations of AMP data. A line graph illustrates the number of letters exchanged between W. H. Auden and Stella Musulin per year in the period 1959-1973. Below, a network graph visualizes the interconnection between place, event, person, and organization entities to which the documents refer. A dropdown menu allows to narrow down these interrelations to either person-person relations or person-organization relations. By selecting a specific node in the network, detailed information on this node's relations with other nodes can be displayed.

### 2.3 Document View

The detailed document view now includes options for enabling/disabling the display of `Revision` (deletions and additions) and `Glyph` characters (non-standard composite symbols employed by Auden in his (type-)writing, such as umlaut vowels composed by means of superimposing double quotation marks over vowel characters). In the XML files, these characters are marked up through the `<g>` element, which is linked via @ref to a `<glyph>` description in the TEI header.

Underlines and typographic spaces are now displayed by default; their display does not need to be enabled.

### 2.4 Feature Updates Summary

* Linked Event Organizations #244
* Persons linked with PMB URI #181
* Underlines and editorial whitespaces displayed by default #216
* Finalized Analytics page with new network graph and updated correspondence data #222 #238
* Biographies revised and changed to a Timeline with events mentioned and linked to the AMPapers #229
* Team Page rework with new images of core team membes #230
* New Glyphs representation #224
* General document structure rework to match new ODD schemas for correspondence and prose documents
