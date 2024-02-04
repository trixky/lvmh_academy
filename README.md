# LVMH Academy

Implementation of an in-store customer identification application aimed at streamlining the customer experience using the phone's native Wallet system, QRcode and Passport scanner.

<img src="https://github.com/trixky/lvmh_academy/blob/main/.demo/screenshots.gif" alt="Demo gif" width="200"/>

> This project was carried out as part of an inter-school bootcamp (HEC x 42 x Strate) at HEC Paris campus in partnership with LVMH with the aim of creating a potential startup aimed at improving the customer experience in stores. (January 2024)

## Features

- Scan the customer's passport to extract his information.
- Create a customer account.
- Generate a QRcode for add the customer's card to his Wallet.
- Scan the QRcode to identify the customer from his Wallet.
- Access customer information by seller after identification.

## Scenarios

### Customer creation

- The customer arrives at the store.
- The customer is asked to present his passport (not required).
- The seller scans the passport.
- The customer is asked to enter his email address (not required).
- The customer is asked to enter his phone number (not required).
- The seller creates the customer's account.
- The seller generates a QRcode for the customer's card.
- The customer scans the QRcode to add the card to his Wallet.

### Customer identification

- The customer arrives at the store.
- The customer presents his Wallet.
- The seller scans the QRcode.
- The customer is identified.

## Setup

- API: Please refer to the [API README](api/README.md) for more information.
- Client: Please refer to the [Client README](client/README.md) for more information.
- Mobile App: Please refer to the [Mobile App README](mobile/README.md) for more information.
