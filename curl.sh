


# Paciente

curl -X POST "http://localhost:8090/fhir/Patient" \
  -H "Content-Type: application/fhir+json" \
  -d '{
    "resourceType": "Patient",
    "identifier": { 
      "value": 1234 
    },
    "name": [{
      "use": "official",
      "family": "Pérez",
      "given": ["Juan"]
    }],
    "gender": "male",
    "birthDate": "1985-03-21"
  }'

curl -X POST "http://localhost:8090/fhir/Patient" \
  -H "Content-Type: application/fhir+json" \
  -d '{
    "resourceType": "Patient",
    "identifier": [
      {
        "system": "http://hospital.local/pacientes",
        "value": "1235"
      }
    ],
    "name": [
      {
        "family": "Rodríguez",
        "given": ["Luis"]
      }
    ],
    "gender": "male",
    "birthDate": "1992-05-10"
  }'

curl -X GET "http://localhost:8090/fhir/Patient?identifier=http%3A%2F%2Fhospital.local%2Fpacientes%7C1235" \
  -H "Accept: application/fhir+json"



curl "http://localhost:8090/fhir/Patient"

curl -X GET "http://localhost:8090/fhir/Patient?identifier=12345" -H "Accept: application/fhir+json"



# Receta

curl -X POST "http://localhost:8090/fhir/MedicationRequest" \
  -H "Content-Type: application/fhir+json" \
  -d '{
    "resourceType": "MedicationRequest",
    "status": "active",    
    "identifier": { "value": "RH12354" },
    "intent": "order",
    "informationSource": {
    },
    "medicationCodeableConcept": {
      "coding": [
        {
          "display": "Paracetamol 500mg tablet"
        }
      ]
    },
    "reasonCode": [
        {
          "text": "Infección respiratoria"
        }
      ],
    "subject": {
      "reference": "Patient?identifier=1234"
    },
    "authoredOn": "2025-08-05"
  }'

#  "reference": "Patient?identifier=http%3A%2F%2Fhospital.local%2Fpacientes%7C1235"
curl -X GET "http://localhost:8090/fhir/MedicationRequest?identifier=RH1234" -H "Accept: application/fhir+json"