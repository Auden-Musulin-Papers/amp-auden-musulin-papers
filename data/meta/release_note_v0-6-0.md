# Pre-Release v0.5.0 

###Release of v0.6.0 of the Auden Musulin Papers SDE web app, based on [v0.9.0 of the amp-data repository](https://github.com/Auden-Musulin-Papers/amp-data).

## 1 Data

### 1.1 ODD

###The AMP ODD has been updated to support editorial interpretation both in human-language and formalized ways.

### 1.2 Markup of Contents

###For the full core correspondence (i.e., the Auden-Musulin correspondence 1959-1973), editorial interpretation is now encoded in XML/TEI within the `<interpGrp>` element of the `<teiHeader>`; the respective elements within the textual data or metadata to which the editorial interpretations refer are linked to the relevant `<interp>` elements via the `ana` attribute. The `<desc>` elements within the `<interp>` nodes contain human-readable comments intended for display on the UI; furthermore, TEI elements have been used to partly formalize editorial interpretation in machine-readable format (such as bibliographic references encoded via `<bibl>`).

### 1.1 Documents

###new facs for doc 0059 ... For [Auden's letter from 30 April 1962](https://amp.acdh.oeaw.ac.at/amp-transcript__0059.html), which has not yet been digitally reproduced, a transcription has now been made on the basis of a published version of that letter in Denzer and Seidl (eds.), *Silence Turned into Objects*, 2014 (p. 4).

### 1.2 Markup of Contents

Drawing inspiration from the model of 'assertive edition' (Vogeler 2019, 2021), we have introduced a new subcategory of the TEI `<event>` element to capture contents whose evidence is asserted only by the edition documents. Against the background of the express research aim to explore Auden's networks of social interaction and artistic collaboration during his Austrian period, these 'internal' `<event>`s especially comprise communicative events (telephone calls, correspondence, meetings, professional activities).

Most notably, this pre-release features the results of intensive editorial research. Person, place, work, institution, and event entities have been updated, and relevant external authority files (Wikidata, GeoNames) and encyclopedic articles (Wikipedia) to which these entities are linked have been enriched. 



### 1.3 Additional Updates

For all dates in the `<teiHeader>` metadata, we now use the TEI @notBefore-iso and @notAfter-iso attributes, with indication of time zones and, if applicable, daylight-saving-time offset.

Information on languages used in the transcribed texts is encoded by means of the @xml:lang attribute.

For three image items, additional licensing information is now encoded in the `<teiHeader>` metadata. In two instances (https://amp.acdh.oeaw.ac.at/amp-transcript__0036.html, https://amp.acdh.oeaw.ac.at/amp-transcript__0037.html), the permissions given by institutions to publish under a CC BY 4.0 licence have been specified; in another instance (https://amp.acdh.oeaw.ac.at/amp-transcript__0050.html), a restricted reuse license has been declared.

### 1.4 ODD

The first draft was completely revised and updated to comply with the new correspondence container structure. Node attribute restrictions including Schematron rules were added. Schematron rules and constraints now dictate node nesting in some scenarios. For example, `<opener>` and `<closer>` elements require their nested nodes to be in a specific sequence.

Overall, the new ODD provides better support for editors.

## 2 Web Application Features

### 2.1 Updated Start Page

The start page of the edition website has been slightly redesigned: access tiles have been enlarged to enhance accessibility.

### 2.2 Updated Document View

The detail view of individual documents now highlights the options for user engagement with the edition (en-/disabling display of original text features, entities, and comments) as well as metadata information and correspondence description (which now includes options for navigating within the chronological sequence of documents).

Editorial comments can be displayed in a separate box below the transcription window.

The IIIF image viewer is now embedded in a stable-size window, still allowing zooming in and out as well as full-screen presentation.

Line numbers have been removed for facilitating copy-pasting from the edition website.

## 3 Disclaimer

Currently, the AMP edition relies on a heterogenously developed dataset. The core correspondence set of documents (amp-transcript__0001 to 0025, 0034, 0038-0045, 0053, 0057-0061, 0063, 0070-0071) features the updated correspondence schema introduced with the previous pre-release of amp-data v0.7.0. Within this set, a smaller group of documents (amp-transcript__0001-0006, 0021-0025, 0038-0039, 0045, 0057-0059, 0063, 0070-0071) has been updated also with regard to the markup of contents as part of the current v0.8.0 pre-release.

###Archiving is in progress, so that the PIDs (resource handles displayed in the document metadata) currently do not link to the most up-to-date versions of the edition resources.