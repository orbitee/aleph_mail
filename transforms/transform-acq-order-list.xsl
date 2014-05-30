<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
       <xsl:call-template name="header"/>


    <!--section-01 (FREE)-->
    <xsl:for-each select="//section-01">
       <xsl:call-template name="section-01"/>
    </xsl:for-each>
    <!--section-02 (SPLIT)-->
    <xsl:for-each select="//section-02">
       <xsl:call-template name="section-02"/>
    </xsl:for-each>
    <!--section-03 (FREE)-->
    <xsl:for-each select="//section-03">
       <xsl:call-template name="section-03"/>
    </xsl:for-each>

</xsl:template>


    <!-- START DATA -->
<xsl:template name="header">
    <xsl:call-template name="header-gen-mit">
       <xsl:with-param name="title" select="'PURCHASE ORDER(S)'"/>
    </xsl:call-template>
</xsl:template>

<!--SECTION-01  (FREE)-->
<xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-mono"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="vendor-address"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="./form-date"/>
    </xsl:call-template>
    <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'salutation_string'"/>
    </xsl:call-template>

   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'We would like to place an order for the following title(s).'"/>
   </xsl:call-template>
   
   <xsl:call-template name="blank-line"/>
   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'Our SHIPPING and BILLING Instructions:  '"/>
   </xsl:call-template>

   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'1.  Enclose your invoice with shipment.' "/>
   </xsl:call-template>
   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'2.  Indicate our
PO No. OPPOSITE EACH ITEM listed on your invoice.   Failure to do so will cause a delay in payment.  '"/>
   </xsl:call-template>
   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'3.  Always send the latest edition unless otherwise specified. ' "/>
   </xsl:call-template>
   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select=" '4.  Please contact us
for confirmation if cost exceeds our estimated price by $25.00. ' "/>
   </xsl:call-template>

   <xsl:call-template name="blank-line"/>
   <xsl:call-template name="generic-line">
                <xsl:with-param name="line" select="'Thank you. '"/>
   </xsl:call-template>

   <xsl:call-template name="salutation-end"/>
   <xsl:call-template name="blank-line"/>
   <xsl:call-template name="horizontal-line"/>
</xsl:template>

<!--SECTION-02  (SPLIT)-->
<xsl:template name="section-02">
     <xsl:call-template name="display-gen-split">
        <xsl:with-param name="label" select="'Order Number:'"/>
        <xsl:with-param name="value" select="./z68-order-number"/>
        <xsl:with-param name="style" select="bold"/>
     </xsl:call-template>
     <xsl:if test="./z68-rush!=''">
        <xsl:call-template name="display-gen">
            <xsl:with-param name="label" select="''"/>
            <xsl:with-param name="value" select="'Rush Please'"/>
            <xsl:with-param name="style" select="bold"/>
         </xsl:call-template>
     </xsl:if>
   <xsl:call-template name="bib-info-hdr"/>
    <xsl:call-template name="table-split-open"/>
    <xsl:call-template name="display-gen-split">
       <xsl:with-param name="label" select="'ISBN:'"/>
       <xsl:with-param name="value" select="./z68-isbn"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Vendor Note:'"/>
       <xsl:with-param name="value" select="./z68-vendor-note"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen-split">
       <xsl:with-param name="label" select="'Quantity:'"/>
       <xsl:with-param name="value" select="./z68-no-units"/>
    </xsl:call-template>
    <xsl:call-template name="table-split-right"/>
    <xsl:call-template name="display-gen-split">
       <xsl:with-param name="label" select="'Unit Price:'"/>
       <xsl:with-param name="value" select="./z68-unit-price"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen-split">
       <xsl:with-param name="label" select="'Currency:'"/>
       <xsl:with-param name="value" select="./z68-e-currency"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen-split">
       <xsl:with-param name="label" select="'Price:'"/>
       <xsl:with-param name="value" select="./z68-e-price"/>
    </xsl:call-template>
    <xsl:call-template name="table-split-close"/>
    <xsl:call-template name="horizontal-line"/>
</xsl:template>

<!--SECTION-03  (FREE)-->
<xsl:template name="section-03">
     <xsl:call-template name="blank-line"/>
     <xsl:call-template name="generic-line">
          <xsl:with-param name="line" select="'End of M.I.T. Libraries
Order(s)'"/>
     </xsl:call-template>
</xsl:template>

</xsl:stylesheet>


