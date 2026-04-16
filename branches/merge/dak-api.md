# DAK API Documentation Hub - SMART ICVP v0.3.0

* [**Table of Contents**](toc.md)
* **DAK API Documentation Hub**

## DAK API Documentation Hub

# DAK API Documentation Hub

This page provides access to Data Access Kit (DAK) API documentation and schemas.

## Table of Contents

1. [DAK API Documentation Hub](#dak-api-documentation-hub)

### API Enumeration Endpoints

These endpoints provide lists of all available schemas and vocabularies of each type:

#### ValueSets.schema.json

Enumeration of all available ValueSet schemas

##### Available Endpoints:

* [ValueSet-DiseaseTargeted.schema.json](schemas/ValueSet-DiseaseTargeted.schema.json) - JSON Schema for Disease Targeted Schema
* [ValueSet-VaccineManufacturer.schema.json](schemas/ValueSet-VaccineManufacturer.schema.json) - JSON Schema for VaccineManufacturer Schema
* [ValueSet-ICVPDiseaseTargeted.schema.json](schemas/ValueSet-ICVPDiseaseTargeted.schema.json) - JSON Schema for ICVP Disease Targeted Schema
* [ValueSet-ICVPVaccineCodes.schema.json](schemas/ValueSet-ICVPVaccineCodes.schema.json) - JSON Schema for ICVP - Vaccine Codes Schema
* [ValueSet-ICVPProductIds.schema.json](schemas/ValueSet-ICVPProductIds.schema.json) - JSON Schema for WHO ICVP Vaccine Product Ids Schema
* [ValueSet-ICVPVaccineType.schema.json](schemas/ValueSet-ICVPVaccineType.schema.json) - JSON Schema for Vaccine Types for use in the ICVP Schema

#### LogicalModels.schema.json

Enumeration of all available Logical Model schemas

##### Available Endpoints:

* [StructureDefinition-ICVPVaccineDetailsSD.schema.json](schemas/StructureDefinition-ICVPVaccineDetailsSD.schema.json) - JSON Schema for ICVP Vaccine Details with Selective Disclosure
* [StructureDefinition-ICVPSD.schema.json](schemas/StructureDefinition-ICVPSD.schema.json) - JSON Schema for DVC Icvp with Selective Disclosure
* [StructureDefinition-ICVPVaccineDetails.schema.json](schemas/StructureDefinition-ICVPVaccineDetails.schema.json) - JSON Schema for ICVP - Vaccine Details
* [StructureDefinition-pICVP.schema.json](schemas/StructureDefinition-pICVP.schema.json) - JSON Schema for pICVP
* [StructureDefinition-pICVPVaccineDetails.schema.json](schemas/StructureDefinition-pICVPVaccineDetails.schema.json) - JSON Schema for pICVP - Vaccine Details
* [StructureDefinition-ICVP.schema.json](schemas/StructureDefinition-ICVP.schema.json) - JSON Schema for ICVP
* [StructureDefinition-ICVPEvent.schema.json](schemas/StructureDefinition-ICVPEvent.schema.json) - JSON Schema for ICVP (single)
* [StructureDefinition-ICVPMin.schema.json](schemas/StructureDefinition-ICVPMin.schema.json) - JSON Schema for ICVP HCERT Payload
* [StructureDefinition-ICVPMinVaccineDetails.schema.json](schemas/StructureDefinition-ICVPMinVaccineDetails.schema.json) - JSON Schema for ICVP HCERT Payload

### ValueSet Schemas (6 available)

JSON Schema definitions for FHIR ValueSets, providing structured enumeration of allowed code values:

#### Disease Targeted Schema

JSON Schema for Disease Targeted ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-DiseaseTargeted.md)
[📄 JSON Schema](schemas/ValueSet-DiseaseTargeted.schema.json)
[🏷️ Displays](schemas/ValueSet-DiseaseTargeted.displays.json)
[🔗 OpenAPI](schemas/ValueSet-DiseaseTargeted.openapi.json)

#### VaccineManufacturer Schema

JSON Schema for VaccineManufacturer ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-VaccineManufacturer.md)
[📄 JSON Schema](schemas/ValueSet-VaccineManufacturer.schema.json)
[🏷️ Displays](schemas/ValueSet-VaccineManufacturer.displays.json)
[🔗 OpenAPI](schemas/ValueSet-VaccineManufacturer.openapi.json)

#### ICVP Disease Targeted Schema

JSON Schema for ICVP Disease Targeted ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-ICVPDiseaseTargeted.md)
[📄 JSON Schema](schemas/ValueSet-ICVPDiseaseTargeted.schema.json)
[🏷️ Displays](schemas/ValueSet-ICVPDiseaseTargeted.displays.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPDiseaseTargeted.openapi.json)

#### ICVP - Vaccine Codes Schema

JSON Schema for ICVP - Vaccine Codes ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-ICVPVaccineCodes.md)
[📄 JSON Schema](schemas/ValueSet-ICVPVaccineCodes.schema.json)
[🏷️ Displays](schemas/ValueSet-ICVPVaccineCodes.displays.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPVaccineCodes.openapi.json)

#### WHO ICVP Vaccine Product Ids Schema

JSON Schema for WHO ICVP Vaccine Product Ids ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-ICVPProductIds.md)
[📄 JSON Schema](schemas/ValueSet-ICVPProductIds.schema.json)
[🏷️ Displays](schemas/ValueSet-ICVPProductIds.displays.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPProductIds.openapi.json)

#### Vaccine Types for use in the ICVP Schema

JSON Schema for Vaccine Types for use in the ICVP ValueSet codes. Generated from FHIR expansions using IRI format.

[🩺 FHIR](ValueSet-ICVPVaccineType.md)
[📄 JSON Schema](schemas/ValueSet-ICVPVaccineType.schema.json)
[🏷️ Displays](schemas/ValueSet-ICVPVaccineType.displays.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPVaccineType.openapi.json)

### Logical Model Schemas (9 available)

JSON Schema definitions for FHIR Logical Models, defining structured data elements and their relationships:

#### ICVP Vaccine Details with Selective Disclosure

ICVP Vaccine Details with Selective Disclosure

[🩺 FHIR](StructureDefinition-ICVPVaccineDetailsSD.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPVaccineDetailsSD.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPVaccineDetailsSD.openapi.json)

#### DVC Icvp with Selective Disclosure

DVC Icvp with Selective Disclosure

[🩺 FHIR](StructureDefinition-ICVPSD.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPSD.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPSD.openapi.json)

#### ICVP - Vaccine Details

Vaccine Data elements for the International Certificate of Vaccination or Prophylaxis

[🩺 FHIR](StructureDefinition-ICVPVaccineDetails.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPVaccineDetails.openapi.json)

#### pICVP

Data elements for the Paper Model International Certificate of Vaccination or Prophylaxis.

[🩺 FHIR](StructureDefinition-pICVP.md)
[📄 JSON Schema](schemas/StructureDefinition-pICVP.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-pICVP.openapi.json)

#### pICVP - Vaccine Details

Vaccine Data elements for the Paper Model International Certificate of Vaccination or Prophylaxis.

[🩺 FHIR](StructureDefinition-pICVPVaccineDetails.md)
[📄 JSON Schema](schemas/StructureDefinition-pICVPVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-pICVPVaccineDetails.openapi.json)

#### ICVP

Data elements for the Model International Certificate of Vaccination or Prophylaxis.

[🩺 FHIR](StructureDefinition-ICVP.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVP.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVP.openapi.json)

#### ICVP (single)

ICVP for a single vaccincation event

[🩺 FHIR](StructureDefinition-ICVPEvent.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPEvent.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPEvent.openapi.json)

#### ICVP HCERT Payload

Mininmial DVC payload for use within an HCERT Payload using the ICVP Product Catalogue

[🩺 FHIR](StructureDefinition-ICVPMin.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPMin.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPMin.openapi.json)

#### ICVP HCERT Payload

Mininmial vaccine detail in DVC payload for use within an HCERT Payload using the ICVP Product Catalogue

[🩺 FHIR](StructureDefinition-ICVPMinVaccineDetails.md)
[📄 JSON Schema](schemas/StructureDefinition-ICVPMinVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPMinVaccineDetails.openapi.json)

### OpenAPI Documentation

Complete API specification documentation for all available endpoints:

#### ValueSet-DiseaseTargeted Endpoints

API endpoints for Disease Targeted Schema

[📄 JSON Schema](schemas/ValueSet-DiseaseTargeted.schema.json)
[🔗 OpenAPI](schemas/ValueSet-DiseaseTargeted.openapi.json)

#### ValueSet-VaccineManufacturer Endpoints

API endpoints for VaccineManufacturer Schema

[📄 JSON Schema](schemas/ValueSet-VaccineManufacturer.schema.json)
[🔗 OpenAPI](schemas/ValueSet-VaccineManufacturer.openapi.json)

#### ValueSet-ICVPDiseaseTargeted Endpoints

API endpoints for ICVP Disease Targeted Schema

[📄 JSON Schema](schemas/ValueSet-ICVPDiseaseTargeted.schema.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPDiseaseTargeted.openapi.json)

#### ValueSet-ICVPVaccineCodes Endpoints

API endpoints for ICVP - Vaccine Codes Schema

[📄 JSON Schema](schemas/ValueSet-ICVPVaccineCodes.schema.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPVaccineCodes.openapi.json)

#### ValueSet-ICVPProductIds Endpoints

API endpoints for WHO ICVP Vaccine Product Ids Schema

[📄 JSON Schema](schemas/ValueSet-ICVPProductIds.schema.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPProductIds.openapi.json)

#### ValueSet-ICVPVaccineType Endpoints

API endpoints for Vaccine Types for use in the ICVP Schema

[📄 JSON Schema](schemas/ValueSet-ICVPVaccineType.schema.json)
[🔗 OpenAPI](schemas/ValueSet-ICVPVaccineType.openapi.json)

#### StructureDefinition-ICVPVaccineDetailsSD Endpoints

API endpoints for ICVP Vaccine Details with Selective Disclosure

[📄 JSON Schema](schemas/StructureDefinition-ICVPVaccineDetailsSD.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPVaccineDetailsSD.openapi.json)

#### StructureDefinition-ICVPSD Endpoints

API endpoints for DVC Icvp with Selective Disclosure

[📄 JSON Schema](schemas/StructureDefinition-ICVPSD.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPSD.openapi.json)

#### StructureDefinition-ICVPVaccineDetails Endpoints

API endpoints for ICVP - Vaccine Details

[📄 JSON Schema](schemas/StructureDefinition-ICVPVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPVaccineDetails.openapi.json)

#### StructureDefinition-pICVP Endpoints

API endpoints for pICVP

[📄 JSON Schema](schemas/StructureDefinition-pICVP.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-pICVP.openapi.json)

#### StructureDefinition-pICVPVaccineDetails Endpoints

API endpoints for pICVP - Vaccine Details

[📄 JSON Schema](schemas/StructureDefinition-pICVPVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-pICVPVaccineDetails.openapi.json)

#### StructureDefinition-ICVP Endpoints

API endpoints for ICVP

[📄 JSON Schema](schemas/StructureDefinition-ICVP.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVP.openapi.json)

#### StructureDefinition-ICVPEvent Endpoints

API endpoints for ICVP (single)

[📄 JSON Schema](schemas/StructureDefinition-ICVPEvent.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPEvent.openapi.json)

#### StructureDefinition-ICVPMin Endpoints

API endpoints for ICVP HCERT Payload

[📄 JSON Schema](schemas/StructureDefinition-ICVPMin.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPMin.openapi.json)

#### StructureDefinition-ICVPMinVaccineDetails Endpoints

API endpoints for ICVP HCERT Payload

[📄 JSON Schema](schemas/StructureDefinition-ICVPMinVaccineDetails.schema.json)
[🔗 OpenAPI](schemas/StructureDefinition-ICVPMinVaccineDetails.openapi.json)

#### ValueSets Enumeration Endpoint

Complete list of all available ValueSet schemas

[📄 JSON Schema](ValueSets.schema.json)
[🔗 OpenAPI](ValueSets-enumeration.openapi.json)

#### LogicalModels Enumeration Endpoint

Complete list of all available Logical Model schemas

[📄 JSON Schema](LogicalModels.schema.json)
[🔗 OpenAPI](LogicalModels-enumeration.openapi.json)

#### StructureDefinition-ICVPVaccineDetails API

OpenAPI specification for StructureDefinition-ICVPVaccineDetails

[📖 Documentation](StructureDefinition-ICVPVaccineDetails.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPVaccineDetails.openapi.json)

#### ValueSet-DiseaseTargeted API

OpenAPI specification for ValueSet-DiseaseTargeted

[📖 Documentation](ValueSet-DiseaseTargeted.md)
[🔗 OpenAPI Spec](schemas/ValueSet-DiseaseTargeted.openapi.json)

#### StructureDefinition-pICVP API

OpenAPI specification for StructureDefinition-pICVP

[📖 Documentation](StructureDefinition-pICVP.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-pICVP.openapi.json)

#### StructureDefinition-ICVPMin API

OpenAPI specification for StructureDefinition-ICVPMin

[📖 Documentation](StructureDefinition-ICVPMin.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPMin.openapi.json)

#### StructureDefinition-ICVPVaccineDetailsSD API

OpenAPI specification for StructureDefinition-ICVPVaccineDetailsSD

[📖 Documentation](StructureDefinition-ICVPVaccineDetailsSD.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPVaccineDetailsSD.openapi.json)

#### ValueSet-ICVPProductIds API

OpenAPI specification for ValueSet-ICVPProductIds

[📖 Documentation](ValueSet-ICVPProductIds.md)
[🔗 OpenAPI Spec](schemas/ValueSet-ICVPProductIds.openapi.json)

#### StructureDefinition-ICVPMinVaccineDetails API

OpenAPI specification for StructureDefinition-ICVPMinVaccineDetails

[📖 Documentation](StructureDefinition-ICVPMinVaccineDetails.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPMinVaccineDetails.openapi.json)

#### StructureDefinition-ICVP API

OpenAPI specification for StructureDefinition-ICVP

[📖 Documentation](StructureDefinition-ICVP.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVP.openapi.json)

#### ValueSet-ICVPDiseaseTargeted API

OpenAPI specification for ValueSet-ICVPDiseaseTargeted

[📖 Documentation](ValueSet-ICVPDiseaseTargeted.md)
[🔗 OpenAPI Spec](schemas/ValueSet-ICVPDiseaseTargeted.openapi.json)

#### StructureDefinition-pICVPVaccineDetails API

OpenAPI specification for StructureDefinition-pICVPVaccineDetails

[📖 Documentation](StructureDefinition-pICVPVaccineDetails.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-pICVPVaccineDetails.openapi.json)

#### ValueSet-ICVPVaccineCodes API

OpenAPI specification for ValueSet-ICVPVaccineCodes

[📖 Documentation](ValueSet-ICVPVaccineCodes.md)
[🔗 OpenAPI Spec](schemas/ValueSet-ICVPVaccineCodes.openapi.json)

#### StructureDefinition-ICVPSD API

OpenAPI specification for StructureDefinition-ICVPSD

[📖 Documentation](StructureDefinition-ICVPSD.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPSD.openapi.json)

#### StructureDefinition-ICVPEvent API

OpenAPI specification for StructureDefinition-ICVPEvent

[📖 Documentation](StructureDefinition-ICVPEvent.md)
[🔗 OpenAPI Spec](schemas/StructureDefinition-ICVPEvent.openapi.json)

#### ValueSet-ICVPVaccineType API

OpenAPI specification for ValueSet-ICVPVaccineType

[📖 Documentation](ValueSet-ICVPVaccineType.md)
[🔗 OpenAPI Spec](schemas/ValueSet-ICVPVaccineType.openapi.json)

#### ValueSet-VaccineManufacturer API

OpenAPI specification for ValueSet-VaccineManufacturer

[📖 Documentation](ValueSet-VaccineManufacturer.md)
[🔗 OpenAPI Spec](schemas/ValueSet-VaccineManufacturer.openapi.json)

### Using the DAK API

#### Schema Validation

Each JSON Schema can be used to validate data structures in your applications.

* Type definitions and constraints
* Property descriptions and examples
* Required field specifications
* Enumeration values with links to definitions

#### JSON-LD Semantic Integration

The JSON-LD vocabularies provide semantic web integration for ValueSet enumerations.

#### Integration with FHIR

All schemas are derived from the FHIR definitions in this implementation guide.

#### API Endpoints

The enumeration endpoints provide machine-readable lists of all available schemas.

-------

