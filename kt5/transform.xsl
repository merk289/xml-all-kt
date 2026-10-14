<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:call-template name="calculate-sum">
            <xsl:with-param name="current" select="sum-of-sequence/from"/>
            <xsl:with-param name="end" select="sum-of-sequence/to"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="calculate-sum">
        <xsl:param name="current"/>
        <xsl:param name="end"/>

        <xsl:choose>
            <xsl:when test="$current &lt; $end">
                <xsl:variable name="rest-sum">
                    <xsl:call-template name="calculate-sum">
                        <xsl:with-param name="current" select="$current + 1"/>
                        <xsl:with-param name="end" select="$end"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$current + number($rest-sum)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$current"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>