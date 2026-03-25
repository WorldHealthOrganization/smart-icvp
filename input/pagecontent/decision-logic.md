This page describes the decision-support logic included in the WHO Specifications and Standards for Digital ICVP.

The decision-support logic component provides the validation logic in accordance to the IHR, which deconstructs the validation requirements into a format that clearly labels the inputs and outputs that would be operationalized into a Status Checking Application.

### Decision-support logic overview

The structure of the decision-support tables is based on an adaptation of the Decision Model and Notation (DMN), an industry standard for modelling and executing decision logic.

**Table 9. Overview of decision-support tables for digital ICVP**

| Decision-support table ID | Decision name | Activity ID | Activity name |
|---|---|---|---|
| ICVP.DT.1 | Ascertain validity of digital ICVP for yellow fever vaccination | ICVP.E7 | Check vaccination validity |
| ICVP.DT.2 | Ascertain validity of digital ICVP for poliovirus vaccination | ICVP.E7 | Check vaccination validity |

### Decision-support tables

#### ICVP.DT.1 Ascertain validity of digital ICVP for yellow fever vaccination

| | | | | |
|---|---|---|---|---|
| **Decision-support table ID** | ICVP.DT.1 | | | |
| **Decision name** | Ascertain validity of digital ICVP for yellow fever vaccination | | | |
| **Activity ID** | ICVP.E7 | | | |
| **Activity name** | Check vaccination validity | | | |
| **Hit Policy Indicator** | Unique (U): a "Unique" hit policy indicator applies. No overlap is possible and all "rules" are mutually exclusive. Only a single rule can be applied and only the outputs of one rule would be relevant. | | | |

<table border="1" class="dataframe table table-striped table-bordered">
  <thead>
    <tr>
      <th>U</th>
      <th>Vaccine or prophylaxis<br/><em>Name of the vaccine or prophylaxis product administered</em></th>
      <th>Days since vaccine administered<br/><em>Today's date - "Date" (where Date = date of vaccine or prophylaxis administration)</em></th>
      <th colspan="2">Output(s)</th>
      <th>Annotation(s)</th>
      <th>Reference(s)</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th></th>
      <th>Recommended care plan</th>
      <th>Guidance displayed to the border health inspector</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Vaccine or prophylaxis is <strong>not</strong> included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products</td>
      <td>-</td>
      <td>State Party may wish to take actions including: assessing the status of traveller vis-a-vis vaccine(s) and/or prophylaxis(es) received; administering the vaccine(s) and/or prophylaxis(es) to the traveller, if needed; and issuing an ICVP</td>
      <td>Digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO.</td>
      <td>IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO.</td>
      <td>IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Vaccine or prophylaxis <strong>is</strong> included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products</td>
      <td>Days since vaccine administered is <strong>less than 10 days</strong></td>
      <td>-</td>
      <td>Digital ICVP is not valid as vaccination occurred less than 10 days ago.</td>
      <td>IHR Annex 7: Yellow fever vaccines approved by WHO provide protection against infection starting 10 days following the administration of the vaccine. The validity of a certificate of vaccination against yellow fever shall extend for the life of the person vaccinated, beginning 10 days after the date of vaccination.</td>
      <td>IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Vaccine or prophylaxis <strong>is</strong> included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products</td>
      <td>Days since vaccine administered is <strong>more than or equal to 10 days</strong></td>
      <td>-</td>
      <td>Digital ICVP is valid</td>
      <td>IHR Annex 7: Yellow fever vaccines approved by WHO provide protection against infection starting 10 days following the administration of the vaccine. The validity of a certificate of vaccination against yellow fever shall extend for the life of the person vaccinated, beginning 10 days after the date of vaccination.</td>
      <td>IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products</td>
    </tr>
  </tbody>
</table>

#### ICVP.DT.2 Ascertain validity of digital ICVP for poliovirus vaccination

| | | | | |
|---|---|---|---|---|
| **Decision-support table ID** | ICVP.DT.2 | | | |
| **Decision name** | Ascertain validity of digital ICVP for poliovirus vaccination | | | |
| **Activity ID** | ICVP.E7 | | | |
| **Activity name** | Check vaccination validity | | | |
| **Hit Policy Indicator** | Unique (U): a "Unique" hit policy indicator applies. No overlap is possible and all "rules" are mutually exclusive. Only a single rule can be applied and only the outputs of one rule would be relevant. | | | |

<table border="1" class="dataframe table table-striped table-bordered">
  <thead>
    <tr>
      <th>U</th>
      <th>Vaccine or prophylaxis<br/><em>Name of the vaccine or prophylaxis product administered</em></th>
      <th colspan="2">Output(s)</th>
      <th>Annotation(s)</th>
      <th>Reference(s)</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th>Recommended care plan</th>
      <th>Guidance displayed to the border health inspector</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Vaccine or prophylaxis is <strong>not</strong> included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products.</td>
      <td>State Party may wish to take actions including: assessing the status of traveller vis-a-vis vaccine(s) and/or prophylaxis(es) received; administering the vaccine(s) and/or prophylaxis(es) to the traveller, if needed; and issuing an ICVP</td>
      <td>Digital ICVP is not valid as vaccine or prophylaxis product is not approved by WHO.</td>
      <td>IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO.</td>
      <td>IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Vaccine or prophylaxis <strong>is</strong> included in WHO List of Prequalified Vaccines, the WHO Emergency use listing procedure or the Prequalified lists - Finished pharmaceutical products.</td>
      <td>-</td>
      <td>Digital ICVP is valid</td>
      <td>IHR Annex 6: Vaccines or other prophylaxis specified in Annex 7 or recommended under these Regulations shall be of suitable quality; those vaccines and prophylaxis designated by WHO shall be subject to its approval. Certificates under this Annex are valid only if the vaccine or prophylaxis used has been approved by WHO.</td>
      <td>IHR (2005) as amended; WHO list of prequalified vaccines; WHO Emergency Use Listing (EUL); WHO prequalified pharmaceutical products</td>
    </tr>
  </tbody>
</table>
