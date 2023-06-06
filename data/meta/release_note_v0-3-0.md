# Pre-Release v0.3.0 

We announce the launch of v0.3.0 of the Auden Musulin Papers web application, which builds upon the foundation of [v0.5.0 of the amp-data repository](https://github.com/Auden-Musulin-Papers/amp-data).

## 1 Data

### 1.1 Additional Photographs

This release includes previously unreleased photographs sourced from the private Musulin family archive. These photographs provide a unique perspective on the personal and professional life of W. H. Auden, shedding light on his interactions with notable figures in his social network in Austria. Furthermore, they capture moments of the poet's funeral on 4 October 1973.

### 1.2 Improved Markup

The TEI/XML `<langUsage>` section now provides precise information about the language(s) used in the documents containing text. The use of the `<language ident="...">` element ensures that each language appearing in a document is appropriately encoded according to ISO 639-1.

Information pertaining to the text type(s) is incorporated within the `<text type="...">` node. Depending on the document's main communicative type, this categorization encompasses a range of classifications: letter, card, invitation card, memoir, photograph, notes, speech, telegram, and aerogram. Titles have been updated to facilitate prompt identification of the key contents and text types of the documents.

v0.3.0 moreover includes a minor fix in the markup: for indented page numbers in typescripts, the `space` element has been inserted.

## 2 Web Application Features

### 2.1 Data Categorization

The web application now arranges the data set chronologically as well as with regard to content type into three categories: [Auden Musulin Papers 1959-1973](https://amp.acdh.oeaw.ac.at/toc.html) (W. H. Auden's correspondence with Stella Musulin together with other materials evidencing their contact and collaboration); [Musulin as Memoirist 1976-1995](https://amp.acdh.oeaw.ac.at/toc_m.html) (Musulin's memoirs as well as correspondence related to her activities as Auden's memoirist); [Photos](https://amp.acdh.oeaw.ac.at/photos.html).

The [landing page](https://amp.acdh.oeaw.ac.at/index.html) has been redesigned to offer easy entry points to explore these categories of edition documents.

### 2.2 Document View

In the default document view, the facsimile display is now disabled to focus on the transcribed texts. 

### 2.3 Search

Full-text and faceted search parameters are now enabled as URL search parameters, thus permitting users to bookmark URLs that represent individual website queries.

## 3 Disclaimer

The facsimile view is not yet optimized for the mobile version of the web application.