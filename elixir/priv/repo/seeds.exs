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

Homework.Repo.insert!(%Company {
    name: "Nike",
    credit_line: 1000000,
    available_credit: 1000000
});
