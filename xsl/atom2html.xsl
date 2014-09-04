<xsl:stylesheet
        version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:atom="http://www.w3.org/2005/Atom"
        xmlns:v1="http://open-ils.org/spec/holdings/v1"
        exclude-result-prefixes="atom"
        >
    <xsl:output encoding="utf-8" indent="yes" method="xml"/>
    <xsl:variable name="opac_link"
                  select="/atom:feed/atom:entry/atom:link[@rel='opac']"/>
    <xsl:template match="/">
        <div class="upei-roblib-reserves">
            <xsl:apply-templates select="atom:feed/atom:entry"/>
        </div>
    </xsl:template>

    <xsl:template match="atom:entry">
        <xsl:for-each select=".">
            <div class="atom-entry">
                <div class="atom-title">
                    <a>
                        <xsl:attribute name='href'>
                            <xsl:value-of
                                    select="atom:link[@rel='opac']/@href"/>
                        </xsl:attribute>
                        <xsl:value-of select="atom:title"/>
                    </a>
                </div>
                <div class="atom-author">
                    <ul class="atom-list">
                        <xsl:for-each select="atom:author/atom:name">
                            <li class="atom-list-item">
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <ul class="atom-holdings">Holdings:
                    <xsl:for-each select="//v1:copy">
                        <li class="atom-available">
                            <xsl:value-of select="v1:status"/><xsl:text> </xsl:text>
                            Period:
                            <xsl:value-of select="v1:location"/>
                        </li>

                    </xsl:for-each>
                </ul>
            </div>
            <br/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>