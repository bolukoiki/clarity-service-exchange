# Clarity 2.0 Smart Contract

## Overview

This smart contract provides a decentralized platform for buying and selling services. It manages service listings, pricing, refunds, platform fees, and user balances in a secure manner. The contract allows service providers to list services for sale, buyers to purchase services, and the system to calculate refunds and platform fees automatically. The contract also includes functionality for managing service limits and user balances efficiently.

## Features

- **Service Listings:** Users can add and remove services for sale.
- **Service Cost Management:** The owner can update the cost per service.
- **Platform Fee:** A percentage fee is charged on each transaction.
- **Refund System:** Users can request refunds, and the contract handles the calculation and distribution of the refund.
- **Limit Management:** The contract tracks the total number of services in the system, ensuring it does not exceed a predefined limit.
- **Authentication:** Only the owner can modify service costs, fee rates, and limits.
- **User Profile:** Each user can view their service balance and service history.
- **Referral Bonus:** Users can receive bonuses for referring new users to the platform.

## Contract Structure

### Constants

The following constants are defined in the contract to handle error messages and user-related checks:

- **Owner:** Defines the contract owner as the transaction sender.
- **Error Codes:** Various error codes for transaction failures, such as insufficient funds, invalid quantities, or failed refunds.

### Data Variables

The contract maintains several data variables for tracking platform state:

- **Service Cost (`service-cost`)**: The cost per service in microstacks.
- **Max Services Per User (`max-services-per-user`)**: Maximum number of services a user can list.
- **Platform Fee Rate (`platform-fee-rate`)**: The percentage of the platform fee.
- **Refund Rate (`refund-rate`)**: The percentage of the service cost refunded to users.
- **Total Service Limit (`total-service-limit`)**: Global cap on the total number of services in the system.
- **Current Total Services (`current-total-services`)**: Tracks the current number of services available on the platform.

### Data Maps

The following maps store user-related and service-related data:

- **User Service Balance (`user-service-balance`)**: Tracks the number of services each user has.
- **User Token Balance (`user-token-balance`)**: Tracks the number of tokens each user holds.
- **Services For Sale (`services-for-sale`)**: Stores the services listed for sale by users, including quantity and cost.

### Private Functions

Private functions are internal utility functions used throughout the contract to handle calculations and updates:

- **Calculate Platform Fee**: Computes the fee to be deducted from each service transaction.
- **Calculate Refund**: Computes the refund amount based on the quantity of services returned.
- **Modify Total Services**: Updates the total number of services in the system, ensuring it doesn't exceed the limit.

### Public Functions

The public functions are the core of the contract, providing functionality for users and the owner:

- **Update Service Cost**: Allows the owner to update the service cost.
- **Update Platform Fee Rate**: Allows the owner to adjust the platform fee rate.
- **Update Refund Rate**: Allows the owner to update the refund rate.
- **Update Total Service Limit**: Allows the owner to set the global limit on services.
- **Add Services for Sale**: Allows a user to list a service for sale.
- **Remove Services from Sale**: Allows a user to remove a service from the sale list.
- **Purchase Service**: Allows a user to purchase a service from another user, including platform fee calculation and token balance updates.
- **Request Refund**: Allows users to request a refund for a service they have purchased.

### Read-Only Functions

These functions provide users and external applications with access to certain data:

- **Get Service Cost**: Returns the current cost per service.
- **Get Platform Fee Rate**: Returns the current platform fee rate.
- **Get Refund Rate**: Returns the current refund rate.
- **Get User Service Balance**: Returns the service balance of a given user.
- **Create User Profile**: Creates a profile for a user, displaying their service balance and history.

### Security and Performance Improvements

- **Secure Owner Functions**: Ensures that only the owner can access functions that modify critical parameters.
- **Refactor Service Cost Update Logic**: Optimizes the logic for updating the service cost.
- **Simplify Balance Update Logic**: Refines the logic for updating user balances, making it more efficient.

### UI Elements

The contract also includes functions that could be used to display information on the user interface:

- **Create User Profile**: Provides the user’s token and service balance, along with service history.
- **Display Service Offer History**: Shows the user’s history of services offered for sale.
- **Referral Bonus**: Allows users to receive a bonus for referring others to the platform.

## How to Use

1. **Owner Operations:**
   - The contract owner can update the service cost, platform fee rate, refund rate, and the total service limit.
   - The owner can also view the system status and monitor the total services available.

2. **User Operations:**
   - Users can list services for sale and remove them.
   - Users can buy services from other users and request refunds.
   - Users can also view their profile, service balance, and purchase history.

## Deployment Instructions

To deploy the contract, follow these steps:

1. Ensure you have access to the Stacks network and have the required tokens for deployment.
2. Deploy the contract to the network using your preferred deployment tool (e.g., Clarity CLI).
3. Set the contract owner to the address that will manage the contract.
4. Update the initial data variables such as the service cost, platform fee rate, refund rate, and total service limit.

## Security Considerations

- The contract includes multiple security checks to prevent unauthorized access and modifications. Only the owner can update sensitive parameters such as service costs and limits.
- Users are prevented from buying services from themselves and are required to have sufficient funds for both the service and platform fee.
- Refunds are restricted by the contract balance to ensure that the contract can honor all refund requests.

## License

This contract is licensed under the MIT License. See the LICENSE file for more details.

## Contributing

I welcome contributions to improve the contract. Please submit issues, bugs, or pull requests via GitHub.

## Contact

For further information or questions, please contact [(bolukoiki2@gmail.com)].
