# Pre-Release v0.3.0 
[comment]: <> (Include links! Discuss images with Sandra.)

We are pleased to announce the launch of v0.3.0 of the Auden Musulin Papers web application. Built upon the foundation of v0.5.0 of the amp-data repository, this update highlights the AMP project's employment of computer-vision technology (in collaboration with TU Wien's Computer Vision Lab) to visualize three-dimensional typewriter impressions in two edition documents.

## 1 Data

### 1.1 Computer-Vision Data

v0.3.0 presents the TEI/XML transcriptions of two previously unpublished poems by W. H. Auden, reconstructed by means of Photometric Stereo from colorless, three-dimensional indented impressions in the paper of two documents (Autograph Letter Signed W. H. Auden to Stella Musulin with Typescript W. H. Auden "Joseph Weinheber" 1965-04-28 and with Typescript W. H. Auden Translation "Joseph Weinheber" and Autograph Letter Signed W. H. Auden to Stella Musulin 1969-06-10).

### 1.2 Additional Photographs

This release also includes previously unreleased photographs sourced from the private Musulin family archive. These photographs provide a unique perspective on the personal and professional life of W. H. Auden, shedding light on his interactions with notable figures in his social network in Austria. Furthermore, they capture moments of the poet's funeral on 4 October 1973.

### 1.3 Improved Markup

The TEI/XML `<langUsage>` section now provides precise information about the language(s) used in the documents containing text. The use of the `<language ident="...">` element ensures that each language appearing in a document is appropriately encoded according to ISO 639-1.

Information pertaining to the text type(s) is incorporated within the `<text type="...">` node. Depending on the document's main communicative type, this categorization encompasses a range of classifications: letter, card, invitation card, memoir, photograph, notes, speech, telegram, and aerogram. Titles have been updated to facilitate prompt comprehension of the key contents and text types of the documents.

v0.3.0 moreover includes a minor fix in the markup: for indented page numbers in typescripts, the `space` element has been inserted.

## 2 Web Application Features

### 2.1 Data Categorization

The web application now arranges the data set chronologically as well as with regard to content type into three categories: Auden Musulin Papers 1959-1973 (W. H. Auden's correspondence with Stella Musulin together with other materials evidencing their contact and collaboration); Musulin as Memoirist 1976-1995 (Musulin's memoirs as well as correspondence related to her activities as Auden's memoirist); Photos.

The landing page has been redesigned to offer easy entry points to explore these categories of edition documents. The images used for the category cards (Auden Musulin Papers 1959-1973; Musulin as Memoirist 1976-1995; Photos) have been created with the OpenAI DALL-E 2 AI image generation tool.

### 2.2 Auden through Computer Vision

Another entry point leads users to a feature page dedicated to the AMP project's research (in collaboration with TU Wien's Computer Vision Lab) on reconstructing otherwise 'invisible' lines of poetry from typewriter impressions in two edition documents.

To visualize the three-dimensional surface structure of one of these documents (Autograph Letter Signed W. H. Auden to Stella Musulin 1969-06-10) the Visual Computing Laboratory's RTI viewer (https://vcg.isti.cnr.it/rti/webviewer.php) has been embedded, allowing users to interactively engage with that document.

### 2.3 Search

Full-text and faceted search parameters are now enabled as URL search parameters, thus permitting users to bookmark URLs that represent individual website queries.

## 3 Disclaimer

The facsimile view is not yet optimized for the mobile version of the web application.