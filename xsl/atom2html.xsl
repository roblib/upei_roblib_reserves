<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom"
    exclude-result-prefixes="atom"
    >
    <xsl:output encoding="utf-8" indent="yes" method="xml"/>
    <xsl:variable name="opac_link" select="/atom:feed/atom:entry/atom:link[@rel='opac']" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <body>
                <xsl:apply-templates select="atom:feed/atom:entry"/>
            </body>
        </html>
    </xsl:template>
    
<xsl:template match="atom:entry">
    <xsl:for-each select=".">
         <div class="atom-title"><a>
            <xsl:attribute name='href'><xsl:value-of select="atom:link[@rel='opac']/@href"/></xsl:attribute>
        <xsl:value-of select="atom:title"/></a></div>
        <div class="atom-author"><ul>
           <xsl:for-each select="atom:author/atom:name">
               <li><xsl:value-of select="."/></li>
           </xsl:for-each>
        </ul>
        </div>
        <div class="atom-available">Availability: <xsl:value-of select="*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='holdings']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='volumes']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='volume']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='copies']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='copy']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='status']"/>
        </div>
        <div class="atom-available">Loan Period: <xsl:value-of select="*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='holdings']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='volumes']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='volume']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='copies']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='copy']/*[namespace-uri()='http://open-ils.org/spec/holdings/v1' and local-name()='location']"/>
        </div>
        <br />
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>