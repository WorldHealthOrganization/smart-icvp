Component 5 in the Digital Adaptation Kit (DAK) for ICVP (link forthcoming) outlines the minimum set of data corresponding to different points of the workflow within the identified business processes. This data set can be used on any softwaresystem and lists the data elements relevant for service delivery and executing decision-support logic, as well as for populating indicators and performance metrics. 

See Web Annex A of the DAK for the complete data dictionary in spreadsheet form detailing the input options, validation checks and concept dictionary codes.

#### Data Dictionary ICVP
        <table>
            <thead>
                <tr>
                    <th>Activity ID</th>
                    <th>Data Element ID</th>
                    <th>Data Element Label</th>
                    <th>Description and Definition</th>
                    <th>Multiple Choice Type</th>
                    <th>Data Type</th>
                    <th>Validation Condition</th>
                    <th>Required</th>
                    <th>Annotations</th>
                    <th>ICD-11 Code</th>
                    <th>ICD-11 URI</th>
                    <th>ICD-11 Comments/Considerations</th>
                    <th>ICD-11 Relationship</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Name</td>
                    <td>The full name of the client</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>Only letters and special characters (period, dash) allowed</td>
                    <td class="required">R</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Date of birth</td>
                    <td>Client's date of birth (DOB) if known; if unknown, use assigned DOB for administrative purposes</td>
                    <td>N/A</td>
                    <td>Date</td>
                    <td>Date ≤ current date</td>
                    <td class="required">R</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Sex</td>
                    <td>Documentation of a specific instance of sex information for the client</td>
                    <td>Select one</td>
                    <td>Coding</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Male</td>
                    <td>Client's biological sex is male</td>
                    <td>Input option</td>
                    <td>Codes</td>
                    <td>None</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Female</td>
                    <td>Client's biological sex is female</td>
                    <td>Input option</td>
                    <td>Codes</td>
                    <td>None</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Biological sex not specified</td>
                    <td>Client's biological sex is not specified</td>
                    <td>Input option</td>
                    <td>Codes</td>
                    <td>None</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Intersex</td>
                    <td>Client's biological sex is intersex</td>
                    <td>Input option</td>
                    <td>Codes</td>
                    <td>None</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Nationality</td>
                    <td>Nationality</td>
                    <td>Select one</td>
                    <td>Coding</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td>bound to 3 letter ISO codes</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>National Identification Document</td>
                    <td>National Identification Document</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Guardian</td>
                    <td>Name of Parent or Guardian</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Issuer</td>
                    <td>Document Issuer</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>product ID</td>
                    <td>Vaccine Product ID</td>
                    <td>N/A</td>
                    <td>Coding</td>
                    <td>None</td>
                    <td class="required">R</td>
                    <td>Codes as defined in WHO Prequal Database</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Date</td>
                    <td>Date of vaccine</td>
                    <td>N/A</td>
                    <td>Date</td>
                    <td>None</td>
                    <td class="required">R</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Clinician Name</td>
                    <td>Name of supervising clinician</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>Either clinician name or issuer must be present</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>issuer</td>
                    <td>Relevant Authority responsible for issuing the certificate, or for overseeing the administration center</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>Either clinician name or issuer must be present</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Vaccine batch number</td>
                    <td>Batch number or lot number of vaccine</td>
                    <td>N/A</td>
                    <td>String</td>
                    <td>None</td>
                    <td class="required">R</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Certificate valid from</td>
                    <td>Date in which the certificate for an immunization event became valid. No health or clinical inferences should be made from this date</td>
                    <td>N/A</td>
                    <td>DateTime</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Certificate valid until</td>
                    <td>Last date in which the certificate for an immunization event is valid. No health or clinical inferences should be made from this date</td>
                    <td>N/A</td>
                    <td>DateTime</td>
                    <td>None</td>
                    <td class="optional">O</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>