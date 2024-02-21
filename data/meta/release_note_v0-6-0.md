# Pre-Release v0.5.0 

###Release of v0.6.0 of the Auden Musulin Papers SDE web app, based on [v0.9.0 of the amp-data repository](https://github.com/Auden-Musulin-Papers/amp-data).

## 1 Data

### 1.1 ODD

###The AMP ODD has been updated to support editorial interpretation both in human-language and TEI formalization within an XML/TEI environment.

###@Daniel: acdh namespace?, linking to other amp documents, to interp in other docs, to entities?

### 1.2 Markup of Contents

###For the full **core correspondence** (the Auden-Musulin correspondence 1959-1973), editorial interpretation is now encoded in XML/TEI within the `<interpGrp>` element of the `<teiHeader>`; the respective elements within the textual data or metadata to which the editorial interpretations refer are linked to the relevant `<interp>` elements via the `ana` attribute. The `<desc>` elements within the `<interp>` nodes contain human-readable comments intended for UI display; furthermore, TEI elements have been used to partly formalize editorial interpretation in machine-readable format (such as bibliographic references encoded via `<bibl>`). Thus, the results of intensive editorial investigation (such as interviews, study of biographic sources, and archival research) are offered to users in multiple ways together with the TEI markup of confidence (by means of `<certainty>`) and responsiblity (`<respons`). The editorial comments enrich the edited documents by providing both biographical and historical information.

###In the core correspondence, intertextuality has been encoded via the TEI `<quote>` element to provide information on the quoted source.

###The system of numbering pages has been updated to provide information on the position of transcribed contents on the sheet, by specifying recto and verso by means of the `ed` attribute (e.g., `ed="1r"` and `ed="1v"` for the recto and verso of the first digitized item of a document, respectively).

### 1.3 Documents

###The previously missing facsimiles of the sheet of [Auden's letter from 30 April 1962](https://amp.acdh.oeaw.ac.at/amp-transcript__0059.html) have been digitally reproduced and are now available through the AMP SDE.

## 2 Web Application Features

### 2.1 Search

###@Daniel

### 2.2 Updated Document View

###The detail document view now includes options for enabling/disabling the display not only of comments, but also of intertextuality information.

## 3 Disclaimer

###In its present state, the AMP edition relies on a heterogenously developed dataset. The core correspondence set of documents (amp-transcript__0001 to 0025, 0035, 0038-0045, 0053, 0057-0059, 0063, 0070-0071) features the updated correspondence schema introduced with pre-release v0.7.0 of amp-data, the markup of contents (in terms of the TEI `<event>` element) introduced (for a subset of documents) in v0.8.0, as well as the markup of editorial interpretation described above. Developing editorial solutions for the markup of non-correspondence prose texts as well as photographs is in progress.

###Archiving is in progress, so that the PIDs (resource handles displayed in the document metadata) currently do not link to the most up-to-date versions of the edition resources.