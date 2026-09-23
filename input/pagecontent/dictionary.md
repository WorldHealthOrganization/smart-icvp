
Component 5 in the WHO Specifications and Standards for Digital ICVP outlines the minimum set of data as outlined in the Guidance related to the issuance and ascertainment of validity and authenticity of the International Certificate of Vaccination or Prophylaxis (ICVP). The data set can be used on any software system and lists the data elements relevant for service delivery and executing decision-support logic.

See the Core Data Dictionary implementation tool for the comprehensive data dictionary in spreadsheet form detailing the input options, validation checks and terminology codes.

#### Core Data Elements for Digital ICVP

<table border="1" class="dataframe table table-striped table-bordered">
    <thead>
        <tr>
            <th>Data Element Label</th>
            <th>Description and Definition</th>
            <th>Data Type</th>
            <th>Optionality</th>
            <th>Validation Condition</th>
            <th>Calculation</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Name of the recipient of vaccine or prophylaxis</td>
            <td>The full name of the recipient of vaccine or prophylaxis</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td>The date of birth of the recipient of vaccine or prophylaxis</td>
            <td>Date</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Sex</td>
            <td>The sex of the recipient of vaccine or prophylaxis</td>
            <td>List - select one</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Male</td>
            <td>Recipient is male</td>
            <td>List value</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Female</td>
            <td>Recipient is female</td>
            <td>List value</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Other</td>
            <td>Recipient identifies as another sex</td>
            <td>List value</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Unknown</td>
            <td>Sex is not known or not specified</td>
            <td>List value</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Nationality</td>
            <td>The nationality of the recipient of vaccine or prophylaxis</td>
            <td>List - select one</td>
            <td class="required">R</td>
            <td>ISO 3166-1</td>
            <td></td>
        </tr>
        <tr>
            <td>National identification document, if applicable</td>
            <td>Identifier of an official national identity document, where applicable</td>
            <td>ID</td>
            <td class="optional">O</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Name of the parent or guardian</td>
            <td>The full name of the parent or guardian. Required, if applicable.</td>
            <td>String</td>
            <td class="conditional">RC</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Vaccine or prophylaxis</td>
            <td>Name of the vaccine or prophylaxis product administered</td>
            <td>List - select one</td>
            <td class="required">R</td>
            <td>Should be selected from WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure, or the Prequalified lists - Finished pharmaceutical products</td>
            <td></td>
        </tr>
        <tr>
            <td>Name of disease or condition</td>
            <td>Name of the disease or condition for which the vaccine or prophylaxis has been administered.</td>
            <td>List - select all that apply</td>
            <td class="required">R</td>
            <td>Must correspond to the disease targeted by the selected vaccine or prophylaxis product</td>
            <td>Derived from "Vaccine or prophylaxis"</td>
        </tr>
        <tr>
            <td>Date</td>
            <td>Date when vaccine or prophylaxis was administered</td>
            <td>Date</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Name of supervising clinician</td>
            <td>Name of supervising clinician responsible for administering the vaccine or prophylaxis or overseeing the vaccination process.</td>
            <td>String</td>
            <td class="conditional">C</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Relevant authority responsible for issuing this certificate</td>
            <td>Name of relevant authority that has been onboarded to GDHCN and is responsible for issuing this certificate, or overseeing the administering centre</td>
            <td>List - select one</td>
            <td class="conditional">C</td>
            <td>Must correspond to a participant included in the GDHCN trust framework (SMART Trust) ValueSet for Participants (https://worldhealthorganization.github.io/smart-trust/ValueSet-Participants.html)</td>
            <td></td>
        </tr>
        <tr>
            <td>Manufacturer of vaccine or prophylaxis</td>
            <td>Name of the manufacturer of vaccine or prophylaxis administered</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td>Derived from "Vaccine or prophylaxis"</td>
        </tr>
        <tr>
            <td>Batch No. of vaccine or prophylaxis</td>
            <td>Batch number of vaccine or prophylaxis administered. May be represented as a string or as a coded value.</td>
            <td>List - select one</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Batch number (string)</td>
            <td>Batch or lot number as recorded by the manufacturer.</td>
            <td>String</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Batch number (coded)</td>
            <td>Batch or lot number represented as a coded value from a predefined list, if available.</td>
            <td>List value</td>
            <td></td>
            <td>Must be selected from a predefined list of batch or lot numbers</td>
            <td></td>
        </tr>
        <tr>
            <td>Certificate valid from</td>
            <td>Date from which the certificate became valid</td>
            <td>Date</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Certificate valid until</td>
            <td>Indicates that the certificate remains valid based on a predefined condition (e.g., lifetime validity).</td>
            <td>List - select one</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Certificate valid until (string)</td>
            <td>Certificate is valid for the life of the vaccinated person</td>
            <td>String</td>
            <td></td>
            <td></td>
            <td>Must correspond to lifetime validity as defined in the IHR (e.g. "life of the person vaccinated" or equivalent translation in supported languages)</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;Certificate valid until (date)</td>
            <td>Date until which the certificate remains valid</td>
            <td>Date</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Text following the table in the Model ICVP in Annex 6</td>
            <td>This certificate is valid only if the vaccine or prophylaxis used has been approved by the World Health Organization. This certificate in non-digital format must be signed by the clinician, who shall be a medical practitioner or other authorized health worker supervising the administration of the vaccine or prophylaxis. The certificate must also bear the official stamp of the administering centre; however, this shall not be an accepted substitute for the signature. Regardless of the format in which this certificate has been issued, it must bear the name of the clinician supervising the administration of the vaccine or prophylaxis, or of the relevant authority responsible for issuing the certificate or overseeing the administering centre. Any amendment of this certificate, or erasure, or failure to complete any part of it, may render it invalid. The validity of this certificate shall extend until the date indicated for the particular vaccination or prophylaxis. The certificate shall be fully completed in English or in French. The certificate may also be completed in another language on the same document, in addition to either English or French.</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Cryptographic signature of the issuer</td>
            <td>A digital cryptographic signature generated by the issuing authority and applied to the certificate data as part of the integrity check.</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Key identifier for signature verification</td>
            <td>An identifier that references the public key or trusted source required to verify the issuer's cryptographic signature as part of the integrity check.</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Version</td>
            <td>Identifier indicating the version of the certificate</td>
            <td>String</td>
            <td class="required">R</td>
            <td></td>
            <td></td>
        </tr>
    </tbody>
</table>
