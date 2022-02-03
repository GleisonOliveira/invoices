defmodule Invoices do
  @moduledoc """
    We are work with invoices
  """
  @doc """
    On receive `invoices` return an invoices list
      ## Examples
      iex> Invoices.create_invoices(["water", "light"], [5, 10])
      ["Invoice: water expire on 5", "Invoice: water expire on 10",
       "Invoice: light expire on 5", "Invoice: light expire on 10"]
  """
  def create_invoices(invoices, expirations) do
    for invoice <- invoices, expiration <- expirations do
      "Invoice: #{invoice} expire on #{expiration}"
    end
  end

  @doc """
    On receive a list of `invoices`, return an ordered list
      ## Examples
      iex> Invoices.order_invoices(["water", "light", "phone"])
      ["light", "phone", "water"]
  """
  def order_invoices(invoices) do
    Enum.sort(invoices)
  end

  @doc """
    Verify if the `invoice` exists on a `invoices` list
      ## Examples
      iex> Invoices.invoice_exist?(["Invoice: water expire on 5", "Invoice: water expire on 10"],"water")
      true
  """
  def invoice_exist?(invoices, invoice) do
    Enum.filter(invoices, fn element ->
      String.contains?(element, invoice)
    end)
    |> Enum.count() >= 1
  end

  @doc """
    Return a splites list of `invoices`
    ## Examples
    iex> Invoices.invoices_to_pay(["Invoice: water expire on 5", "Invoice: water expire on 10"], 1)
    {["Invoice: water expire on 5"], ["Invoice: water expire on 10"]}
  """
  def invoices_to_pay(invoices, quantity) do
    Enum.split(invoices, quantity)
  end
end
