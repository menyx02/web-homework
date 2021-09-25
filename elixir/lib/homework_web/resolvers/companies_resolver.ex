defmodule HomeworkWeb.Resolvers.CompaniesResolver do
  alias Homework.Companies
  alias Homework.Transactions

  @doc """
  Get a list of companies
  """
  def companies(_root, args, _info) do
    {:ok, Companies.list_companies(args)}
  end

  @doc """
  Create a new company
  """
  def create_company(_root, args, _info) do
    # TODO - when I work on the cents conversion
    # updated_credit_line = convert(args.credit_line);
    # args = %{args | credit_line: updated_creditLine, available_credit: updated_credit_line}

    case Companies.create_company(args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not create company: #{inspect(error)}"}
    end
  end


  @doc """
  Updates a company for an id with args specified.
  """
  def update_company(_root, %{id: id} = args, _info) do
    company = Companies.get_company!(id)

    #company = update_available_credit(company)

    IO.puts("here **********")
    IO.puts(company.id)
    IO.puts(company.name)
    IO.puts(company.available_credit)

    case Companies.update_company(company, args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not update company: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a company for an id
  """
  def delete_company(_root, %{id: id}, _info) do
    company = Companies.get_company!(id)

    case Companies.delete_company(company) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not update company: #{inspect(error)}"}
    end
  end

  ## UTIL METHODS ***********

  @doc """
  Calculates the available credit for a company based on its transactions.

  ## Examples

    iex> calculate_available_credit(transactions)
    {:ok, :available_credit}
  """
  def calculate_available_credit(transactions) do
    fn(company) ->
      total_amount_spent = Enum.reduce(transactions, 0, fn t, acc -> t.amount +  acc end)
     company.credit_line - round(total_amount_spent / 100)
   end
  end

  @doc """
  Updates the available credit property for a company.

  ## Examples

    iex > update_available_credit(company)
    {:ok, %Company{}}
  """
  def update_available_credit(company) do
   transactions = Transactions.get_company_transactions(company.id)
    calculate = calculate_available_credit(transactions)
    Map.put(company, :available_credit, calculate.(company))
  end
end


