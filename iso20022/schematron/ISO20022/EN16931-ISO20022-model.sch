<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="EN16931" id="EN16931-ISO20022-Model">

		<!-- CONTEXT ADDITIONAL_SUPPORTING_DOCUMENTS  -->
		<param name="Additional_supporting_documents " value="//Document/FinInvc/TradAgrmt/AddtlRefDoc"/>
		<param name="BR-52 " value="(DocNb)"/>
		<!-- CONTEXT CARD_INFORMATION  -->
		<param name="Card_information " value="//Document/FinInvc/TradSttlm/PmtMeans/Id"/>
		<param name="BR-51 " value="string-length(Id)&lt;=6 and string-length(Id)&gt;=4"/>
		<!-- CONTEXT CREDITTRANSFER_INFORMATION  -->
		<param name="CreditTransfer_information " value="//Document/FinInvc/TradSttlm/PmtMeans/PyeeCdtrAcct"/>
		<param name="BR-50 " value="(Id/IBAN)"/>
		<!-- CONTEXT DOCUMENT_LEVEL_ALLOWANCES  -->
		<param name="Document_level_allowances " value="//Document/FinInvc/TradSttlm"/>
		<param name="BR-31 " value="(MntrySummtn/AllwncTtlAmt)"/>
		<param name="BR-32 " value="(SubTtlClctdTax/CtgyCd)"/>
		<param name="BR-33 " value="(AllwncChrg/Rsn/ChrgTp/Prtry/Id) or (AllwncChrg/Rsn/ChrgTp/Cd)"/>
		<param name="BR-34 " value="(MntrySummtn/AllwncTtlAmt) &gt;=0 or not (MntrySummtn/LineTtlAmt)"/>
		<param name="BR-35 " value="(MntrySummtn/LineTtlAmt &gt;=0) or not (MntrySummtn/LineTtlAmt)"/>
		<param name="BR-CO-05 " value="true()"/>
		<param name="BR-CO-21 " value="(AllwncChrg/Rsn/ChrgTp/Prtry/Id) or (AllwncChrg/Rsn/ChrgTp/Cd )"/>
		<param name="BR-DEC-01 " value="string-length(substring-after(AllwncTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-02 " value="string-length(substring-after(LineTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-03 " value="string-length(substring-after(DscntPctRate,'.'))&lt;=4"/>
		<param name="BR-DEC-04 " value="string-length(substring-after((SubTtlClctdTax/ClctdRate)[1],'.'))&lt;=4"/>
		<!-- CONTEXT DOCUMENT_LEVEL_CHARGES  -->
		<param name="Document_level_charges " value="//Document/FinInvc/TradSttlm"/>
		<param name="BR-36 " value="(MntrySummtn/ChrgTtlAmt)"/>
		<param name="BR-37 " value="(SubTtlClctdTax/CtgyCd)"/>
		<param name="BR-38 " value="(AllwncChrg/Rsn/ChrgTp/Prtry) or (AllwncChrg/Rsn/ChrgTp/Cd)"/>
		<param name="BR-39 " value="(MntrySummtn/ChrgTtlAmt) &gt;=0"/>
		<param name="BR-40 " value="(MntrySummtn/LineTtlAmt &gt;=0) or not (MntrySummtn/LineTtlAmt)"/>
		<param name="BR-CO-06 " value="true()"/>
		<param name="BR-CO-22 " value="true()"/>
		<param name="BR-DEC-05 " value="string-length(substring-after(MntrySummtn/AllwncTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-06 " value="string-length(substring-after(MntrySummtn/LineTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-07 " value="string-length(substring-after(TradSttlm/PmtTerms/DscntPctRate,'.'))&lt;=4"/>
		<param name="BR-DEC-08 " value="string-length(substring-after(TradSttlm/SubTtlClctdTax/ClctdRate,'.'))&lt;=4"/>
		<!-- CONTEXT DOCUMENT_TOTALS  -->
		<param name="Document_totals " value="//Document/FinInvc/TradSttlm"/>
		<param name="BR-12 " value="(MntrySummtn/LineTtlAmt)"/>
		<param name="BR-13 " value="(MntrySummtn/TaxBsisAmt)"/>
		<param name="BR-14 " value="(MntrySummtn/GrdTtlAmt)"/>
		<param name="BR-15 " value="(DuePyblAmt)"/>
		<param name="BR-CO-10 " value="FIXME"/>
		<param name="BR-CO-11 " value="FIXME"/>
		<param name="BR-CO-12 " value="FIXME"/>
		<param name="BR-CO-13 " value="FIXME"/>
		<param name="BR-CO-15 " value="FIXME"/>
		<param name="BR-CO-16 " value="FIXME"/>
		<param name="BR-DEC-09 " value="string-length(substring-after(TradSttlm/MntrySummtn/LineTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-10 " value="string-length(substring-after(TradSttlm/MntrySummtn/AllwncTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-11 " value="string-length(substring-after(TradSttlm/MntrySummtn/ChrgTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-12 " value="string-length(substring-after(TradSttlm/MntrySummtn/TaxBsisAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-13 " value="string-length(substring-after(TradSttlm/MntrySummtn/TaxTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-14 " value="string-length(substring-after(TradSttlm/MntrySummtn/GrdTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-15 " value="string-length(substring-after(TradSttlm/MntrySummtn/TaxTtlAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-16 " value="string-length(substring-after(TradSttlm/MntrySummtn/TtlPrepdAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-17 " value="string-length(substring-after(TradSttlm/MntrySummtn/RndgAmt,'.'))&lt;=2"/>
		<param name="BR-DEC-18 " value="string-length(substring-after(TradSttlm/DuePyblAmt,'.'))&lt;=2"/>

</pattern>
