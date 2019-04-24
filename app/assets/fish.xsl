 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <ul id='rootOfList'>
 <xsl:for-each select="objects/object">
 <li>
 <xsl:value-of select="genus"/>,
 <xsl:value-of select="commonname"/>
 <xsl:value-of select="description"/>
 <xsl:value-of select="files"/>
 
 </li>
 </xsl:foreach>
 </ul>
 </xsl:template>