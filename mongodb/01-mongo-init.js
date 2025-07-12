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
        AvatarPath: {
          bsonType: "string",
          description: "Path to employee's avatar picture - optional"
        },
        Email: {
          bsonType: "string",
          description: "Employee email - required"
        },
        CellPhone: {
          bsonType: "string",
          description: "Employee cell phone - optional"
        },
        WorkPhone: {
          bsonType: "string",
          description: "Employee work phone - optional"
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
        HouseID: {
          bsonType: "string",
          description: "Reference to House ID - optional"
        },
        Addresses: {
          bsonType: "array",
          description: "Array of employee's primary and secondary addresses",
          items: {
            bsonType: "object",
            required: ["Type", "AddressLine1", "City", "State", "ZipCode"],
            properties: {
              ID: { bsonType: "string" },
              Type: {
                bsonType: "string",
                enum: ["PRIMARY", "SECONDARY"],
                description: "Type of address (PRIMARY or SECONDARY)"
              },
              AddressLine1: { bsonType: "string" },
              AddressLine2: { bsonType: "string" },
              City: { bsonType: "string" },
              State: { bsonType: "string" },
              ZipCode: { bsonType: "string" }
            }
          }
        },
        WorkAuthorization: {
          bsonType: "object",
          description: "Employee's work authorization details - optional",
          properties: {
            IsUSCitizen: {
              bsonType: "bool",
              description: "True if US Citizen"
            },
            GreenCardHolder: {
              bsonType: "bool",
              description: "True if Green Card Holder"
            },
            Type: {
              bsonType: "string",
              enum: ["H1B", "L2", "F1", "H4", "OTHER", "N/A"],
              description: "Type of work authorization (e.g., H1B, L2, F1, H4, OTHER)"
            },
            StartDate: {
              bsonType: "date",
              description: "Work authorization start date"
            },
            EndDate: {
              bsonType: "date",
              description: "Work authorization end date"
            },
            LastModificationDate: {
              bsonType: "date",
              description: "Last modification date of work authorization status"
            }
          }
        },
        DriverLicense: {
          bsonType: "object",
          description: "Employee's driver license information - optional",
          properties: {
            HasLicense: {
              bsonType: "bool",
              description: "True if employee has a driver's license"
            },
            LicenseNumber: {
              bsonType: "string",
              description: "Driver license number"
            },
            ExpirationDate: {
              bsonType: "date",
              description: "Driver license expiration date"
            }
          }
        },
        EmergencyContacts: {
          bsonType: "array",
          description: "Array of emergency contact information",
          items: {
            bsonType: "object",
            required: ["FirstName", "LastName", "Relationship"],
            properties: {
              ID: { bsonType: "string" },
              FirstName: { bsonType: "string" },
              LastName: { bsonType: "string" },
              MiddleName: { bsonType: "string" },
              CellPhone: { bsonType: "string" },
              AlternatePhone: { bsonType: "string" },
              Email: { bsonType: "string" },
              Relationship: { bsonType: "string" },
              Address: {
                bsonType: "object",
                description: "Address of the emergency contact - optional",
                properties: {
                  AddressLine1: { bsonType: "string" },
                  AddressLine2: { bsonType: "string" },
                  City: { bsonType: "string" },
                  State: { bsonType: "string" },
                  ZipCode: { bsonType: "string" }
                }
              }
            }
          }
        },
        References: {
          bsonType: "array",
          description: "Array of professional/personal references",
          items: {
            bsonType: "object",
            required: ["FirstName", "LastName", "Relationship"],
            properties: {
              ID: { bsonType: "string" },
              FirstName: { bsonType: "string" },
              LastName: { bsonType: "string" },
              MiddleName: { bsonType: "string" },
              Phone: { bsonType: "string" },
              Email: { bsonType: "string" },
              Relationship: { bsonType: "string" },
              Address: {
                bsonType: "object",
                description: "Address of the reference - optional",
                properties: {
                  AddressLine1: { bsonType: "string" },
                  AddressLine2: { bsonType: "string" },
                  City: { bsonType: "string" },
                  State: { bsonType: "string" },
                  ZipCode: { bsonType: "string" }
                }
              }
            }
          }
        },
        PersonalDocuments: {
          bsonType: "array",
          description: "Array of personal documents, categorized by type",
          items: {
            bsonType: "object",
            required: ["Type", "Path", "Title"],
            properties: {
              ID: { bsonType: "string" },
              Type: {
                bsonType: "string",
                enum: ["DRIVER_LICENSE_PROOF", "WORK_AUTHORIZATION_PROOF", "SSN_CARD", "PASSPORT", "OTHER"],
                description: "Type of document (e.g., DRIVER_LICENSE_PROOF, WORK_AUTHORIZATION_PROOF)"
              },
              Path: {
                bsonType: "string",
                description: "Path to the stored document (e.g., S3 URL)"
              },
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