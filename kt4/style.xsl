<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="city_key" match="item" use="@city"/>
    <xsl:key name="org_key" match="item" use="concat(@city, '|', @org)"/>
    <xsl:template match="/">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Города</title>
        </head>
        <body>
            <h1>Города и компании</h1>
            <ul>
                <xsl:for-each select="orgs/item[generate-id() = generate-id(key('city_key', @city)[1])]">
                    <li>
                        <h3><xsl:value-of select="@city"/></h3>
                        <p>Всего товаров: <xsl:value-of select="count(key('city_key', @city))"/></p>
                        <xsl:for-each select="key('city_key', @city)[generate-id() = generate-id(key('org_key', concat(@city, '|', @org))[1])]">
                            <ul><li>
                                <h4><xsl:value-of select="@org"/></h4>
                                <p>Всего товаров: <xsl:value-of select="count(key('org_key', concat(@city, '|', @org)))"/></p>
                                <ul>
                                    <xsl:for-each select="key('org_key', concat(@city, '|', @org))">
                                        <li><xsl:value-of select="@title"/></li>
                                    </xsl:for-each>
                                </ul>
                            </li></ul>
                        </xsl:for-each>
                    </li>
                </xsl:for-each>
            </ul>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>