<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:variable name="constants">
            <xsl:for-each select=".//node()[parent::acdh:RepoObject]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="ImgConstants">
            <xsl:for-each select=".//node()[parent::acdh:FacsConstants]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="TopColId">
            <xsl:value-of select="data(.//acdh:TopCollection/@rdf:about)"/>
        </xsl:variable>
        <rdf:RDF xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#">
            <acdh:TopCollection>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select=".//acdh:TopCollection/@rdf:about"/>
                </xsl:attribute>
                <xsl:copy-of select="$constants"/>
                <xsl:for-each select=".//node()[parent::acdh:TopCollection]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </acdh:TopCollection>
            <acdh:Collection rdf:about="https://id.acdh.oeaw.ac.at/auden-musulin-papers/facs">
                <acdh:isPartOf rdf:resource="https://id.acdh.oeaw.ac.at/auden-musulin-papers"/>
                <acdh:hasCurator rdf:resource="https://d-nb.info/gnd/1024881253"/>
                <acdh:hasTitle xml:lang="en">Facsimiles (Highest Resolution)</acdh:hasTitle>
                <acdh:hasDescription xml:lang="en">Highest-resolution digital facsimiles of the Auden Musulin Papers</acdh:hasDescription>
                <xsl:copy-of select="$ImgConstants"/>
            </acdh:Collection>
            <acdh:Collection rdf:about="https://id.acdh.oeaw.ac.at/auden-musulin-papers/web-img">
                <acdh:isPartOf rdf:resource="https://id.acdh.oeaw.ac.at/auden-musulin-papers"/>
                <acdh:hasCurator rdf:resource="https://d-nb.info/gnd/1024881253"/>
                <acdh:hasTitle xml:lang="en">Facsimiles (Lower-Resolution Web Images)</acdh:hasTitle>
                <acdh:hasDescription xml:lang="en">Lower-resolution digital facsimiles of the Auden Musulin Papers for web display</acdh:hasDescription>
                <xsl:copy-of select="$ImgConstants"/>
            </acdh:Collection>
            
            <xsl:for-each select=".//node()[parent::acdh:MetaAgents]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            <xsl:for-each select=".//acdh:Collection">
                <acdh:Collection>
                    <xsl:attribute name="rdf:about"><xsl:value-of select="@rdf:about"/></xsl:attribute>
                    <xsl:copy-of select="$constants"/>
                    <xsl:for-each select=".//node()">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </acdh:Collection>
            </xsl:for-each>
            <xsl:for-each select="collection('../data/editions')//tei:TEI[.//tei:idno[@type='handle']]">
<!--TEIs-->
                <xsl:variable name="partOf">
                    <xsl:value-of select="concat(@xml:base, '/editions')"/>
                </xsl:variable>
                <xsl:variable name="id">
                    <xsl:value-of select="concat($TopColId, '/', @xml:id)"/>
                </xsl:variable>
                <acdh:Resource rdf:about="{$id}">
                    <xsl:if test=".//tei:idno[@type='handle']/text()">
                        <acdh:hasPid><xsl:value-of select=".//tei:idno[@type='handle']/text()"/></acdh:hasPid>
                    </xsl:if>
                    <acdh:hasTitle xml:lang="de"><xsl:value-of select=".//tei:title[@level='a'][1]/text()"/></acdh:hasTitle>
                    <acdh:hasAccessRestriction rdf:resource="https://vocabs.acdh.oeaw.ac.at/archeaccessrestrictions/public"/>
                    <acdh:hasCategory rdf:resource="https://vocabs.acdh.oeaw.ac.at/archecategory/text/tei"/>
                    <acdh:hasLanguage rdf:resource="https://vocabs.acdh.oeaw.ac.at/iso6393/eng"/>
                    <acdh:isPartOf rdf:resource="{$partOf}"/>
                    <xsl:copy-of select="$constants"/>
                </acdh:Resource>
<!-- IMG (MASTER) -->
                <xsl:for-each select=".//tei:pb">
                    <xsl:variable name="facsId">
                        <xsl:value-of select="replace(substring-after(@facs, 'amp/'), '/', '.tif')"/>
                    </xsl:variable>
                    <xsl:variable name="facsUrl">
                        <xsl:value-of select="concat($TopColId, '/', $facsId)"/>
                    </xsl:variable>
                    <acdh:Resource rdf:about="{$facsUrl}">
                        <acdh:isPartOf rdf:resource="{concat($TopColId, '/facs')}"/>
                        <acdh:hasTitle xml:lang="en"><xsl:value-of select="$facsId"/> (<xsl:value-of select="data(@type)"/>)</acdh:hasTitle>
                        <acdh:isSourceOf rdf:resource="{$id}"/>
                        <xsl:copy-of select="$ImgConstants"/>
                    </acdh:Resource>
                </xsl:for-each>
<!-- IMG (WEB) -->
                <xsl:for-each select=".//tei:pb">
                    <xsl:variable name="facsId">
                        <xsl:value-of select="replace(substring-after(@facs, 'amp/'), '/', '.jpg')"/>
                    </xsl:variable>
                    <xsl:variable name="facsUrl">
                        <xsl:value-of select="concat($TopColId, '/', $facsId)"/>
                    </xsl:variable>
                    <acdh:Resource rdf:about="{$facsUrl}">
                        <acdh:isPartOf rdf:resource="{concat($TopColId, '/web-img')}"/>
                        <acdh:hasTitle xml:lang="en"><xsl:value-of select="$facsId"/> (<xsl:value-of select="data(@type)"/>)</acdh:hasTitle>
                        <acdh:isSourceOf rdf:resource="{$id}"/>
                        <xsl:copy-of select="$ImgConstants"/>
                    </acdh:Resource>
                </xsl:for-each>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>   
</xsl:stylesheet>