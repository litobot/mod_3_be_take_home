Customer.create!([
  { first_name: "John", last_name: "Doe", email: "john.doe@example.com", address: "123 Main St, Springfield, IL" },
  { first_name: "Jane", last_name: "Smith", email: "jane.smith@example.com", address: "456 Elm St, Austin, TX" },
  { first_name: "Alice", last_name: "Johnson", email: "alice.johnson@example.com", address: "789 Oak St, Seattle, WA" },
  { first_name: "Bob", last_name: "Brown", email: "bob.brown@example.com", address: "321 Pine St, Denver, CO" },
  { first_name: "Charlie", last_name: "Davis", email: "charlie.davis@example.com", address: "654 Maple St, Miami, FL" }
])

Tea.create!([
  { title: "MistyRose Herbal Tea", description: "A aromatic flavor profile with hints of malty.", temperature: 171, brew_time: 4.00 },
  { title: "Orchid Herbal Tea", description: "A robust flavor profile with hints of robust.", temperature: 201, brew_time: 4.25 },
  { title: "BlanchedAlmond Green Tea", description: "A smooth flavor profile with hints of spicy.", temperature: 164, brew_time: 4.50 },
  { title: "LightYellow Green Tea", description: "A minty flavor profile with hints of minty.", temperature: 194, brew_time: 3.75 },
  { title: "Snow Matcha Tea", description: "A citrusy flavor profile with hints of aromatic.", temperature: 178, brew_time: 4.50 },
  { title: "Azure Black Tea", description: "A delicate flavor profile with hints of tangy.", temperature: 200, brew_time: 3.00 },
  { title: "Coral White Tea", description: "A fruity flavor profile with hints of nutty.", temperature: 189, brew_time: 4.75 },
  { title: "Salmon Green Tea", description: "A bold flavor profile with hints of herbaceous.", temperature: 197, brew_time: 3.50 },
  { title: "Crimson Oolong Tea", description: "A rich flavor profile with hints of smooth.", temperature: 207, brew_time: 4.25 },
  { title: "Plum Herbal Tea", description: "A floral flavor profile with hints of earthy.", temperature: 171, brew_time: 3.75 }
])

Subscription.create!([
  { title: "Tea Lover Monthly", price: 20.0, status: "active", frequency: "monthly" },
  { title: "Bi-Annual Tea Delight", price: 120.0, status: "active", frequency: "bi-annual" },
  { title: "Annual Tea Bliss", price: 240.0, status: "active", frequency: "annual" }
])

TeaSubscription.create!([
  { tea_id: 7, subscription_id: 3, customer_id: 5 },
  { tea_id: 2, subscription_id: 1, customer_id: 3 },
  { tea_id: 8, subscription_id: 3, customer_id: 1 },
  { tea_id: 6, subscription_id: 3, customer_id: 2 },
  { tea_id: 9, subscription_id: 3, customer_id: 2 },
  { tea_id: 1, subscription_id: 2, customer_id: 4 },
  { tea_id: 3, subscription_id: 1, customer_id: 5 },
  { tea_id: 4, subscription_id: 2, customer_id: 4 },
  { tea_id: 5, subscription_id: 1, customer_id: 3 },
  { tea_id: 10, subscription_id: 3, customer_id: 1 }
])
