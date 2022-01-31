<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes" omit-xml-declaration="no"/>
    <xsl:strip-space elements="*"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "event" adds an event element.</p> 
        </desc>    
    </doc>
    
    <xsl:template name="event-el">
        <xsl:param name="eventType"/>
        <xsl:choose>
            <xsl:when test="string-length(//tei:origDate) > 3">
                <event xml:id="{@xml:id}" type="{$eventType}" facs="{//tei:facsimile/tei:surface[1]/tei:graphic/@url}">
                    <head xml:lang="en">
                        <date>
                            <xsl:choose>
                                <xsl:when test="//tei:origDate/@when-iso">
                                    <xsl:attribute name="when-iso">
                                        <xsl:value-of select="//tei:origDate/@when-iso"/>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="not(//tei:origDate/@when-iso)">                            
                                    <xsl:variable name="date" select="translate(translate(//tei:origDate, '[' ,''), ']', '')"/>
                                    <xsl:choose>
                                        <xsl:when test="string-length($date) = 4">
                                            <xsl:attribute name="when-iso">
                                                <xsl:value-of select="concat(subsequence($date, 1, 4), '-01-01')"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="string-length($date) = 7">
                                            <xsl:attribute name="when-iso">
                                                <xsl:value-of select="concat(subsequence($date, 1, 4), '-01')"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="string-length($date) = 9">
                                            <xsl:attribute name="when-iso">
                                                <xsl:value-of select="replace($date, '\?', '01')"/>
                                            </xsl:attribute>
                                        </xsl:when>  
                                        <xsl:otherwise>
                                            <xsl:attribute name="when-iso">
                                                <xsl:value-of select="$date"/>
                                            </xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>                            
                                </xsl:when>
                            </xsl:choose>                                        
                            <xsl:value-of select="//tei:origDate"/>
                        </date>
                    </head>
                    <label xml:lang="en">
                        <xsl:value-of select="//tei:title[@level='a']"/>
                    </label>
                </event>
            </xsl:when>
        </xsl:choose>                                       
                                    
    </xsl:template>
</xsl:stylesheet>