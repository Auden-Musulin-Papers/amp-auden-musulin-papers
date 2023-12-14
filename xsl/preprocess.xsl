<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8" media-type="text/plain" indent="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:editionStmt">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <respStmt xmlns="http://www.tei-c.org/ns/1.0">
                <resp xmlns="http://www.tei-c.org/ns/1.0">TEI Schema, ODD/RNG</resp>
                <name xmlns="http://www.tei-c.org/ns/1.0" ref="https://orcid.org/0000-0002-9575-9372"
                    xml:id="pandorfer">Andorfer, Peter</name>
                <name xmlns="http://www.tei-c.org/ns/1.0" ref="https://orcid.org/0000-0002-0636-4476"
                    xml:id="delsner">Elsner, Daniel</name>
            </respStmt>
        </xsl:copy>
    </xsl:template>  
    
    <xsl:template match="tei:name[parent::tei:editor]">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="./text() = 'Mayer, Sandra'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-2915-5888</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="xml:id">
                        <xsl:text>smayer</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="text() = 'Frühwirth, Timo'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-3997-5193</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="xml:id">
                        <xsl:text>tfruewirth</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="text() = 'Grigoriou, Dimitra'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-0914-9245</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="xml:id">
                        <xsl:text>dgrigoriou</xsl:text>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:name[parent::tei:respStmt]">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="./text() = 'Mayer, Sandra'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-2915-5888</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="sameAs">
                        <xsl:text>smayer</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="text() = 'Frühwirth, Timo'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-3997-5193</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="sameAs">
                        <xsl:text>tfruewirth</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="text() = 'Grigoriou, Dimitra'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0002-0914-9245</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="sameAs">
                        <xsl:text>dgrigoriou</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="text() = 'Brenner, Simon'">
                    <xsl:attribute name="ref">
                        <xsl:text>https://orcid.org/0000-0001-6909-7099</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="xml:id">
                        <xsl:text>sbrenner</xsl:text>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>