<?xml version="1.0" encoding= "ISO-8859-1"?>
<xsl:xml-stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <xsl:template match="/text">
        <html>
        <body>
            <xsl:for-each select="div"><br />
            <xsl:value-of select="pb"><br />
            <xsl:value-of select="p"><br />
            </xsl:for-each>


</body>
</html>
</xsl:template>
</xsl:xml-stylesheet>