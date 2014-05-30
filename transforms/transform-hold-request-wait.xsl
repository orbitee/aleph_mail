<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
       <xsl:call-template name="header"/>

    <!--section-01 (FREE)-->

    <xsl:for-each select="//section-01">
       <xsl:call-template name="section-01"/>
    </xsl:for-each>

    <xsl:call-template name="signature"/>

</xsl:template>


    <!-- START DATA -->
<xsl:template name="header"/>

<!--SECTION-01  (FREE)-->

<xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-circ"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="patron-address-mit-circ"/>

    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line-mit">
       <xsl:with-param name="line" select='concat("The item you requested on ",.//z37-request-date," is currently on loan to another patron.")'/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>

    <xsl:call-template name="bib-info-hdr"/>
    <xsl:call-template name="table-open"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Author of Part:'"/>
       <xsl:with-param name="value" select="./z37-author"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Title of Part:'"/>
       <xsl:with-param name="value" select="./z37-title"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Pages:'"/>
       <xsl:with-param name="value" select="./z37-pages"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Note 1:'"/>
       <xsl:with-param name="value" select="./z37-note-1"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Note 2:'"/>
       <xsl:with-param name="value" select="./z37-note-2"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Data inf:'"/>
       <xsl:with-param name="value" select="./z30-description"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Note:'"/>
       <xsl:with-param name="value" select="./request-type"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line-mit">
       <xsl:with-param name="line" select="'If you placed the request through Your Account, it has initiated a recall that will shorten the current loan time. This item will be available for pick up in one to two weeks depending on the date of the original loan. If other requests were placed before your own, those loans will be limited to two weeks.'"/>
    </xsl:call-template>
<xsl:call-template name="generic-line-mit">
       <xsl:with-param name="line" select="'If you called a service desk to make the request, the current loan period may not have been shortened (depending on what you asked for).'"/>
    </xsl:call-template>
<xsl:call-template name="generic-line-mit">
       <xsl:with-param name="line" select="'Via either method, you will receive an email notification when the item is available for pick-up.'"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="table-close"/>
<xsl:call-template name="generic-line-mit">
       <xsl:with-param name="line" select="'Please log into Your Account http://libraries.mit.edu/barton-account to monitor your request. '"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="blank-line"/>
</xsl:template>

<xsl:template name="signature">
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'Many thanks,'"/>
       </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'MIT Libraries'"/>
       </xsl:call-template>
   </xsl:template>


</xsl:stylesheet>
