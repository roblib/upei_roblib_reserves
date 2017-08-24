<xsl:stylesheet
        version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:atom="http://www.w3.org/2005/Atom"
        xmlns:v1="http://open-ils.org/spec/holdings/v1"
        exclude-result-prefixes="atom v1"
        >
    <xsl:output encoding="utf-8" indent="yes" method="html"/>
    <xsl:variable name="opac_link"
                  select="/atom:feed/atom:entry/atom:link[@rel='opac']"/>
    <xsl:template match="/">
            <xsl:apply-templates select="atom:feed/atom:entry"/>
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
                <div class="atom-publication-date">
                    Publication date:
                    <xsl:value-of select="atom:published"/>
                </div>
                <div class="atom-author">Authors:
                    <ul class="atom-list">
                        <xsl:for-each select="atom:author/atom:name">
                            <li class="atom-list-item">
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="atom-holdings">Holdings:
                    <ul class="atom-list">
                        <xsl:for-each select="v1:holdings/v1:volumes/v1:volume/v1:copies/v1:copy">
                            <li class="atom-available">
                                <xsl:value-of select="v1:location"/><xsl:text> </xsl:text>
                                (<xsl:value-of select="v1:status"/>)
                            </li>

                        </xsl:for-each>
                    </ul>
                </div>
            </div>
            <br/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
