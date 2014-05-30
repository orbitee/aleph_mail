<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>



<xsl:template name="sublib-address">
<xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ1"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ2"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ3"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ4"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ5"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ6"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ7"/><xsl:call-template name="new-line"/>
</xsl:template>

<!-- Template for sublibrary address for letters from monograph acq -->
<xsl:template name="sublib-address-mit-mono">
<xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ1"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ2"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ3"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ4"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ5"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ6"/><xsl:call-template name="new-line"/>
<xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ7"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ8"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ9"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ10"/><xsl:call-template name="new-line"/>
</xsl:template>

<!-- Template for library address on MIT circ notices -->
<xsl:template name="sublib-address-mit-circ">
<xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ1"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ2"/><xsl:call-template name="new-line"/>
<xsl:value-of select="//sub-library-address-1-occ4"/><xsl:call-template name="new-line"/>
</xsl:template>

<!-- Template for library address on MIT debt notice -->
<xsl:template name="sublib-address-mit-circ-2">
<xsl:call-template name="new-line"/>
<xsl:value-of select="'MIT Libraries'"/><xsl:call-template name="new-line"/>
<xsl:value-of select="'77 Massachusetts Ave'"/><xsl:call-template name="new-line"/>
<xsl:value-of select="'Cambridge, MA 02139-4307'"/><xsl:call-template name="new-line"/>
<xsl:value-of select="' '"/><xsl:call-template name="new-line"/>
<xsl:value-of select="'Contact Us: http://libraries.mit.edu/about/'"/><xsl:call-template name="new-line"/>
<xsl:value-of select="'Ask Us: http://libraries.mit.edu/ask'"/><xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="transfer-address">
   <xsl:value-of select="//transfer-library-address-1-occ1"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ2"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ3"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ4"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ5"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ6"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//transfer-library-address-1-occ7"/><xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="patron-address">
   <xsl:value-of select="//z302-address-0"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-address-1"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-address-2"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-address-3"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-address-4"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-zip"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z302-email-address"/><xsl:call-template name="new-line"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron ID'"/>
       <xsl:with-param name="value" select="//z302-id"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron Barcode'"/>
       <xsl:with-param name="value" select="//z308-key-data"/>
    </xsl:call-template>
</xsl:template>

<!-- Template for patron address on MIT circ notices -->
<xsl:template name="patron-address-mit-circ">
   <xsl:value-of select="//z302-address-0"/><xsl:call-template name="new-line"/>
   <xsl:if test="//z302-address-1!=''">
      <xsl:value-of select="//z302-address-1"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="//z302-address-2!=''">
      <xsl:value-of select="//z302-address-2"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="//z302-address-3!=''">
      <xsl:value-of select="//z302-address-3"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="//z302-address-4!=''">
      <xsl:value-of select="//z302-address-4"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="//z302-zip!=''">
      <xsl:value-of select="//z302-zip"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:value-of select="//z302-email-address"/><xsl:call-template name="new-line"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron ID:'"/>
       <xsl:with-param name="value" select="//z302-id"/>
    </xsl:call-template>
</xsl:template>

<xsl:template name="vendor-address">
   <xsl:call-template name="table-open-full"/>
   <xsl:value-of select="//z72-vendor-address-occ1"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ2"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ3"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ4"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ5"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ6"/><xsl:call-template name="new-line"/>
   <xsl:value-of select="//z72-vendor-address-occ7"/><xsl:call-template name="new-line"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Attn'"/>
       <xsl:with-param name="value" select="//z68-vendor-contact"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>


