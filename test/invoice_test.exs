defmodule FaturaTest do
  use ExUnit.Case
  doctest Invoices

  test "should create an invoices list" do
    invoices = Invoices.create_invoices(["water", "light", "phone"], "")
    assert invoices == ["water", "light", "phone"]
  end

  test "should return a ordered list of invoices" do
    invoices = Invoices.order_invoices(["water", "light", "phone"])
    refute invoices == ["water", "light", "phone"]
  end

  test "should return if invoice exists" do
    invoice = Invoices.invoice_exist?(Invoices.create_invoices(["water", "light", "phone"], ""), "phone")
    assert invoice == true
  end
end
