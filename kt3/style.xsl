<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="teacher-key" match="teacher" use="."/>
    <xsl:key name="keyword-key" match="keyword" use="."/>

    <xsl:template match="/">
        <html>
            <body>
                <h1>Наши курсы</h1>
                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('teacher-key', 'Борисов И.О.')/../..">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:for-each select="key('keyword-key', 'XML')/../..">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые читает Борисов И.О. и где есть XSLT</h3>
                <ul>

                    <xsl:for-each select="key('teacher-key', 'Борисов И.О.')/../..[keywords/keyword = 'XSLT']">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>