# Proof of Attendance Protocol (POAP) on Aptos

## Introduction
The Proof of Attendance Protocol (POAP) is a blockchain-based system implemented on the Aptos network that provides a transparent and immutable way to verify attendance at events. This smart contract allows event organizers to create digital proofs of attendance that can be claimed by participants, creating a permanent record on the blockchain.

The protocol consists of two main functions:
- Event Creation: Organizers can create events with specific parameters
- Attendance Recording: Participants can claim their attendance proof

## Vision
Our vision is to revolutionize how attendance and participation are verified in both digital and physical events. By leveraging blockchain technology, we aim to:
- Create tamper-proof attendance records
- Reduce fraud in event participation claims
- Enable seamless verification of attendance history
- Build a reliable system for loyalty programs and engagement tracking
- Foster a more connected community through verifiable shared experiences

## Core Features
- **Event Creation**: Organizers can create events with:
  - Custom event names
  - Specific time windows for attendance
  - Maximum attendee limits
  - Automatic organizer verification

- **Attendance Recording**:
  - Time-bound attendance verification
  - One-time-only attendance claims
  - Permanent proof of attendance
  - Automatic timestamp recording

## Technical Implementation
```move
module poap_addr::event {
    // Core functionality for event creation and attendance recording
}
```

### Deployed Address
- **Network**: Aptos Testnet
- **Contract Address**: `0xec785bf41aa31e666e07a342f5b9e81093012b43fc5ea3d9dd619513a59fe0df`
- **Module Name**: `event`

## Future Goals

### Phase 1: Enhanced Features (Q2 2024)
- [ ] Implement tiered attendance badges
- [ ] Add event metadata storage
- [ ] Create event categories and tags
- [ ] Enable batch attendance processing

### Phase 2: Integration & Expansion (Q3 2024)
- [ ] Develop web interface for event management
- [ ] Create mobile app for attendance claiming
- [ ] Implement QR code integration
- [ ] Add support for recurring events

### Phase 3: Ecosystem Growth (Q4 2024)
- [ ] Launch attendance-based reputation system
- [ ] Create marketplace for event creation
- [ ] Implement cross-chain compatibility
- [ ] Develop analytics dashboard for organizers

## Getting Started

### Prerequisites
- Aptos CLI
- Move compiler
- Aptos wallet

### Installation
1. Clone the repository
2. Configure the Move.toml with your address
3. Build and test the module
4. Deploy to your chosen network

### Usage Example
```bash
# Create a new event
aptos move run --function-id $ADDR::event::create_event \
    --args string:"EventName" u64:1234567890 u64:1234657890 u64:100

# Record attendance
aptos move run --function-id $ADDR::event::record_attendance \
    --args address:$ORGANIZER_ADDR
```

## Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For questions and support, please open an issue in the GitHub repository or contact the development team.

---
