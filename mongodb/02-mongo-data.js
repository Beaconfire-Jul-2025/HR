db = db.getSiblingDB('HR');

db.Employee.insertMany([
  // Employee 1: US Citizen
  {
    ID: "emp001",
    UserID: "user_abc_123",
    FirstName: "Alice",
    LastName: "Smith",
    Email: "alice.smith@example.com",
    MiddleName: "P.",
    PreferredName: "Ali",
    AvatarPath: "/avatars/alice.jpg",
    CellPhone: "555-111-2222",
    WorkPhone: "555-333-4444",
    Gender: "Female",
    SSN: "999-88-7777",
    DOB: new Date("1990-05-15T00:00:00Z"),
    StartDate: new Date("2020-01-01T00:00:00Z"),
    HouseID: "house_xyz_789",
    Addresses: [
      {
        ID: "addr001",
        Type: "PRIMARY",
        AddressLine1: "123 Main St",
        City: "Anytown",
        State: "CA",
        ZipCode: "90210"
      }
    ],
    WorkAuthorization: {
      IsUSCitizen: true,
      GreenCardHolder: false,
      Type: "N/A" // US Citizen
    },
    DriverLicense: {
      HasLicense: true,
      LicenseNumber: "DL1234567",
      ExpirationDate: new Date("2028-12-31T00:00:00Z")
    },
    EmergencyContacts: [
      {
        ID: "emc001",
        FirstName: "Bob",
        LastName: "Smith",
        Relationship: "Spouse",
        CellPhone: "555-555-6666",
        Email: "bob.smith@example.com"
      }
    ],
    ApplicationType: "ONBOARD"
  },
  // Employee 2: Green Card Holder
  {
    ID: "emp002",
    UserID: "user_def_456",
    FirstName: "Bob",
    LastName: "Johnson",
    Email: "bob.johnson@example.com",
    Gender: "Male",
    DOB: new Date("1985-11-22T00:00:00Z"),
    StartDate: new Date("2022-03-10T00:00:00Z"),
    Addresses: [
      {
        ID: "addr002",
        Type: "PRIMARY",
        AddressLine1: "789 Pine Rd",
        City: "Smallville",
        State: "TX",
        ZipCode: "75001"
      }
    ],
    WorkAuthorization: {
      IsUSCitizen: false,
      GreenCardHolder: true,
      Type: "N/A" // Green Card Holder
    },
    EmergencyContacts: [
      {
        ID: "emc002",
        FirstName: "Diana",
        LastName: "Johnson",
        Relationship: "Mother",
        CellPhone: "555-999-0000"
      }
    ],
    ApplicationType: "ONBOARD"
  },
  // Employee 3: H1B Work Authorization
  {
    ID: "emp003",
    UserID: "user_ghi_789",
    FirstName: "Carol",
    LastName: "Davis",
    Email: "carol.davis@example.com",
    Gender: "Female",
    DOB: new Date("1992-07-01T00:00:00Z"),
    StartDate: new Date("2023-01-15T00:00:00Z"),
    Addresses: [
      {
        ID: "addr003",
        Type: "PRIMARY",
        AddressLine1: "101 Maple Lane",
        City: "Big City",
        State: "IL",
        ZipCode: "60601"
      }
    ],
    WorkAuthorization: {
      IsUSCitizen: false,
      GreenCardHolder: false,
      Type: "H1B",
      StartDate: new Date("2023-01-15T00:00:00Z"),
      EndDate: new Date("2026-01-14T00:00:00Z"),
      LastModificationDate: new Date("2023-01-10T00:00:00Z")
    },
    ApplicationType: "ONBOARD"
  },
  // Employee 4: L2 Work Authorization
  {
    ID: "emp004",
    UserID: "user_jkl_012",
    FirstName: "David",
    LastName: "Miller",
    Email: "david.miller@example.com",
    Gender: "Male",
    DOB: new Date("1988-03-20T00:00:00Z"),
    StartDate: new Date("2021-09-01T00:00:00Z"),
    Addresses: [
      {
        ID: "addr004",
        Type: "PRIMARY",
        AddressLine1: "202 Elm Street",
        City: "Tech Town",
        State: "WA",
        ZipCode: "98101"
      }
    ],
    WorkAuthorization: {
      IsUSCitizen: false,
      GreenCardHolder: false,
      Type: "L2",
      StartDate: new Date("2021-09-01T00:00:00Z"),
      EndDate: new Date("2025-08-31T00:00:00Z"),
      LastModificationDate: new Date("2021-08-25T00:00:00Z")
    },
    ApplicationType: "ONBOARD"
  },
  // Employee 5: F1 Work Authorization (e.g., CPT/OPT)
  {
    ID: "emp005",
    UserID: "user_mno_345",
    FirstName: "Eve",
    LastName: "White",
    Email: "eve.white@example.com",
    Gender: "Female",
    DOB: new Date("1995-09-10T00:00:00Z"),
    StartDate: new Date("2024-06-01T00:00:00Z"),
    Addresses: [
      {
        ID: "addr005",
        Type: "PRIMARY",
        AddressLine1: "303 College Ave",
        City: "University City",
        State: "MA",
        ZipCode: "02139"
      }
    ],
    WorkAuthorization: {
      IsUSCitizen: false,
      GreenCardHolder: false,
      Type: "F1", // Represents F1 visa, often used for CPT/OPT
      StartDate: new Date("2024-06-01T00:00:00Z"),
      EndDate: new Date("2025-05-31T00:00:00Z"),
      LastModificationDate: new Date("2024-05-28T00:00:00Z")
    },
    ApplicationType: "ONBOARD"
  }
]);

print("Fake data inserted into Employee collection successfully!");
