<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes" omit-xml-declaration="no"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>        
    </xsl:template>
    <xsl:template match="tei:listEvent">
        <xsl:variable name="date" select="if (./tei:head/tei:date/@when-iso) then(./tei:head/tei:date/@when-iso) else(./tei:head/tei:date/@when)"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>            
            <xsl:apply-templates select="./tei:event">
                <xsl:sort select="$date" data-type="text" order="descending"/>
            </xsl:apply-templates>
        </xsl:copy>        
    </xsl:template>
    
</xsl:stylesheet>