# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Homework.Merchants.Merchant
alias Homework.Transactions.Transaction
alias Homework.Users.User

# Create dummy data for MERCHANTS
merchants = [
    %{description: "Just Do It",
    name: "Nike"},

    %{description: "Where's the Beef?",
    name: "Wendy's"},

    %{description: "Melts in Your Mouth, Not in Your Hands",
    name: "M&Ms"},

    %{description: "America Runs on Dunkin",
    name: "Dunkin' Donuts"}
];

# Function to process map instead of manual/individual inserts so that it can be used by other processes
Enum.each(merchants, fn(data) ->
    Homework.Repo.insert!(%Merchant {
        description: data.description,
        name: data.name
    })
end
)


# Create dummy data for USERS
users = [
    %{dob: "01/11/1111",
    first_name: "Manuel",
    last_name: "Marquez"},

    %{dob: "02/22/2222",
    first_name: "Haley",
    last_name: "Marquez"}
];

# Function to process map instead of manual/individual inserts so that it can be used by other processes
Enum.each(users, fn(data) ->
    Homework.Repo.insert!(%User {
        dob: data.dob,
        first_name: data.first_name,
        last_name: data.last_name
    })
end
)

# Create dummy data for TRANSACTIONS
transactions = [
    %{amount: 150,
    credit: true,
    debit: false,
    description: "Air Jordans 1957",
    merchant_id: "d9127c42-b71b-4ce6-9acf-8dee1db94598",
    user_id: "c745104b-41fa-4acd-8d7a-fd21249a004b"},

    %{amount: 4,
    credit: false,
    debit: true,
    description: "4 for 4",
    merchant_id: "42f26c32-8982-4cf6-9e15-3de443922717",
    user_id: "c745104b-41fa-4acd-8d7a-fd21249a004b"},

    %{amount: 2,
    credit: false,
    debit: true,
    description: "Peanut Butter Mini Pack",
    merchant_id: "c987d3b6-ed9d-400f-9c6f-9219dbd5702c",
    user_id: "32b9388f-1b64-41eb-ad28-71a2d00fef19"},

    %{amount: 12,
    credit: true,
    debit: false,
    description: "Variety Dozen Donuts",
    merchant_id: "869c473b-5c39-4223-974c-a3af1130e7a7",
    user_id: "32b9388f-1b64-41eb-ad28-71a2d00fef19"}
];

# Function to process map instead of manual/individual inserts so that it can be used by other processes
Enum.each(transactions, fn(data) ->
    Homework.Repo.insert!(%Transaction {
        amount: data.amount,
        credit: data.credit,
        debit: data.debit,
        description: data.description,
        merchant_id: data.merchant_id,
        user_id: data.user_id
    })
end
)
