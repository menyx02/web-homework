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

alias Homework.Repo
alias Homework.Merchants.Merchant
alias Homework.Transactions.Transaction
alias Homework.Users.User
alias Homework.Companies.Company


## Adding Companies
company1 = Repo.insert!(
    %Company{
        name: "Company 1",
        credit_line: 100000,
        available_credit: 100000}
)

company2 = Repo.insert!(
    %Company{
        name: "Company 2",
        credit_line: 5000,
        available_credit: 5000}
)

company3 = Repo.insert!(
    %Company{
        name: "Company 3",
        credit_line: 200,
        available_credit: 200}
)

## Adding Users
user1 = Repo.insert!(
    %User{
        dob: "02-22-1992",
        first_name: "Manuel",
        last_name: "Marquez",
        company_id: company1.id}
)

user2 = Repo.insert!(
    %User{
        dob: "05-31-1993",
        first_name: "Haley",
        last_name: "Marquez",
        company_id: company2.id}
)

## Adding Merchants
merchant1 = Repo.insert!(
    %Merchant{
        name: "Merchant 1",
        description: "Description Merchant 1"
    }
)

merchant2 = Repo.insert!(
    %Merchant{
        name: "Merchant 2",
        description: "Description Merchant 2"
    }
)

merchant3 = Repo.insert!(
    %Merchant{
        name: "Merchant 3",
        description: "Description Merchant 3"
    }
)

## Adding Transactions
transaction1 = Repo.insert!(
    %Transaction{
        amount: 100,
        credit: true,
        debit: false,
        description: "Transaction 1",
        user_id: user1.id,
        merchant_id: merchant1.id,
        company_id: company1.id
    }
)

transaction2 = Repo.insert!(
    %Transaction{
        amount: 200,
        credit: false,
        debit: true,
        description: "Transaction 2",
        user_id: user2.id,
        merchant_id: merchant2.id,
        company_id: company2.id
    }
)

transaction3 = Repo.insert!(
    %Transaction{
        amount: 300,
        credit: true,
        debit: false,
        description: "Transaction 3",
        user_id: user1.id,
        merchant_id: merchant3.id,
        company_id: company3.id
    }
)

transaction4 = Repo.insert!(
    %Transaction{
        amount: 400,
        credit: false,
        debit: true,
        description: "Transaction 4",
        user_id: user2.id,
        merchant_id: merchant1.id,
        company_id: company2.id
    }
)

transaction5 = Repo.insert!(
    %Transaction{
        amount: 500,
        credit: true,
        debit: false,
        description: "Transaction 5",
        user_id: user2.id,
        merchant_id: merchant2.id,
        company_id: company1.id
    }
)

transaction6 = Repo.insert!(
    %Transaction{
        amount: 600,
        credit: false,
        debit: true,
        description: "Transaction 6",
        user_id: user1.id,
        merchant_id: merchant3.id,
        company_id: company2.id
    }
)
