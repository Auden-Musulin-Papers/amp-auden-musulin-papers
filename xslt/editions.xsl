<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:output exclude-result-prefixes="#all" encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">
                        <div class="card" style="margin-top: 1em;">
                            <div class="card card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                            <div class="card card-body">
                                <xsl:apply-templates select="//tei:text"/>
                            </div>
                        </div>
                        <div class="card" style="margin: 1em 0 5em 0;">
                            <div class="card card-header">
                                <h1>Facsimile</h1>
                            </div>
                            <div class="card card-body">
                                <xsl:call-template name="osd-container"/>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
                    
    
    <xsl:template match="tei:lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="tei:pb">
        <hr />
    </xsl:template>
</xsl:stylesheet>