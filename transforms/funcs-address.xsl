<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>



<xsl:template name="sublib-address">
   <TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial">
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ1"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ2"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ3"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ4"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ5"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ6"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ7"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ8"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ9"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ10"/></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<!-- Template for sublibrary address for letters from monograph acq -->

<xsl:template name="sublib-address-mit-mono">
   <TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial">
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ1"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ2"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ3"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ4"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ5"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ6"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="blank-line"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ7"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ8"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ9"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ10"/></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<!-- Template for library address on MIT circ notices -->
<xsl:template name="sublib-address-mit-circ">
   <TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial">
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ1"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ2"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ4"/></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<!-- Template for library address on MIT debt notice -->
<xsl:template name="sublib-address-mit-circ-2">
   <TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial">
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="'MIT Libraries'"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="'77 Massachusetts Ave'"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="'Cambridge, MA 02139-4307'"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="' '"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="'Contact Us: http://libraries.mit.edu/about/'"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="'Ask Us: http://libraries.mit.edu/ask'"/></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<!-- template to remove unnecessary address info for the monographs 
     acquisition's "Arrival Slip" report-->
<xsl:template name="sublib-address-mit-m-arrival">
   <TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial">
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ1"/></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"></td><td><xsl:value-of select="//sub-library-address-1-occ2"/></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<xsl:template name="transfer-address">
   <xsl:call-template name="table-open-full"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ1"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ2"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ3"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ4"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ5"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ6"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ7"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ8"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ9"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//transfer-library-address-1-occ10"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-close"/>
</xsl:template>

<xsl:template name="patron-address">
   <xsl:call-template name="table-open-full"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-0"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-1"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-2"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-3"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-4"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-zip"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-telephone"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-email-address"/></td><td></td><xsl:call-template name="table-end-row"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron ID:'"/>
       <xsl:with-param name="value" select="//z302-id"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron Barcode'"/>
       <xsl:with-param name="value" select="//z308-key-data"/>
    </xsl:call-template>
   <td/>
   <xsl:call-template name="table-close"/>
<!--    <xsl:call-template name="table-open"/>
    <xsl:call-template name="table-close"/>-->
</xsl:template>

<!-- Template for patron address on MIT circ notices -->
<xsl:template name="patron-address-mit-circ">
   <xsl:call-template name="table-open-full"/>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-0"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:if test="//z302-address-1!=''">
      <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-1"/></td><td></td><xsl:call-template name="table-end-row"/>
   </xsl:if>
   <xsl:if test="//z302-address-2!=''">
      <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-2"/></td><td></td><xsl:call-template name="table-end-row"/>
   </xsl:if>
   <xsl:if test="//z302-address-3!=''">
      <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-3"/></td><td></td><xsl:call-template name="table-end-row"/>
   </xsl:if>
   <xsl:if test="//z302-address-4!=''">
      <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-address-4"/></td><td></td><xsl:call-template name="table-end-row"/>
   </xsl:if>
   <xsl:if test="//z302-zip!=''">
      <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-zip"/></td><td></td><xsl:call-template name="table-end-row"/>
   </xsl:if>
   <xsl:call-template name="table-start-row"/><td colspan="2" width="70%"><xsl:value-of select="//z302-email-address"/></td><td></td><xsl:call-template name="table-end-row"/>
<!--   <xsl:call-template name="table-close"/>
    <xsl:call-template name="table-open"/>-->
<!--    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Patron ID:'"/>
       <xsl:with-param name="value" select="//z302-id"/>
    </xsl:call-template>-->
    <tr><td width="20%">
    Patron ID:</td>
    <td><xsl:value-of select="//z302-id"/></td><td/></tr>
    <xsl:call-template name="table-close"/>
</xsl:template>

<xsl:template name="vendor-address">
   <xsl:call-template name="table-open-full"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ1"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ2"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ3"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ4"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ5"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ6"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-start-row"/><td width="70%"><xsl:value-of select="//z72-vendor-address-occ7"/></td><td></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-close"/>
<!--
    <xsl:call-template name="table-open"/>
    <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Attn:'"/>
       <xsl:with-param name="value" select="//z68-vendor-contact"/>
    </xsl:call-template>
    <xsl:call-template name="table-close"/>
-->
</xsl:template>



     

</xsl:stylesheet>

