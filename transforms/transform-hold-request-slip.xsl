<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
       <xsl:call-template name="header"/>

<xsl:for-each select="//section-01">
        <xsl:call-template name="section-01"/>
</xsl:for-each>

</xsl:template>

<xsl:template name="header">
    <xsl:call-template name="header-gen-mit">
       <xsl:with-param name="title" select="''"/>
    </xsl:call-template>
</xsl:template>


<xsl:template name="section-01">

<xsl:variable name="HoldPeriod">
 <xsl:choose>
 <xsl:when test="./z30-item-status != 'ILB Loan'">
  <xsl:value-of select="./z37-end-hold-date " /> 
  </xsl:when>
 <xsl:otherwise>
  <xsl:value-of select="'ILB LOAN'" /> 
  </xsl:otherwise>
 </xsl:choose>
</xsl:variable>
    <xsl:call-template name="table-open">
	<xsl:with-param name="font-size" select="12"/>
    </xsl:call-template>	
       <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Name:'"/>
                <xsl:with-param name="value" select="./z302-name"/>
       </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Pickup Location:'"/>
                <xsl:with-param name="value" select="./z37-pickup-location"/>
        </xsl:call-template>
       <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'End Date:'"/>
                <xsl:with-param name="value" select="$HoldPeriod"/>
       </xsl:call-template>
    <xsl:call-template name="table-close"/>
    <xsl:call-template name="sublib-address-mit-circ"/>


        <!--Free Section Code -->
<xsl:call-template name="blank-line"/>
<xsl:call-template name="table-open-full"/>
    <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'Material requested:'"/>
        </xsl:call-template>
<xsl:call-template name="table-close"/>
<xsl:call-template name="bib-info-hdr"/>
<xsl:call-template name="table-open"/>
    <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'Item:'"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Call No:'"/>
                <xsl:with-param name="value" select="./z30-call-no"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Sub Library:'"/>
                <xsl:with-param name="value" select="./z30-sub-library"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Item Status:'"/>
                <xsl:with-param name="value" select="./z30-item-status"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Description:'"/>
                <xsl:with-param name="value" select="./z30-description"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Collection:'"/>
                <xsl:with-param name="value" select="./z30-collection"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Copy Id:'"/>
                <xsl:with-param name="value" select="./z30-copy-id"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Barcode:'"/>
                <xsl:with-param name="value" select="./z30-barcode"/>
                <xsl:with-param name="type" select="'barcode'"/>
        </xsl:call-template>
<xsl:call-template name="table-close"/>
<xsl:call-template name="blank-line"/>
<xsl:call-template name="table-open-full"/>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Author:'"/>
                <xsl:with-param name="value" select="./z37-author"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Title:'"/>
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
<xsl:call-template name="table-close"/>
<xsl:call-template name="blank-line"/>
<xsl:call-template name="table-open-full"/>
    <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'Requested for:'"/>
        </xsl:call-template>
    <xsl:call-template name="patron-address-mit-circ"/>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Bor Status:'"/>
                <xsl:with-param name="value" select="./z305-bor-status"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Bor Type:'"/>
                <xsl:with-param name="value" select="./z305-bor-type"/>
        </xsl:call-template>
<xsl:call-template name="table-close"/>
<xsl:call-template name="blank-line"/>
<xsl:call-template name="table-open-full"/>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Id:'"/>
                <xsl:with-param name="value" select="./z305-id"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Request Date:'"/>
                <xsl:with-param name="value" select="./z37-request-date"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
               <xsl:with-param name="label" select="'Request Time:'"/>
               <xsl:with-param name="value" select="./z37-open-hour"/>
       </xsl:call-template>
     <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'End Request Date:'"/>
                <xsl:with-param name="value" select="./z37-end-request-date"/>
        </xsl:call-template>
    <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Pickup Location:'"/>
                <xsl:with-param name="value" select="./z37-pickup-location"/>
        </xsl:call-template>
<xsl:call-template name="table-close"/>
<xsl:if test="./z37-rush-request !='No' ">
   <xsl:call-template name="horizontal-line"/>
   <xsl:call-template name="table-open-full"/>
      <xsl:call-template name="display-gen">
                <xsl:with-param name="label" select="'Rush Request:'"/>
                <xsl:with-param name="value" select="./z37-rush-request"/>
      </xsl:call-template>
   <xsl:call-template name="table-close"/>
   <xsl:call-template name="horizontal-line"/>
</xsl:if>

</xsl:template>

</xsl:stylesheet>

