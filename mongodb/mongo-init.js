db = db.getSiblingDB('HR');

db.createCollection("Employee", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["ID", "UserID", "FirstName", "LastName", "Email"],
      properties: {
        ID: {
          bsonType: "string",
          description: "Employee ID - required"
        },
        UserID: {
          bsonType: "string",
          description: "Reference to User ID from Authentication Service - required"
        },
        FirstName: {
          bsonType: "string",
          description: "Employee first name - required"
        },
        LastName: {
          bsonType: "string",
          description: "Employee last name - required"
        },
        MiddleName: {
          bsonType: "string",
          description: "Employee middle name - optional"
        },
        PreferredName: {
          bsonType: "string",
          description: "Employee preferred name - optional"
        },
        Email: {
          bsonType: "string",
          description: "Employee email - required"
        },
        CellPhone: {
          bsonType: "string",
          description: "Employee cell phone - optional"
        },
        AlternatePhone: {
          bsonType: "string",
          description: "Employee alternate phone - optional"
        },
        Gender: {
          bsonType: "string",
          description: "Employee gender - optional"
        },
        SSN: {
          bsonType: "string",
          description: "Employee SSN - optional"
        },
        DOB: {
          bsonType: "date",
          description: "Employee date of birth - optional"
        },
        StartDate: {
          bsonType: "date",
          description: "Employee start date - optional"
        },
        EndDate: {
          bsonType: "date",
          description: "Employee end date - optional"
        },
        DriverLicense: {
          bsonType: "string",
          description: "Driver license number - optional"
        },
        DriverLicenseExpiration: {
          bsonType: "date",
          description: "Driver license expiration date - optional"
        },
        HouseID: {
          bsonType: "string",
          description: "Reference to House ID - optional"
        },
        Contact: {
          bsonType: "array",
          description: "Array of contact information",
          items: {
            bsonType: "object",
            properties: {
              ID: { bsonType: "string" },
              FirstName: { bsonType: "string" },
              LastName: { bsonType: "string" },
              CellPhone: { bsonType: "string" },
              AlternatePhone: { bsonType: "string" },
              Email: { bsonType: "string" },
              Relationship: { bsonType: "string" },
              Type: { bsonType: "string" }
            }
          }
        },
        Address: {
          bsonType: "array",
          description: "Array of addresses",
          items: {
            bsonType: "object",
            properties: {
              ID: { bsonType: "string" },
              AddressLine1: { bsonType: "string" },
              AddressLine2: { bsonType: "string" },
              City: { bsonType: "string" },
              State: { bsonType: "string" },
              ZipCode: { bsonType: "string" }
            }
          }
        },
        VisaStatus: {
          bsonType: "array",
          description: "Array of visa statuses",
          items: {
            bsonType: "object",
            properties: {
              ID: { bsonType: "string" },
              VisaType: { bsonType: "string" },
              ActiveFlag: { bsonType: "bool" },
              StartDate: { bsonType: "date" },
              EndDate: { bsonType: "date" },
              LastModificationDate: { bsonType: "date" }
            }
          }
        },
        PersonalDocument: {
          bsonType: "array",
          description: "Array of personal documents",
          items: {
            bsonType: "object",
            properties: {
              ID: { bsonType: "string" },
              Path: { bsonType: "string" },
              Title: { bsonType: "string" },
              Comment: { bsonType: "string" },
              CreateDate: { bsonType: "date" }
            }
          }
        },
        ApplicationType: {
          bsonType: "string",
          description: "Application type - optional"
        }
      }
    }
  }
});

print("Employee collection with schema validation created successfully!");