module 0x1::Charity {
    struct Charity {
        total_donations: u64,
    }

    public fun initialize(account: &signer) {
        let charity = Charity { total_donations: 0 };
        move_to(&account, charity);
    }

    public fun donate(account: &signer, amount: u64) {
        let mut charity = borrow_global_mut<Charity>(Signer::address_of(account));
        charity.total_donations += amount;
    }

    public fun get_total_donations(account: &signer): u64 {
        let charity = borrow_global<Charity>(Signer::address_of(account));
        charity.total_donations
    }
}
