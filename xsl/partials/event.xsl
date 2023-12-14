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

            <event xml:id="{@xml:id}" type="{$eventType}" facs="{//tei:facsimile/tei:surface[1]/tei:graphic/@url}">
                <head xml:lang="en">
                    <date>                        
                        <xsl:if test="//tei:origDate/@notBefore-iso">
                            <xsl:attribute name="notBefore">
                                <xsl:value-of select="//tei:origDate/@notBefore-iso"/>
                            </xsl:attribute>
                        </xsl:if>   
                        <xsl:if test="//tei:origDate/@notAfter-iso">
                            <xsl:attribute name="notAfter">
                                <xsl:value-of select="//tei:origDate/@notAfter-iso"/>
                            </xsl:attribute>
                        </xsl:if> 
                        <xsl:if test="//tei:origDate/@when-iso">
                            <xsl:attribute name="notBefore">
                                <xsl:value-of select="//tei:origDate/@when-iso"/>
                            </xsl:attribute>
                            <xsl:attribute name="notAfter">
                                <xsl:value-of select="//tei:origDate/@when-iso"/>
                            </xsl:attribute>
                        </xsl:if>                                         
                        <xsl:value-of select="//tei:origDate"/>
                    </date>
                </head>
                <label xml:lang="en">
                    <xsl:value-of select="//tei:title[@level='a']"/>
                </label>
            </event>
                                    
    </xsl:template>
</xsl:stylesheet>