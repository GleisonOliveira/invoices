defmodule Invoices do
  @moduledoc """
    We are work with invoices
  """
  @doc """
    On receive `invoices` return an invoices list
      ## Examples
      iex> Invoices.create_invoices(["water", "light", "phone"], "")
      ["water", "light", "phone"]
  """
  def create_invoices(invoices, _expiration) do
    for invoice <- invoices do
      invoice
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
      iex> Invoices.invoice_exist?(["water", "light", "phone"], "light")
      true
  """
  def invoice_exist?(invoices, invoice) do
    Enum.member?(invoices, invoice)
  end
end
