defmodule Homework.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework.Merchants.Merchant
  alias Homework.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "companies" do
    field(:name, :string)
    field(:credit_line, :integer, default: 0)
    field(:available_credit, :integer, default: 0)

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :credit_line, :available_credit,)
    |> validate_required([:name, :credit_line, :available_credit])
  end
end
