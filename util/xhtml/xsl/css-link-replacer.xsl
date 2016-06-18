<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"    
    version="2.0">

    <xsl:output encoding="UTF-8" indent="no"  method="xml"/>

    <xsl:param name="css.link" required="yes"/> <!-- reduce-depth -->

    <xsl:template match="link[@rel='stylesheet']">
        <xsl:element name="link">
            <xsl:copy-of select="@*"/>
            <xsl:if test="$css.link eq 'reduce-depth'">
                <xsl:attribute name="href">
                    <xsl:value-of select="replace(@href,'\.\./\.\./','../')"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$css.link eq 'increase-depth'">
                <xsl:attribute name="href">
                    <xsl:value-of select="replace(@href,'\.\./\.\./','../../../')"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$css.link eq 'rendition'">
                <xsl:attribute name="href">
                    <xsl:value-of select="replace(@href,'\.\./\.\./','../../epub/')"/>
                </xsl:attribute>
            </xsl:if>
        </xsl:element>        
    </xsl:template>
    
    <!-- piggyback fix for the idpf logo --> 
    
    <xsl:template match="img[@class='logo']">
        <xsl:element name="img">
            <xsl:copy-of select="@*"/>
            <xsl:if test="$css.link eq 'reduce-depth'">
                <xsl:attribute name="src">
                    <xsl:value-of select="replace(@src,'\.\./\.\./','../')"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$css.link eq 'increase-depth'">
                <xsl:attribute name="src">
                    <xsl:value-of select="replace(@src,'\.\./\.\./','../../../')"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$css.link eq 'rendition'">
                <xsl:attribute name="src">
                    <xsl:value-of select="replace(@src,'\.\./\.\./','../../epub/')"/>
                </xsl:attribute>
            </xsl:if>
        </xsl:element>        
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>