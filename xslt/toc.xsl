<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Table of Contents'"/>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <meta name="Document type" class="staticSearch_desc" content="table of content"/>
            </head>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container-fluid">
                        <div id="navBarLetters" style="margin-top:4em !important;">
                            <ul class="nav nav-tabs" id="dropdown-lang">
                                <li class="nav-item">                                    
                                    <a title="Cards" href="#cards-tab" data-toggle="tab" class="nav-link btn btn-round active">
                                        show cards
                                    </a>
                                </li>
                                <li class="nav-item">                                    
                                    <a title="Table" href="#table-tab" data-toggle="tab" class="nav-link btn btn-round">
                                        show table
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane active" id="cards-tab" tabindex="-1">  
                                <div class="row">
                                    <xsl:for-each select="collection('../data/editions')//tei:TEI">
                                        <xsl:variable name="full_path">
                                            <xsl:value-of select="document-uri(/)"/>
                                        </xsl:variable>                                
                                        <!--<xsl:variable name="date" select="//tei:correspAction/tei:date/@when-iso"/>-->
                                        <div class="col-md-4" style="padding: 0 !important;">
                                            <a>
                                                <xsl:attribute name="href">                                                
                                                    <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                                </xsl:attribute>
                                                <div class="card index-card" style="margin:.2em !important;">                                 
                                                    <div class="card-body">
                                                        <xsl:variable name="iiif-ext" select="'full/full/0/default.jpg'"/>
                                                        <img>
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="concat(//tei:pb[1]/@facs, $iiif-ext)"/>
                                                            </xsl:attribute>
                                                        </img>
                                                    </div>
                                                    <div class="card-header">                                                      
                                                        <p style="padding: .2em!important;margin:0!important;"><xsl:value-of select="//tei:correspAction[@type='sent']/tei:persName"/> to <xsl:value-of select="//tei:correspAction[@type='received']/tei:persName"/></p>
                                                        <p style="padding: .2em!important;margin:0!important;"><xsl:value-of select="//tei:correspAction[@type='sent']/tei:date"/></p>
                                                        <p style="padding: .2em!important;margin:0!important;"><xsl:value-of select="//tei:revisionDesc/tei:change[last()]"/></p>
                                                    </div>                                        
                                                </div>
                                            </a>
                                        </div>                                
                                    </xsl:for-each>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="table-tab" tabindex="-1">                        
                                <div class="card">
                                    <div class="card-header">
                                        <h1>Table of Contents</h1>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped display" id="tocTable" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Date</th>
                                                    <th scope="col">Latest Revisions Data</th>
                                                    <th scope="col">Latest Revisions Content</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <xsl:for-each select="collection('../data/editions')//tei:TEI">
                                                    <xsl:variable name="full_path">
                                                        <xsl:value-of select="document-uri(/)"/>
                                                    </xsl:variable>
                                                    <!--<tr>
                                                        <td>                                        
                                                            <a>
                                                                <xsl:attribute name="href">                                                
                                                                    <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="data(.//tei:origDate/@when-iso)"/>
                                                        </td>  
                                                    </tr>-->
                                                    <xsl:for-each select=".//tei:revisionDesc/tei:change[position()=last()]/self::tei:change">                                                
                                                        <tr>
                                                            <td>
                                                                <a>
                                                                    <xsl:attribute name="href">                                                
                                                                        <xsl:value-of select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"/>
                                                                    </xsl:attribute>
                                                                    <xsl:value-of select="//tei:title[@level='a'][1]/text()"/>
                                                                </a>
                                                            </td>
                                                            <td><xsl:value-of select="data(//tei:origDate/@when-iso)"/></td>
                                                            <td>
                                                                <ul>
                                                                    <li><xsl:value-of select="concat(@when/name(), ': ' ,@when)"/></li>
                                                                    <li><xsl:value-of select="concat(@who/name(), ': ', @who)"/></li>
                                                                </ul>                                                                                                                                            
                                                            </td>
                                                            <td>
                                                                <xsl:apply-templates/>                                                                                             
                                                            </td>  
                                                        </tr>                                                                                                                                             
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                    
                    <xsl:call-template name="html_footer"/>
                    <script>
                        $(document).ready(function () {
                            createDataTable('tocTable')
                        });
                    </script>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>