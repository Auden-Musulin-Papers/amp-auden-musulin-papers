<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes" omit-xml-declaration="no"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xml:id="amp-timeline__0001.xml">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">Auden Musulin Papers: A Digital Edition of W. H. Auden´s Letters to Stella Musulin (FWF P 33754)</title>
                        <title level="a">Biography</title>
                        <author>
                            <name>Mayer, Sandra</name>
                            <name>Frühwirth, Timo</name>
                            <name>Stoxreiter, Daniel</name>
                        </author>
                        <funder>
                            <name>FWF Austrian Science Fund</name>
                            <address>
                                <street>Sensengasse 1</street>
                                <postCode>1090 Vienna</postCode>
                                <placeName>
                                    <country>A</country>
                                    <settlement>Vienna</settlement>
                                </placeName>
                            </address>
                        </funder>
                    </titleStmt>
                    <editionStmt>
                        <edition>AMP</edition>
                        <respStmt>
                            <resp>Transcription and commentary</resp>
                            <name>Mayer, Sandra</name>
                            <name>Frühwirth, Timo</name>
                        </respStmt>
                        <respStmt>
                            <resp>Automated document creation</resp>
                            <name>Stoxreiter, Daniel</name>
                        </respStmt>
                    </editionStmt>
                    <publicationStmt>
                        <publisher>Austrian Centre for Digital Humanities and Cultural Heritage</publisher>
                        <pubPlace>Vienna</pubPlace>
                        <date when="2021">2021</date>
                        <availability>
                            <licence target="https://creativecommons.org/licenses/by/4.0/deed.en">
                                <p>You are free to: Share — copy and redistribute the material in any medium or format; adapt — remix, transform, and build upon the material
                                    for any purpose, even commercially.</p>
                                <p>The licensor cannot revoke these freedoms as long as you follow the license terms. Under the following terms:</p>
                                <p>Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use. No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.</p>
                                <p>Notices:</p>
                                <p>You do not have to comply with the license for elements of the material in the public domain or where your use is permitted by an applicable exception or limitation. No warranties are given. The license may not give you all of the permissions necessary for your intended use. For example, other rights such as publicity, privacy, or moral rights may limit how you use the material.</p>
                            </licence>
                            <p>Copyright literary texts W. H. Auden Estate of W. H. Auden.</p>
                        </availability>
                    </publicationStmt>
                    <seriesStmt>
                        <p>Machine-Readable Transcriptions of the Auden Musulin Papers</p>
                    </seriesStmt>
                    <sourceDesc>
                        <p>born digital</p>
                    </sourceDesc>
                </fileDesc>
                <profileDesc>
                    <langUsage>
                        <language ident="en">English</language>
                    </langUsage>
                </profileDesc>
                <revisionDesc status="draft">
                    <change who="dstoxreiter" when="2022-01-24">document created</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <listEvent>
                       <xsl:call-template name="event"/>
                    </listEvent>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template name="event">
        <xsl:for-each select="collection('../data/editions/correspondence')//tei:TEI">
            <event xml:id="{@xml:id[1]}">
                <head xml:lang="en">
                    Kirchstetten, 
                    <date>
                        <xsl:choose>
                            <xsl:when test="//tei:origDate/@when-iso">
                                <xsl:attribute name="when-iso">
                                    <xsl:value-of select="//tei:origDate/@when-iso"/>
                                </xsl:attribute>
                            </xsl:when>
                        </xsl:choose>                                        
                        <xsl:value-of select="//tei:origDate"/>
                    </date>
                </head>
                <ab xml:lang="en">
                    <xsl:value-of select="//tei:title[@level='a']"/>
                </ab>
            </event>
        </xsl:for-each>
        <!--<xsl:for-each select="collection('../data/editions/photos')//tei:TEI">
                <event>
                    <head xml:lang="en">
                        Kirchstetten, 
                        <date>
                            <xsl:choose>
                                <xsl:when test="//tei:origDate/@when-iso">
                                    <xsl:attribute name="when-iso">
                                        <xsl:value-of select="//tei:origDate/@when-iso"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>                                        
                            <xsl:value-of select="//tei:origDate"/>
                        </date>
                    </head>
                    <ab xml:lang="en">
                        <xsl:value-of select="//tei:title[@level='a']"/>
                    </ab>
                </event>
            </xsl:for-each>
            <xsl:for-each select="collection('../data/editions/additional-materials')//tei:TEI">
                <event>
                    <head xml:lang="en">
                        Kirchstetten, 
                        <date>
                            <xsl:choose>
                                <xsl:when test="//tei:origDate/@when-iso">
                                    <xsl:attribute name="when-iso">
                                        <xsl:value-of select="//tei:origDate/@when-iso"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>                                        
                            <xsl:value-of select="//tei:origDate"/>
                        </date>
                    </head>
                    <ab xml:lang="en">
                        <xsl:value-of select="//tei:title[@level='a']"/>
                    </ab>
                </event>
            </xsl:for-each>
            <xsl:for-each select="collection('../data/editions/memoirs')//tei:TEI">
                <event>
                    <head xml:lang="en">
                        Kirchstetten, 
                        <date>
                            <xsl:choose>
                                <xsl:when test="//tei:origDate/@when-iso">
                                    <xsl:attribute name="when-iso">
                                        <xsl:value-of select="//tei:origDate/@when-iso"/>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>                                        
                            <xsl:value-of select="//tei:origDate"/>
                        </date>
                    </head>
                    <ab xml:lang="en">
                        <xsl:value-of select="//tei:title[@level='a']"/>
                    </ab>
                </event>
            </xsl:for-each>-->
    </xsl:template>
    
</xsl:stylesheet>