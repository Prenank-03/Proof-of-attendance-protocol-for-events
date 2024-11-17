module proof_of_attendance::event {
    use std::string::String;
    use aptos_framework::timestamp;
    use aptos_framework::signer;

    /// Error codes
    const E_EVENT_NOT_STARTED: u64 = 1;
    const E_EVENT_ENDED: u64 = 2;
    const E_ALREADY_CLAIMED: u64 = 3;

    /// Struct representing an event
    struct Event has store, key {
        name: String,
        start_time: u64,
        end_time: u64,
        attendees: vector<address>,
        max_attendees: u64,
        organizer: address
    }

    /// Struct representing attendance proof
    struct AttendanceProof has store, key {
        event_name: String,
        timestamp: u64,
        attendee: address
    }

    /// Function to create a new event
    public fun create_event(
        organizer: &signer,
        name: String,
        start_time: u64,
        end_time: u64,
        max_attendees: u64
    ) {
        let event = Event {
            name,
            start_time,
            end_time,
            attendees: vector::empty(),
            max_attendees,
            organizer: signer::address_of(organizer)
        };
        move_to(organizer, event);
    }

    /// Function to record attendance for an event
    public fun record_attendance(
        attendee: &signer,
        organizer_addr: address
    ) acquires Event {
        let event = borrow_global_mut<Event>(organizer_addr);
        let current_time = timestamp::now_seconds();
        
        assert!(current_time >= event.start_time, E_EVENT_NOT_STARTED);
        assert!(current_time <= event.end_time, E_EVENT_ENDED);
        
        let attendee_addr = signer::address_of(attendee);
        assert!(!vector::contains(&event.attendees, &attendee_addr), E_ALREADY_CLAIMED);
        
        vector::push_back(&mut event.attendees, attendee_addr);
        
        let proof = AttendanceProof {
            event_name: event.name,
            timestamp: current_time,
            attendee: attendee_addr
        };
        move_to(attendee, proof);
    }
}