<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8" media-type="text/plain" indent="no"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="tei:editionStmt">
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
    </xsl:template>-->  
    
    <!--<xsl:template match="tei:titleStmt/tei:editor">
        <xsl:copy>
            <name xmlns="http://www.tei-c.org/ns/1.0" xml:id="smayer" ref="https://orcid.org/0000-0002-2915-5888">Mayer, Sandra</name>
            <name xmlns="http://www.tei-c.org/ns/1.0" xml:id="tfruewirth" ref="https://orcid.org/0000-0002-3997-5193">Frühwirth, Timo</name>
            <name xmlns="http://www.tei-c.org/ns/1.0" xml:id="dgrigoriou" ref="https://orcid.org/0000-0002-0914-9245">Grigoriou, Dimitra</name>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="tei:titleStmt/tei:editor/tei:name[@xml:id='tfruewirth']">
        <name xmlns="http://www.tei-c.org/ns/1.0" xml:id="tfruehwirth" ref="https://orcid.org/0000-0002-3997-5193">Frühwirth, Timo</name>
    </xsl:template>
    
    <!--<xsl:template match="tei:editionStmt/tei:respStmt">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="./tei:resp/text() = 'Transcription and commentary'">
                    <resp xmlns="http://www.tei-c.org/ns/1.0">Transcription and commentary</resp>
                    <name xmlns="http://www.tei-c.org/ns/1.0" sameAs="smayer" ref="https://orcid.org/0000-0002-2915-5888">Mayer, Sandra</name>
                    <name xmlns="http://www.tei-c.org/ns/1.0" sameAs="tfruewirth" ref="https://orcid.org/0000-0002-3997-5193">Frühwirth, Timo</name>
                    <name xmlns="http://www.tei-c.org/ns/1.0" sameAs="dgrigoriou" ref="https://orcid.org/0000-0002-0914-9245">Grigoriou, Dimitra</name>
                </xsl:when>
                <xsl:when test="./tei:resp/text() = 'Generation of computer-vision visualizations'">
                    <resp xmlns="http://www.tei-c.org/ns/1.0">Generation of computer-vision visualizations</resp>
                    <name xmlns="http://www.tei-c.org/ns/1.0" xml:id="sbrenner" ref="https://orcid.org/0000-0001-6909-7099">Brenner, Simon</name>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xsl:template match="tei:titleStmt/tei:author">
        <xsl:choose>
            <xsl:when test="contains(./text(),'Auden')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/118650963"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Stella')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/127246711"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Kraus')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/116413298"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Spiel')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/118751980"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Janko')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/115753761"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Breicha')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/116469986"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'sterreichische Gesellschaft für Literatur')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/2175892-X"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Blaha')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://id.acdh.oeaw.ac.at/rblaha"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Elsa')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://id.acdh.oeaw.ac.at/emusulin"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Sullivan')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/1173017283"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Mendelson')">
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/14000761X"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Elizabeth')"><!-\- added; already in arche Baserow -\->
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/117542784"><xsl:value-of select="./text()"/></author>
            </xsl:when>
            <xsl:when test="contains(./text(), 'Busta')"><!-\- added; added also to arche Baserow -\->
                <author xmlns="http://www.tei-c.org/ns/1.0" ref="https://d-nb.info/gnd/119022354"><xsl:value-of select="./text()"/></author>
            </xsl:when>
        </xsl:choose>
    </xsl:template>-->
</xsl:stylesheet>