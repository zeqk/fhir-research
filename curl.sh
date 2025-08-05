
# Paciente

curl -X POST "http://localhost:8090/fhir/Patient" \
  -H "Content-Type: application/fhir+json" \
  -d '{
    "resourceType": "Patient",
    "name": [{
      "use": "official",
      "family": "Pérez",
      "given": ["Juan"]
    }],
    "gender": "male",
    "birthDate": "1985-03-21"
  }'


# Receta

curl -X POST "http://localhost:8090/fhir/MedicationRequest" \
  -H "Content-Type: application/fhir+json" \
  -d '{
    "resourceType": "MedicationRequest",
    "status": "active",
    "intent": "order",
    "medicationCodeableConcept": {
      "coding": [
        {
          "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
          "code": "860975",
          "display": "Paracetamol 500mg tablet"
        }
      ]
    },
    "subject": {
      "reference": "Patient/a3843b6d-1703-4149-a9e5-951d397691c8"
    },
    "authoredOn": "2025-08-05",
    "dosageInstruction": [
      {
        "text": "Tomar 1 tableta cada 8 horas por 5 días",
        "timing": {
          "repeat": {
            "frequency": 3,
            "period": 1,
            "periodUnit": "d"
          }
        },
        "route": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/route-codes",
              "code": "PO",
              "display": "Oral"
            }
          ]
        },
        "doseAndRate": [
          {
            "doseQuantity": {
              "value": 500,
              "unit": "mg",
              "system": "http://unitsofmeasure.org",
              "code": "mg"
            }
          }
        ]
      }
    ]
  }'
